package de.tu_dresden.inf.lat.om_planning

import de.tu_dresden.inf.lat.om_planning.generation.{HookInstantiator, PDDLFormulaGenerator, PlanningFormulaGenerator, RDDLFormulaGenerator}
import de.tu_dresden.inf.lat.om_planning.parsing.{FluentSpecificationParser, HookSpecificationParser}
import de.tu_dresden.inf.lat.om_pmc.formulaGeneration.FormulaGenerator
import de.tu_dresden.inf.lat.om_pmc.parsing.InterfaceParser
import org.semanticweb.HermiT.ReasonerFactory
import org.semanticweb.owlapi.apibinding.OWLManager

import java.io.{File, FileWriter, PrintWriter}

object CreatePlanningDefinitions {

  def main(args: Array[String]) = {

    /*create(
      "-pddl",
      new File("/home/tobias/Documents/programming/ontologies/om-pmc-formula-generation/examples/pipes/A-9/fluents.txt"),
      new File("/home/tobias/Documents/programming/ontologies/om-pmc-formula-generation/examples/pipes/A-9/hooks.txt"),
      new File("/home/tobias/Documents/programming/ontologies/om-pmc-formula-generation/examples/pipes/A-9/pipesA-9.ttl"),
      new File("/home/tobias/Documents/programming/ontologies/om-pmc-formula-generation/examples/pipes/A-9/temp_rewritings.txt")
    )

     */
    create(
      "-pddl",
      new File("/home/tobias/Documents/programming/ontologies/om-pmc-formula-generation/examples/drones/5-5/fluents.txt"),
      new File("/home/tobias/Documents/programming/ontologies/om-pmc-formula-generation/examples/drones/5-5/hooks.txt"),
      new File("/home/tobias/Documents/programming/ontologies/om-pmc-formula-generation/examples/drones/5-5/drone5-5.ttl"),
      new File("/home/tobias/Documents/programming/ontologies/om-pmc-formula-generation/examples/drones/5-5/temp_rewritings.txt")
    )


    if (args.isEmpty || (args.size != 5 && args.size!=7) ) {
      println("Expected parameters : ")
      println("outputSyntax formulaFile hookFile ontologyFile outputFile [slice-start slide-end]")
    } else if (args(0) != "-pddl" && args(0) != "-rddl") {
      println("outputSyntax needs to be '-pddl' or '-rddl'")
    } else if(args.size==5) {
        create(
          args(0),
          new File(args(1)),
          new File(args(2)),
          new File(args(3)),
          new File(args(4))
        )
      } else {
      assert(args.size==7)
      create(
        args(0),
        new File(args(1)),
        new File(args(2)),
        new File(args(3)),
        new File(args(4)),
        args(5).toInt,
        args(6).toInt
      )

    }


  }

  def create(outputSyntax: String, formulaFile: File, hookFile: File, ontologyFile: File, outputFile: File,
             sliceStart:Int = -1, sliceEnd:Int = -1): Unit = {
    val manager = OWLManager.createOWLOntologyManager()
    val ontology = manager.loadOntologyFromOntologyDocument(ontologyFile)
    val factory = manager.getOWLDataFactory()

    val fluentSpec = new FluentSpecificationParser(ontology, factory).parse(formulaFile)
    val hookSpec = new HookSpecificationParser(ontology).parse(hookFile)

    // we use a copy here, to disentangle this reasoner from the other ones --> prevents memory leak
    val ontologyCopy = OWLManager.createOWLOntologyManager().loadOntologyFromOntologyDocument(ontologyFile)
    val hookInstantiatorReasoner = new ReasonerFactory().createReasoner(ontologyCopy)

    val hookInstantiator = new HookInstantiator(hookInstantiatorReasoner, factory)

    // val formulaGenerator = FormulaGenerator.formulaGenerator(axiom2Formula,hook2axiom,ontology)
    val formulaGenerator = FormulaGenerator
      .formulaGenerator(fluentSpec.asAxiom2FormulaMap(factory), hookInstantiator.asHookToAxiomMap(hookSpec), ontology)

    val printWriter = new PrintWriter(new FileWriter(outputFile,true))

    val planningFormulaGenerator: PlanningFormulaGenerator =
      if (outputSyntax=="-pddl") {
        new PDDLFormulaGenerator(formulaGenerator, hookInstantiator, factory, fluentSpec, hookSpec)
      } else { //if (outputSyntax == "-rddl") {
        assert(outputSyntax=="-rddl")
        // TODO: modify analogue to PDDLFormulaGenerator
        new RDDLFormulaGenerator(formulaGenerator, hookInstantiatorReasoner, factory, fluentSpec, hookSpec)
      }

    if(sliceStart == -1)
      planningFormulaGenerator.generateAllFormulaDefinitions()
        .foreach(printWriter.println)
    else {
      println("Creating slice from "+sliceStart+" to "+sliceEnd)
      planningFormulaGenerator.generateRangeOfFormulaDefinitions(sliceStart,sliceEnd)
        .foreach(printWriter.println)
    }

    printWriter.close()
  }
}
