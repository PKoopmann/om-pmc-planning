package de.tu_dresden.inf.lat.om_pmc.formulaGeneration

import de.tu_dresden.inf.lat.om_pmc.interface.{AxiomToFormulaMap, HookToAxiomMap}
import de.tu_dresden.inf.lat.prettyPrinting.formatting.SimpleOWLFormatter
import org.semanticweb.owlapi.model._
import org.semanticweb.owlapi.reasoner.OWLReasonerFactory

import scala.collection.JavaConverters.asScalaSetConverter

class InconsistencyBasedBlackBSituationFormulaGenerator(
                                                     axiom2formula: AxiomToFormulaMap,
                                                     hook2axiom: HookToAxiomMap,
                                                     ontologyManager: OWLOntologyManager,
                                                     reasonerFactory: OWLReasonerFactory
                                                   )
  extends BlackboxSituationFormulaGenerator(axiom2formula,hook2axiom,ontologyManager,reasonerFactory) {

  override def getExplanations(axiom: OWLLogicalAxiom): Iterable[Set[OWLLogicalAxiom]] = {

  /*  println("Ontology before: ")
    println("--------------");
    println(SimpleOWLFormatter.format(ontology))
    println(ontology.getAxiomCount()+" axioms");
*/
    val negated = negateAxiom(axiom)

    val needsToAddAxiom = !ontology.containsAxiom(negated)

    if(needsToAddAxiom)
      ontology.addAxiom(negated)

    //println("Needs to add axiom: "+needsToAddAxiom)
    //println("negatedAxiom: "+SimpleOWLFormatter.format(negated))

    updateReasoner(ontology)
    reasoner.flush()
    synchronizeExplanationGenerator()

    val result = getExplanationsForInconsistency()

    assert(result.size>0)

    if(needsToAddAxiom)
      ontology.removeAxiom(negated)

    updateReasoner(ontology)
    reasoner.flush()

    result
  }



  def negateAxiom(axiom: OWLLogicalAxiom): OWLLogicalAxiom = axiom match {
    case ca: OWLClassAssertionAxiom =>
      factory.getOWLClassAssertionAxiom(
        factory.getOWLObjectComplementOf(
          ca.getClassExpression),
        ca.getIndividual)
    case ci: OWLSubClassOfAxiom =>
      factory.getOWLClassAssertionAxiom(
        factory.getOWLObjectIntersectionOf(
          ci.getSubClass, factory.getOWLObjectComplementOf(ci.getSuperClass)
        ),
        factory.getOWLAnonymousIndividual
      )
    case op: OWLObjectPropertyAssertionAxiom =>
      factory.getOWLNegativeObjectPropertyAssertionAxiom(
        op.getProperty, op.getSubject, op.getObject
      )

    case _ => assert(false, "NOT SUPPORTED YET: "+axiom)
      null
  }
}
