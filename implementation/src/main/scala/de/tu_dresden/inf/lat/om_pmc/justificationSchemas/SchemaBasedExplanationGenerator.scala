package de.tu_dresden.inf.lat.om_pmc.justificationSchemas

import com.clarkparsia.owlapi.explanation.MultipleExplanationGenerator
import com.clarkparsia.owlapi.explanation.util.ExplanationProgressMonitor
import org.semanticweb.owlapi.model.{OWLAxiom, OWLClassExpression, OWLLogicalAxiom, OWLOntology, OWLOntologyManager}
import org.semanticweb.owlapi.reasoner.{OWLReasoner, OWLReasonerFactory}

import java.util
import scala.collection.JavaConverters.setAsJavaSetConverter

class SchemaBasedExplanationGenerator(
                                       ontology: OWLOntology,
                                       relevantAxioms: Set[OWLLogicalAxiom],
                                       reasonerFactory: OWLReasonerFactory,
                                       reasoner: OWLReasoner)
  extends MultipleExplanationGenerator {

  val manager = ontology.getOWLOntologyManager

  val allJustificationSchemas = new AllJustificationSchemas(ontology, relevantAxioms, reasonerFactory)


  override def setProgressMonitor(explanationProgressMonitor: ExplanationProgressMonitor): Unit = {
    // ignore this
  }

  override def getExplanations(owlClassExpression: OWLClassExpression): util.Set[util.Set[OWLAxiom]] = {
    if(!owlClassExpression.isOWLThing)
      throw new IllegalArgumentException("Explanation Generator only supports explaining inconsistency!")

    allJustificationSchemas.allJustifications().map(_.toSet[OWLAxiom].asJava).asJava
  }

  override def getExplanations(owlClassExpression: OWLClassExpression, i: Int): util.Set[util.Set[OWLAxiom]] = {
    throw new AssertionError("Not implemented!")
  }

  override def getOntologyManager: OWLOntologyManager = manager

  override def getOntology: OWLOntology = ontology

  override def dispose(): Unit = {
    // ignore this
  }

  override def getReasoner: OWLReasoner = reasoner

  override def getReasonerFactory: OWLReasonerFactory = reasonerFactory

  override def getExplanation(owlClassExpression: OWLClassExpression): util.Set[OWLAxiom] = {
    throw new AssertionError("Not implemented! (this is for generating all explanations).")
  }
}
