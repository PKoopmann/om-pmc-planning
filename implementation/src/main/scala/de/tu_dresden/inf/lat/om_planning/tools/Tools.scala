package de.tu_dresden.inf.lat.om_planning.tools

import org.semanticweb.owlapi.model.{OWLClassAssertionAxiom, OWLClassExpression, OWLDataFactory, OWLLogicalAxiom, OWLObjectPropertyAssertionAxiom}

import scala.collection.JavaConverters.setAsJavaSetConverter


object Tools {

  /** check whether the given iterable contains duplicates */
  def hasDuplicates[A](iter:Iterable[A]): Boolean = {
    iter.size>iter.toSet.size // TODO this looks like it can be optimized
  }

  def setOfMaps[A,B](map: Map[A, Iterable[B]]): Set[Map[A,B]] = {
    def inner(list: List[(A, Iterable[B])], current: List[(A,B)]): Set[Map[A,B]] = list match {
      case Nil => Set(current.toMap[A,B])
      case (key, values)::tail => {
        values.flatMap { value =>
          inner(tail, (key,value)::current)
        }.toSet[Map[A,B]]
      }
    }
    inner(map.toList, List())
  }

  def asOne(axioms: Set[OWLLogicalAxiom], factory: OWLDataFactory) = {
    if(axioms.size==1)
      axioms.head
    else {
      factory.getOWLSubClassOfAxiom(
        factory.getOWLThing,
        factory.getOWLObjectIntersectionOf(axioms.map(ax =>
          factory.getOWLObjectSomeValuesFrom(factory.getOWLTopObjectProperty, asClass(ax,factory))
        ).asJava)
      )
    }
  }

  def asClass(ax: OWLLogicalAxiom, factory: OWLDataFactory): OWLClassExpression = ax match {
    case ax: OWLClassAssertionAxiom =>
      factory.getOWLObjectIntersectionOf(
        factory.getOWLObjectOneOf(ax.getIndividual),
        ax.getClassExpression)
    case ax: OWLObjectPropertyAssertionAxiom =>
      factory.getOWLObjectIntersectionOf(
        factory.getOWLObjectOneOf(ax.getSubject),
        factory.getOWLObjectHasValue(ax.getProperty, ax.getObject)
      )
    case other =>
      throw new AssertionError("Not supported "+other)
  }

}
