package de.tu_dresden.inf.lat.om_pmc.formulaGeneration

import de.tu_dresden.inf.lat.om_pmc.interface.{AxiomToFormulaMap, HookToAxiomMap}
import org.semanticweb.owlapi.model.{OWLLogicalAxiom, OWLOntologyManager}
import org.semanticweb.owlapi.reasoner.OWLReasonerFactory
import scala.collection.JavaConverters.{asScalaSetConverter, setAsJavaSetConverter}


class HookCentricFormulaGenerator( axiom2formula: AxiomToFormulaMap,
                                    hook2axiom: HookToAxiomMap,
                                    ontologyManager: OWLOntologyManager,
                                    reasonerFactory: OWLReasonerFactory
                                  )
  extends BlackboxSituationFormulaGenerator(axiom2formula,hook2axiom,ontologyManager,reasonerFactory) {

  // generate DNF by iterating over repairs for one hook at a time

  override def fluentExplanationsAsDNF(axiom: OWLLogicalAxiom): Set[Set[OWLLogicalAxiom]] = {
    var dnf = Set[Set[OWLLogicalAxiom]]()

    val axioms = ontology.getAxioms()

    val repairs = getRepairs()
    println("Number of repairs: " + repairs.size)

    repairs.foreach { repair =>

      // compute repaired ontology
      val repairedAxioms = axioms.asScala -- repair
      val repairedOntology = ontologyManager.createOntology(repairedAxioms.asJava)
      updateReasoner(repairedOntology)
      // get explanations using the repaired ontology
      val explanations =  explanationWithCurrentReasoner(axiom)

      // add all found explanations to DNF
      explanations.foreach { exp =>
        dnf = addExplanationToDNF(dnf, exp)
      }

    }
    val oldOntology = ontologyManager.createOntology(axioms)
    updateReasoner(oldOntology)

    dnf
  }
}
