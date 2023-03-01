import de.tu_dresden.inf.lat.om_planning.generation.HookInstantiator
import de.tu_dresden.inf.lat.om_planning.parsing.{FluentSpecificationParser, HookSpecificationParser}
import de.tu_dresden.inf.lat.om_pmc.parsing.InterfaceParser
import org.junit.Test
import org.semanticweb.HermiT.ReasonerFactory
import org.semanticweb.owlapi.apibinding.OWLManager
import org.semanticweb.owlapi.io.ReaderDocumentSource

import scala.io.Source

class PDDL {

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
