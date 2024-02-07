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

  //var explanationMethod = Methods.INC_BASED // Methods.BLACK_BOX
  var explanationMethod = Methods.BLACK_BOX // Methods.INC_BASED


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

    println(explanationMethod)

    var reasonerFactory: OWLReasonerFactory =
      if (explanationMethod.equals(Methods.BLACK_BOX) || explanationMethod.equals(Methods.INC_BASED)) {
        new ReasonerFactory()
      } // HermiT
      else
        new OpenlletReasonerFactory()

    //println("factory: "+reasonerFactory)

    if (inEL(module)) {
      println("only EL axioms relevant!")
      explanationMethod = Methods.BLACK_BOX
      reasonerFactory = new ElkReasonerFactory()
    }


    val result = explanationMethod match {
      case Methods.BLACK_BOX =>
        new BlackboxSituationFormulaGenerator(axiom2formula, hook2axiom, manager, reasonerFactory)
      case Methods.GLASS_BOX =>
        new GlassboxCapableSituationFormulaGenerator(axiom2formula, hook2axiom, manager, reasonerFactory)
      case Methods.INC_BASED =>
        new InconsistencyBasedGBSituationFormulaGenerator(axiom2formula, hook2axiom, manager, reasonerFactory)
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
    val GLASS_BOX, BLACK_BOX, INC_BASED = Value
  }

}

abstract class FormulaGenerator(axiom2formula: AxiomToFormulaMap,
                                hook2axiom: HookToAxiomMap,
                                ontologyManager: OWLOntologyManager,
                                reasonerFactory: OWLReasonerFactory) {

  val relevantAxioms: Set[OWLLogicalAxiom] = axiom2formula.axioms
  var relevantHooks: Set[OWLLogicalAxiom] = _ // hook2axiom.hooks().map(hook2axiom.axiom)
  var reasoner: OWLReasoner = _
  var ontology: OWLOntology = _
  var staticReasoner: OWLReasoner = _
  var staticOntology: OWLOntology = _
  val factory: OWLDataFactory = ontologyManager.getOWLDataFactory

  protected def initExplanationGenerator(ontology: OWLOntology): Unit

  protected def synchronizeExplanationGenerator(): Unit

  protected def getExplanationsForInconsistency(): Iterable[_ <: Set[OWLLogicalAxiom]]

  protected def getExplanations(axiom: OWLLogicalAxiom): Iterable[_ <: Set[OWLLogicalAxiom]]

  def getReasoner(ontology: OWLOntology): OWLReasoner =
    if(reasonerFactory.isInstanceOf[ReasonerFactory]){
      val config = new Configuration();
      config.throwInconsistentOntologyException=false
      reasonerFactory.createReasoner(ontology,config)
    }
    else
      reasonerFactory.createReasoner(ontology)


  def getHooks(): Set[String] = hook2axiom.hooks()


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
  private def freeSomeMemory() : Unit ={
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


  def generateDNF(axiom: OWLLogicalAxiom): Set[Set[OWLLogicalAxiom]] =
  {
    val inconsistentDNF = generateInconsistentDNF()

    //println(SimpleOWLFormatter.format(ontology))

    var dnf = Set[Set[OWLLogicalAxiom]]()

    println("Generate DNF for axiom: " + SimpleOWLFormatter.format(axiom))

    if (staticReasoner.isEntailed(axiom)) {
      // axiom is already entailed in static ontology
      // add empty explanation
      dnf += Set()
      println("entailed in static ontology")
    }
    else {
      // different approaches for different reasoning methods
      val dnfAdd = explanationMethod match {
        case Methods.INC_BASED =>
          generateDNFIncBased(axiom)
        case _ =>
          generateDNFRepairCentric(axiom)
      }
      dnf ++= dnfAdd
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
  private def explanationWithCurrentReasoner(axiom : OWLLogicalAxiom) : Set[Set[OWLLogicalAxiom]] = {

    var dnf = Set[Set[OWLLogicalAxiom]]()

    val consistent = reasoner.isConsistent()
    val entailed = reasoner.isEntailed(axiom)

    if (!consistent || entailed) {
      val explanations = getExplanations(axiom)
      dnf ++= explanations
    }
    dnf
  }

  private def addExplanationToDNF(dnf: Set[Set[OWLLogicalAxiom]], explanation : Set[OWLLogicalAxiom]) : Set[Set[OWLLogicalAxiom]] = {
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


  // generate DNF by using inconsistency based approach
  def generateDNFIncBased(axiom: OWLLogicalAxiom) : Set[Set[OWLLogicalAxiom]] = {
    var dnf = Set[Set[OWLLogicalAxiom]]()
    println("explain using inc. based method")
    val explanations = getExplanations(axiom)
    explanations.foreach { exp =>
      val rel = exp.filter(relevantAxioms)

      // backward subsumption deletion
      dnf = dnf.filterNot(rel.forall)

      // forward subsumption deletion
      if (!dnf.exists(_.forall(rel)))
        dnf += rel
    }

    dnf
  }

  // generate DNF by iterating over repairs for one hook at a time
  def generateDNFHookCentric(axiom: OWLLogicalAxiom): Set[Set[OWLLogicalAxiom]] = {
    var dnf = Set[Set[OWLLogicalAxiom]]()

    val axioms = ontology.getAxioms()

    val repairs = getRepairs()
    println("Number of repairs: " + repairs.size)

    repairs.foreach { repair =>

      // compute repaired ontology
      val repairedAxioms = axioms.asScala -- repair
      val repairedOntology = ontologyManager.createOntology(repairedAxioms.asJava)
      updateReasoner(repairedOntology)
      // get explanations using the repaired ontology
      val explanations =  explanationWithCurrentReasoner(axiom)

      // add all found explanations to DNF
      explanations.foreach { exp =>
        dnf = addExplanationToDNF(dnf, exp)
      }

    }
    val oldOntology = ontologyManager.createOntology(axioms)
    updateReasoner(oldOntology)

    dnf
  }


  // map to store generated rewritings
  // maps from hook axioms to explanation DNFs
  private var repairCentricRewritings : Option[mutable.Map[OWLLogicalAxiom, Set[Set[OWLLogicalAxiom]]]] = None

  // iterates over all repairs and calculates the rewritings for all hooks
  private def generateRepairCentricRewritings() = {
    freeSomeMemory()

    var rewritings : mutable.Map[OWLLogicalAxiom, Set[Set[OWLLogicalAxiom]]] = mutable.Map()

    // get repairs
    val repairs = getRepairs()
    println("Number of repairs: " + repairs.size)


    val axioms = ontology.getAxioms()

    // iterate through all repairs
    var counter = 0
    var totalHookCount = 0
    repairs.foreach { repair =>
      counter += 1
      println("Computing hooks for repair nr. "+counter)

      val repairedAxioms = axioms.asScala -- repair
      val repairedOntology = ontologyManager.createOntology(repairedAxioms.asJava)

      updateReasoner(repairedOntology)

      relevantHooks.foreach { axiom =>
        totalHookCount += 1



        // free some memory every tenth hook
        if (totalHookCount %20 == 0) {
          println(s"free some memory: hock count=$totalHookCount")
          freeSomeMemory()
        }
        //val axiom = hook2axiom.axiom(hook)

        // find axiom (if we already have rewritings for it
        var dnf : Set[Set[OWLLogicalAxiom]] = {
          if(rewritings.contains(axiom))
            rewritings(axiom)
          else
            Set()
        }

        // get explanations w.r.t. the current (repaired) ontology
        val explanations = explanationWithCurrentReasoner(axiom)
        explanations.foreach {exp =>
          dnf = addExplanationToDNF(dnf, exp)
        }
        // add updated explanation DNF to the map
        //println("add axiom: " + SimpleOWLFormatter.format(axiom))
        rewritings += (axiom -> dnf)

      }
    }

    repairCentricRewritings = Some(rewritings)
  }
  // generate DNF by iterating over all hooks for one rewriting at a time
  def generateDNFRepairCentric(axiom: OWLLogicalAxiom) : Set[Set[OWLLogicalAxiom]] = {
    // generate repairs if it had not been done in the past
    if (repairCentricRewritings.isEmpty)
      generateRepairCentricRewritings()

    if (repairCentricRewritings.get.contains(axiom))
       repairCentricRewritings.get(axiom)
    else {
      println("WARNING: no rewritings for " + axiom + " where computed.")
       Set() // empty disjunction --> false
    }
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

  private def getRepairs(): Set[Set[OWLLogicalAxiom]] = {
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
