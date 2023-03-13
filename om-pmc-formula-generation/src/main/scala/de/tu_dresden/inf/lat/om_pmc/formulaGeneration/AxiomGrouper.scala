/**
  *  Group axioms into a single one to reduce search space for
  *  explanations
  */

package de.tu_dresden.inf.lat.om_pmc.formulaGeneration

import org.semanticweb.owlapi.model._

import scala.collection.JavaConverters._


class AxiomGrouper(dataFactory: OWLDataFactory) {

  def groupAxioms(axioms: Set[OWLAxiom]): OWLAxiom = {
    val concepts = axioms.map(asConcept).asJava

    dataFactory.getOWLSubClassOfAxiom(
      dataFactory.getOWLThing,
      dataFactory.getOWLObjectIntersectionOf(concepts))
        
  }

  def asConcept(axiom: OWLAxiom): OWLClassExpression = axiom match {
    case as: OWLClassAssertionAxiom =>
      dataFactory.getOWLObjectUnionOf(
        dataFactory.getOWLObjectComplementOf(
          dataFactory.getOWLObjectOneOf(
            as.getIndividual)),
        as.getClassExpression)
    case as: OWLObjectPropertyAssertionAxiom =>
      dataFactory.getOWLObjectUnionOf(
        dataFactory.getOWLObjectComplementOf(
          dataFactory.getOWLObjectOneOf(
            as.getSubject)),
        dataFactory.getOWLObjectSomeValuesFrom(
          as.getProperty,
          dataFactory.getOWLObjectOneOf(
            as.getObject)))
  }

}
