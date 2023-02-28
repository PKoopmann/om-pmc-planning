package de.tu_dresden.inf.lat.om_pmc

import de.tu_dresden.inf.lat.om_pmc.formulaGeneration.FormulaGenerator
import de.tu_dresden.inf.lat.om_pmc.formulaGeneration.PDDLFormulaGenerator
import de.tu_dresden.inf.lat.om_pmc.interface.InterfaceParser
import org.semanticweb.owlapi.apibinding.OWLManager

import java.io.{File, PrintWriter}

object CreatePDDLDefinitions {

  def main(args: Array[String]) = {
    if(args.isEmpty || args.size!=4) {
      println("Expected parameters : ")
      println("formulaFile hookFile ontologyFile outputFile")
    } else {
      create(
        new File(args(0)),
        new File(args(1)),
        new File(args(2)),
        new File(args(3)))
    }
  }

  def create(formulaFile: File, hookFile: File, ontologyFile: File, outputFile: File): Unit = {
    val ontology = OWLManager.createOWLOntologyManager().loadOntologyFromOntologyDocument(ontologyFile)

    val parser = new InterfaceParser(ontology)
    val axiom2Formula = parser.parseAxiomMapping(formulaFile)
    println("Mapping DL fluent -> PDDL formula: "+axiom2Formula)
    val hook2axiom = parser.parseHookDefinitions(hookFile)
    println("Mapping PDDL hook -> DL axiom: "+hook2axiom)

    // val formulaGenerator = FormulaGenerator.formulaGenerator(axiom2Formula,hook2axiom,ontology)
    val formulaGenerator = FormulaGenerator.formulaGenerator(axiom2Formula,hook2axiom,ontology)

    val pddlFormulaGenerator = new PDDLFormulaGenerator(formulaGenerator);

    val printWriter = new PrintWriter(outputFile)

    pddlFormulaGenerator.generateAllFormulaDefinitions()
      .foreach(printWriter.println(_))

    printWriter.close()
  }
}
