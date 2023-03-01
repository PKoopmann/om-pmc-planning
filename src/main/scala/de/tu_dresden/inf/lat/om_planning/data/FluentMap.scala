package de.tu_dresden.inf.lat.om_planning.data

import org.semanticweb.owlapi.model
import org.semanticweb.owlapi.model.{OWLAxiom, OWLClass, OWLClassAssertionAxiom, OWLDataFactory, OWLEntity, OWLLogicalAxiom, OWLNamedIndividual, OWLObjectProperty, OWLObjectPropertyAssertionAxiom}

import scala.collection.mutable

case class FluentMap(specifications: Set[FluentSpecification]) {

  private var individual2object = Map[OWLNamedIndividual, String]()
  private var class2spec = Map[OWLClass, OWLClass2Predicate]()
  private var prop2spec = Map[OWLObjectProperty, OWLProperty2Predicate]()
  private var axiom2conditions =
    new mutable.HashMap[OWLLogicalAxiom, mutable.Set[String]]() with mutable.MultiMap[OWLLogicalAxiom,String]
  private var typeInstances =
    new mutable.HashMap[String, mutable.Set[OWLNamedIndividual]]() with mutable.MultiMap[String, OWLNamedIndividual]

  specifications.foreach(s => s match {
    case OWLIndividual2Object(i,o,t) => individual2object += (i -> o); typeInstances.addBinding(t,i)
    case OWLClass2Predicate(c, _, _) => class2spec += (c -> s.asInstanceOf[OWLClass2Predicate])
    case OWLProperty2Predicate(p,_,_,_) => prop2spec += (p -> s.asInstanceOf[OWLProperty2Predicate])
    case OWLAxiom2Condition(a, c) => axiom2conditions.addBinding(a,c)
    case _ => throw new AssertionError()
  })

  def fluents(factory: OWLDataFactory): Set[OWLLogicalAxiom] = {
    specifications.flatMap(instantiate(_,factory))
  }

  def instantiate(spec: FluentSpecification, factory: OWLDataFactory) = {
    (spec match {
      case _: OWLIndividual2Object => Set[OWLLogicalAxiom]()
      case OWLClass2Predicate(c,_,t) => typeInstances.getOrElse(t,Set())
        .map(factory.getOWLClassAssertionAxiom(c, _))
      case OWLProperty2Predicate(prp,_,t1,t2) => typeInstances.getOrElse(t1,Set())
        .flatMap(i1 =>
          typeInstances.getOrElse(t2,Set())
            .map(i2 =>
              factory.getOWLObjectPropertyAssertionAxiom(prp,i1,i2)
            )
        )
      case OWLAxiom2Condition(ax, _) => Set(ax)
    }).toSet[OWLLogicalAxiom]
  }

  def convert(ind: OWLNamedIndividual): String = individual2object(ind)

  def convert(axiom: OWLLogicalAxiom): String = {
    val set = allConversions(axiom)
    if(set.size==1)
      set.head
    else
      set.mkString("(or ", " ", ")")
  }

  private def allConversions(axiom: OWLLogicalAxiom) = {
    var result = List() ++ axiom2conditions.getOrElse(axiom, Set())
    axiom match {
      case ca: OWLClassAssertionAxiom if ca.getClassExpression.isOWLClass && ca.getIndividual.isNamed =>
        class2spec.get(ca.getClassExpression.asOWLClass()).foreach(f =>
          result ::= ("("+f.predicate+" "+convert(ca.getIndividual.asOWLNamedIndividual())+")")
        )
      case pa: OWLObjectPropertyAssertionAxiom
        if pa.getProperty.isNamed && pa.getSubject.isNamed && pa.getObject.isNamed =>
        prop2spec.get(pa.getProperty.getNamedProperty).foreach(f =>
          result ::= ("("
            +f.predicate+" "
            +convert(pa.getSubject.asOWLNamedIndividual())+" "
            +convert(pa.getObject.asOWLNamedIndividual())+")")
        )
    }
    result.toSet[String]
  }

}
