package de.tu_dresden.inf.lat.om_pmc.formulaGeneration

import de.tu_dresden.inf.lat.om_pmc.ifm.IfmSituationFormulaGenerator.Methods.{BLACK_BOX, Value}
import de.tu_dresden.inf.lat.om_pmc.ifm.{IfmBlackboxSituationFormulaGenerator, IfmGlassboxSituationFormulaGenerator, IfmInconsistencyBasedGBSituationFormulaGenerator, IfmSituationFormulaGenerator}
import de.tu_dresden.inf.lat.om_pmc.interface.{AxiomToFormulaMap, HookToAxiomMap}
import de.tu_dresden.inf.lat.prettyPrinting.formatting.SimpleOWLFormatter
import openllet.owlapi.OpenlletReasonerFactory
import org.semanticweb.HermiT.{Configuration, ReasonerFactory}
import org.semanticweb.elk.owlapi.ElkReasonerFactory
import org.semanticweb.owlapi.model.{IRI, OWLAxiom, OWLClass, OWLEntity, OWLLogicalAxiom, OWLOntology, OWLOntologyManager}
import org.semanticweb.owlapi.profiles.OWL2ELProfile
import org.semanticweb.owlapi.reasoner.{OWLReasoner, OWLReasonerConfiguration, OWLReasonerFactory}
import uk.ac.manchester.cs.owlapi.modularity.{ModuleType, SyntacticLocalityModuleExtractor}

import java.io.{File, FileOutputStream}
import scala.collection.JavaConverters.{asScalaSetConverter, setAsJavaSetConverter}

object FormulaGenerator {

  val PREFIX = "http://lat.inf.tu-dresden.de/OM-PMC#"
  var explanationMethod = Methods.BLACK_BOX // Methods.INC_BASED

  def formulaGenerator(axiom2formula: AxiomToFormulaMap,
                       hook2axiom: HookToAxiomMap,
                       ontology: OWLOntology)
  : FormulaGenerator = {

    val manager = ontology.getOWLOntologyManager

    ontology.addAxioms(axiom2formula.axioms.asJava)

    val module =
      getModule(ontology,
        hook2axiom.hooks()
          .map(hook2axiom.axiom(_))
          .flatMap(_.getSignature().asScala))

    println("Axioms in module: "+module.getAxiomCount())

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

    val staticAxioms = ontology.getAxioms().asScala -- axiom2formula.axioms
    result.staticOntology = manager.createOntology(staticAxioms.asJava)

    result.initReasoner(module)
    result
  }

  def inEL(ontology: OWLOntology) = {
    val profileReport = (new OWL2ELProfile).checkOntology(ontology);
    val result = profileReport.isInProfile()
    // if (!result)
    //   profileReport.getViolations.asScala.foreach(println)
    result
  }

  def getModule(ontology: OWLOntology, signature: Set[OWLEntity]) = {
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

  val relevantAxioms = axiom2formula.axioms
  var reasoner: OWLReasoner = _
  var ontology: OWLOntology = _
  var staticOntology: OWLOntology = _
  val factory = ontologyManager.getOWLDataFactory

  protected def initExplanationGenerator(ontology: OWLOntology): Unit

  protected def getExplanationsForInconsistency(): Iterable[_ <: Set[OWLLogicalAxiom]]

  protected def getExplanations(axiom: OWLLogicalAxiom): Iterable[_ <: Set[OWLLogicalAxiom]]

  def getReasoner(ontology: OWLOntology) =
    if(reasonerFactory.isInstanceOf[ReasonerFactory]){
      val config = new Configuration();
      config.throwInconsistentOntologyException=false
      reasonerFactory.createReasoner(ontology,config)
    }
    else
      reasonerFactory.createReasoner(ontology)

  def getHooks() = hook2axiom.hooks()

  def initReasoner(ontology: OWLOntology) = {
    this.ontology=ontology

    reasoner = getReasoner(ontology)

    initExplanationGenerator(ontology)
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

  def generateFormula(hook: String) = {
    dnfToStr(generateDNF(hook))
  }

  private def generateDNF(hook: String): Set[Set[OWLLogicalAxiom]] =
    generateDNF(hook2axiom.axiom(hook))

  def generateDNF(axiom: OWLLogicalAxiom): Set[Set[OWLLogicalAxiom]] =
  {
    val originalOntology = ontology

    val inconsistentDNF = generateInconsistentDNF()

    //println(SimpleOWLFormatter.format(ontology))

    var dnf = Set[Set[OWLLogicalAxiom]]()

    println("Generate DNF for axiom: " + SimpleOWLFormatter.format(axiom))

    initReasoner(staticOntology)
    reasoner.flush()
    if (reasoner.isEntailed(axiom)) {
      // axiom is already entailed in static ontology
      // add empty explanation
      dnf += Set()
      println("entailed in static ontology")
    }
    else {
      ontology = originalOntology
      val axioms = ontology.getAxioms()

      val repairs = getRepairs()


      //println("Got " + repairs.size + " repairs.")
      //println("Repairs: " + repairs)

      var counter = 0

      //println("Ontology:")
      //println(SimpleOWLFormatter.format(ontology))

      //println("Relevant axioms: "+relevantAxioms.map(SimpleOWLFormatter.format))

      repairs.foreach { repair =>
        counter += 1
        //println("Using repair nr. "+counter)
        val repairedAxioms = axioms.asScala -- repair

        val repairedOntology = ontologyManager.createOntology(repairedAxioms.asJava)

        //      repair.foreach(ontology.removeAxiom)
        //println("axioms in ontology: " + repairedOntology.getAxiomCount())
        // println("++++++++++++++++++++")
        // println(repairedOntology.getAxioms().asScala.mkString("\n"))
        // println("++++++++++++++++++++")
        initReasoner(repairedOntology)
        initExplanationGenerator(repairedOntology)
        reasoner.flush()

        val consistent = reasoner.isConsistent()
        val entailed = reasoner.isEntailed(axiom)

        //println("Consistency of ontology: " + consistent)
        //println("Entailment: " + entailed)


        if (!consistent || entailed) {
          val start = System.currentTimeMillis
          //println("Generating Explanations for " + axiom)

          val explanations = getExplanations(axiom)

          //println("took " + (System.currentTimeMillis - start))
          //println(explanations.size + " explanations found")
          //repairedOntology.getAxioms().forEach(a => println(a));

          //println("Explanations: " + explanations.map(_.map(SimpleOWLFormatter.format)))

          explanations.foreach { exp =>
            // println("Adding new explanation")
            //println("Explanations before: "+dnf.size)

            val rel = exp.filter(relevantAxioms)
            dnf = dnf.filterNot(rel.forall)
            if (!dnf.exists(_.forall(rel))) {
              dnf += rel.toSet
              //println("Explanations after: "+dnf.size)
            }
          }

        }
      }
    }

    ontology=originalOntology

    //      initReasoner()
    //      reasoner.flush()

    dnf --= inconsistentDNF

    dnf.size match {
      case 0 => println("no explanation found")
      case 1 => println("1 explanation found")
      case n => println(n + " explanations found")
    }

    dnf
  }

  var inconsistentDNF: Option[Set[Set[OWLLogicalAxiom]]] = None

  def generateInconsistentDNF(): Set[Set[OWLLogicalAxiom]] = {

    if(!inconsistentDNF.isEmpty)
      return inconsistentDNF.get

    var dnf = Set[Set[OWLLogicalAxiom]]()

    val start = System.currentTimeMillis

    println("Generating inconsistency dnf")
    //println("Ontology has now "+ontology.getAxiomCount()+ " axioms.")

    initReasoner(ontology)
    initExplanationGenerator(ontology)
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
          dnf += rel.toSet
      }

    }
    inconsistentDNF = Some(dnf)
    dnf
  }

  def getRepairs(): Set[Set[OWLLogicalAxiom]] = {
    val dnf = generateInconsistentDNF()
    //println("inconsistency dnf: ")
    //println("----------")
    //println(dnf.mkString("\n"))
    //println("-----------")
    if (dnf.size == 0)
      return Set(Set())
    else {
      //println(dnf.toList)
      return hittingSet(dnf.toList)
    }
  }

  def hittingSet[T](sets: List[Set[T]]): Set[Set[T]] = sets match {
    case head :: Nil =>
      //      println("A: "+ head.map(Set(_)))
      head.map(Set(_))
    case head :: rest =>
      val a = head.flatMap { first =>
        //	println("B: "+ hittingSet(rest).map(_+first))
        hittingSet(rest).map(_ + first)
      }
      //	println("C: "+a)
      a
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

  def toStr(axiom: OWLLogicalAxiom) =
    axiom2formula.formula(axiom)

}
