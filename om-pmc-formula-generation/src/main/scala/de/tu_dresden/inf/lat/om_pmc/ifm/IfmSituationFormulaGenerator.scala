package de.tu_dresden.inf.lat.om_pmc.ifm

import de.tu_dresden.inf.lat.om_pmc.formulaGeneration.{BlackboxSituationFormulaGenerator, GlassboxCapableSituationFormulaGenerator, InconsistencyBasedGBSituationFormulaGenerator}
import openllet.owlapi.OpenlletReasonerFactory
import org.semanticweb.elk.owlapi.ElkReasonerFactory
import org.semanticweb.owlapi.model._
import org.semanticweb.owlapi.profiles.OWL2ELProfile
import org.semanticweb.owlapi.reasoner.OWLReasonerFactory
import uk.ac.manchester.cs.owlapi.modularity.{ModuleType, SyntacticLocalityModuleExtractor}

import java.io.{File, PrintStream}
import scala.collection.JavaConverters.{asScalaSetConverter, mutableSetAsJavaSetConverter}
import scala.collection.mutable.{HashMap, MultiMap, Set => MutableSet}

object IfmSituationFormulaGenerator {

  val PREFIX = "http://lat.inf.tu-dresden.de/OM-PMC#"
  var explanationMethod = Methods.INC_BASED

  def criticalSituationFormulaGenerator(
                                         ontology: OWLOntology, relevantAxioms: Set[OWLLogicalAxiom]) = {

    situationFormulaGenerator(
      ontology, relevantAxioms, "CriticalSituation")
  }

  def situationFormulaGenerator(
                                 ontology: OWLOntology,
                                 relevantAxioms: Set[OWLLogicalAxiom],
                                 situation: String)
  : IfmSituationFormulaGenerator = {

    val factory = ontology.getOWLOntologyManager.getOWLDataFactory

    val sitClass = factory.getOWLClass(IRI.create(PREFIX + situation))

    val module =
      if (ontology.getClassesInSignature().contains(sitClass))
        getModule(ontology, sitClass)
      else if (situation != "") {
        println("WARNING: SITUATION CLASS NOT KNOWN: " + situation)
        ontology
      } else
        ontology
    //module.getAxioms().asScala.foreach(println)

    var reasonerFactory: OWLReasonerFactory =
      new OpenlletReasonerFactory()
    //    new ReasonerFactory()

    if (inEL(module)) {
      println("only EL axioms relevant!")
      explanationMethod = Methods.BLACK_BOX
      reasonerFactory = new ElkReasonerFactory()
    }


    explanationMethod match {
      case Methods.BLACK_BOX =>
        new IfmBlackboxSituationFormulaGenerator(reasonerFactory,
          module, relevantAxioms, sitClass, situation)
      case Methods.GLASS_BOX =>
        new IfmGlassboxSituationFormulaGenerator(reasonerFactory,
          module, relevantAxioms, sitClass, situation)
      case Methods.INC_BASED =>
        new IfmInconsistencyBasedGBSituationFormulaGenerator(reasonerFactory,
          module, relevantAxioms, sitClass, situation)
    }
  }

  def inEL(ontology: OWLOntology) = {
    val profileReport = (new OWL2ELProfile).checkOntology(ontology);
    val result = profileReport.isInProfile()
    // if (!result)
    //   profileReport.getViolations.asScala.foreach(println)
    result
  }

  def getModule(ontology: OWLOntology, sitClass: OWLClass) = {
    val moduleExtractor =
      new SyntacticLocalityModuleExtractor(
        ontology.getOWLOntologyManager,
        ontology,
        ModuleType.STAR)

    moduleExtractor.extractAsOntology(
      java.util.Collections.singleton(sitClass),
      IRI.create(sitClass.getIRI + "-temporaryModule"))
  }

  def situationFormulaGenerator(ontology: OWLOntology, relevantAxioms: Set[OWLLogicalAxiom])
  : IfmSituationFormulaGenerator = {
    situationFormulaGenerator(ontology, relevantAxioms, "")
  }

  object Methods extends Enumeration {
    val GLASS_BOX, BLACK_BOX, INC_BASED = Value
  }

}

abstract class IfmSituationFormulaGenerator(
                                             reasonerFactory: OWLReasonerFactory,
                                             ontology: OWLOntology,
                                             relevantAxioms: Set[OWLLogicalAxiom],
                                             situationSuperClass: OWLClass,
                                             outputFileName: String
                                           ) {


  val PREFIX = "http://lat.inf.tu-dresden.de/OM-PMC#"


  val manager = ontology.getOWLOntologyManager

  val factory = manager.getOWLDataFactory

  val clTCProcess =
    factory.getOWLClass(IRI.create(PREFIX + "TimeCriticalProcess"))
  val prRunsProcess =
    factory.getOWLObjectProperty(IRI.create(PREFIX + "runsProcess"))
  val clInactive =
    factory.getOWLClass(IRI.create(PREFIX + "Inactive"))
  val clProcess =
    factory.getOWLClass(IRI.create(PREFIX + "Process"))
  val clHPProcess =
    factory.getOWLClass(IRI.create(PREFIX + "HighPriorityProcess"))
  val clActiveContext =
    factory.getOWLClass(IRI.create(PREFIX + "ActiveContext"))
  val processPrefix = PREFIX + "process"
  val cpuPrefix = PREFIX + "cpu"

  // def generateSplitFormulae() = {

  //   val dnf = generateSituationDNF(situationSuperClass)

  //   val axiom2Rest = splitDNF(dnf)

  //   println(relevantAxioms.mkString("\n"))
  //   println("--")
  //   println(axiom2Rest.keys.mkString("\n"))

  //   relevantAxioms.foreach { axiom =>
  //     val file = new File(outputFileName + "_" + filePostfix(axiom))
  //     generateSituationFormula(axiom2Rest.getOrElse(axiom, Set()).toSet, file)
  //   }
  // }

  // def generateSituationFormulaAssignment(varName: String): String = {
  //   val dnf = generateSituationDNF(situationSuperClass)

  //   "formula " + varName + " = (" + dnfToStr(dnf) + ");"
  // }
  val contextPrefix = PREFIX + "Context"
  var reasoner = reasonerFactory.createReasoner(ontology)


  // def generateSituationFormulae() = {

  //   println("Using situations of type " + situationSuperClass)

  //   val dnf = generateSituationDNF(situationSuperClass)

  //   //    getSituations.foreach(generateSituationFormula)

  //   val outputFile = new File(outputFileName)

  //   generateSituationFormula(dnf, outputFile)
  // }

  def generateInconsistentSituationFormulaAssignment(varName: String): String = {
    val dnf = generateInconsistentSituationDNF()

    "formula " + varName + " = (" + dnfToStr(dnf) + ");"
  }

  /**
   * varPrefix: prefix of the hook
   * number: number of individuals for which situations are generated
   * indPrefix: beginning of relevant individual names
   *
   * the situations correspond to entailed assertions Situation(PREFIX+indPrefix+i)
   */
  def generateSplitSituationFormulaAssignments(
                                                varPrefix: String,
                                                number: Int,
                                                indPrefix: String) = {
    val dnfMap = generateSituationDNF(situationSuperClass, number, indPrefix)
    //    val axiom2Rest = splitDNF(dnf)

    var todo = (1 to number).toSet[Int].map(_.toString)

    dnfMap.map {
      case (individual, dnf) =>
        val id = ID(individual)
        todo -= id
        "formula " + varPrefix + id + " = (" +
          dnfToStr(dnf) + ");"
    }.mkString("\n") + "\n" +
      todo.map(id => "formula " + varPrefix + id + " = (false);").mkString("\n")

    // relevantAxioms.flatMap { axiom =>
    //   getPrefix(axiom).map { prefix =>
    //     "formula " + varPrefix + prefix + " = (" +
    //       dnfToStr(axiom2Rest.getOrElse(axiom, Set()).toSet) + ");"
    //   }
    // }.mkString("\n")
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

  def generateSituationDNF(
                            situation: OWLClass,
                            individualNumber: Int,
                            individualNamePrefix: String) = {
    val inds =
      (1 to individualNumber).map(i =>
        factory.getOWLNamedIndividual(
          IRI.create(PREFIX + individualNamePrefix + i.toString)
        )
      )

    //ontology.getIndividualsInSignature(false).asScala

    var dnfMap = scala.collection.mutable.Map[OWLIndividual, Set[Set[OWLLogicalAxiom]]]()

    val repairs = Set(Set[OWLAxiom]()) //getRepairs()

    println("Got " + repairs.size + " repairs.")
    println("Repair: " + repairs)

    val axioms = ontology.getAxioms()

    val inconsistentDNF = generateInconsistentSituationDNF()

    repairs.foreach { repair =>
      val repairedAxioms = axioms.asScala -- repair

      val repairedOntology = manager.createOntology(repairedAxioms.asJava)

      //      repair.foreach(ontology.removeAxiom)
      println("axioms in ontology: " + repairedOntology.getAxiomCount())
      // println("++++++++++++++++++++")
      // println(repairedOntology.getAxioms().asScala.mkString("\n"))
      // println("++++++++++++++++++++")
      initReasoner(repairedOntology)
      initExplanationGenerator(repairedOntology)
      reasoner.flush()
      inds.foreach { ind =>
        val ax = factory.getOWLClassAssertionAxiom(situationSuperClass, ind)

        println("Testing: " + ax)

        println("Consistency of ontology: " + reasoner.isConsistent())

        if (!reasoner.isConsistent() || reasoner.isEntailed(ax)) {


          var dnf = Set[Set[OWLLogicalAxiom]]()

          // val outputFile = new File(situation.getIRI.getFragment.toString+
          //                           "("+ind.getIRI.getFragment.toString+").txt")


          val start = System.currentTimeMillis
          println("Generating Explanations for " + ax)
          val explanations = getExplanations(ax)
          println("took " + (System.currentTimeMillis - start))
          println(explanations.size + " explanations found")
          explanations.foreach { exp =>
            val rel = exp.filter(relevantAxioms)
            dnf = dnf.filterNot(rel.forall)
            if (!dnf.exists(_.forall(rel)))
              dnf += rel.toSet
          }

          dnf --= inconsistentDNF

          if (!dnf.isEmpty) {
            if (!dnfMap.contains(ind))
              dnfMap += (ind -> dnf)
            else
              dnfMap(ind) = dnfMap(ind) ++ dnf
          }
        }
      }
      //      initReasoner()
      //      reasoner.flush()
    }

    dnfMap.toMap
  }

  def initReasoner(ontology: OWLOntology) = {
    reasoner = reasonerFactory.createReasoner(ontology)
    initExplanationGenerator(ontology)
  }

  def generateInconsistentSituationDNF() = {
    var dnf = Set[Set[OWLLogicalAxiom]]()

    val start = System.currentTimeMillis


    if (!reasoner.isConsistent) {
      println("Is inconsistent")
      val explanations = getExplanationsForInconsistency()
      println("took " + (System.currentTimeMillis - start))
      println(explanations.size + " explanations found")
      explanations.foreach { exp =>
        val rel = exp.filter(relevantAxioms)

        // backward subsumption deletion
        dnf = dnf.filterNot(rel.forall)

        // forward subsumption deletion
        if (!dnf.exists(_.forall(rel)))
          dnf += rel.toSet
      }

    }
    dnf
  }

  def ID(a: OWLIndividual) = {
    a.asOWLNamedIndividual
      .getIRI
      .getIRIString
      .replaceAll("[^0-9]", "")
  }

  def splitDNF(dnf: Set[Set[OWLAxiom]]) = {
    val axiom2Rest =
      new HashMap[OWLAxiom, MutableSet[Set[OWLAxiom]]]() with MultiMap[OWLAxiom, Set[OWLAxiom]]

    dnf.foreach { clause =>
      clause.foreach { axiom =>
        val clauseWithout = clause - axiom

        axiom2Rest.addBinding(axiom, clauseWithout)
      }
    }

    axiom2Rest
  }

  def generateSituationFormula(dnf: Set[Set[OWLLogicalAxiom]],
                               file: File) = {

    val out = new PrintStream(file)
    out.println(dnfToStr(dnf))
    out.close()
  }

  def getRepairs(): Set[Set[OWLLogicalAxiom]] = {
    val dnf = generateInconsistentSituationDNF()
    println("inconsistency dnf: ")
    println("----------")
    println(dnf.mkString("\n"))
    println("-----------")
    if (dnf.size == 0)
      return Set(Set())
    else {
      println(dnf.toList)
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

  //      ontology.getClassesInSignature().asScala.filter(
  //          _.getIRI.getIRIString.startsWith(SIT_PREFIX)).toSet

  def initExplanationGenerator(ontology: OWLOntology): Unit

  def getExplanations(axiom: OWLLogicalAxiom): Iterable[_ <: Set[OWLLogicalAxiom]]

  //  inc_proc[NUM]on[Server] = (FORMULA);

  def getExplanationsForInconsistency(): Iterable[_ <: Set[OWLLogicalAxiom]]

  def getSituations: Set[OWLClass] = {
    val sits =
      reasoner.getSubClasses(situationSuperClass, false).getFlattened.asScala.toSet
    println(sits.mkString("\n"))
    sits
  }

  def filePostfix(a: Any): String = toStr(a)

  def toStr(a: Any): String = a match {
    //    case a: OWLClassAssertionAxiom
    //      if a.getClassExpression.equals(clInactive) =>
    //      "proc" + procID(a.getIndividual) + "_cpu = 0"

    //    case a: OWLClassAssertionAxiom
    //      if a.getClassExpression.equals(clTCProcess) =>
    //      "proc" + procID(a.getIndividual) + "_critical = 1"

    case a: OWLObjectPropertyAssertionAxiom
      if a.getProperty.equals(prRunsProcess) =>
      "proc" + procID(a.getObject) + "_cpu = " + cpuID(a.getSubject)

    case a: OWLSubClassOfAxiom
      if a.getSubClass.equals(clActiveContext) && a.getSuperClass.isInstanceOf[OWLClass] =>
      "context = " + contextID(a.getSuperClass.asInstanceOf[OWLClass])

    // case a: OWLClassAssertionAxiom =>
    //   toStr(a.getClassExpression) + "(" + toStr(a.getIndividual) + ")"

    // case a: OWLObjectPropertyAssertionAxiom =>
    //   toStr(a.getProperty) + "(" + toStr(a.getSubject) + "," + toStr(a.getObject) + ")"

    // case cl: OWLNamedObject => cl.getIRI.getFragment

    case a => assert(false, "Not supported: " + a.toString)
      a.toString
  }

  def contextID(a: OWLClass) = {
    a.getIRI.getIRIString.replaceAll(
      contextPrefix, "")
  }

  def getPrefix(axiom: OWLAxiom): Option[String] = axiom match {
    case a: OWLClassAssertionAxiom
      if a.getClassExpression.equals(clHPProcess) =>
      Some(procID(a.getIndividual))
    case a: OWLClassAssertionAxiom
      if a.getClassExpression.equals(clProcess) =>
      Some(procID(a.getIndividual))
    case a: OWLClassAssertionAxiom
      if a.getClassExpression.equals(clInactive) =>
      Some("_proc" + procID(a.getIndividual) + "on0")
    case a: OWLObjectPropertyAssertionAxiom
      if a.getProperty.equals(prRunsProcess) =>
      Some("_proc" + procID(a.getObject) + "on" + cpuID(a.getSubject))
    case _ => None
  }

  def procID(a: OWLIndividual) = {
    a.asOWLNamedIndividual.getIRI.getIRIString.replaceAll(
      processPrefix, "")
  }

  def cpuID(a: OWLIndividual) = {
    a.asOWLNamedIndividual.getIRI.getIRIString.replaceAll(
      cpuPrefix, "")
  }

}
