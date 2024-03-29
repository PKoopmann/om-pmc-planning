import de.tu_dresden.inf.lat.om_pmc.parsing.InterfaceParser
import org.junit.Test
import org.semanticweb.owlapi.apibinding.OWLManager
import org.semanticweb.owlapi.expression.ShortFormEntityChecker
import org.semanticweb.owlapi.manchestersyntax.parser.ManchesterOWLSyntaxInlineAxiomParser
import org.semanticweb.owlapi.manchestersyntax.renderer.ManchesterOWLSyntaxObjectRenderer
import org.semanticweb.owlapi.model.IRI
import org.semanticweb.owlapi.util.{BidirectionalShortFormProviderAdapter, DefaultPrefixManager}

import java.io.{BufferedInputStream, BufferedReader, File, InputStreamReader, PrintWriter}
import scala.io.Source

class TestParsers {
  //@Test
  def testParseHooks(): Unit ={
    val ontology = OWLManager.createOWLOntologyManager()
      .loadOntologyFromOntologyDocument(getClass.getClassLoader
        .getResourceAsStream("example1.owl"))


    val parser = new InterfaceParser(ontology);
    parser.MANCHESTER_SYNTAX=true

    val hooksFile = Source.fromResource("hooks-example.txt")

    val hooks = parser.parseHookDefinitions(hooksFile)
    println(hooks)
  }


  //@Test
  def testParseFluents(): Unit ={
    val ontology = OWLManager.createOWLOntologyManager().loadOntologyFromOntologyDocument(getClass.getClassLoader
      .getResourceAsStream("example1.owl"))
    val parser = new InterfaceParser(ontology);

    parser.MANCHESTER_SYNTAX=true

    val fluentsFile = Source.fromResource("fluent2formula-example.txt")

    val fluents = parser.parseAxiomMapping(fluentsFile)
    println(fluents)
  }


}
