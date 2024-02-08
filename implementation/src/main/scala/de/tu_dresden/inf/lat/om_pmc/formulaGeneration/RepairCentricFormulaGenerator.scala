package de.tu_dresden.inf.lat.om_pmc.formulaGeneration

import de.tu_dresden.inf.lat.om_pmc.interface.{AxiomToFormulaMap, HookToAxiomMap}
import org.semanticweb.owlapi.model.{OWLLogicalAxiom, OWLOntologyManager}
import org.semanticweb.owlapi.reasoner.OWLReasonerFactory

import scala.collection.JavaConverters.{asScalaSetConverter, setAsJavaSetConverter}
import scala.collection.mutable

class RepairCentricFormulaGenerator( axiom2formula: AxiomToFormulaMap,
                                     hook2axiom: HookToAxiomMap,
                                     ontologyManager: OWLOntologyManager,
                                     reasonerFactory: OWLReasonerFactory
                                   )
  extends BlackboxSituationFormulaGenerator(axiom2formula,hook2axiom,ontologyManager,reasonerFactory) {

  // generate DNF by iterating over all hooks for one rewriting at a time
  override def fluentExplanationsAsDNF(axiom: OWLLogicalAxiom): Set[Set[OWLLogicalAxiom]] = {
    // generate repairs if it had not been done in the past
    if (repairCentricRewritings.isEmpty)
      generateRepairCentricRewritings()

    if (repairCentricRewritings.get.contains(axiom))
      repairCentricRewritings.get(axiom)
    else {
      println("WARNING: no rewritings for " + axiom + " where computed.")
      Set() // empty disjunction --> false
    }
  }




  // map to store generated rewritings
  // maps from hook axioms to explanation DNFs
  private var repairCentricRewritings : Option[mutable.Map[OWLLogicalAxiom, Set[Set[OWLLogicalAxiom]]]] = None

  // iterates over all repairs and calculates the rewritings for all hooks
  private def generateRepairCentricRewritings(): Unit = {
    freeSomeMemory()

    val rewritings: mutable.Map[OWLLogicalAxiom, Set[Set[OWLLogicalAxiom]]] = mutable.Map()

    // get repairs
    val repairs = getRepairs()
    println("Number of repairs: " + repairs.size)


    val axioms = ontology.getAxioms()

    // iterate through all repairs
    var counter = 0
    var totalHookCount = 0
    repairs.foreach { repair =>
      counter += 1
      println("Computing hooks for repair nr. "+counter)

      val repairedAxioms = axioms.asScala -- repair
      val repairedOntology = ontologyManager.createOntology(repairedAxioms.asJava)

      updateReasoner(repairedOntology)

      relevantHooks.foreach { axiom =>
        totalHookCount += 1



        // free some memory every 20th hook
        if (totalHookCount %20 == 0) {
          println(s"free some memory: hock count=$totalHookCount")
          freeSomeMemory()
        }
        //val axiom = hook2axiom.axiom(hook)

        // find axiom (if we already have rewritings for it
        var dnf : Set[Set[OWLLogicalAxiom]] = {
          if(rewritings.contains(axiom))
            rewritings(axiom)
          else
            Set()
        }

        // get explanations w.r.t. the current (repaired) ontology
        val explanations = explanationWithCurrentReasoner(axiom)
        explanations.foreach {exp =>
          dnf = addExplanationToDNF(dnf, exp)
        }
        // add updated explanation DNF to the map
        //println("add axiom: " + SimpleOWLFormatter.format(axiom))
        rewritings += (axiom -> dnf)

      }
    }

    repairCentricRewritings = Some(rewritings)
  }
}
