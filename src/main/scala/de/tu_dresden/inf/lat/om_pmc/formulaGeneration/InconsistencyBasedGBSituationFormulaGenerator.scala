package de.tu_dresden.inf.lat.om_pmc.formulaGeneration

import de.tu_dresden.inf.lat.om_pmc.interface.{AxiomToFormulaMap, HookToAxiomMap}
import org.semanticweb.owlapi.model.{OWLAxiom, OWLClass, OWLClassAssertionAxiom, OWLLogicalAxiom, OWLOntology, OWLOntologyManager}
import org.semanticweb.owlapi.reasoner.OWLReasonerFactory

import scala.collection.JavaConverters.asScalaSetConverter

class InconsistencyBasedGBSituationFormulaGenerator(
                                                     axiom2formula: AxiomToFormulaMap,
                                                     hook2axiom: HookToAxiomMap,
                                                     ontologyManager: OWLOntologyManager,
                                                     reasonerFactory: OWLReasonerFactory
                                                   )
  extends GlassboxSituationFormulaGenerator(axiom2formula,hook2axiom,ontologyManager,reasonerFactory) {

  override def getExplanations(axiom: OWLLogicalAxiom): Iterable[Set[OWLLogicalAxiom]] = {

    val negated = negateAxiom(axiom)

    ontology.addAxiom(negated)

    initReasoner(ontology)

    reasoner.flush()

    System.out.println("consistency: "+reasoner.isConsistent)

    val result = explanationGenerator.getInconsistencyExplanations()
      .asScala
      .map(_.asScala.toSet[OWLAxiom].map(_.asInstanceOf[OWLLogicalAxiom]))

    ontology.removeAxiom(negated)

    initReasoner(ontology)
    reasoner.flush()

    result
  }

  def negateAxiom(axiom: OWLLogicalAxiom): OWLLogicalAxiom = axiom match {
    case ca: OWLClassAssertionAxiom =>
      factory.getOWLClassAssertionAxiom(
        factory.getOWLObjectComplementOf(
          ca.getClassExpression),
        ca.getIndividual)
    case _ => assert(false, "NOT SUPPORTED YET: "+axiom)
      null
  }
}
