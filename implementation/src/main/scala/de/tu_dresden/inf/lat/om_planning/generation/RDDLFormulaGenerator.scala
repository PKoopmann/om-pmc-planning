package de.tu_dresden.inf.lat.om_planning.generation

import de.tu_dresden.inf.lat.om_planning.data.{FluentMap, HookPredicate}
import de.tu_dresden.inf.lat.om_pmc.formulaGeneration.FormulaGenerator
import org.semanticweb.owlapi.model._
import org.semanticweb.owlapi.reasoner.OWLReasoner

/**
 * generates the rewritings in the syntax of the RDDL planning language. Uses intermediate fluents for rewritings.
 * @param formulaGenerator
 * @param constantReasoner
 * @param factory
 * @param fluentMap
 * @param hookPredicates
 */
class RDDLFormulaGenerator(formulaGenerator: FormulaGenerator,
                           constantReasoner: OWLReasoner,
                           factory: OWLDataFactory,
                           fluentMap: FluentMap,
                           hookPredicates: Iterable[HookPredicate]) {

  val hookInstantiator = new HookInstantiator(constantReasoner,factory)
  val tab = " "*4

  def generateAllFormulaDefinitions(): Iterable[String] = {
    tab + "inconsistent = " + generateInconsistencyFormula() + "\n"::
      hookPredicates.map(generateHookFormulas).toList
  }

  def generateInconsistencyFormula() =
    dnfToStr(formulaGenerator.generateInconsistentDNF())

  def generateHookFormulas(hookPredicate: HookPredicate) = {
    tab +hookPredicate.name + hookPredicate.variables.mkString(" ", " ", " =")+ "\n"+
      tab*2 + "if (inconsistent)\n" +
        tab*3 + " then true\n"+
        hookInstantiator.validAssignments(hookPredicate).map { ass =>
          val query = hookInstantiator.instantiateQuery(hookPredicate, ass)
          tab*2 + "if ("+toString(ass) +")\n"+
            //conjunction(query.map(x => dnfToStr(formulaGenerator.generateDNF(x))))+")"
            tab*3 + "then " + query.map(x => dnfToStr(formulaGenerator.generateDNF(x))).mkString("(", " ^ ", ")")
          //+dnfToStr(formulaGenerator.generateDNF(Tools.asOne(query,factory)))+")"
        }.mkString("\n") + "\n" +
    tab + "else\n" +
      tab*2 + "false;\n" +
    "\n"
  }


  def dnfToStr(dnf: Set[Set[OWLLogicalAxiom]]): String = {
    if (dnf.isEmpty)
      "false"
    else if(dnf.size==1)
      clauseToStr(dnf.head)
    else
      dnf.map(clauseToStr).mkString("(", " | " ,")")
  }

  def clauseToStr(clause: Set[OWLLogicalAxiom]): String = {
    if (clause.isEmpty)
      "true"
    else if(clause.size==1)
      formulaGenerator.toStr(clause.head)
    else
      clause.map(c => formulaGenerator.toStr(c)).mkString("(", " & ", ")")
  }

  def toString(assignment: Map[String, OWLNamedIndividual]) =
    assignment.map(entry =>
      "("+entry._1+" == "+fluentMap.convert(entry._2)+")")
      .mkString(" ")



}
