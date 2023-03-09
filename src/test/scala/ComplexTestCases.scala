import de.tu_dresden.inf.lat.om_pmc.CreatePrismDefinitions
import de.tu_dresden.inf.lat.om_pmc.formulaGeneration.FormulaGenerator
import de.tu_dresden.inf.lat.om_pmc.parsing.InterfaceParser
import org.junit.Test
import org.semanticweb.owlapi.apibinding.OWLManager
import org.semanticweb.owlapi.io.ReaderDocumentSource

import java.io.File
import scala.io.Source

class ComplexTestCases {


  @Test
  def bug2() = {
    val ontology = OWLManager.createOWLOntologyManager()
      .loadOntologyFromOntologyDocument(new ReaderDocumentSource(
        Source.fromResource("bug2/bugs.owl").reader()
      ))

    val parser = new InterfaceParser(ontology)
    parser.MANCHESTER_SYNTAX = true


    val axiom2Formula = parser.parseAxiomMapping(Source.fromResource("bug2/fluents1.txt"))
    println("Axiom2formula: " + axiom2Formula)
    val hook2axiom = parser.parseHookDefinitions(Source.fromResource("bug2/hooks.txt"))
    println("Hook2Axiom: " + hook2axiom)


    val formulaGenerator = FormulaGenerator.formulaGenerator(axiom2Formula, hook2axiom, ontology)

    formulaGenerator.generateAllFormulaDefinitions()
      .foreach(println(_))
  }

  @Test
  def bug1() = {
    val ontology = OWLManager.createOWLOntologyManager()
      .loadOntologyFromOntologyDocument(new ReaderDocumentSource(
        Source.fromResource("bug1/bug.ttl").reader()
      ))

    val parser = new InterfaceParser(ontology)


    val axiom2Formula = parser.parseAxiomMapping(Source.fromResource("bug1/fluents.txt"))
    println("Axiom2formula: "+axiom2Formula)
    val hook2axiom = parser.parseHookDefinitions(Source.fromResource("bug1/hooks_bad.txt"))
    println("Hook2Axiom: "+hook2axiom)


    val formulaGenerator = FormulaGenerator.formulaGenerator(axiom2Formula, hook2axiom, ontology)

    formulaGenerator.generateAllFormulaDefinitions()
      .foreach(println(_))
  }

/*
  @Test
  def test1(): Unit = {

    val ontology = OWLManager.createOWLOntologyManager()
    .loadOntologyFromOntologyDocument(
      new ReaderDocumentSource(
        Source.fromResource("case1/complex_AUV_system.owl").reader()
      )
    )

    val parser = new InterfaceParser(ontology)
    parser.MANCHESTER_SYNTAX=false

    val axiom2Formula = parser.parseAxiomMapping(Source.fromResource("case1/weird.txt"))
    val hook2axiom = parser.parseHookDefinitions(Source.fromResource("case1/hooks_auv.txt"))


    val formulaGenerator = FormulaGenerator.formulaGenerator(axiom2Formula, hook2axiom, ontology)

    formulaGenerator.generateAllFormulaDefinitions()
      .foreach(println(_))
  }
*/

}
