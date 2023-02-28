package de.tu_dresden.inf.lat.om_pmc.formulaGeneration

import org.semanticweb.owlapi.model.OWLLogicalAxiom

import de.tu_dresden.inf.lat.om_pmc.formulaGeneration.FormulaGenerator

class PDDLFormulaGenerator(formulaGenerator : FormulaGenerator) {

  var generator: FormulaGenerator = formulaGenerator

  def generateAllFormulaDefinitions(): Iterable[String] = {
    List("(:derived (inconsistent) (" + generateInconsistencyFormula() + "))") ++
      generator.getHooks().map(hook =>
        "(:derived (" + hook + ") (or (inconsistent) " + generateFormula(hook) + "))"
      )
  }

  def generateInconsistencyFormula(): String = {
    dnfToStr(generator.generateInconsistentDNF());
  }

  def generateFormula(hook: String) = {
    dnfToStr(generator.generateDNF(hook))
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
      clause.map(c => generator.toStr(c)).mkString("(and ", " ", ")")
  }
}
