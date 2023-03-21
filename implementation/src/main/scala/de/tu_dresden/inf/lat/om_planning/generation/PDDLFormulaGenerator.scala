package de.tu_dresden.inf.lat.om_planning.generation

import de.tu_dresden.inf.lat.om_planning.data.{FluentMap, HookPredicate}
import de.tu_dresden.inf.lat.om_planning.generation.PlanningFormulaGenerator.sortAssignments
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
                           hookPredicates: Seq[HookPredicate]) extends PlanningFormulaGenerator(hookPredicates) {

  val hookInstantiator = new HookInstantiator(constantReasoner,factory)
  val tab = " "*4

  def inconsistencyDefinition() = {
    tab + "(:derived (inconsistent) \n" +
      tab * 2 + generateInconsistencyFormula() + "\n" +
      tab + ")\n"
  }

  def generateInconsistencyFormula() =
    dnfToStr(formulaGenerator.generateInconsistentDNF())

  override def generateHookFormulas(hookPredicate: HookPredicate) = {
    tab + "(:derived ("+hookPredicate.name+" "+hookPredicate.variables.mkString("", " ", ")")+ "\n"+
      tab*2 + "(or\n" +
        // next line: derived axiom is true, if inconsistent
        tab*3 + "(inconsistent) \n"+
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


  override def generateHookFormulas(hookPredicate: HookPredicate, start: Int, end: Int) = {
    var result = List[String]()
    if(start<=0) {
      result = result :+ (tab + "(:derived (" + hookPredicate.name + " " + hookPredicate.variables.mkString("", " ", ")") + "\n" +
        tab * 2 + "(or\n" +
        tab * 3 + "(inconsistent) \n")
    }

    val assignments = sortAssignments(hookInstantiator.validAssignments(hookPredicate))
    //if(currentPos+assignments.size > start) {
    val slice  = assignments.slice(start, end)
    result ++= slice.map { ass =>
          println("process "+ass)
          val query = hookInstantiator.instantiateQuery(hookPredicate, ass)
          tab * 3 + "(and " + toString(ass) + " " +
            //conjunction(query.map(x => dnfToStr(formulaGenerator.generateDNF(x))))+")"
            query.map(x => dnfToStr(formulaGenerator.generateDNF(x))).mkString(" ") + ")"
        //+dnfToStr(formulaGenerator.generateDNF(Tools.asOne(query,factory)))+")"
    }

    println("Assignments: "+assignments.size)

    if(start<=assignments.size && assignments.size<=end)
      result = result :+ "\n" +
        tab * 2 + ")\n" +
        tab + ")\n"

    (result, assignments.size)
  }

  def conjunction(conjuncts: Set[String]) =
    if(conjuncts.size==1)
      conjuncts.head
    else if(conjuncts.isEmpty)
      "true"
    else
      conjuncts.mkString("(and ", " ", ")")

  def disjunction(disjuncts: Set[String]) =
    if (disjuncts.size == 1)
      disjuncts.head
    else if (disjuncts.isEmpty)
      "false"
    else
      disjuncts.mkString("(or ", " ", ")")


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
