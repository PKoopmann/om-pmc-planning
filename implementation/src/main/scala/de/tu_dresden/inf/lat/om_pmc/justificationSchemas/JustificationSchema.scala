package de.tu_dresden.inf.lat.om_pmc.justificationSchemas

import com.clarkparsia.owlapi.explanation.MyBlackBoxExplanation
import de.tu_dresden.inf.lat.om_planning.tools.{OWLTools, Tools}
import org.semanticweb.HermiT.Configuration
import org.semanticweb.owlapi.model.parameters.Imports
import org.semanticweb.owlapi.model.{AxiomType, IRI, OWLAxiom, OWLClass, OWLClassAssertionAxiom, OWLEntity, OWLIndividual, OWLNamedIndividual, OWLObjectProperty, OWLObjectPropertyAssertionAxiom, OWLOntology}
import org.semanticweb.owlapi.reasoner.OWLReasonerFactory

import scala.collection.JavaConverters.{asJavaIterableConverter, asScalaSetConverter}
import scala.collection.{SortedSet, mutable}

class JustificationSchema(val prefix: List[OWLAxiom],
                          val schema: List[OWLEntity],
                          completeOntology: OWLOntology,
                          currentOntology: OWLOntology,
                          relevantAxioms: Set[OWLAxiom],
                          reasonerFactory: OWLReasonerFactory) {

  println("My Schema is: "+schema)

  def this(justification: Iterable[OWLAxiom],
           completeOntology: OWLOntology,
           currentOntology: OWLOntology,
           relevantAxioms: Set[OWLAxiom],
           reasonerFactory: OWLReasonerFactory) = {
    this(
      prefix = justification.filter(_.isOfType(AxiomType.TBoxAndRBoxAxiomTypes)).toList,
      schema = justification.filter(_.isOfType(AxiomType.ABoxAxiomTypes)).toList.map(_ match {
          case c: OWLClassAssertionAxiom => c.getClassExpression().asInstanceOf[OWLClass]
          case p: OWLObjectPropertyAssertionAxiom => p.getProperty.getNamedProperty()
      }),
      completeOntology,currentOntology,relevantAxioms,
      reasonerFactory)
  }

  val fastABoxLookup = new FastABoxLookup(completeOntology)
  val ontologyManager = completeOntology.getOWLOntologyManager()
  val factory = ontologyManager.getOWLDataFactory()

  private var precomputedValuations: Option[Set[Seq[OWLNamedIndividual]]] = None

  var extendingPatterns = Set[JustificationSchema]()

  def valuations(): Set[Seq[OWLNamedIndividual]] = precomputedValuations match {
    case Some(result) => result
    case None =>
      val result = findValuations()
      precomputedValuations = Some(result)
      result
  }


  /**
   * TODO duplication with AllJustificationSchemas and others
   */
  def getReasoner(ontology: OWLOntology) = {
    val config = new Configuration();
    config.throwInconsistentOntologyException=false
    reasonerFactory.createReasoner(ontology,config)
  }

  /**
   * Computes all valuations of the given justificationSchema
   */
  private def findValuations() = {
    val positions = schema.map(_ match {
      case _: OWLClass => 1
      case _: OWLObjectProperty => 2
      case entity => throw new AssertionError("Unexpected entity: "+entity)
    }).sum

    def compare(l1: Seq[Int], l2:Seq[Int]): Boolean = {
      if(l1.isEmpty)
        return false
      else if(l2.isEmpty)
        return true
      val cmpMax = l1.max-l2.max
      if(cmpMax!=0)
        cmpMax>0
      else {
        val first = l1.head-l2.head
        if(first!=0)
          first>0
        else
          compare(l1.tail, l2.tail)
      }
    }

    val ordering = Ordering.fromLessThan[Seq[Int]](compare)
      // Ordering.by[Seq[Int],Int](-_.max)  // TODO removes elements!
    var patterns =
      SortedSet()(ordering) ++
        PatternTools.homomorphicPatterns(Range(0,positions).toList,positions)


    var result = Set[Seq[OWLNamedIndividual]]()

    while(!patterns.isEmpty){
      println("Patterns in order: ")
      patterns.foreach(x => println(" - "+x))

      val pattern = patterns.head
      patterns -= pattern
      println("Current pattern: "+pattern)
      var valueSequence = mutable.ArraySeq[Set[OWLNamedIndividual]]() // sets of possible values for the positions in the pattern
      var incompleteValuations = Set[List[OWLNamedIndividual]](List()) // store the "query answers", the actual valuations
      // <-- in both cases, we use the pattern value as a key, that is, for a pattern (0,0,1,2), we would have a sequence for (0,1,2)

      var schemaPosition =0; // position of atom in the schema
      var variablePosition = 0; // position of variable in the schema
      var failed = false

      def newKey(pos:Int) = pattern(pos)>=valueSequence.size

      def intersectValues(variablePosition: Int,values: Set[OWLNamedIndividual]) = {
        if(valueSequence.size<=pattern(variablePosition)) {
          values
        } else
          values.filter(valueSequence(pattern(variablePosition))) // intersect with existing values otherwise
      }

      while(schemaPosition<schema.size && !failed){
        println("Schema position: "+schemaPosition)
        schema(schemaPosition) match {
          case c: OWLClass =>
            val values = intersectValues(variablePosition, fastABoxLookup.forClass(c))
            println("Values at this position: "+values)
              /*if(valueSequence.size>=pattern(variablePosition)) { // new value
                fastABoxLookup.forClass(c)
              } else
                fastABoxLookup.forClass(c).filter(valueSequence(pattern(variablePosition))) // intersect with previous values
              */
            if(!values.isEmpty){
              if(pattern(variablePosition)>=valueSequence.size)
                valueSequence = valueSequence.+:(values)
              else
                valueSequence.update(pattern(variablePosition),values)
              incompleteValuations = incompleteValuations.map{tuple: List[OWLNamedIndividual] =>
                println("variablePosition: "+variablePosition)
                println(valueSequence.size)
                if(tuple.size<=pattern(variablePosition)) // new key, need to multiply assignment
                  values.map((ind: OWLNamedIndividual) => tuple.:+(ind))
                else if(values(tuple(pattern(variablePosition)))) {
                  Set(tuple) // this assignment is still good
                  //val nextElement = tuple(variablePosition)
                  //Set(tuple.:+(nextElement))
                }
                else {
                  // this assignment is not good anymore
                  Set[List[OWLNamedIndividual]]()
                }
              }.flatten
            } else {
              // we are done here
              failed = true
            }

            variablePosition+=1
          case p: OWLObjectProperty => {

            println("schema position for "+variablePosition+": "+pattern(variablePosition))
            println("schema position for "+(variablePosition+1)+": "+pattern(variablePosition+1))

            val newKey1 = newKey(variablePosition)
            val newKey2 = newKey(variablePosition+1)

            var valuePairs = fastABoxLookup.forProperty(p)

            // special case r(x,x)
            if(pattern(variablePosition)==pattern(variablePosition+1)) {
              println("jo!")
              valuePairs = valuePairs.filter(p => p._1.equals(p._2))
            }
            println("valuePairs: "+valuePairs)
            val values1 = intersectValues(variablePosition,valuePairs.map(_._1))
            val values2 = intersectValues(variablePosition,valuePairs.map(_._2))



            println("values1: "+values1)
            println("values2: "+values2)

            if(!values1.isEmpty && !values2.isEmpty){

              if(valueSequence.size<=pattern(variablePosition))
                valueSequence = valueSequence.+:(values1)
              else
                valueSequence.update(pattern(variablePosition),values1)

              if(valueSequence.size<=pattern(variablePosition+1))
                valueSequence = valueSequence.+:(values2)
              else
                valueSequence.update(pattern(variablePosition+1),values2)

              println("Current value sequence: "+valueSequence)

              incompleteValuations = incompleteValuations.map{tuple: List[OWLNamedIndividual] =>
                if(newKey1 && newKey2) {
                  // both values are new
                  if(pattern(variablePosition)==pattern(variablePosition+1))
                    valuePairs.map(pair => tuple.:+(pair._1))
                  else // two new variables to be added
                    valuePairs.map(pair => tuple.:+(pair._1).:+(pair._2))
                } else if (!newKey1 && !newKey2) {
                  // both values are old
                  val el1 = tuple(pattern(variablePosition))
                  val el2 = tuple(pattern(variablePosition+1))
                  if(valuePairs((el1,el2)))//values1(el1) && values2(el2))
                    Set(tuple) // the assignment still works
                  else
                    Set() // the assignment does not work anymore
                } else if(newKey2){
                  // first value is old, second is new
                  // we need to extend with the second value of the compatible pairs
                  val el1 = tuple(pattern(variablePosition))
                  valuePairs.filter(_._1.equals(el1)).map(pair => tuple.:+(pair._2))
                } else {
                  // first value is new, second is old
                  // as previous case
                  val el2 = tuple(pattern(variablePosition+1))
                  valuePairs.filter(_._2.equals(el2)).map(pair => tuple.:+(pair._1))
                }
              }.flatten
            } else {
              failed = true
            }
            variablePosition+=2
          }
        }

        println("Current incomplete valuations: "+incompleteValuations)

        if(incompleteValuations.isEmpty)
          failed=true;
        if(failed){
          // pattern has no matches, so we delete all patterns to which this one is homomorphic
          val homomorphisms = PatternTools.homomorphicPatterns(pattern.take(variablePosition+1))
          patterns = patterns.filterNot(pat => homomorphisms(pat.take(variablePosition+1)))
        }
        schemaPosition+=1
      }
      if(!failed) {
        // check consistency with the reasoner
        val instance = ontologyManager.createOntology()
        prefix.foreach(instance.addAxiom)
        instantiate(schema,pattern).foreach(instance.addAxiom)
        val reasoner = reasonerFactory.createReasoner(instance)
        if(reasoner.isConsistent()){
          println("Consistent - nothing happens with pattern "+pattern)
          patterns-=pattern // current pattern is no good, but nothing else changes
          canExtendPattern(pattern,incompleteValuations).foreach(extendingPatterns+=_)
        } else {
          println("Inconsistent - we will save this pattern and its valuations "+pattern)
          // result ++= incompleteValuations
          // the current pattern worked, so we don't need to
          // consider the homomorphic ones anymore
          val homomorphisms = PatternTools.homomorphicPatterns(pattern)
          patterns=patterns.filterNot(homomorphisms)
          // we now extend the incomplete Valuation to a full one, using the pattern
          result ++=
            incompleteValuations.map(extendValuation(pattern,_))
        }
      }
    }
    println("Done computing valuations!")
    result
  }

  def canExtendPattern(pattern: Seq[Int], valuations: Set[List[OWLNamedIndividual]]) = {
    var instantiation = instantiate(schema, pattern).toSet
    instantiation ++= maximalExtension(instantiation)
    instantiation ++= prefix
    println("Checking whether the following extension is consistent: ")
    instantiation.foreach(x => println(" - "+x))
    if(consistent(reasonerFactory,instantiation)) {
      println("It is.")
      None
    } else {
      println("It isn't.")
      Some(justification(instantiation))
    }

    /*valuations.filterNot(Tools.hasDuplicates)
      .map(extendValuation(pattern,_))
      .map(instantiateWith)
      .map(_.forall(currentOntology.containsAxiom))
      .map(nonJustification => {
        val extension = maximalExtension(nonJustification)
      })*/
  }

  /**
   * TODO duplication with AllJustificationSchemas
   */
  def justification(axioms: Set[OWLAxiom]) = {
    val ontology = ontologyManager.createOntology()
    axioms.foreach(ontology.add)
    val singleGen = new MyBlackBoxExplanation(
      ontology,
      reasonerFactory,
      getReasoner(ontology),
      //reasonerFactory.createNonBufferingReasoner(ontology)
    )
    val justification = singleGen.getExplanation(factory.getOWLThing).asScala.toSet
    new JustificationSchema(justification, completeOntology, currentOntology, relevantAxioms, reasonerFactory)
  }

  def consistent(factory: OWLReasonerFactory, axioms: Set[OWLAxiom]) = {
    val ontology = ontologyManager.createOntology()
    axioms.foreach(ontology.addAxiom)
    factory.createNonBufferingReasoner(ontology)
      .isConsistent
  }

  def maximalExtension(axioms: Set[OWLAxiom]) = {
    val individuals = axioms.flatMap(_.getIndividualsInSignature.asScala)
    currentOntology.getABoxAxioms(Imports.EXCLUDED)
      .asScala
      .filter(relevantAxioms)
      .flatMap(_.getSignature.asScala)
      .flatMap(_ match {
        case cl: OWLClass => individuals.map(factory.getOWLClassAssertionAxiom(cl,_)).toSet[OWLAxiom]
        case prp: OWLObjectProperty =>
          individuals.flatMap(
            i1 => individuals.map(
              i2 => factory.getOWLObjectPropertyAssertionAxiom(prp,i1,i2))).toSet[OWLAxiom]
        case other => Set[OWLAxiom]() // do nothing
      })
  }

  def extendValuation(pattern: Seq[Int], valuation: List[OWLNamedIndividual]) = {
    pattern.map(valuation)
  }

  def instantiateWith(valuation: Seq[OWLNamedIndividual]) = {
    var schemaPosition =0;
    var variablePosition = 0;
    var result = List[OWLAxiom]()
    while(schemaPosition<schema.size) {
      schema(schemaPosition) match {
        case c: OWLClass =>
          result ::= factory.getOWLClassAssertionAxiom(c, valuation(variablePosition))
          variablePosition += 1
        case p: OWLObjectProperty =>
          result ::= factory.getOWLObjectPropertyAssertionAxiom(p, valuation(variablePosition), valuation(variablePosition + 1))
          variablePosition += 2
      }
      schemaPosition += 1
    }
    result
  }

  def instantiate(schema: List[OWLEntity], pattern: Seq[Int]): Iterable[OWLAxiom] = {
    var schemaPosition =0;
    var variablePosition = 0;
    var result = List[OWLAxiom]()
    while(schemaPosition<schema.size) {
      schema(schemaPosition) match {
        case c: OWLClass =>
          result ::= factory.getOWLClassAssertionAxiom(c,
            factory.getOWLNamedIndividual(pattern(variablePosition).toString))
          variablePosition += 1
        case p: OWLObjectProperty =>
          result ::= factory.getOWLObjectPropertyAssertionAxiom(
            p,
            factory.getOWLNamedIndividual(pattern(variablePosition).toString),
            factory.getOWLNamedIndividual(pattern(variablePosition + 1).toString))
          variablePosition += 2
      }
      schemaPosition += 1
    }
    result
  }


  private def canEqual(other: Any): Boolean = other.isInstanceOf[JustificationSchema]

  override def equals(other: Any): Boolean = other match {
    case that: JustificationSchema =>
      that.canEqual(this) &&
        prefix == that.prefix &&
        schema == that.schema
    case _ => false
  }

  override def hashCode(): Int = {
    val state = Seq(prefix, schema)
    state.map(_.hashCode()).foldLeft(0)((a, b) => 31 * a + b)
  }
}

object Test {
  def main(args: Array[String]) = {
    val v1 = new ValuationPattern(List(0,1,2,3),List(Set(),Set(),Set(),Set()))
    println("homomorphic to [0,1,2,3]:")
    println("=========================")
    v1.homomorphicPatterns().foreach(println)


    val v2 = new ValuationPattern(List(0,1,2,1),List(Set(),Set(),Set()))
    println("homomorphic to [0,1,2,1]:")
    println("=========================")
    v2.homomorphicPatterns().foreach(println)


    val ordering = Ordering.by[Seq[Int],Int](-_.max) // TODO removes elements!
    val patterns =
      SortedSet()(ordering) ++
        PatternTools.homomorphicPatterns(Range(0,4))

    println("Patterns until 3:")
    println("=================")
    patterns.foreach(println)
  }
}

class ValuationPattern(pattern: List[Int], valuations: List[Set[OWLNamedIndividual]]) {
  def maxVar= valuations.size

  def size = pattern.size

  def homomorphicPatterns(): Set[Seq[Int]] = PatternTools.homomorphicPatterns(pattern,maxVar)

}

class FastABoxLookup(ontology: OWLOntology) {

  def forClass(clazz: OWLClass) = classAssertions.getOrElse(clazz, Set())
  def forProperty(property: OWLObjectProperty) = propertyAssertions.getOrElse(property, Set())


  private var classAssertions = Map[OWLClass,Set[OWLNamedIndividual]]()
  private var propertyAssertions = Map[OWLObjectProperty, Set[(OWLNamedIndividual,OWLNamedIndividual)]]()

  ontology.aboxAxioms(Imports.INCLUDED).forEach(_ match {
    case ax: OWLClassAssertionAxiom if ax.getClassExpression.isNamed =>
      val named = ax.getClassExpression.asInstanceOf[OWLClass]
      if(!classAssertions.contains(named))
        classAssertions += ((named, Set(ax.getIndividual.asOWLNamedIndividual())))
      else {
        classAssertions += ((named, classAssertions(named)+ax.getIndividual.asOWLNamedIndividual()))
      }
    case ax: OWLObjectPropertyAssertionAxiom if ax.getProperty.isNamed =>
      val named = ax.getProperty.asInstanceOf[OWLObjectProperty]
      if(!propertyAssertions.contains(named))
        propertyAssertions += ((named, Set((ax.getSubject.asOWLNamedIndividual(),ax.getObject.asOWLNamedIndividual()))))
      else {
        propertyAssertions += ((named, propertyAssertions(named)+((ax.getSubject.asOWLNamedIndividual(),ax.getObject.asOWLNamedIndividual()))))
      }
    case other => throw new AssertionError("Unexpected ABox axiom: "+other)
  })


}

object PatternTools {

  def homomorphicPatterns(pattern: Seq[Int]): Set[Seq[Int]] =
    homomorphicPatterns(pattern, pattern.max)
  def homomorphicPatterns(pattern: Seq[Int], maxVar: Int): Set[Seq[Int]] = {
    Set(fix(pattern)) ++
      Range.inclusive(0,maxVar).flatMap((x: Int) => {
        val newPattern: Seq[Int] = pattern.map((y: Int) => if(y==maxVar) x else y )
        homomorphicPatterns(newPattern,maxVar-1)
      })
  }

  def fix(pattern: Seq[Int]) : Seq[Int]= {
    val maxVar = pattern.max
    val vars = pattern.toSet
    if(maxVar>=vars.size) {
      val missing: Int = Range(0,maxVar).find(!vars(_)).get
      fix(pattern.map((x:Int) => if(x==maxVar) missing else x))
    } else
      pattern
  }
}