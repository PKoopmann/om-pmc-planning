package de.tu_dresden.inf.lat.om_pmc.ifm

import org.semanticweb.owlapi.model.{OWLAxiom, OWLClass, OWLClassAssertionAxiom, OWLLogicalAxiom, OWLOntology}
import org.semanticweb.owlapi.reasoner.OWLReasonerFactory

import scala.collection.JavaConverters.asScalaSetConverter

class IfmInconsistencyBasedGBSituationFormulaGenerator(
                                                     reasonerFactory: OWLReasonerFactory,
                                                     ontology: OWLOntology,
                                                     relevantAxioms: Set[OWLLogicalAxiom],
                                                     situationSuperClass: OWLClass,
                                                     outputFileName: String
                                                   ) extends IfmGlassboxSituationFormulaGenerator(reasonerFactory,
  ontology,
  relevantAxioms,
  situationSuperClass,
  outputFileName) {

  val dataFactory = ontology.getOWLOntologyManager().getOWLDataFactory()

  override def getExplanations(axiom: OWLLogicalAxiom): Iterable[Set[OWLLogicalAxiom]] = {

    val negated = negateAxiom(axiom)

    ontology.addAxiom(negated)

    initReasoner(ontology)

    reasoner.flush()

    System.out.println("consistency: "+reasoner.isConsistent)

    val result = explanationGenerator.getInconsistencyExplanations().asScala.map(_.asScala.toSet[OWLAxiom].map(_.asInstanceOf[OWLLogicalAxiom]))

    ontology.removeAxiom(negated)

    initReasoner(ontology)
    reasoner.flush()

    result
  }

  def negateAxiom(axiom: OWLAxiom): OWLAxiom = axiom match {
    case ca: OWLClassAssertionAxiom =>
      dataFactory.getOWLClassAssertionAxiom(
        dataFactory.getOWLObjectComplementOf(
          ca.getClassExpression),
        ca.getIndividual)
    case _ => assert(false, "NOT SUPPORTED YET: "+axiom)
      null
  }
}
