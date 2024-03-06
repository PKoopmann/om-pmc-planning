package de.tu_dresden.inf.lat.om_pmc.formulaGeneration

import org.semanticweb.owlapi.model.{OWLAxiom, OWLLogicalAxiom}

// used to maps support axioms or sets of support
// maps (sets of) supporting axioms to the (set of) hooks they are associated with
class supportToHook {
  private var mapping : Map[Set[OWLAxiom], Set[OWLLogicalAxiom]] = Map()

  def add(support: Set[OWLAxiom], hooks: Set[OWLLogicalAxiom]): Unit = {
    if (mapping.contains(support))
      mapping += (support -> (hooks ++ mapping(support)))
    else
      mapping += (support -> hooks)
  }




  def get(support: Set[OWLAxiom]) : Set[OWLLogicalAxiom] = {
    mapping getOrElse (support, Set())
  }

}
