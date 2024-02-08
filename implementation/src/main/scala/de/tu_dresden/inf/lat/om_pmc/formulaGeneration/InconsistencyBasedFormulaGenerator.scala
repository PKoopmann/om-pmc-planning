package de.tu_dresden.inf.lat.om_pmc.formulaGeneration

import de.tu_dresden.inf.lat.om_pmc.interface.{AxiomToFormulaMap, HookToAxiomMap}
import de.tu_dresden.inf.lat.prettyPrinting.formatting.SimpleOWLFormatter
import org.semanticweb.owlapi.model._
import org.semanticweb.owlapi.reasoner.OWLReasonerFactory

import scala.collection.JavaConverters.asScalaSetConverter

class InconsistencyBasedFormulaGenerator(
                                                     axiom2formula: AxiomToFormulaMap,
                                                     hook2axiom: HookToAxiomMap,
                                                     ontologyManager: OWLOntologyManager,
                                                     reasonerFactory: OWLReasonerFactory
                                                   )
  extends BlackboxSituationFormulaGenerator(axiom2formula,hook2axiom,ontologyManager,reasonerFactory) {

  override def getExplanations(axiom: OWLLogicalAxiom): Iterable[Set[OWLLogicalAxiom]] = {

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

  // generate DNF by using inconsistency based approach
  override def fluentExplanationsAsDNF(axiom: OWLLogicalAxiom) : Set[Set[OWLLogicalAxiom]] = {
    freeSomeMemory()  // avoid memory leaks
    var dnf = Set[Set[OWLLogicalAxiom]]()
    val explanations = getExplanations(axiom)

    explanations.foreach { exp =>
      val rel = exp.filter(relevantAxioms)

      // backward subsumption deletion
      dnf = dnf.filterNot(rel.forall)

      // forward subsumption deletion
      if (!dnf.exists(_.forall(rel)))
        dnf += rel
    }

    dnf
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
