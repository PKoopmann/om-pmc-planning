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
    val axioms = ontology.getLogicalAxioms().asScala.toSet

    val relevantAxiomsFiltered = relevantAxioms.filter(axioms)


    // TODO: as indicated by a later comment: this line may not work properly. Test this!
    explanationGenerator = MyExplanation.getBlackBoxExplanation(reasonerFactory, reasoner, relevantAxiomsFiltered.asJava)

    //explanationGenerator = new MyExplanation(ontology, true, relevantAxiomsFiltered.asJava) // above line seems to fail

  }

  override def synchronizeExplanationGenerator() = {
    initExplanationGenerator(reasoner.getRootOntology())
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

  // generic method to generate explanation
  override def fluentExplanationsAsDNF(axiom: OWLLogicalAxiom): Set[Set[OWLLogicalAxiom]] = {
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
}
