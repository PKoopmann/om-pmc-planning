package de.tu_dresden.inf.lat.om_planning.tools

import org.semanticweb.owlapi.model.{OWLAxiom, OWLOntology}
import org.semanticweb.owlapi.model.parameters.Imports
import org.semanticweb.owlapi.reasoner.OWLReasonerFactory

object OWLTools {


  def copy(ontology: OWLOntology) = {
    val manager = ontology.getOWLOntologyManager()
    manager.createOntology(ontology.axioms(Imports.INCLUDED))
  }
}
