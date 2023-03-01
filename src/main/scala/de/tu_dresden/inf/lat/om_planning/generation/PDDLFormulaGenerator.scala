package de.tu_dresden.inf.lat.om_planning.generation

import de.tu_dresden.inf.lat.om_planning.data.{FluentMap, HookPredicate}
import de.tu_dresden.inf.lat.om_planning.tools.Tools
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
    "(:derived (inconsistent) " + generateInconsistencyFormula() + ")\n"::
      hookPredicates.map(generateHookFormulas).toList
  }

  def generateInconsistencyFormula() =
    dnfToStr(formulaGenerator.generateInconsistentDNF())

  def generateHookFormulas(hookPredicate: HookPredicate) = {
    "(:derived ("+hookPredicate.name+" "+hookPredicate.variables.mkString("", " ", ")")+
      "\n"+
      "\t(or (inconsistent) \n"+
      hookInstantiator.validAssignments(hookPredicate).map { ass =>
        val query = hookInstantiator.instantiateQuery(hookPredicate, ass)
        "\t    (and "+toString(ass) +" "+dnfToStr(formulaGenerator.generateDNF(Tools.asOne(query,factory)))+")"
    }.mkString("\n)")+
    "\n\t)"+
    "\n)\n"
  }

  def dnfToStr(dnf: Set[Set[OWLLogicalAxiom]]): String = {
    if (dnf.isEmpty)
      "(false)"
    else if(dnf.size==1)
      clauseToStr(dnf.head)
    else
      dnf.map(clauseToStr).mkString("(or ", " " ,")")
  }

  def clauseToStr(clause: Set[OWLLogicalAxiom]): String = {
    if (clause.isEmpty)
      "(true)"
    else if(clause.size==1)
      formulaGenerator.toStr(clause.head)
    else
      clause.map(c => formulaGenerator.toStr(c)).mkString("(and ", " ", ")")
  }

  def toString(assignment: Map[String, OWLNamedIndividual]) =
    assignment.map(entry =>
      "(= "+entry._1+" "+fluentMap.convert(entry._2)+")")
      .mkString(" ")



}
