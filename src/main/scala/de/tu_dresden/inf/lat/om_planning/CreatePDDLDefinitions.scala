package de.tu_dresden.inf.lat.om_planning

import de.tu_dresden.inf.lat.om_planning.generation.{HookInstantiator, PDDLFormulaGenerator}
import de.tu_dresden.inf.lat.om_planning.parsing.{FluentSpecificationParser, HookSpecificationParser}
import de.tu_dresden.inf.lat.om_pmc.formulaGeneration.FormulaGenerator
import de.tu_dresden.inf.lat.om_pmc.parsing.InterfaceParser
import org.semanticweb.HermiT.ReasonerFactory
import org.semanticweb.owlapi.apibinding.OWLManager

import java.io.{File, PrintWriter}

object CreatePDDLDefinitions {

  def main(args: Array[String]) = {
    if (args.isEmpty || args.size != 4) {
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
    val manager = OWLManager.createOWLOntologyManager()
    val ontology = manager.loadOntologyFromOntologyDocument(ontologyFile)
    val factory = manager.getOWLDataFactory()

    val fluentSpec = new FluentSpecificationParser(ontology, factory).parse(formulaFile)
    val hookSpec = new HookSpecificationParser(ontology).parse(hookFile)

    val reasoner = new ReasonerFactory().createReasoner(ontology)

    val hookInstantiator = new HookInstantiator(reasoner, factory)

    // val formulaGenerator = FormulaGenerator.formulaGenerator(axiom2Formula,hook2axiom,ontology)
    val formulaGenerator = FormulaGenerator
      .formulaGenerator(fluentSpec.asAxiom2FormulaMap(factory), hookInstantiator.asHookToAxiomMap(hookSpec), ontology)

    val pddlFormulaGenerator = new PDDLFormulaGenerator(formulaGenerator, reasoner, factory, fluentSpec, hookSpec)

    val printWriter = new PrintWriter(outputFile)

    pddlFormulaGenerator.generateAllFormulaDefinitions()
      .foreach(printWriter.println)

    printWriter.close()
  }
}
