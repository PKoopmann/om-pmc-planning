package de.tu_dresden.inf.lat.om_pmc.formulaGeneration

import com.clarkparsia.owlapi.explanation.{MyBlackBoxExplanation, MyHSTExplanationGenerator}
import de.tu_dresden.inf.lat.om_pmc.interface.{AxiomToFormulaMap, HookToAxiomMap}
import de.tu_dresden.inf.lat.prettyPrinting.formatting.SimpleOWLFormatter
import org.semanticweb.owlapi.apibinding.OWLManager
import org.semanticweb.owlapi.model.{OWLAxiom, OWLClassAssertionAxiom, OWLClassExpression, OWLLogicalAxiom, OWLObjectPropertyAssertionAxiom, OWLObjectPropertyExpression, OWLOntology, OWLOntologyManager, OWLSubClassOfAxiom}
import org.semanticweb.owlapi.reasoner.{OWLReasoner, OWLReasonerFactory}

import scala.collection.JavaConverters.{asScalaSetConverter, setAsJavaSetConverter}
import scala.collection.convert.ImplicitConversions.`set asScala`
import scala.collection.immutable.Set
import scala.collection.mutable

class ClassBasedFormulaGenerator (
                                   axiom2formula: AxiomToFormulaMap,
                                   hook2axiom: HookToAxiomMap,
                                   ontologyManager: OWLOntologyManager,
                                   reasonerFactory: OWLReasonerFactory
                                 )
  extends BlackboxSituationFormulaGenerator(axiom2formula,hook2axiom,ontologyManager,reasonerFactory) {

  private val manager = OWLManager.createOWLOntologyManager()

  private val localOntology = manager.createOntology(Set[OWLAxiom]().asJava)

  private val localReasoner: OWLReasoner = getReasoner(localOntology)

  private val fluentAxioms = relevantAxioms

  // maps (sets of) supporting axioms to the (set of) hooks they are associated with
  private val supportToHookMap = new supportToHook()

  override def fluentExplanationsAsDNF(axiom: OWLLogicalAxiom): Iterable[_ <: Set[OWLLogicalAxiom]] = {
    // generate repairs if it had not been done in the past
    if (classCentricRewritings.isEmpty)
      generateClassCentricRewritings()

    if (classCentricRewritings.get.contains(axiom))
      classCentricRewritings.get(axiom)
    else {
      println("WARNING: no rewritings for " + axiom + " where computed.")
      Set() // empty disjunction --> false
    }
  }

  override def generateInconsistentDNF(): Set[Set[OWLLogicalAxiom]] = {
    if(inconsistentDNF.isDefined)
      return inconsistentDNF.get

    generateClassCentricRewritings()

    inconsistentDNF.get
  }

  // map to store generated rewritings
  // maps from hook axioms to explanation DNFs
  private var classCentricRewritings : Option[mutable.Map[OWLLogicalAxiom, Set[Set[OWLLogicalAxiom]]]] = None
    generatorOption = ExplanationMethods.RESTRICTED

  private def generateClassCentricRewritings(): Unit =  {
    freeSomeMemory()

    val rewritings: mutable.Map[OWLLogicalAxiom, Set[Set[OWLLogicalAxiom]]] = mutable.Map()

    var inconsistencyDnf = Set[Set[OWLLogicalAxiom]]()

    // iterate over all hooks
    relevantHooks.foreach {axiom =>
      // only compute rewriting for hook, if it does not exists yet, i.e. was not already computed together with
      // another hook
      if (!rewritings.contains(axiom)) {
        println("compute hooks with pattern as " + SimpleOWLFormatter.format(axiom))
        // find all hooks that are of the same class
        relevantHooks.foreach { hook =>
          if (sameAbstractHook(axiom, hook))
            rewritings.update(hook, Set())   // initialize with empty disjunction, i.e. false
        }

        // compute axiom to add
        // anchorAxiom: the axiom that introduces the new inconsistency
        val (anchorAxiom, supportingAxioms) = additionalAxioms(axiom)

        // set parameter for explanation generator
        hookSpecificAxioms = supportingAxioms
        this.anchorAxiom = anchorAxiom



        // if supportingAxioms is empty --> no hook element to explain
        if (supportingAxioms.nonEmpty) {

          // add general class explanation to ontology

          ontology.addAxiom(anchorAxiom)
          supportingAxioms.foreach(ontology.addAxiom(_))

          // add anchor axiom to distinguish between explanations for inconsistency and hook
          //relevantAxioms += anchorAxiom
          supportingAxioms.foreach(relevantAxioms+=_)

          updateReasoner(ontology)

          // generate justifications
          val justifications = getCompleteExplanationsForInconsistency()

         // println(justifications)
          println("computed justifications")
          // iterate over justifications and decide which hooks they explain
          justifications.foreach { j =>
            //println("j " + j)
            val jrelevant = (j - anchorAxiom)
            // we explain only witch fluents
            val filteredJustification = jrelevant.filter(fluentAxioms)
            val supportJustification = jrelevant.filter(supportingAxioms)

            if (!j.contains(anchorAxiom)) {
              // justification for inconsistency
              inconsistencyDnf = addExplanationToDNF(inconsistencyDnf, filteredJustification)
            }
            else {
              //println("j " + j.filter(relevantAxioms))

              // add all the supporting axioms to infer all hooks that might be explained by justification
              val extendedJustification = (staticOntology.getAxioms() ++ filteredJustification).toSet[OWLAxiom]

              //val explainedHooks = justifiedHooks(extendedJustification, axiom)
              val explainedHooks = justifiedHooksUsingSupport(supportJustification.toSet[OWLAxiom])
              val i = " "
              explainedHooks.foreach{hook =>
                if (rewritings.contains(hook)) {
                  val newRewriting = addExplanationToDNF(rewritings(hook), filteredJustification)
                  rewritings.update(hook, newRewriting)
                }
                else
                  rewritings.update(hook, Set(filteredJustification))
              }
            }
          }

          // put ontology back to original state
          ontology.removeAxiom(anchorAxiom)
          supportingAxioms.foreach(ontology.removeAxiom(_))

          relevantAxioms -= anchorAxiom

          updateReasoner(ontology)
        }
      }

    }

    classCentricRewritings = Some(rewritings)
    inconsistentDNF = Some(inconsistencyDnf)
  }

  // takes justification and one representative of the relevant hooks and computes all hooks explained by the justification

  private def justifiedHooksUsingReasoner(justification: Set[OWLAxiom], axiom: OWLLogicalAxiom): Set[OWLLogicalAxiom] = axiom match {
      case ca: OWLClassAssertionAxiom =>
        justifiedHooksUsingReasoner(justification, ca.getClassExpression)
      case op: OWLObjectPropertyAssertionAxiom =>
        justifiedHooksUsingReasoner(justification, op.getProperty)
      case _ => assert(false, "NOT SUPPORTED YET: " + axiom)
        null
  }



  // takes justification that contains only the axioms from the supportAxioms and computes all hooks explained by the justification
  private def justifiedHooksUsingSupport(justification: Set[OWLAxiom]): Set[OWLLogicalAxiom] =  {
    this.supportToHookMap.get(justification)
  }

  private def justifiedHooksUsingReasoner(justification: Set[OWLAxiom],
                             classExpression: OWLClassExpression): Set[OWLLogicalAxiom] = {
    // compute which hooks can be explained by this justification
    updateLocalReasoner(justification)

    val instances = localReasoner.getInstances(classExpression)

    var result : Set[OWLLogicalAxiom] = Set()

    instances.forEach { individual =>
      result = result + factory.getOWLClassAssertionAxiom(
        classExpression, individual.getRepresentativeElement
      )
    }
    val a = " "

    justification.foreach { j =>
     // print(j)
      j match {
        case axiom: OWLLogicalAxiom => if (hookSpecificAxioms.contains(axiom))
          println(j)
        case _ =>
      }
    }

    result
  }

  private def justifiedHooksUsingReasoner(justification: Set[OWLAxiom],
                             propertyExpression: OWLObjectPropertyExpression): Set[OWLLogicalAxiom] = {
    // compute which hooks can be explained by this justification
    updateLocalReasoner(justification)

    // inferred domain of the property
    val domain = localReasoner.getInstances(
      factory.getOWLObjectSomeValuesFrom(
        propertyExpression,
        factory.getOWLThing
      )
    )

    var result : Set[OWLLogicalAxiom] = Set()

    relevantHooks.foreach {
      case op: OWLObjectPropertyAssertionAxiom =>
        if (domain.containsEntity(op.getSubject.asOWLNamedIndividual())) {
          // subject of hook can also be inferred by justification
          // next: check if object is also in range
          val range = localReasoner.getObjectPropertyValues(
            op.getSubject.asOWLNamedIndividual(),
            propertyExpression
          )
          if (range.containsEntity(op.getObject.asOWLNamedIndividual()))
            result += op
        }
      case _ => null
    }

    result
  }

  // result: 'anchor axiom' plus set of supporting axioms
  private def additionalAxioms(axiom: OWLLogicalAxiom): (OWLLogicalAxiom, Set[OWLLogicalAxiom]) = axiom match {
    case ca: OWLClassAssertionAxiom =>
      additionalAxioms(ca.getClassExpression)
    case op: OWLObjectPropertyAssertionAxiom =>
      additionalAxioms(op.getProperty)
    case _ =>  assert(false, "NOT SUPPORTED YET: "+axiom)
      null
  }

  private def additionalAxioms(hookClass: OWLClassExpression): (OWLLogicalAxiom, Set[OWLLogicalAxiom]) = {
    // define new class with new name
    val className = "hookIndividualsInClass"+hookClass.toString.stripPrefix("<").stripSuffix(">")
    val indClass = factory.getOWLClass(className)

    var supportingAxioms: Set[OWLLogicalAxiom] = Set()

    val entailedInStatic = staticReasoner.getInstances(
      hookClass
    )

    // add supporting axioms (i.e. class declarations to newly created class) if hook has correct class expression
    relevantHooks.foreach {
      case ca: OWLClassAssertionAxiom =>
        // class must match, and the individual should not be in the class in the static ontology
        if (ca.getClassExpression == hookClass &&
          !entailedInStatic.containsEntity(ca.getIndividual.asOWLNamedIndividual())) {
          val newAxiom = factory.getOWLClassAssertionAxiom(
            indClass, ca.getIndividual
          )
          supportingAxioms += newAxiom
          supportToHookMap.add(Set(newAxiom).toSet[OWLAxiom], Set(ca))
        }

      case _ => null
    }

    val anchorAxiom = factory.getOWLSubClassOfAxiom(
      factory.getOWLObjectIntersectionOf(
        hookClass, indClass
      ),
      factory.getOWLNothing
    )

    (anchorAxiom, supportingAxioms)
  }

  private def additionalAxioms(hookProperty: OWLObjectPropertyExpression): (OWLLogicalAxiom, Set[OWLLogicalAxiom]) = {
    val domainClassName = "hookIndividualsInDomainFor" + hookProperty.toString.stripPrefix("<").stripSuffix(">")
    val rangeClassName = "hookIndividualsInRangeFor" + hookProperty.toString.stripPrefix("<").stripSuffix(">")

    val domainClass = factory.getOWLClass(domainClassName)
    val rangeClass = factory.getOWLClass(rangeClassName)

    var supportingAxioms: Set[OWLLogicalAxiom] = Set()

    // anchor: domain /\ E property. range subClassOf Nothing
    // i.e. property connects nothing from domain to range
    val anchorAxiom = factory.getOWLSubClassOfAxiom(
      factory.getOWLObjectIntersectionOf(
        domainClass,
        factory.getOWLObjectSomeValuesFrom(
          hookProperty,
          rangeClass
        )
      ),
      factory.getOWLNothing
    )

    relevantHooks.foreach {
      case op: OWLObjectPropertyAssertionAxiom =>
        if (op.getProperty == hookProperty) {
          val domainAxiom = factory.getOWLClassAssertionAxiom(
            domainClass, op.getSubject
          )
          supportingAxioms += domainAxiom
          val rangeAxiom = factory.getOWLClassAssertionAxiom(
            rangeClass, op.getObject
          )
          supportingAxioms += rangeAxiom
          supportToHookMap.add(Set(domainAxiom, rangeAxiom).toSet[OWLAxiom], Set(op))

        }

      case _ => null
    }

    (anchorAxiom, supportingAxioms)
  }

  def getClassExpression(axiom: OWLLogicalAxiom): OWLClassExpression = axiom match {
    case ca: OWLClassAssertionAxiom =>
        ca.getClassExpression
    case _ => assert(false, "NOT SUPPORTED YET: "+axiom)
      null
  }

  private def updateLocalReasoner(newAxioms: Set[OWLAxiom]): Unit = {
    val oldOntology = localReasoner.getRootOntology
    //oldOntology.removeAxioms(oldOntology.getAxioms())
    //oldOntology.addAxioms(ontology.getAxioms())

    val oldAxioms = oldOntology.getAxioms()
    val deleteAxioms = oldAxioms.diff(newAxioms)
    val addAxioms = newAxioms.diff(oldAxioms)

    // apply changes to ontology
    oldOntology.removeAxioms(deleteAxioms.asJava)
    oldOntology.addAxioms(addAxioms.asJava)

    localReasoner.flush()
  }

  // decides, if the two hooks (i.e. axioms) are of the same class, i.e., calculated with the same justification run
  private def sameAbstractHook(hook1 : OWLLogicalAxiom, hook2: OWLLogicalAxiom) : Boolean = hook1 match {
    case ca1 : OWLClassAssertionAxiom =>
      hook2 match {
        case ca2: OWLClassAssertionAxiom =>
          ca1.getClassExpression == ca2.getClassExpression
        case _ => false
      }
    case op1: OWLObjectPropertyAssertionAxiom =>
      hook2 match {
        case op2: OWLObjectPropertyAssertionAxiom =>
          op1.getProperty == op2.getProperty
        case _ => false
      }
    case _ => assert(false, "NOT SUPPORTED YET: " + hook1)
      false
  }
}
