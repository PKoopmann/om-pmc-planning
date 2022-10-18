package de.tu_dresden.inf.lat.om_pmc.formulaGeneration

import de.tu_dresden.inf.lat.om_pmc.interface.{AxiomToFormulaMap, HookToAxiomMap}
import de.tu_dresden.lat.prettyPrinting.formatting.SimpleOWLFormatter
import org.semanticweb.owlapi.model.{OWLAxiom, OWLClass, OWLClassAssertionAxiom, OWLLogicalAxiom, OWLOntology, OWLOntologyManager}
import org.semanticweb.owlapi.reasoner.OWLReasonerFactory

import java.io.{File, FileOutputStream}
import scala.collection.JavaConverters.asScalaSetConverter

class InconsistencyBasedGBSituationFormulaGenerator(
                                                     axiom2formula: AxiomToFormulaMap,
                                                     hook2axiom: HookToAxiomMap,
                                                     ontologyManager: OWLOntologyManager,
                                                     reasonerFactory: OWLReasonerFactory
                                                   )
  extends GlassboxCapableSituationFormulaGenerator(axiom2formula,hook2axiom,ontologyManager,reasonerFactory) {

  override def getExplanations(axiom: OWLLogicalAxiom): Iterable[Set[OWLLogicalAxiom]] = {

    //println("Ontology before: ")
    //println("--------------");
    //println(SimpleOWLFormatter.format(ontology))

    val negated = negateAxiom(axiom)

    val added =
      if(ontology.containsAxiom(negated)) {
        false
      } else
        true

    if(added)
      ontology.addAxiom(negated)


    initReasoner(ontology)

    reasoner.flush()

    ontologyManager.saveOntology(ontology, new FileOutputStream(new File("test.owl")))

    System.out.println("consistency: "+reasoner.isConsistent)

    val result = explanationGenerator.getInconsistencyExplanations()
      .asScala
      .map(_.asScala.toSet[OWLAxiom].map(_.asInstanceOf[OWLLogicalAxiom]))

    assert(result.size>0)

    //if(result.size==0)
    //  System.out.println("WARNING: Hook that is always satisfied for axiom "+SimpleOWLFormatter.format(axiom))

    if(!added)
      ontology.removeAxiom(negated)

    initReasoner(ontology)
    reasoner.flush()

    result
  }

  def negateAxiom(axiom: OWLLogicalAxiom): OWLLogicalAxiom = axiom match {
    case ca: OWLClassAssertionAxiom =>
      factory.getOWLClassAssertionAxiom(
        factory.getOWLObjectComplementOf(
          ca.getClassExpression),
        ca.getIndividual)
    case _ => assert(false, "NOT SUPPORTED YET: "+axiom)
      null
  }
}
