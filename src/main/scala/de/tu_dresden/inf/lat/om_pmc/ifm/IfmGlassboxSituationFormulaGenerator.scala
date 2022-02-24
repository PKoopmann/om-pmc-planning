package de.tu_dresden.inf.lat.om_pmc.ifm

import openllet.owlapi.explanation.MyPelletExplanation
import org.semanticweb.owlapi.model.{OWLAxiom, OWLClass, OWLLogicalAxiom, OWLOntology}
import org.semanticweb.owlapi.reasoner.OWLReasonerFactory

import scala.collection.JavaConverters.{asScalaSetConverter, setAsJavaSetConverter}

class IfmGlassboxSituationFormulaGenerator(
                                         reasonerFactory: OWLReasonerFactory,
                                         ontology: OWLOntology,
                                         relevantAxioms: Set[OWLLogicalAxiom],
                                         situationSuperClass: OWLClass,
                                         outputFileName: String
                                       )
  extends IfmSituationFormulaGenerator(
    reasonerFactory,
    ontology,
    relevantAxioms,
    situationSuperClass,
    outputFileName) {

  //val explanationGenerator = new PelletExplanation(ontology, true);
  var explanationGenerator: MyPelletExplanation = _

  initExplanationGenerator(ontology)

  override def initExplanationGenerator(ontology: OWLOntology) = {
    val axioms = ontology.getAxioms().asScala.toSet
    val relevantAxiomsFiltered = relevantAxioms.filter(axioms)
    explanationGenerator = new MyPelletExplanation(ontology, true, relevantAxiomsFiltered.asJava) // above line seems to fail
  }

  override def getExplanations(axiom: OWLLogicalAxiom): Iterable[Set[OWLLogicalAxiom]] =
    explanationGenerator.getEntailmentExplanations(axiom).asScala.map(_.asScala.toSet[OWLAxiom].map(_.asInstanceOf[OWLLogicalAxiom]))

  override def getExplanationsForInconsistency(): Iterable[Set[OWLLogicalAxiom]] = {
    initReasoner(ontology)

    explanationGenerator.getInconsistencyExplanations().asScala.map(_.asScala.toSet[OWLAxiom].map(_.asInstanceOf[OWLLogicalAxiom]))
  }
}
