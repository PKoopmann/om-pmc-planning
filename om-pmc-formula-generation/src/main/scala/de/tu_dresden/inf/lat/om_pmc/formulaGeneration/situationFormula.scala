package de.tu_dresden.inf.lat.om_pmc.formulaGeneration


import scala.collection.JavaConverters._
import scala.collection.mutable.HashMap
import scala.collection.mutable.MultiMap
import scala.collection.mutable.{Set => MutableSet}

import java.io.{File, PrintStream}
import java.util.function.Supplier

import com.clarkparsia.owlapi.explanation._
import com.clarkparsia.owlapi.explanation.util.ExplanationProgressMonitor
import org.semanticweb.HermiT.{Reasoner, ReasonerFactory}
import org.semanticweb.owlapi.model._
import org.semanticweb.owlapi.profiles.OWL2ELProfile
import org.semanticweb.owlapi.reasoner.{OWLReasoner, OWLReasonerFactory}
import uk.ac.manchester.cs.owlapi.modularity.{ModuleType, SyntacticLocalityModuleExtractor}
//import org.semanticweb.owl.explanation.api._;

// import org.semanticweb.owl.explanation.impl.blackbox._
// import org.semanticweb.owl.explanation.impl.blackbox.checker._

import org.semanticweb.elk.owlapi.ElkReasonerFactory;
import openllet.owlapi.{OpenlletReasoner, OpenlletReasonerFactory}
import openllet.owlapi.explanation.{MyExplanation, PelletExplanation}






// class InconsistencyBasedBBSituationFormulaGenerator(
//   reasonerFactory: OWLReasonerFactory,
//   ontology: OWLOntology,
//   relevantAxioms: Set[OWLAxiom],
//   situationSuperClass: OWLClass,
//   outputFileName: String
// ) extends BlackboxSituationFormulaGenerator(reasonerFactory,
// 					    ontology,
// 					    relevantAxioms,
// 					    situationSuperClass,
// 					    outputFileName) {

//   val dataFactory = ontology.getOWLOntologyManager().getOWLDataFactory()

//   override def getExplanations(axiom: OWLAxiom): Iterable[Set[OWLAxiom]] = {

//     val negated = negateAxiom(axiom)

//     ontology.addAxiom(negated)

//     initReasoner(ontology)

//     reasoner.flush()

//     System.out.println("consistency: "+reasoner.isConsistent)

//     val result = expGenerator.getInconsistencyExplanations().asScala.map(_.asScala.toSet)

//     ontology.removeAxiom(negated)

//     initReasoner(ontology)
//     reasoner.flush()

//     result
//   }

//   def negateAxiom(axiom: OWLAxiom): OWLAxiom = axiom match {
//     case ca: OWLClassAssertionAxiom => 
//       dataFactory.getOWLClassAssertionAxiom(
// 	dataFactory.getOWLObjectComplementOf(
// 	  ca.getClassExpression),
// 	ca.getIndividual)
//       case _ => assert(false, "NOT SUPPORTED YET: "+axiom)
//       null
//   }
// }


