package de.tu_dresden.inf.lat.om_pmc.interface

import org.semanticweb.owlapi.model.{OWLLogicalAxiom}

class AxiomToFormulaMap {

  private var map: Map[OWLLogicalAxiom, String] = Map()

  def add(axiom: OWLLogicalAxiom, formula: String) =
    map += ((axiom,formula))

  def formula(axiom: OWLLogicalAxiom) =
    map(axiom)

  def knows(axiom: OWLLogicalAxiom) =
    map.contains(axiom)

  def axioms = map.keySet


  override def toString() = {
    map.mkString("[", ", ", "]")
  }

  def size() = map.size
}
