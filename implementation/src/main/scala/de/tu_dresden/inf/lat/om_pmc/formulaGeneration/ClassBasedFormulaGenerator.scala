package de.tu_dresden.inf.lat.om_pmc.formulaGeneration

import com.clarkparsia.owlapi.explanation.{MyBlackBoxExplanation, MyHSTExplanationGenerator}
import de.tu_dresden.inf.lat.om_pmc.interface.{AxiomToFormulaMap, HookToAxiomMap}
import org.semanticweb.owlapi.apibinding.OWLManager
import org.semanticweb.owlapi.model.{OWLAxiom, OWLClassAssertionAxiom, OWLClassExpression, OWLLogicalAxiom, OWLObjectPropertyAssertionAxiom, OWLOntology, OWLOntologyManager, OWLSubClassOfAxiom}
import org.semanticweb.owlapi.reasoner.{OWLReasoner, OWLReasonerFactory}

import scala.collection.JavaConverters.{asScalaSetConverter, setAsJavaSetConverter}
import scala.collection.convert.ImplicitConversions.`set asScala`
import scala.collection.immutable.Set
import scala.collection.mutable

class ClassBasedFormulaGenerator (
                                   axiom2formula: AxiomToFormulaMap,
                                   hook2axiom: HookToAxiomMap,
                                   ontologyManager: OWLOntologyManager,
                                   reasonerFactory: OWLReasonerFactory
                                 )
  extends BlackboxSituationFormulaGenerator(axiom2formula,hook2axiom,ontologyManager,reasonerFactory) {

  private val manager = OWLManager.createOWLOntologyManager()

  private val localOntology = manager.createOntology(Set[OWLAxiom]().asJava)

  private val localReasoner: OWLReasoner = getReasoner(localOntology)

  override def fluentExplanationsAsDNF(axiom: OWLLogicalAxiom): Iterable[_ <: Set[OWLLogicalAxiom]] = {
    // generate repairs if it had not been done in the past
    if (classCentricRewritings.isEmpty)
      generateClassCentricRewritings()

    if (classCentricRewritings.get.contains(axiom))
      classCentricRewritings.get(axiom)
    else {
      println("WARNING: no rewritings for " + axiom + " where computed.")
      Set() // empty disjunction --> false
    }
  }

  override def generateInconsistentDNF(): Set[Set[OWLLogicalAxiom]] = {
    if(inconsistentDNF.isDefined)
      return inconsistentDNF.get

    generateClassCentricRewritings()

    return inconsistentDNF.get
  }

  // map to store generated rewritings
  // maps from hook axioms to explanation DNFs
  private var classCentricRewritings : Option[mutable.Map[OWLLogicalAxiom, Set[Set[OWLLogicalAxiom]]]] = None
  def generateClassCentricRewritings(): Unit =  {
    freeSomeMemory()

    val rewritings: mutable.Map[OWLLogicalAxiom, Set[Set[OWLLogicalAxiom]]] = mutable.Map()

    var inconsistencyDnf = Set[Set[OWLLogicalAxiom]]()

    // iterate over all hooks
    relevantHooks.foreach {axiom =>
      // only compute rewriting for hook, if it does not exists yet, i.e. was not already computed together with
      // another hook
      if (!rewritings.contains(axiom)) {

        // compute axiom to add

        val (generalizedAxiom, supportingAxioms) = additionalAxioms(axiom)

        println(generalizedAxiom)
        supportingAxioms.foreach(println)
        // add general class explanation to ontology

        ontology.addAxiom(generalizedAxiom)
        supportingAxioms.foreach(ontology.addAxiom(_))

        updateReasoner(ontology)

        // generate justifications
        val justifications = getExplanationsForInconsistency()

       // println(justifications)

        // iterate over justifications and decide which hooks they explain
        justifications.foreach { j =>
          println("j: " + j)
          val jrelevant = (j - generalizedAxiom)
          // we explain only witch fluents
          val filteredJustification = jrelevant.filter(relevantAxioms)

          if (!j.contains(generalizedAxiom)) {
            // justification for inconsistency
            inconsistencyDnf = addExplanationToDNF(inconsistencyDnf, filteredJustification)
          }
          else {
            val explainedHooks = justifiedHooks(jrelevant.toSet[OWLAxiom], axiom)

            explainedHooks.foreach{hook =>
              if (rewritings.contains(hook)) {
                val newRewriting = addExplanationToDNF(rewritings(hook), filteredJustification)
                rewritings.update(hook, newRewriting)
              }
              else
                rewritings.update(hook, Set(filteredJustification))
            }
          }
        }

        // put ontology back to original state
        ontology.removeAxiom(generalizedAxiom)
        supportingAxioms.foreach(ontology.removeAxiom(_))

        updateReasoner(ontology)
      }

    }

    classCentricRewritings = Some(rewritings)
    inconsistentDNF = Some(inconsistencyDnf)
  }

  def justifiedHooks(justification: Set[OWLAxiom], axiom: OWLLogicalAxiom): Set[OWLLogicalAxiom] ={

    // compute which hooks can be explained by this justification
    updateLocalReasoner(justification)

    // get instances of class
    val classExpression = getClassExpression(axiom)
    val instances = localReasoner.getInstances(classExpression)

    var result : Set[OWLLogicalAxiom] = Set()

    instances.forEach { individual =>
      result = result + factory.getOWLClassAssertionAxiom(
        classExpression, individual.getRepresentativeElement
      )
    }

    result
  }


  def additionalAxioms(axiom: OWLLogicalAxiom): (OWLLogicalAxiom, Set[OWLLogicalAxiom]) = axiom match {
    case ca: OWLClassAssertionAxiom =>
      additionalAxioms(ca.getClassExpression)
    case _ =>  assert(false, "NOT SUPPORTED YET: "+axiom)
      null
  }

  // result: 'key axiom' plus set of supporting axioms
  def additionalAxioms(hookClass: OWLClassExpression): (OWLLogicalAxiom, Set[OWLLogicalAxiom]) = {
    // define new class with new name
    val className = "hookIndividualsInClass"
    val indClass = factory.getOWLClass(className)

    var supportingAxioms: Set[OWLLogicalAxiom] = Set()

    // add supporting axioms (i.e. class declarations to newly created class) if hook has correct class expression
    relevantHooks.foreach {
      case ca: OWLClassAssertionAxiom =>
        if (ca.getClassExpression == hookClass) {
          val newAxiom = factory.getOWLClassAssertionAxiom(
            indClass, ca.getIndividual
          )
          supportingAxioms += newAxiom
        }

      case _ => null
    }

    val keyAxiom = factory.getOWLSubClassOfAxiom(
      factory.getOWLObjectIntersectionOf(
        hookClass, indClass
      ),
      factory.getOWLNothing
    )

    (keyAxiom, supportingAxioms)
  }

  def generalizedNegateAxiom(axiom: OWLLogicalAxiom): OWLLogicalAxiom = axiom match {
    case ca: OWLClassAssertionAxiom =>
     factory.getOWLSubClassOfAxiom(
       ca.getClassExpression, factory.getOWLNothing
     )
    case _ => assert(false, "NOT SUPPORTED YET: "+axiom)
      null
  }

  def getClassExpression(axiom: OWLLogicalAxiom): OWLClassExpression = axiom match {
    case ca: OWLClassAssertionAxiom =>
        ca.getClassExpression
    case _ => assert(false, "NOT SUPPORTED YET: "+axiom)
      null
  }

  // specialized method, because we do not want to filter the justifications to fluents, but keep all axioms
  override def synchronizeExplanationGenerator(): Unit = {
    val currentOntology = reasoner.getRootOntology()

    //    println("Relevant axioms after filtering: "+relevantAxiomsFiltered)

    // get fresh reasoner
    val r = getReasoner(currentOntology)

    val singleGen = new MyBlackBoxExplanation(
      currentOntology,
      reasonerFactory,
      r
      //reasonerFactory.createNonBufferingReasoner(ontology)
    )

    // clear some memory before assigning new value
    expGenerator.dispose()

    expGenerator =
      new MyHSTExplanationGenerator(
        ontology.getLogicalAxioms(),
        singleGen)
  }

  def updateLocalReasoner(newAxioms: Set[OWLAxiom]): Unit = {
    val oldOntology = localReasoner.getRootOntology
    //oldOntology.removeAxioms(oldOntology.getAxioms())
    //oldOntology.addAxioms(ontology.getAxioms())

    val oldAxioms = oldOntology.getAxioms()
    val deleteAxioms = oldAxioms.diff(newAxioms)
    val addAxioms = newAxioms.diff(oldAxioms)

    // apply changes to ontology
    oldOntology.removeAxioms(deleteAxioms.asJava)
    oldOntology.addAxioms(addAxioms.asJava)

    localReasoner.flush()
  }
}
