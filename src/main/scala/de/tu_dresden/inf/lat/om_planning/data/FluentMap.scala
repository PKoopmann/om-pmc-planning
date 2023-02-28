package de.tu_dresden.inf.lat.om_planning.data

import org.semanticweb.owlapi.model
import org.semanticweb.owlapi.model.OWLNamedIndividual

case class FluentMap(ind2object: Map[OWLNamedIndividual, String]) {

  def convert(ind: OWLNamedIndividual) = ind2object(ind)
}
