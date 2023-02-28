package de.tu_dresden.inf.lat.om_planning

import de.tu_dresden.inf.lat.om_planning.data.{FluentMap, HookPredicate}
import de.tu_dresden.inf.lat.om_pmc.formulaGeneration.FormulaGenerator
import org.semanticweb.owlapi.model.{OWLClassAssertionAxiom, OWLClassExpression, OWLDataFactory, OWLLogicalAxiom, OWLNamedIndividual, OWLObjectPropertyAssertionAxiom}
import org.semanticweb.owlapi.reasoner.OWLReasoner

import scala.collection.JavaConverters.setAsJavaSetConverter

class PlanningFormulaGenerator(formulaGenerator: FormulaGenerator,
                               constantReasoner: OWLReasoner,
                               factory: OWLDataFactory,
                               fluentMap: FluentMap) {

  val hookInstantiator = new HookInstantiator(constantReasoner,factory)

  def generateInconsistencyDNF() =
    formulaGenerator.generateInconsistentDNF()

  def generateHookFormulas(hookPredicate: HookPredicate) = {
    "(:derive ("+hookPredicate.name+" "+hookPredicate.variables.mkString("(", " ", ")")+
      "\n"+
      hookInstantiator.validAssignments(hookPredicate).map { ass =>
        val query = hookInstantiator.instantiateQuery(hookPredicate, ass)
        "\t(and "+toString(ass) +" "+toString(formulaGenerator.generateDNF(asOne(query)))+")\n"
    }.mkString("( or "," ",")")+
    ")"
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
