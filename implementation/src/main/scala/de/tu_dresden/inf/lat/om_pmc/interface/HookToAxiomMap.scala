package de.tu_dresden.inf.lat.om_pmc.interface

import org.semanticweb.owlapi.model.OWLLogicalAxiom

class HookToAxiomMap {

  private var map: Map[String,OWLLogicalAxiom] = Map()

  def add(hook: String, axiom: OWLLogicalAxiom) =
    map += ((hook, axiom))

  def axiom(hook: String) =
    map(hook)

  def knows(hook: String) =
    map.contains(hook)

  def hooks() = map.keySet

  override def toString() = {
    map.mkString("[", ", ", "]")
  }

  def size() = map.size
}
