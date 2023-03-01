package de.tu_dresden.inf.lat.om_planning.data

import org.semanticweb.owlapi.model.{OWLClass, OWLLogicalAxiom, OWLNamedIndividual, OWLObjectProperty}

trait FluentSpecification

case class OWLIndividual2Object(individual: OWLNamedIndividual, object1: String, type1: String) extends FluentSpecification
case class OWLClass2Predicate(owlClass: OWLClass, predicate: String, type1: String) extends FluentSpecification
case class OWLProperty2Predicate(property: OWLObjectProperty, predicate: String, type1: String, type2: String) extends FluentSpecification
case class OWLAxiom2Condition(axiom: OWLLogicalAxiom, condition: String) extends FluentSpecification
