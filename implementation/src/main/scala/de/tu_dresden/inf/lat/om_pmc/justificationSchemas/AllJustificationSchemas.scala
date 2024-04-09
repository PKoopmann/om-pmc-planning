package de.tu_dresden.inf.lat.om_pmc.justificationSchemas

import com.clarkparsia.owlapi.explanation.{MyBlackBoxExplanation, MyHSTExplanationGenerator}
import de.tu_dresden.inf.lat.om_planning.tools.OWLTools
import org.semanticweb.HermiT.Configuration
import org.semanticweb.owlapi.model.{OWLAxiom, OWLClass, OWLEntity, OWLLogicalAxiom, OWLObject, OWLObjectProperty, OWLOntology}
import org.semanticweb.owlapi.reasoner.OWLReasonerFactory

import scala.collection.JavaConverters.{asScalaSetConverter, setAsJavaSetConverter}

class AllJustificationSchemas(ontology: OWLOntology, relevantAxioms: Set[OWLLogicalAxiom], reasonerFactory: OWLReasonerFactory) {

  var currentSet = Set[JustificationSchema]()

  var visitedPaths = Set[Seq[OWLEntity]]()

  val factory = ontology.getOWLOntologyManager.getOWLDataFactory()


  def getReasoner(ontology: OWLOntology) = {
    val config = new Configuration();
    config.throwInconsistentOntologyException=false
    reasonerFactory.createReasoner(ontology,config)
  }

  def allJustifications() = {
    allJustificationSchemas().map(justSchema =>
     justSchema.valuations().map(justSchema.instantiateWith).map(_.toSet[OWLAxiom]++justSchema.prefix)
    ).flatten
  }

  def allJustificationSchemas(): Set[JustificationSchema] = {
    val copyOntology = OWLTools.copy(ontology)

    currentSet = Set()
    visitedPaths = Set()

    computeAllJustificationSchemas(copyOntology,List())
    currentSet
  }

  def computeAllJustificationSchemas(currentOntology: OWLOntology, currentPath: List[OWLObject]): Unit = {
    println("Axioms in the current ontology: ")
    currentOntology.getAxioms().asScala.foreach(x =>println(" - "+x))
    println(" --- Size: "+currentOntology.getAxioms().size())
    val nextSchema = getJustificationSchema(currentOntology)
    if(nextSchema.schema.isEmpty){
      println("No justification left on this branch")
    } else {
      var schemasToProcess = Set(nextSchema)
      while(!schemasToProcess.isEmpty) {
        val nextSchema = schemasToProcess.head
        schemasToProcess -= nextSchema
        if(!currentSet.contains(nextSchema)) {
          currentSet += nextSchema
          schemasToProcess ++= nextSchema.extendingPatterns

          // first try removing the entity-parts of the schema
          nextSchema.schema.indices.foreach { i =>
            val entity: OWLEntity = nextSchema.schema(i)
            println("Removing " + entity)
            val values1 = nextSchema.valuations().map(_(i))
            println("With values " + values1)
            val axioms = entity match {
              case cl: OWLClass => values1.map(factory.getOWLClassAssertionAxiom(cl, _))
              case prp: OWLObjectProperty =>
                val values2 = nextSchema.valuations().map(_(i + 1))
                values1.flatMap(v1 => values2.map(v2 => factory.getOWLObjectPropertyAssertionAxiom(prp, v1, v2)))
            }

            val newOnt = OWLTools.copy(currentOntology)
            axioms.foreach(newOnt.removeAxiom)
            computeAllJustificationSchemas(newOnt, entity :: currentPath)
          }

          // next try removing the prefix (TBox) part of the schema
          nextSchema.prefix.foreach{ axiom =>
            println("removing "+axiom)
            val newOnt = OWLTools.copy(currentOntology)
            newOnt.remove(axiom)
            computeAllJustificationSchemas(newOnt, axiom :: currentPath)
          }
        }
      }
    }
  }

  def getJustification(ontology: OWLOntology) = {
    val singleGen = new MyBlackBoxExplanation(
      ontology,
      reasonerFactory,
      getReasoner(ontology),
      //reasonerFactory.createNonBufferingReasoner(ontology)
    )
    singleGen.getExplanation(factory.getOWLThing).asScala.toSet
  }
  def getJustificationSchema(ontology: OWLOntology): JustificationSchema = {
    val anyJustification = getJustification(ontology)

    val justSchema = new JustificationSchema(anyJustification, this.ontology, ontology, relevantAxioms, reasonerFactory)
    //justSchema.valuations() // computes also all insufficient patterns
    justSchema
  }


}
