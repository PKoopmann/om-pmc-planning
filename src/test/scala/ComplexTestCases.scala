import de.tu_dresden.inf.lat.om_pmc.CreatePrismDefinitions
import de.tu_dresden.inf.lat.om_pmc.formulaGeneration.FormulaGenerator
import de.tu_dresden.inf.lat.om_pmc.interface.InterfaceParser
import org.junit.Test
import org.semanticweb.owlapi.apibinding.OWLManager
import org.semanticweb.owlapi.io.ReaderDocumentSource

import java.io.File
import scala.io.Source

class ComplexTestCases {

  @Test
  def test1(): Unit = {
    val axiom2Formula = InterfaceParser.parseAxiomMapping(Source.fromResource("case1/weird.txt"))
    val hook2axiom = InterfaceParser.parseHookDefinitions(Source.fromResource("case1/hooks_auv.txt"))
    val ontology = OWLManager.createOWLOntologyManager()
      .loadOntologyFromOntologyDocument(
        new ReaderDocumentSource(
          Source.fromResource("case1/complex_AUV_system.owl").reader()
        )
      )

    val formulaGenerator = FormulaGenerator.formulaGenerator(axiom2Formula, hook2axiom, ontology)

    formulaGenerator.generateAllFormulaDefinitions()
      .foreach(println(_))
  }
}
