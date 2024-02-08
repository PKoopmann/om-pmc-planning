package de.tu_dresden.inf.lat.om_pmc.formulaGeneration

import com.clarkparsia.owlapi.explanation.{MultipleExplanationGenerator, MyBlackBoxExplanation, MyHSTExplanationGenerator}
import de.tu_dresden.inf.lat.om_pmc.ifm.IfmSituationFormulaGenerator
import de.tu_dresden.inf.lat.om_pmc.interface.{AxiomToFormulaMap, HookToAxiomMap}
import org.semanticweb.owlapi.model.{OWLAxiom, OWLClass, OWLClassAssertionAxiom, OWLClassExpression, OWLLogicalAxiom, OWLObjectPropertyAssertionAxiom, OWLOntology, OWLOntologyManager, OWLSubClassOfAxiom}
import org.semanticweb.owlapi.reasoner.OWLReasonerFactory

import scala.collection.JavaConverters.{asScalaSetConverter, setAsJavaSetConverter}

abstract class BlackboxSituationFormulaGenerator(axiom2formula: AxiomToFormulaMap,
                                        hook2axiom: HookToAxiomMap,
                                        ontologyManager: OWLOntologyManager,
                                        reasonerFactory: OWLReasonerFactory
                                       )
  extends FormulaGenerator(axiom2formula, hook2axiom,ontologyManager, reasonerFactory) {

  var expGenerator: MultipleExplanationGenerator = _

  //initExplanationGenerator(ontology)

  override def initExplanationGenerator(ontology: OWLOntology) = {
    val axioms = ontology.getAxioms().asScala.toSet
    val relevantAxiomsFiltered = relevantAxioms.filter(axioms)

//    println("Relevant axioms after filtering: "+relevantAxiomsFiltered)

    val singleGen = new MyBlackBoxExplanation(
      ontology,
      reasonerFactory,
      getReasoner(ontology)
      //reasonerFactory.createNonBufferingReasoner(ontology)
    )

    expGenerator =
      new MyHSTExplanationGenerator(
        relevantAxiomsFiltered.toSet[OWLLogicalAxiom].asJava,
        singleGen)
  }

  /**
   * synchronizes the explanation generator to use the current ontology of the reasoner
   */
  override def synchronizeExplanationGenerator() = {
    val currentOntology = reasoner.getRootOntology()
    val axioms = currentOntology.getAxioms().asScala.toSet
    val relevantAxiomsFiltered = relevantAxioms.filter(axioms)

    //    println("Relevant axioms after filtering: "+relevantAxiomsFiltered)

    // get fresh reasoner
    val r = getReasoner(currentOntology)

    val singleGen = new MyBlackBoxExplanation(
      currentOntology,
      reasonerFactory,
      r
      //reasonerFactory.createNonBufferingReasoner(ontology)
    )

    // clear some memory before assigning new value
    expGenerator.dispose()

    expGenerator =
      new MyHSTExplanationGenerator(
        relevantAxiomsFiltered.toSet[OWLLogicalAxiom].asJava,
        singleGen)
  }

  override def getExplanations(axiom: OWLLogicalAxiom): Iterable[Set[OWLLogicalAxiom]] = {

    expGenerator.getExplanations(toUnsatClassExp(axiom))
      .asScala
      .map(_.asScala
        .toSet[OWLAxiom]
        .map(_.asInstanceOf[OWLLogicalAxiom]))
  }

  override def getExplanationsForInconsistency(): Iterable[Set[OWLLogicalAxiom]] = {
    //initReasoner(ontology)
    updateReasoner(ontology)

    expGenerator.getExplanations(factory.getOWLThing)
      .asScala
      .map(_.asScala
        .toSet[OWLAxiom]
        .map(_.asInstanceOf[OWLLogicalAxiom]))
    //getExplanations(getInconsistentAxiom)
  }

  def getInconsistentAxiom() = {
    factory.getOWLSubClassOfAxiom(factory.getOWLThing, factory.getOWLNothing);
  }


  def toUnsatClassExp(axiom: OWLLogicalAxiom): OWLClassExpression = axiom match {
    case ss: OWLSubClassOfAxiom =>
      factory.getOWLObjectIntersectionOf(
        ss.getSubClass(),
        factory.getOWLObjectComplementOf(ss.getSuperClass()))
    case as: OWLClassAssertionAxiom =>
      factory.getOWLObjectIntersectionOf(
        factory.getOWLObjectComplementOf(as.getClassExpression()),
        factory.getOWLObjectOneOf(as.getIndividual))
    case prp: OWLObjectPropertyAssertionAxiom =>
      factory.getOWLObjectIntersectionOf(
        factory.getOWLObjectOneOf(prp.getSubject()),
        factory.getOWLObjectComplementOf(
          factory.getOWLObjectHasValue(prp.getProperty(), prp.getObject)
        )
      )
  }
}
