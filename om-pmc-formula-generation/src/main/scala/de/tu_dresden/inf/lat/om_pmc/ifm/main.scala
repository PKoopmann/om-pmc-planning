package de.tu_dresden.inf.lat.om_pmc.ifm

import org.semanticweb.owlapi.apibinding.OWLManager
import org.semanticweb.owlapi.model.{IRI, OWLAxiom, OWLLogicalAxiom, OWLOntology, OWLOntologyIRIMapper}

import java.io.{File, FileOutputStream, PrintStream}


object IfmPaperDataGeneration {

  def main(args: Array[String]) = {

    if (args.size < 6) {
      println("Expected arguments:")
      println("[ONTOLOGY] [NUM_SERVERS] " +
        "[NUM_WINDOW_SERVERS] [NUM_CPUS_PER_SERVER] " +
        "[NUM_PROCESSES] [NUM_WINDOWS_PROCESSES] ")
      //         "[NUM_TIME_CRITICAL_PROCESSES] ")
      //         "(--splitFormulae)")

      println("NUM_SERVERS and NUM_PROCESSES denote *complete number* " +
        "of servers/processes (including windows/time critical). " +
        "The optional argument --splitFormulae " +
        "is used to specify that we do not generate a single " +
        "formula, but a set of formulae as preconditions for " +
        "actions")

      System.exit(0);
    }


    val ontFile = args(0)

    //     val situation = args(1)
    val servers = args(1).toInt
    val windowsServers = args(2).toInt
    val cpusPerServer = args(3).toInt
    val processes = args(4).toInt
    val windowsProcesses = args(5).toInt
    //     val timeCriticalProcesses = args(6).toInt

    println("Servers: " + servers)
    println("Windows servers: " + windowsServers)
    println("CPUs per server: " + cpusPerServer)
    println("processes: " + processes)
    println("windowsProcesses: " + windowsProcesses)
    //     println("timeCriticalProcesses: "+timeCriticalProcesses)

    //     val splitFormulae = (args.size>8 && args(8) == "--splitFormulae")


    val manager = OWLManager.createOWLOntologyManager()

    manager.getIRIMappers().add(new OWLOntologyIRIMapper() {
      val contextIRI = IRI.create("http://lat.inf.tu-dresden.de/OM-PMC/contexts")
      val contextFileIRI = IRI.create(new File("./contextOntology.owl"))

      override def getDocumentIRI(ontologyIRI: IRI): IRI = {
        if (ontologyIRI.equals(contextIRI))
          return contextFileIRI
        else
          return null
      }
    })

    val ont = manager.loadOntologyFromOntologyDocument(new File(ontFile))

    val gen = new ABoxGenerator(
      ontology = ont,
      servers = servers,
      windowsServers = windowsServers,
      cpusPerServer = cpusPerServer,
      processes = processes,
      windowsProcesses = windowsProcesses)
    //       highPriorityProcesses=timeCriticalProcesses)

    gen.createMaximalABox()

    //     ont.getAxioms().asScala.foreach(println)

    // store the generated ontology for debugging purposes
    val outStream = new FileOutputStream(new File("out.owl"))
    ont.saveOntology(outStream)
    outStream.close()

    // write the actual formulae
    val start = System.currentTimeMillis

    val out = new PrintStream(new File("sit-formula-assignments.prism"))

    writeAssignmentsSingleInconsistent(ont, gen.relevantAxioms, out)

    writeAssignmentsSplit(ont, gen.relevantAxioms,
      "CriticalSituation", "critical", out, servers, "cpu")
    writeAssignmentsSplit(ont, gen.relevantAxioms,
      "PreemptiveSituation", "preemptive", out, servers, "cpu")
    //     writeAssignmentsSplit(ont, gen.relevantAxioms,
    //       "InconsistentSituation", "inc", out)
    //     writeAssignmentSingle(ont, gen.relevantAxioms,
    //       "BeneficialSituation", "beneficial", out)
    writeAssignmentsSplit(ont, gen.relevantAxioms ++ gen.relevantForHighPriority,
      "HighPriorityProcess", "highPriority", out, processes, "process")

    println("Generation took " + (System.currentTimeMillis - start))
    out.close()

    // var formGen =
    //   SituationFormulaGenerator.situationFormulaGenerator(
    //     ont, gen.relevantAxioms, situation)

    // val start = System.currentTimeMillis
    // if(!splitFormulae)
    //   formGen.generateSituationFormulae
    // else
    //   formGen.generateSplitFormulae
    // println("Overall computation took "+(System.currentTimeMillis-start)+".")

  }

  // def writeAssignmentSingle(
  //   ontology: OWLOntology,
  //   relevantAxioms: Set[OWLAxiom],
  //   situation: String,
  //   varName: String,
  //   out: PrintStream) = {

  //   println("Computing formula for "+situation)

  //   var formGen =
  //     SituationFormulaGenerator.situationFormulaGenerator(
  //       ontology, relevantAxioms, situation)

  //   out.println(formGen.generateSituationFormulaAssignment(varName))
  // }

  def writeAssignmentsSingleInconsistent(
                                          ontology: OWLOntology,
                                          relevantAxioms: Set[OWLLogicalAxiom],
                                          out: PrintStream) = {

    println("Computing inconsistent situation formula")

    var formGen = IfmSituationFormulaGenerator.situationFormulaGenerator(
      ontology, relevantAxioms
    )

    out.println(formGen.generateInconsistentSituationFormulaAssignment("inconsistent"))
  }

  def writeAssignmentsSplit(
                             ontology: OWLOntology,
                             relevantAxioms: Set[OWLLogicalAxiom],
                             situation: String,
                             varPrefix: String,
                             out: PrintStream,
                             number: Int,
                             indPrefix: String
                           ) = {

    println("Computing formula for " + situation + " (split)")

    var formGen =
      IfmSituationFormulaGenerator.situationFormulaGenerator(
        ontology, relevantAxioms, situation)

    out.println(formGen.generateSplitSituationFormulaAssignments(varPrefix, number, indPrefix))
  }

}
