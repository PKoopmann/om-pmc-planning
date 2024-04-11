package de.tu_dresden.inf.lat.om_pmc.formulaGeneration

import de.tu_dresden.inf.lat.om_pmc.justificationSchemas.SchemaBasedExplanationGenerator


import com.clarkparsia.owlapi.explanation.{MupsTrackingHSTExplanationGenerator, MultipleExplanationGenerator, SchemaHSTExplanationGenerator, TransactionAwareSingleExpGen}
import de.tu_dresden.inf.lat.om_pmc.interface.{AxiomToFormulaMap, HookToAxiomMap}
import org.semanticweb.owlapi.model.{OWLLogicalAxiom, OWLOntologyManager}
import org.semanticweb.owlapi.reasoner.OWLReasonerFactory

import scala.collection.JavaConverters.setAsJavaSetConverter


// uses schemas in justification algorithm to infer explanations with analogue pattern
class SchemaBasedFormulaGenerator (
                                    axiom2formula: AxiomToFormulaMap,
                                    hook2axiom: HookToAxiomMap,
                                    ontologyManager: OWLOntologyManager,
                                    reasonerFactory: OWLReasonerFactory
                                  )
  extends ClassBasedFormulaGenerator(axiom2formula,hook2axiom,ontologyManager,reasonerFactory) {

  override def getExplanationGenerator(relevantAxioms: Set[OWLLogicalAxiom],
                                       singleGen: TransactionAwareSingleExpGen): MultipleExplanationGenerator  = {
    new MupsTrackingHSTExplanationGenerator(
      relevantAxioms.asJava,
      hookSpecificAxioms.asJava,
      anchorAxioms.asJava,
      singleGen
    )


/*
    new SchemaBasedExplanationGenerator(
      ontology,
      relevantAxioms,
      reasonerFactory,
      getReasoner(ontology)
    )

 */
  }
}
