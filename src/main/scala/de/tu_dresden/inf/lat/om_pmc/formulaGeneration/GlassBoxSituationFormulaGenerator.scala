package de.tu_dresden.inf.lat.om_pmc.formulaGeneration

import de.tu_dresden.inf.lat.om_pmc.ifm.IfmSituationFormulaGenerator
import de.tu_dresden.inf.lat.om_pmc.interface.{AxiomToFormulaMap, HookToAxiomMap}
import openllet.owlapi.explanation.MyExplanation
import org.semanticweb.owlapi.model.{OWLAxiom, OWLClass, OWLLogicalAxiom, OWLOntology, OWLOntologyManager}
import org.semanticweb.owlapi.reasoner.OWLReasonerFactory

import scala.collection.JavaConverters.{asScalaSetConverter, setAsJavaSetConverter}

class GlassboxCapableSituationFormulaGenerator(
                                         axiom2formula: AxiomToFormulaMap,
                                         hook2axiom: HookToAxiomMap,
                                         ontologyManager: OWLOntologyManager,
                                         reasonerFactory: OWLReasonerFactory
                                       )
  extends FormulaGenerator(axiom2formula, hook2axiom,ontologyManager, reasonerFactory) {

  //val explanationGenerator = new PelletExplanation(ontology, true);
  var explanationGenerator: MyExplanation = _

  //initExplanationGenerator(ontology)

  override def initExplanationGenerator(ontology: OWLOntology) = {
    val axioms = ontology.getAxioms().asScala.toSet
    val relevantAxiomsFiltered = relevantAxioms.filter(axioms)
    explanationGenerator = MyExplanation.getBlackBoxExplanation(reasonerFactory, reasoner, relevantAxiomsFiltered.asJava)
    // TODO class name misleading - not glassbox!
    //explanationGenerator = new MyExplanation(ontology, true, relevantAxiomsFiltered.asJava) // above line seems to fail
  }

  override def getExplanations(axiom: OWLLogicalAxiom): Iterable[Set[OWLLogicalAxiom]] =
    explanationGenerator.getEntailmentExplanations(axiom)
      .asScala
      .map(_.asScala.toSet[OWLAxiom].map(_.asInstanceOf[OWLLogicalAxiom]))

  override def getExplanationsForInconsistency(): Iterable[Set[OWLLogicalAxiom]] = {
    initReasoner(ontology)

    explanationGenerator.getInconsistencyExplanations()
      .asScala
      .map(_.asScala.toSet[OWLAxiom].map(_.asInstanceOf[OWLLogicalAxiom]))
  }
}
