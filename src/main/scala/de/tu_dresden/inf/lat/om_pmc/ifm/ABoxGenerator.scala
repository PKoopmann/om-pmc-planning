package de.tu_dresden.inf.lat.om_pmc.ifm

import de.tu_dresden.inf.lat.om_pmc.formulaGeneration.AxiomGrouper
import org.semanticweb.owlapi.model._

import scala.collection.JavaConverters._


object ABoxGenerator {

}


class ABoxGenerator(
  ontology: OWLOntology,
  servers: Int,
  windowsServers: Int,
  cpusPerServer: Int,
  processes: Int,
  windowsProcesses: Int,
//  highPriorityProcesses: Int,
  dynamicOS: Boolean = true) {

  var timeCriticalForModel = false

  val NUM_CONTEXTS = 6

  // var servers = 3

  // var windowsServers = 1

  // var cpusPerServer = 1

  // var processes = 6

  // var windowsProcesses = 3

  // var highPriorityProcesses = 2

  val PREFIX = "http://lat.inf.tu-dresden.de/OM-PMC#"
        
  val clProcessIRI = PREFIX+"Process"
  val clServerIRI = PREFIX+"Server" 
  val clCpuIRI = PREFIX+"CPU"
  val clTCProcessIRI = PREFIX+"TimeCritical"
  val clOffIRI = PREFIX+"Off"

  val clActiveContextIRI = PREFIX+"ActiveContext"

  val prHasCpuIRI = PREFIX+"hasCPU"
  val prRunsProcessIRI = PREFIX+"runsProcess"


  val manager = ontology.getOWLOntologyManager
  val factory = manager.getOWLDataFactory

  val clProcess = factory.getOWLClass(IRI.create(clProcessIRI))
  val clServer = factory.getOWLClass(IRI.create(clServerIRI))
  val clCPU = factory.getOWLClass(IRI.create(clCpuIRI))
  val clOff = factory.getOWLClass(IRI.create(clOffIRI))
  val clTCProcess = factory.getOWLClass(IRI.create(clTCProcessIRI))
  val clHPProcess = factory.getOWLClass(IRI.create(PREFIX+"HighPriority"))
  val clActiveContext = factory.getOWLClass(IRI.create(clActiveContextIRI))
  

  val clWindows = factory.getOWLClass(IRI.create(PREFIX+"Windows"))
  val clLinux = factory.getOWLClass(IRI.create(PREFIX+"Linux"))

  val clCategoryA = factory.getOWLClass(IRI.create(PREFIX+"CategoryAProcess"))
  val clCategoryB = factory.getOWLClass(IRI.create(PREFIX+"CategoryBProcess"))

  val clFirstServer = factory.getOWLClass(IRI.create(PREFIX+"FirstServer"))
  val clNonDedicatedServer = factory.getOWLClass(IRI.create(PREFIX+"NonDedicatedServer"))
  val clGroup1Server = factory.getOWLClass(IRI.create(PREFIX+"Group1Server"))
  val clGroup2Server = factory.getOWLClass(IRI.create(PREFIX+"Group2Server"))

  val prHasCPU = factory.getOWLObjectProperty(IRI.create(prHasCpuIRI))
  val prRunsProcess =
    factory.getOWLObjectProperty(IRI.create(prRunsProcessIRI))
  val prRunsOS =
    factory.getOWLObjectProperty(IRI.create(PREFIX+"runsOS"))
  val prRequiresOS =
    factory.getOWLObjectProperty(IRI.create(PREFIX+"requiresOperatingSystem"))

  val indLinux = factory.getOWLNamedIndividual(IRI.create(PREFIX+"linux"))
  val indWindows = factory.getOWLNamedIndividual(IRI.create(PREFIX+"windows"))

//  val contextIndPrefix = PREFIX + "context"
  val contextClPrefix = PREFIX + "Context"

  var individuals = Set[OWLNamedIndividual]()

  var relevantAxioms = Set[OWLLogicalAxiom]()
  var relevantForHighPriority = Set[OWLLogicalAxiom]()
  var otherAxioms = Set[OWLLogicalAxiom]()

  def createMaximalABox() {


    // we still need to os individuals to assign them to the processes
    val osAxiom1 = factory.getOWLClassAssertionAxiom(clWindows,
						     indWindows)
    val osAxiom2 = factory.getOWLClassAssertionAxiom(clLinux,
						     indLinux)
    ontology.addAxiom(osAxiom1)
    ontology.addAxiom(osAxiom2)

    addContexts()
    


    for(processID <- 1 to processes){
      addProcess(processID)
	//        if(timeCriticalForModel)
      //          makeTC(processID)
      
      if(processID==1)
	assignClass(processIRI(processID), clCategoryA, false)
      if(processID%2==0)
	assignClass(processIRI(processID), clCategoryB, false)
      
      
        if(processID <= windowsProcesses)
          assignProcessOS(processID, indWindows)
        else
          assignProcessOS(processID, indLinux)
      }

      println("processes: "+processes)

//      Random.shuffle(1 to processes).take(highPriorityProcesses).foreach(makeHighPriority)

      for(serverID <- 1 to servers) {
        addServer(serverID)

	if(serverID==1)
	  assignClass(serverIRI(serverID),clFirstServer, false) 
	else
	  assignClass(serverIRI(serverID),clNonDedicatedServer,false)

        println("A server")


	if(NUM_CONTEXTS==0){
	  // if we do not use contexts, os assignment is done in the ABox
          if(dynamicOS || serverID <= windowsServers)
            assignServerOS(serverID, indWindows)
          if(dynamicOS || serverID> windowsServers)
            assignServerOS(serverID, indLinux)
	} else {
	  // otherwise, servers are assigned to groups
	  if(serverID <= windowsServers)
	    assignClass(serverIRI(serverID),clGroup1Server, false)
	  else
	    assignClass(serverIRI(serverID),clGroup2Server, false)
	}

        for(cpuID <- 1 to cpusPerServer){
          println("A CPU")
           addCPU(serverID,cpuID)
         }
      }


    for(processID <- 1 to processes){
      for(serverID <- 1 to servers)
        for(cpuID <- 1 to cpusPerServer){
          addRunsOn(processID, serverID, cpuID)
          addInactive(processID)
        }
    }

    addProcessClosure(processes)

    val unaAxiom = factory.getOWLDifferentIndividualsAxiom(individuals.asJava)

    ontology.addAxiom(unaAxiom)

    val axiomGrouper = new AxiomGrouper(factory)
    otherAxioms.foreach(ontology.addAxiom)
//    ontology.addAxiom(axiomGrouper.groupAxioms(otherAxioms))
  }

  def addContexts() = {
    (1 to NUM_CONTEXTS).foreach{ id =>
	  
      val activeContextAxiom =
	factory.getOWLSubClassOfAxiom(
	  clActiveContext,
	  factory.getOWLClass(IRI.create(contextClPrefix+id.toString)))
      ontology.addAxiom(activeContextAxiom)
      relevantAxioms += activeContextAxiom
    }
  }

  def addProcessClosure(numOfProcesses: Int) = {
    val processes = (1 to numOfProcesses).map(i =>
      factory.getOWLNamedIndividual(processIRI(i)))

    val axiom = factory.getOWLSubClassOfAxiom(
      factory.getOWLClass(IRI.create(PREFIX+"ProcessPool")),
      factory.getOWLObjectAllValuesFrom(
        factory.getOWLObjectProperty(PREFIX+"hasProcess"),
        factory.getOWLObjectOneOf(processes.asJava)))

    ontology.addAxiom(axiom)
  }

  def addInactive(processID: Int) = {
    val process = factory.getOWLNamedIndividual(processIRI(processID))
    val inactive = factory.getOWLClass(IRI.create(PREFIX+"Inactive"))
    val axiom = factory.getOWLClassAssertionAxiom(inactive, process)

    ontology.addAxiom(axiom)
//    relevantAxioms += axiom
  }

  def addRunsOn(processID: Int, serverID: Int, cpuID: Int) = {
     val process = factory.getOWLNamedIndividual(processIRI(processID))
     val cpu = factory.getOWLNamedIndividual(cpuIRI(serverID, cpuID))

    individuals += process
    individuals += cpu
          
    val axiom = factory.getOWLObjectPropertyAssertionAxiom(prRunsProcess, cpu, process)

    ontology.addAxiom(axiom)

    relevantAxioms += axiom
  }
                                                   
  def addProcess(processID: Int) = {
    val ind = factory.getOWLNamedIndividual(processIRI(processID))
    val axiom = factory.getOWLClassAssertionAxiom(clProcess, ind)

    individuals += ind

    // relevantAxioms += axiom

    // relevantForHighPriority += axiom

    // ontology.addAxiom(axiom)
    //otherAxioms += axiom
  }

  def makeTC(processID: Int) = {
    val ind = factory.getOWLNamedIndividual(processIRI(processID))
    val axiom = factory.getOWLClassAssertionAxiom(clTCProcess, ind)

    individuals += ind
          
    ontology.addAxiom(axiom)

    relevantAxioms += axiom
  }

  def assignClass(iri: IRI, cl: OWLClass, relevant: Boolean = true) = {
    val ind = factory.getOWLNamedIndividual(iri)
    val axiom = factory.getOWLClassAssertionAxiom(cl, ind)
          
    ontology.addAxiom(axiom)

    if(relevant)
      relevantAxioms += axiom
  }


  def makeHighPriority(processID: Int) = {
    val ind = factory.getOWLNamedIndividual(processIRI(processID))
    val axiom = factory.getOWLClassAssertionAxiom(clHPProcess, ind)

    //relevantForHighPriority += axiom

    //    ontology.addAxiom(axiom)
    otherAxioms += axiom
  }

                                                   
        
  def addServer(serverID: Int) = {
    val ind = factory.getOWLNamedIndividual(serverIRI(serverID))
    val axiom = factory.getOWLClassAssertionAxiom(clServer, ind)

    individuals += ind
          
    //    ontology.addAxiom(axiom)
    otherAxioms += axiom
  }

  def assignServerOS(serverID: Int, osInd: OWLIndividual) = {

    val serverInd = factory.getOWLNamedIndividual(serverIRI(serverID))



    val runsOSAxiom =
      factory.getOWLObjectPropertyAssertionAxiom(prRunsOS,
        serverInd, osInd)

    if(dynamicOS)
      relevantAxioms += runsOSAxiom

    //ontology.addAxiom(runsOSAxiom)
    otherAxioms += runsOSAxiom
  }

  def assignProcessOS(processID: Int, osInd: OWLNamedIndividual) = {

    val processInd = factory.getOWLNamedIndividual(processIRI(processID))


    val runsOSAxiom =
      factory.getOWLObjectPropertyAssertionAxiom(prRequiresOS,
        processInd, osInd)

    ontology.addAxiom(runsOSAxiom)
    otherAxioms += runsOSAxiom
  }


  var freshIndividualCounter = 0

  def freshIndividual() = {

    val iri = IRI.create(PREFIX+"x"+freshIndividualCounter)

    freshIndividualCounter+=1

    factory.getOWLNamedIndividual(iri)
  }




  def addCPU(serverID: Int, cpuID: Int) = {
    val cpuInd = factory.getOWLNamedIndividual(cpuIRI(serverID, cpuID))
    val axiom = factory.getOWLClassAssertionAxiom(clCPU, cpuInd)

    individuals += cpuInd
          
    //    ontology.addAxiom(axiom)
    otherAxioms += axiom

    val serverInd = factory.getOWLNamedIndividual(serverIRI(serverID))
    val axiom2 = factory.getOWLObjectPropertyAssertionAxiom(prHasCPU, serverInd, cpuInd)

    // //ontology.addAxiom(axiom2)
    otherAxioms += axiom2

    // val axiom3 = factory.getOWLClassAssertionAxiom(clOff, cpuInd)

    // ontology.addAxiom(axiom3)
    // relevantAxioms += axiom3
  }
        
  def processIRI(id: Int) = 
    IRI.create(PREFIX+"process"+id.toString)


  def serverIRI(id: Int) =
    IRI.create(PREFIX+"server"+id.toString)
        
        
  def cpuIRI(serverID: Int, cpuID: Int) = {
    val id = (cpusPerServer*(serverID-1))+cpuID
    IRI.create(PREFIX+"cpu"+id.toString)
  }        
}
