package de.tu_dresden.inf.lat.om_planning.generation

import de.tu_dresden.inf.lat.om_planning.data.{FluentMap, HookPredicate}
import de.tu_dresden.inf.lat.om_planning.tools.Tools
import de.tu_dresden.inf.lat.om_pmc.formulaGeneration.FormulaGenerator
import org.semanticweb.owlapi.model._
import org.semanticweb.owlapi.reasoner.OWLReasoner

import scala.collection.JavaConverters.setAsJavaSetConverter

/**
 * generates the rewritings in the syntax of PDDL planning language. Uses derived predicates for rewritings.
 * @param formulaGenerator
 * @param constantReasoner
 * @param factory
 * @param fluentMap
 * @param hookPredicates
 */
class PDDLFormulaGenerator(formulaGenerator: FormulaGenerator,
                           constantReasoner: OWLReasoner,
                           factory: OWLDataFactory,
                           fluentMap: FluentMap,
                           hookPredicates: Iterable[HookPredicate]) {

  val hookInstantiator = new HookInstantiator(constantReasoner,factory)
  val tab = " "*4

  def generateAllFormulaDefinitions(): Iterable[String] = {
    tab + "(:derived (inconsistent) \n"+
      tab*2 + generateInconsistencyFormula() + "\n" +
      tab + ")\n"::
      hookPredicates.map(generateHookFormulas).toList
  }

  def generateInconsistencyFormula() =
    dnfToStr(formulaGenerator.generateInconsistentDNF())

  def generateHookFormulas(hookPredicate: HookPredicate) = {
    tab + "(:derived ("+hookPredicate.name+" "+hookPredicate.variables.mkString("", " ", ")")+ "\n"+
      tab*2 + "(or\n" +
        // next line: derived axiom is true, if inconsistent
        //tab*3 + "(inconsistent) \n"+
        hookInstantiator.validAssignments(hookPredicate).map { ass =>
          val query = hookInstantiator.instantiateQuery(hookPredicate, ass)
          tab*3 + "(and "+toString(ass) +" "+
            //conjunction(query.map(x => dnfToStr(formulaGenerator.generateDNF(x))))+")"
          query.map(x => dnfToStr(formulaGenerator.generateDNF(x))).mkString(" ")+")"
          //+dnfToStr(formulaGenerator.generateDNF(Tools.asOne(query,factory)))+")"
        }.mkString("\n") + "\n" +
      tab*2 + ")\n" +
    tab + ")\n"
  }

  def conjunction(conjuncts: Set[String]) =
    if(conjuncts.size==1)
      conjuncts.head
    else if(conjuncts.isEmpty)
      "true"
    else
      conjuncts.mkString("(and ", " ", ")")

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
