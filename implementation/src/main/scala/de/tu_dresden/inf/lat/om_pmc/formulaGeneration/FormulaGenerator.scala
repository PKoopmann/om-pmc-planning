package de.tu_dresden.inf.lat.om_pmc.formulaGeneration

import de.tu_dresden.inf.lat.om_pmc.formulaGeneration.FormulaGenerator.{Methods, explanationMethod}
import de.tu_dresden.inf.lat.om_pmc.ifm.IfmSituationFormulaGenerator.Methods.{BLACK_BOX, Value}
import de.tu_dresden.inf.lat.om_pmc.ifm.{IfmBlackboxSituationFormulaGenerator, IfmGlassboxSituationFormulaGenerator, IfmInconsistencyBasedGBSituationFormulaGenerator, IfmSituationFormulaGenerator}
import de.tu_dresden.inf.lat.om_pmc.interface.{AxiomToFormulaMap, HookToAxiomMap}
import de.tu_dresden.inf.lat.prettyPrinting.formatting.SimpleOWLFormatter
import openllet.owlapi.OpenlletReasonerFactory
import org.semanticweb.HermiT.{Configuration, ReasonerFactory}
import org.semanticweb.elk.owlapi.ElkReasonerFactory
import org.semanticweb.owlapi.model.{IRI, OWLAxiom, OWLClass, OWLDataFactory, OWLEntity, OWLLogicalAxiom, OWLOntology, OWLOntologyManager}
import org.semanticweb.owlapi.profiles.OWL2ELProfile
import org.semanticweb.owlapi.reasoner.{OWLReasoner, OWLReasonerConfiguration, OWLReasonerFactory}
import uk.ac.manchester.cs.owlapi.modularity.{ModuleType, SyntacticLocalityModuleExtractor}

import java.io.{File, FileOutputStream}
import scala.collection.JavaConverters.{asScalaSetConverter, setAsJavaSetConverter}
import scala.collection.convert.ImplicitConversions.`set asScala`
import scala.collection.mutable
import scala.collection.mutable.Map

object FormulaGenerator {

  var explanationMethod = Methods.CLASS_BASED // Methods.INC_BASED, Methods.HOOK_CENTRIC

  def formulaGenerator(axiom2formula: AxiomToFormulaMap,
                       hook2axiom: HookToAxiomMap,
                       ontology: OWLOntology,
                       primitiveHookAxioms: Set[OWLLogicalAxiom])
  : FormulaGenerator = {

    val manager = ontology.getOWLOntologyManager

    ontology.addAxioms(axiom2formula.axioms.asJava)


    val module =
      getModule(ontology,
        hook2axiom.hooks()
          .map(hook2axiom.axiom)
          .flatMap(_.getSignature.asScala))

    //println("Number of axioms in module: "+module.getAxiomCount())
    //println("Axioms in module1" + SimpleOWLFormatter.format(module))

    //manager.saveOntology(module, new FileOutputStream(new File("moduleUsed.owl")))

    println("explanation method: " + explanationMethod)

    var reasonerFactory: OWLReasonerFactory =
      if (!explanationMethod.equals(Methods.GLASS_BOX)) {
        new ReasonerFactory()
      } // HermiT
      else
        new OpenlletReasonerFactory()

    //println("factory: "+reasonerFactory)

    if (inEL(module)) {
      println("only EL axioms relevant!")
      explanationMethod = Methods.REPAIR_CENTRIC
      reasonerFactory = new ElkReasonerFactory()
    }


    val result = explanationMethod match {
      case Methods.HOOK_CENTRIC =>
        new HookCentricFormulaGenerator(axiom2formula, hook2axiom, manager, reasonerFactory)
      case Methods.REPAIR_CENTRIC =>
        new RepairCentricFormulaGenerator(axiom2formula, hook2axiom, manager, reasonerFactory)
      case Methods.GLASS_BOX =>
        new GlassboxCapableSituationFormulaGenerator(axiom2formula, hook2axiom, manager, reasonerFactory)
      case Methods.INC_BASED =>
        new InconsistencyBasedFormulaGenerator(axiom2formula, hook2axiom, manager, reasonerFactory)
      case Methods.CLASS_BASED =>
        new ClassBasedFormulaGenerator(axiom2formula, hook2axiom, manager, reasonerFactory)
    }

    val staticAxioms = module.getAxioms().asScala -- axiom2formula.axioms
    result.staticOntology = manager.createOntology(staticAxioms.asJava)
    result.staticReasoner = result.getReasoner(result.staticOntology)
    result.staticReasoner.flush()

    result.relevantHooks = primitiveHookAxioms

    //println("Module axioms: "+module.getAxioms().asScala.map(SimpleOWLFormatter.format))
    println("Module size: " + module.getAxioms().size)
    println("Number of Hooks: " + hook2axiom.size)
    println("Number of Fluents: " + axiom2formula.size)
    result.initReasoner(module)
    result
  }

  def inEL(ontology: OWLOntology): Boolean = {
    val profileReport = (new OWL2ELProfile).checkOntology(ontology);
    val result = profileReport.isInProfile()
    // if (!result)
    //   profileReport.getViolations.asScala.foreach(println)
    result
  }

  def getModule(ontology: OWLOntology, signature: Set[OWLEntity]): OWLOntology = {
//    println("Signature: "+signature)
    val moduleExtractor =
      new SyntacticLocalityModuleExtractor(
        ontology.getOWLOntologyManager,
        ontology,
        ModuleType.STAR)

    moduleExtractor.extractAsOntology(
      signature.asJava,
      IRI.create("temporaryModule"))
  }

  object Methods extends Enumeration {
    val GLASS_BOX, HOOK_CENTRIC, REPAIR_CENTRIC, INC_BASED, CLASS_BASED = Value
  }
}

abstract class FormulaGenerator(axiom2formula: AxiomToFormulaMap,
                                hook2axiom: HookToAxiomMap,
                                ontologyManager: OWLOntologyManager,
                                reasonerFactory: OWLReasonerFactory) {

  var relevantAxioms: Set[OWLLogicalAxiom] = axiom2formula.axioms
  var relevantHooks: Set[OWLLogicalAxiom] = _ // hook2axiom.hooks().map(hook2axiom.axiom)
  var reasoner: OWLReasoner = _
  var ontology: OWLOntology = _
  var staticReasoner: OWLReasoner = _
  var staticOntology: OWLOntology = _
  val factory: OWLDataFactory = ontologyManager.getOWLDataFactory

  protected def initExplanationGenerator(ontology: OWLOntology): Unit

  protected def synchronizeExplanationGenerator(): Unit

  protected def getExplanationsForInconsistency(): Iterable[_ <: Set[OWLLogicalAxiom]]

  def fluentExplanationsAsDNF(axiom: OWLLogicalAxiom): Iterable[_ <: Set[OWLLogicalAxiom]]
  protected def getExplanations(axiom: OWLLogicalAxiom): Iterable[_ <: Set[OWLLogicalAxiom]]

  def getHooks(): Set[String] = hook2axiom.hooks()

  def getReasoner(ontology: OWLOntology): OWLReasoner =
    if(reasonerFactory.isInstanceOf[ReasonerFactory]){
      val config = new Configuration();
      config.throwInconsistentOntologyException=false
      reasonerFactory.createReasoner(ontology,config)
    }
    else
      reasonerFactory.createReasoner(ontology)

  def initReasoner(ontology: OWLOntology): Unit = {
    this.ontology=ontology


    reasoner = getReasoner(ontology)

    initExplanationGenerator(ontology)
  }

  def updateReasoner(ontology: OWLOntology): Unit = {
    val oldOntology = reasoner.getRootOntology
    //oldOntology.removeAxioms(oldOntology.getAxioms())
    //oldOntology.addAxioms(ontology.getAxioms())

    val oldAxioms = oldOntology.getAxioms()
    val newAxioms = ontology.getAxioms()
    val deleteAxioms = oldAxioms.diff(newAxioms)
    val addAxioms = newAxioms.diff(oldAxioms)

    // apply changes to ontology
    oldOntology.removeAxioms(deleteAxioms.asJava)
    oldOntology.addAxioms(addAxioms.asJava)

    reasoner.flush()

    synchronizeExplanationGenerator()
  }


  // frees some allocated memory by synchronizing the various reasoners (and thus clear their cache)
  def freeSomeMemory() : Unit ={
    staticReasoner.dispose()
    staticReasoner = getReasoner(staticOntology)
    reasoner.flush()
    synchronizeExplanationGenerator()
  }

  def generateAllFormulaDefinitions(): Iterable[String] = {
    List("formula inconsistent = (" + generateInconsistencyFormula() + ")") ++
      hook2axiom.hooks().map(hook =>
        "formula " + hook + " = (inconsistent | " + generateFormula(hook) + ")"
      )
  }

  def generateInconsistencyFormula(): String = {
    dnfToStr(generateInconsistentDNF());
  }

  private def generateFormula(hook: String) = {
    dnfToStr(generateDNF(hook))
  }

  private def generateDNF(hook: String): Set[Set[OWLLogicalAxiom]] =
    generateDNF(hook2axiom.axiom(hook))

  def generateDNF(axiom: OWLLogicalAxiom): Set[Set[OWLLogicalAxiom]] = {
    val inconsistentDNF = generateInconsistentDNF()
    var dnf = Set[Set[OWLLogicalAxiom]]()

    println("Generate DNF for axiom: " + SimpleOWLFormatter.format(axiom))

    if (staticReasoner.isEntailed(axiom)) {
      // axiom is already entailed in static ontology
      // add empty explanation
      dnf += Set()
      println("entailed in static ontology")
    }
    else {
      // next line uses different approaches for different reasoning methods
      dnf ++= fluentExplanationsAsDNF(axiom)
    }

    dnf --= inconsistentDNF

    dnf.size match {
      case 0 => println("no explanation found")
      case 1 => println("1 explanation found")
      case n => println(n + " explanations found")
    }

    dnf
  }


  // returns the explanation for an OWL axiom
  // CAVE: uses the current set-up of the reasoner and it MUST NOT change the setup during the process!
  def explanationWithCurrentReasoner(axiom : OWLLogicalAxiom) : Set[Set[OWLLogicalAxiom]] = {

    var dnf = Set[Set[OWLLogicalAxiom]]()

    val consistent = reasoner.isConsistent()
    val entailed = reasoner.isEntailed(axiom)

    if (!consistent || entailed) {
      val explanations = getExplanations(axiom)
      dnf ++= explanations
    }
    dnf
  }

  var inconsistentDNF: Option[Set[Set[OWLLogicalAxiom]]] = None

  def generateInconsistentDNF(): Set[Set[OWLLogicalAxiom]] = {

    if(inconsistentDNF.isDefined)
      return inconsistentDNF.get

    var dnf = Set[Set[OWLLogicalAxiom]]()

    val start = System.currentTimeMillis

    println("Generating inconsistency dnf")
    //println("Ontology has now "+ontology.getAxiomCount()+ " axioms.")

    //initReasoner(ontology)
    //initExplanationGenerator(ontology)

    updateReasoner(ontology)
    reasoner.flush()

    if (!reasoner.isConsistent) {
      //println("Is inconsistent")
      val explanations = getExplanationsForInconsistency()
      //println("took " + (System.currentTimeMillis - start))
      //println(explanations.size + " explanations found")
      //println("Explanations: "+explanations.map(_.map(SimpleOWLFormatter.format)))
      explanations.foreach { exp =>
        val rel = exp.filter(relevantAxioms)

        // backward subsumption deletion
        dnf = dnf.filterNot(rel.forall)

        // forward subsumption deletion
        if (!dnf.exists(_.forall(rel)))
          dnf += rel
      }

    }
    inconsistentDNF = Some(dnf)
    dnf
  }

  var repairsSet: Option[Set[Set[OWLLogicalAxiom]]] = None

  def getRepairs(): Set[Set[OWLLogicalAxiom]] = {
    // safe repairs to not compute them all over again
    if(repairsSet.isDefined)
      return repairsSet.get

    val dnf = generateInconsistentDNF()
    println("number of inconsistencies:" + dnf.size)
    //println("inconsistency dnf: ")
    //println("----------")
    //println(dnf.mkString("\n"))
    //println("-----------")
    if (dnf.isEmpty) {
      repairsSet = Some(Set(Set()))
    } else {
      //println(dnf.toList)
      repairsSet = Some(hittingSet(dnf.toList))
    }
    repairsSet.get
  }

  def hittingSet[T](sets: List[Set[T]]): Set[Set[T]] = sets match {
    case Nil => Set()
    case head :: Nil =>
      //      println("A: "+ head.map(Set(_)))
      head.map(Set(_))
    case head :: rest =>
      val restSet = hittingSet(rest)
      val b = restSet.flatMap {set =>
        if (set.intersect(head).isEmpty) {
          // generate all combinations
          head.map(first =>
            set + first
          )
        }
        else {
          // set already contains element from head --> inconsistency described by "head" is already repaired by "set"
          Set(set)
        }
      }
      b


  }

  def addExplanationToDNF(dnf: Set[Set[OWLLogicalAxiom]], explanation : Set[OWLLogicalAxiom]) : Set[Set[OWLLogicalAxiom]] = {
    // filter explanation to relevant axioms
    val rel = explanation.filter(relevantAxioms)
    // remove all explanations that are supersets of the found explanations
    var dnf_new = dnf.filterNot(rel.forall)

    // only add explanation, if it is not a subset of an already computed explanation
    if (!dnf_new.exists(_.forall(rel))) {
      dnf_new += rel
    }
    dnf_new
  }

  def dnfToStr(dnf: Set[Set[OWLLogicalAxiom]]): String = {
    if (dnf.isEmpty)
      "false"
    else
      dnf.map(clauseToStr).mkString(" | ")
  }

  def clauseToStr(clause: Set[OWLLogicalAxiom]): String = {
    if (clause.isEmpty)
      "true"
    else
      clause.map(c => toStr(c)).mkString("(", " & ", ")")
  }

  def toStr(axiom: OWLLogicalAxiom): String =
    axiom2formula.formula(axiom)
}
