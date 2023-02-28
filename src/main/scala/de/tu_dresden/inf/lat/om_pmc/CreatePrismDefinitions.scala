package de.tu_dresden.inf.lat.om_pmc

import de.tu_dresden.inf.lat.om_pmc.formulaGeneration.FormulaGenerator
import de.tu_dresden.inf.lat.om_pmc.formulaGeneration.FormulaGeneratorPDDL
import de.tu_dresden.inf.lat.om_pmc.interface.InterfaceParser
import org.semanticweb.owlapi.apibinding.OWLManager
import org.semanticweb.owlapi.model.OWLOntology

import java.io.{File, PrintWriter}

object CreatePrismDefinitions {

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
    println("Mapping DL fluent -> PRISM formula: "+axiom2Formula)
    val hook2axiom = parser.parseHookDefinitions(hookFile)
    println("Mapping PRISM hook -> DL axiom: "+hook2axiom)

 //   val formulaGenerator = FormulaGenerator.formulaGenerator(axiom2Formula,hook2axiom,ontology)
    val formulaGenerator = FormulaGeneratorPDDL.formulaGenerator(axiom2Formula,hook2axiom,ontology)


    val printWriter = new PrintWriter(outputFile)

    formulaGenerator.generateAllFormulaDefinitions()
      .foreach(printWriter.println(_))

    printWriter.close()
  }
}
