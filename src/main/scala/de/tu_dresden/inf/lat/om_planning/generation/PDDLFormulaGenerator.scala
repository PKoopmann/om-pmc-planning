package de.tu_dresden.inf.lat.om_planning.generation

import de.tu_dresden.inf.lat.om_planning.data.{FluentMap, HookPredicate}
import de.tu_dresden.inf.lat.om_pmc.formulaGeneration.FormulaGenerator
import org.semanticweb.owlapi.model._
import org.semanticweb.owlapi.reasoner.OWLReasoner

import scala.collection.JavaConverters.setAsJavaSetConverter

class PDDLFormulaGenerator(formulaGenerator: FormulaGenerator,
                           constantReasoner: OWLReasoner,
                           factory: OWLDataFactory,
                           fluentMap: FluentMap,
                           hookPredicates: Iterable[HookPredicate]) {

  val hookInstantiator = new HookInstantiator(constantReasoner,factory)


  def generateAllFormulaDefinitions(): Iterable[String] = {
    "(:derived (inconsistent) (" + generateInconsistencyFormula() + "))"::
      hookPredicates.map(generateHookFormulas).toList
  }

  def generateInconsistencyFormula() =
    dnfToStr(formulaGenerator.generateInconsistentDNF())

  def generateHookFormulas(hookPredicate: HookPredicate) = {
    "(:derived ("+hookPredicate.name+" "+hookPredicate.variables.mkString("(", " ", ")")+
      "\n"+
      "\t(or (inconsistent) \n"+
      hookInstantiator.validAssignments(hookPredicate).map { ass =>
        val query = hookInstantiator.instantiateQuery(hookPredicate, ass)
        "\t    (and "+toString(ass) +" "+dnfToStr(formulaGenerator.generateDNF(asOne(query)))+")"
    }.mkString("\n)")+
    "\n\t)"+
    "\n)"
  }

  def dnfToStr(dnf: Set[Set[OWLLogicalAxiom]]): String = {
    if (dnf.isEmpty)
      "(false)"
    else
      dnf.map(clauseToStr).mkString("(or ", " " ,")")
  }

  def clauseToStr(clause: Set[OWLLogicalAxiom]): String = {
    if (clause.isEmpty)
      "(true)"
    else
      clause.map(c => formulaGenerator.toStr(c)).mkString("(and ", " ", ")")
  }

  def toString(assignment: Map[String, OWLNamedIndividual]) =
    assignment.map(entry =>
      "(= "+entry._1+" "+fluentMap.convert(entry._2)+")")
      .mkString(" ")

  def asOne(axioms: Set[OWLLogicalAxiom]) = {
    if(axioms.size==1)
      axioms.head
    else {
      factory.getOWLSubClassOfAxiom(
        factory.getOWLThing,
        factory.getOWLObjectIntersectionOf(axioms.map(ax =>
          factory.getOWLObjectSomeValuesFrom(factory.getOWLTopObjectProperty, asClass(ax))
        ).asJava)
      )
    }
  }

  def asClass(ax: OWLLogicalAxiom): OWLClassExpression = ax match {
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
