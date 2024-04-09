package de.tu_dresden.inf.lat.om_pmc.justificationSchemas

import com.clarkparsia.owlapi.explanation.{MyBlackBoxExplanation, MyHSTExplanationGenerator}
import org.semanticweb.HermiT.{Configuration, ReasonerFactory}
import org.semanticweb.owlapi.apibinding.OWLManager
import org.semanticweb.owlapi.model.{IRI, OWLAxiom, OWLLogicalAxiom}

import scala.collection.JavaConverters.setAsJavaSetConverter

object Test2 {

  def main(args: Array[String]): Unit = {
    val manager = OWLManager.createOWLOntologyManager()
    val ontology = manager.createOntology()
    val factory = manager.getOWLDataFactory()

    val A = factory.getOWLClass(IRI.create("A"))
    val B = factory.getOWLClass(IRI.create("B"))
    val r = factory.getOWLObjectProperty(IRI.create("r"))
    ontology.addAxiom(factory.getOWLDisjointClassesAxiom(A,B))
    ontology.addAxiom(factory.getOWLDisjointClassesAxiom(A,
      factory.getOWLObjectSomeValuesFrom(r,B)))

    var relevantAxioms = Set[OWLLogicalAxiom]()

    Range(0,6).foreach { i =>
      val ind = factory.getOWLNamedIndividual(IRI.create("a" + i))
      val ind2 = factory.getOWLNamedIndividual(IRI.create("a" + (i+1)))
      val ax1 = factory.getOWLClassAssertionAxiom(A, ind)
      val ax2 = factory.getOWLClassAssertionAxiom(B,ind)
      val ax3 = factory.getOWLObjectPropertyAssertionAxiom(r,ind,ind2)
      ontology.addAxiom(ax1)
      ontology.addAxiom(ax2)
      ontology.addAxiom(ax3)
      relevantAxioms += ax1
      relevantAxioms += ax2
      relevantAxioms += ax3
    }

    var start = System.nanoTime()
    val allJust = new AllJustificationSchemas(ontology, relevantAxioms, new ReasonerFactory())
    val computingTime = System.nanoTime()-start

    val justifications = allJust.allJustifications()
    println("Justifications I found: ")
    justifications.foreach(println)
    println("-----------------")
    System.out.println("All justifications: "+justifications.size)
    System.out.println("Took: "+computingTime)

    System.out.println("Now trying the default implementation")

    val reasonerFactory = new ReasonerFactory()
    val config = new Configuration();
    config.throwInconsistentOntologyException=false
    val reasoner = reasonerFactory.createReasoner(ontology,config)

    val singleGen = new MyBlackBoxExplanation(
      ontology,
      reasonerFactory,
      reasoner
      //reasonerFactory.createNonBufferingReasoner(ontology)
    )
    val expGenerator = new MyHSTExplanationGenerator(
      relevantAxioms.asJava,
      singleGen)


    start = System.nanoTime()
    val explanations = expGenerator.getExplanations(factory.getOWLThing())
    val computingTime2 = System.nanoTime()-start
    println("Found "+explanations.size()+" explanations.")
    println("Took "+computingTime2+" vs "+computingTime+" with the new method.")
  }
}
