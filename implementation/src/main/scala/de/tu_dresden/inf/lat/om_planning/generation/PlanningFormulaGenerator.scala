package de.tu_dresden.inf.lat.om_planning.generation

import de.tu_dresden.inf.lat.om_planning.data.HookPredicate
import org.semanticweb.owlapi.model.{OWLLogicalAxiom, OWLNamedIndividual}

abstract class PlanningFormulaGenerator(hookPredicates: Seq[HookPredicate]) {

  def inconsistencyDefinition(): String
  def generateHookFormulas(predicate: HookPredicate, start: Int, end: Int): (List[String], Integer)
  def generateHookFormulas(hookPredicate: HookPredicate): String

  def generateAllFormulaDefinitions(): Iterable[String] = {
    inconsistencyDefinition() ::
      hookPredicates.map(generateHookFormulas).toList
  }

  def generateRangeOfFormulaDefinitions(start: Int, end: Int): List[String] = {
    var result = List[String]()
    var currentStart = start
    var currentEnd= end
    var hookPredicatesLeft = hookPredicates
    if (currentStart==0) {
      //println(currentEnd)
      result ::= inconsistencyDefinition()
    }
    while (currentEnd>0 && !hookPredicatesLeft.isEmpty) {
      println(currentStart+" - "+currentEnd)
      val currentPredicate = hookPredicatesLeft.head
      hookPredicatesLeft = hookPredicatesLeft.tail
      val (nextStrings,size) = generateHookFormulas(currentPredicate, currentStart, currentEnd)
      currentStart -= size
      currentEnd -= size
      result ++= nextStrings
    }
    println(currentStart+" - "+currentEnd)
    result
  }
}

object PlanningFormulaGenerator {
  def sortAssignments(assignments: Set[Map[String,OWLNamedIndividual]]): Seq[Map[String,OWLNamedIndividual]] = {
    assignments.toSeq.sortWith((a,b) => {
      var value: Option[Boolean] = None
      (a.keySet++b.keySet).toSeq.sorted.foreach { key =>
        if(value.isEmpty){
          if(!a.contains(key))
            value = Some(true)
          else if(!b.contains(key))
            value = Some(false)
          else {
            val cmp = a(key).getIRI.getIRIString.compareTo(b(key).getIRI.getIRIString)
            if(cmp>0)
              value = Some(false)
            else if(cmp<0)
              value = Some(true)
          }
        }
      }
      value.getOrElse(false)
    })
  }
}
