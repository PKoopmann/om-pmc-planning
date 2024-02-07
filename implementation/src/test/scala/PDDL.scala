import de.tu_dresden.inf.lat.om_planning.generation.{HookInstantiator, PDDLFormulaGenerator, PlanningFormulaGenerator}
import de.tu_dresden.inf.lat.om_planning.parsing.{FluentSpecificationParser, HookSpecificationParser}
import de.tu_dresden.inf.lat.om_pmc.formulaGeneration.FormulaGenerator
import de.tu_dresden.inf.lat.om_pmc.parsing.InterfaceParser
import org.junit.Test
import org.semanticweb.HermiT.ReasonerFactory
import org.semanticweb.owlapi.apibinding.OWLManager
import org.semanticweb.owlapi.io.ReaderDocumentSource

import scala.io.Source

class PDDL {

  @Test
  def bug3() = {
    test("bug3/TTL5-5.ttl", "bug3/fluents.txt", "bug3/hooks.txt")
  }

  def test(ontologyPath: String, fluentPath: String, hookPath: String) = {
    val manager = OWLManager.createOWLOntologyManager()
    val ontology = manager.loadOntologyFromOntologyDocument(
      new ReaderDocumentSource(Source.fromResource(ontologyPath).reader()))
    val factory = manager.getOWLDataFactory()

    val fluentSpec = new FluentSpecificationParser(ontology, factory).parse(Source.fromResource(fluentPath))
    val hookSpec = new HookSpecificationParser(ontology).parse(Source.fromResource(hookPath))

    // we use a copy here, to disentangle this reasoner from the other ones --> prevents memory leak
    val ontologyCopy = OWLManager.createOWLOntologyManager().loadOntologyFromOntologyDocument(
      new ReaderDocumentSource(Source.fromResource(ontologyPath).reader()))
    val hookInstantiatorReasoner = new ReasonerFactory().createReasoner(ontologyCopy)

    val hookInstantiator = new HookInstantiator(hookInstantiatorReasoner, factory)

    // val formulaGenerator = FormulaGenerator.formulaGenerator(axiom2Formula,hook2axiom,ontology)
    val formulaGenerator = FormulaGenerator
      .formulaGenerator(fluentSpec.asAxiom2FormulaMap(factory), hookInstantiator.asHookToAxiomMap(hookSpec), ontology, hookInstantiator.primitiveHookAxioms(hookSpec))

    val planningFormulaGenerator: PlanningFormulaGenerator =
      new PDDLFormulaGenerator(formulaGenerator, hookInstantiator, factory, fluentSpec, hookSpec)

    planningFormulaGenerator.generateAllFormulaDefinitions()
      .foreach(println)
  }

  @Test
  def testFluentParsing(): Unit = {
    val manager = OWLManager.createOWLOntologyManager()
    val factory = manager.getOWLDataFactory
    val ontology = manager.loadOntologyFromOntologyDocument(new ReaderDocumentSource(
        Source.fromResource("pddl/miniAUVPlan.ttl").reader()
      ))

    val parser = new FluentSpecificationParser(ontology, factory)

    println(Source.fromResource("pddl/fluents.txt").size)

    val fluentMap = parser.parse(Source.fromResource("pddl/fluents.txt"))

    println()
    println("Parsed fluent mappings:")
    println("========================")
    fluentMap.specifications.foreach(println)
    println()
    println("Fluents: ")
    println("=========")
    fluentMap.fluents(factory).foreach(println)
    println()
    println("Translated fluents: ")
    println("=========")
    fluentMap.fluents(factory).map(fluentMap.convert).foreach(println)
  }

  @Test
  def testHookParsing(): Unit = {
    val ontology = OWLManager.createOWLOntologyManager()
      .loadOntologyFromOntologyDocument(new ReaderDocumentSource(
        Source.fromResource("pddl/miniAUVPlan.ttl").reader()
      ))

    val parser = new HookSpecificationParser(ontology)

    val hookSpecifications = parser.parse(Source.fromResource("pddl/hooks.txt"))

    println(hookSpecifications)

    val reasoner = new ReasonerFactory().createReasoner(ontology)

    val instantiator = new HookInstantiator(reasoner, ontology.getOWLOntologyManager.getOWLDataFactory)

    hookSpecifications.foreach { hook =>
      println("Hook: "+hook.name)
      println("Queries: ")
      instantiator.instantiateQueries(hook).foreach(q => println("\t "+q))
      println()
    }
  }
}
