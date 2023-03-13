package de.tu_dresden.inf.lat.om_pmc.ifm

import com.clarkparsia.owlapi.explanation.{MultipleExplanationGenerator, MyBlackBoxExplanation, MyHSTExplanationGenerator}
import org.semanticweb.owlapi.model._
import org.semanticweb.owlapi.reasoner.OWLReasonerFactory

import scala.collection.JavaConverters.{asScalaSetConverter, setAsJavaSetConverter}

class IfmBlackboxSituationFormulaGenerator(
                                         reasonerFactory: OWLReasonerFactory,
                                         ontology: OWLOntology,
                                         relevantAxioms: Set[OWLLogicalAxiom],
                                         situationSuperClass: OWLClass,
                                         outputFileName: String
                                       ) extends IfmSituationFormulaGenerator(reasonerFactory,
  ontology,
  relevantAxioms,
  situationSuperClass,
  outputFileName) {

  var expGenerator: MultipleExplanationGenerator = _

  initExplanationGenerator(ontology)

  override def initExplanationGenerator(ontology: OWLOntology) = {
    val axioms = ontology.getAxioms().asScala.toSet
    val relevantAxiomsFiltered = relevantAxioms.filter(axioms)

    val singleGen = new MyBlackBoxExplanation(
      ontology,
      reasonerFactory,
      reasonerFactory.createNonBufferingReasoner(ontology)
    )


    expGenerator =
      new MyHSTExplanationGenerator(
        relevantAxioms.toSet[OWLLogicalAxiom].asJava,
        singleGen)
  }

  override def getExplanations(axiom: OWLLogicalAxiom): Iterable[Set[OWLLogicalAxiom]] =
    expGenerator.getExplanations(toUnsatClassExp(axiom)).asScala.map(_.asScala.toSet[OWLAxiom].map(_.asInstanceOf[OWLLogicalAxiom]))

  override def getExplanationsForInconsistency(): Iterable[Set[OWLLogicalAxiom]] =
    getExplanations(getInconsistentAxiom)

  def getInconsistentAxiom() = {
    factory.getOWLSubClassOfAxiom(factory.getOWLThing, factory.getOWLNothing);
  }


  def toUnsatClassExp(axiom: OWLAxiom): OWLClassExpression = axiom match {
    case ss: OWLSubClassOfAxiom =>
      factory.getOWLObjectIntersectionOf(
        ss.getSubClass(),
        factory.getOWLObjectComplementOf(ss.getSuperClass()))
    case as: OWLClassAssertionAxiom =>
      factory.getOWLObjectIntersectionOf(
        factory.getOWLObjectComplementOf(as.getClassExpression()),
        factory.getOWLObjectOneOf(as.getIndividual))
  }

}
