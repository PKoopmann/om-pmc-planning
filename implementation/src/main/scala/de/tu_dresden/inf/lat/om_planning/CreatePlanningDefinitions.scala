package de.tu_dresden.inf.lat.om_planning

import de.tu_dresden.inf.lat.om_planning.generation.{HookInstantiator, PDDLFormulaGenerator, RDDLFormulaGenerator}
import de.tu_dresden.inf.lat.om_planning.parsing.{FluentSpecificationParser, HookSpecificationParser}
import de.tu_dresden.inf.lat.om_pmc.formulaGeneration.FormulaGenerator
import de.tu_dresden.inf.lat.om_pmc.parsing.InterfaceParser
import org.semanticweb.HermiT.ReasonerFactory
import org.semanticweb.owlapi.apibinding.OWLManager

import java.io.{File, PrintWriter}

object CreatePlanningDefinitions {

  def main(args: Array[String]) = {
    if (args.isEmpty || args.size != 5) {
      println("Expected parameters : ")
      println("outputSyntax formulaFile hookFile ontologyFile outputFile")
    } else if (args(0) != "-pddl" && args(0) != "-rddl") {
      println("outputSyntax needs to be 'pddl' or '-rddl'")
    } else {
        create(
          args(0),
          new File(args(1)),
          new File(args(2)),
          new File(args(3)),
          new File(args(4)))
      }
  }

  def create(outputSyntax: String, formulaFile: File, hookFile: File, ontologyFile: File, outputFile: File): Unit = {
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

    val printWriter = new PrintWriter(outputFile)

    if (outputSyntax == "-pddl") {
      val pddlFormulaGenerator = new PDDLFormulaGenerator(formulaGenerator, reasoner, factory, fluentSpec, hookSpec)
      pddlFormulaGenerator.generateAllFormulaDefinitions()
        .foreach(printWriter.println)
    }
    else if (outputSyntax == "-rddl") {
      val rddlFormulaGenerator = new RDDLFormulaGenerator(formulaGenerator, reasoner, factory, fluentSpec, hookSpec)
      rddlFormulaGenerator.generateAllFormulaDefinitions()
        .foreach(printWriter.println)
    }

    printWriter.close()
  }
}
