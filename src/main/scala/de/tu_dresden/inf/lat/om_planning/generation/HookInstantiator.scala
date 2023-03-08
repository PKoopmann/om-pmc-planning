package de.tu_dresden.inf.lat.om_planning.generation

import de.tu_dresden.inf.lat.om_planning.data.{HookPredicate, InvalidSpecificationException}
import de.tu_dresden.inf.lat.om_planning.tools.Tools
import de.tu_dresden.inf.lat.om_pmc.interface.HookToAxiomMap
import org.semanticweb.owlapi.model._
import org.semanticweb.owlapi.reasoner.OWLReasoner

import scala.collection.JavaConverters.asScalaSetConverter

class HookInstantiator(reasoner: OWLReasoner, factory: OWLDataFactory) {

  def instantiateQueries(hookPredicate: HookPredicate) = {
    validAssignments(hookPredicate).map(instantiateQuery(hookPredicate,_))
  }

  def instantiateQuery(hookPredicate: HookPredicate, assignment: Map[String, OWLNamedIndividual]) = {
    val indAssignment = assignment.map(pair => (factory.getOWLNamedIndividual(IRI.create(pair._1)), pair._2))
    assert(indAssignment.forall(pair => !indAssignment.contains(pair._2)), "variable to variable: "+assignment)
    hookPredicate.query.map(instantiate(_,indAssignment))
  }

  def instantiate(axiom: OWLLogicalAxiom, assignment: Map[OWLNamedIndividual, OWLNamedIndividual]): OWLLogicalAxiom =
  axiom match {
    case ca: OWLClassAssertionAxiom if ca.getIndividual.isNamed =>
      assert(ca.getClassExpression.individualsInSignature().noneMatch(assignment.contains(_)),
        "variables in concepts not supported yet")
      factory.getOWLClassAssertionAxiom(ca.getClassExpression,
        assignment.getOrElse(ca.getIndividual.asOWLNamedIndividual(), ca.getIndividual))
    case ra: OWLObjectPropertyAssertionAxiom
      if ra.getSubject.isNamed && assignment.contains(ra.getSubject.asOWLNamedIndividual()) =>
      instantiate(
        factory.getOWLObjectPropertyAssertionAxiom(
          ra.getProperty, assignment(ra.getSubject.asOWLNamedIndividual()), ra.getObject), assignment)
    case ra: OWLObjectPropertyAssertionAxiom
      if ra.getObject.isNamed && assignment.contains(ra.getObject.asOWLNamedIndividual()) =>
      factory.getOWLObjectPropertyAssertionAxiom(ra.getProperty, ra.getSubject, assignment(ra.getObject.asOWLNamedIndividual()))
    case other =>
      assert(other.individualsInSignature().noneMatch(assignment.contains(_)),
        "unsupported variable occurrence: "+other)
      other
  }

  def validAssignments(hookPredicate: HookPredicate): Set[Map[String,OWLNamedIndividual]] = {
    var possibilities = Map[String, Set[OWLNamedIndividual]]()

    hookPredicate.typeSpecification.foreach(_ match {
      case ca: OWLClassAssertionAxiom => ca.getIndividual match {
        case ind: OWLNamedIndividual if hookPredicate.variables.contains(ind.getIRI.toString) =>
          val variable = ind.getIRI.toString
          val candidates = reasoner.getInstances(ca.getClassExpression)
            .getFlattened
            .asScala
            .toSet
          if (!possibilities.contains(variable))
            possibilities += (variable -> candidates)
          else {
            possibilities += (variable -> possibilities(variable).intersect(candidates))
          }
        case other => throw new RuntimeException("type specification not supported yet: " + ca)
      }
      case other => throw new RuntimeException("type specification not supported yet: " + other)
    })

    if (hookPredicate.variables.exists(!possibilities.contains(_)))
      throw new InvalidSpecificationException("variables without type specification: " +
        hookPredicate.variables.filterNot(possibilities.contains(_)))
    else
      Tools.setOfMaps(possibilities)
  }

  def asHookToAxiomMap(hookSpecifications: Iterable[HookPredicate]) = {
    val result = new HookToAxiomMap()
    hookSpecifications.foreach(f => instantiateQueries(f).foreach(query =>
      result.add("--", Tools.asOne(query,factory))
    ))
    result
  }
}
