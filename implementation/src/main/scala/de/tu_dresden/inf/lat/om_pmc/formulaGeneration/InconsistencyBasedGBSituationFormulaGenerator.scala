package de.tu_dresden.inf.lat.om_pmc.formulaGeneration

import de.tu_dresden.inf.lat.om_pmc.interface.{AxiomToFormulaMap, HookToAxiomMap}
import de.tu_dresden.inf.lat.prettyPrinting.formatting.SimpleOWLFormatter
import org.semanticweb.owlapi.model.{OWLAxiom, OWLClass, OWLClassAssertionAxiom, OWLLogicalAxiom, OWLOntology,
  OWLOntologyManager, OWLSubClassOfAxiom, OWLObjectPropertyAssertionAxiom}
import org.semanticweb.owlapi.reasoner.OWLReasonerFactory

import java.io.{File, FileOutputStream}
import scala.collection.JavaConverters.asScalaSetConverter

@deprecated("use 'InconsistencyBasedFormulaGenerator', which is based on black box explanations")
class InconsistencyBasedGBSituationFormulaGenerator(
                                                     axiom2formula: AxiomToFormulaMap,
                                                     hook2axiom: HookToAxiomMap,
                                                     ontologyManager: OWLOntologyManager,
                                                     reasonerFactory: OWLReasonerFactory
                                                   )
  extends GlassboxCapableSituationFormulaGenerator(axiom2formula,hook2axiom,ontologyManager,reasonerFactory) {

  override def getExplanations(axiom: OWLLogicalAxiom): Iterable[Set[OWLLogicalAxiom]] = {

  /*  println("Ontology before: ")
    println("--------------");
    println(SimpleOWLFormatter.format(ontology))
    println(ontology.getAxiomCount()+" axioms");
*/
    val negated = negateAxiom(axiom)

    val needsToAddAxiom = !ontology.containsAxiom(negated)

    if(needsToAddAxiom)
      ontology.addAxiom(negated)

    //println("Needs to add axiom: "+needsToAddAxiom)
    //println("negatedAxiom: "+SimpleOWLFormatter.format(negated))

    initReasoner(ontology)
    reasoner.flush()

    /*
    println("ontology: ")
   println("--------------");
   println(SimpleOWLFormatter.format(ontology))
   println(ontology.getAxiomCount()+" axioms");
*/
    //ontologyManager.saveOntology(ontology, new FileOutputStream(new File("test.owl")))

  //  System.out.println("consistency: "+reasoner.isConsistent)

    val result = explanationGenerator.getInconsistencyExplanations()
      .asScala
      .map(_.asScala.toSet[OWLAxiom].map(_.asInstanceOf[OWLLogicalAxiom]))

    assert(result.size>0)

    System.out.println("Explanations found: "+result.size)
   /* result.foreach { r =>
      r.foreach { a =>
        print(SimpleOWLFormatter.format(a))
      }
      println()
    }

    */

    /*if(result.size==0)
      System.out.println("WARNING: Hook that is never satisfied for axiom "+SimpleOWLFormatter.format(axiom))
    */
    if(needsToAddAxiom)
      ontology.removeAxiom(negated)

    initReasoner(ontology)
    reasoner.flush()


    /*println("Ontology after: ")
    println("--------------");
    println(SimpleOWLFormatter.format(ontology))
    println(ontology.getAxiomCount()+" axioms");
    */
    result
  }

  def negateAxiom(axiom: OWLLogicalAxiom): OWLLogicalAxiom = axiom match {
    case ca: OWLClassAssertionAxiom =>
      factory.getOWLClassAssertionAxiom(
        factory.getOWLObjectComplementOf(
          ca.getClassExpression),
        ca.getIndividual)
    case ci: OWLSubClassOfAxiom =>
      factory.getOWLClassAssertionAxiom(
        factory.getOWLObjectIntersectionOf(
          ci.getSubClass, factory.getOWLObjectComplementOf(ci.getSuperClass)
        ),
        factory.getOWLAnonymousIndividual
      )
    case op: OWLObjectPropertyAssertionAxiom =>
      factory.getOWLNegativeObjectPropertyAssertionAxiom(
        op.getProperty, op.getSubject, op.getObject
      )

    case _ => assert(false, "NOT SUPPORTED YET: "+axiom)
      null
  }
}
