(define (domain taskAssigment)
(:constants
  a b c d e f g h i j k l m n o p q - object)
(:predicates
  (employee ?x - object)
  (engineer ?x - object)
  (designer ?x - object)
  (developer ?x - object)
  (electronicengineer ?x - object)
  (informaticengineer ?x - object)
  (materialsengineer ?x - object)
  (taskagent ?x - object)
  (electronicsagent ?x - object)
  (softwareagent ?x - object)
  (designagent ?x - object)
  (materialsagent ?x - object)
  (testingagent ?x - object)
  (codingagent ?x - object)
  (specificationsagent ?x - object)
  (fullname ?x - object)
  (haspersonalinfo ?x ?y - object)
  (DATALOG_EMPLOYEE ?x0 - object)
  (DATALOG_INCONSISTENT)
  (DATALOG_TASKAGENT ?x0 - object)
  (DATALOG_SOFTWAREAGENT ?x0 - object)
  (DATALOG_FULLNAME ?x0 - object)
  (DATALOG_QUERY0 ?x0 ?x1 - object)
  (DATALOG_ENGINEER ?x0 - object)
  (DATALOG_DESIGNAGENT ?x0 - object)
  (AUX0 ?y0 - object)
  (AUX1 ?y0 - object)
  (AUX2 ?y0 - object)
  (AUX3 ?y0 - object)
  (AUX4 ?y0 - object)
  (AUX5 ?y0 - object)
  (AUX6 ?y0 - object)
  (AUX7 ?y0 - object)
  (AUX8 ?y0 - object)
  (AUX9 ?x1 - object ?x3 - object ?x2 - object)
  (AUX10 ?x1 - object ?x3 - object ?x2 - object)
  (AUX11)
  (AUX12 ?x - object ?y - object))
(:derived (DATALOG_QUERY0 ?x0 ?x1 - object)
          (and (electronicengineer ?x0) (electronicengineer ?x1)))
(:derived (DATALOG_EMPLOYEE ?x0 - object)
          (or (exists (?y0 - object) (haspersonalinfo ?x0 ?y0)) (DATALOG_ENGINEER ?x0) (DATALOG_TASKAGENT ?x0) (designer ?x0) (developer ?x0) (employee ?x0)))
(:derived (DATALOG_INCONSISTENT)
          (or (exists (?y0 - object) (AUX0 ?y0)) (exists (?y0 - object) (AUX1 ?y0)) (exists (?y0 - object) (AUX2 ?y0)) (exists (?y0 - object) (AUX3 ?y0)) (exists (?y0 - object) (AUX4 ?y0)) (exists (?y0 - object) (AUX5 ?y0)) (exists (?y0 - object) (AUX6 ?y0)) (exists (?y0 - object) (AUX7 ?y0)) (exists (?y0 - object) (AUX8 ?y0))))
(:derived (DATALOG_TASKAGENT ?x0 - object)
          (or (DATALOG_DESIGNAGENT ?x0) (DATALOG_SOFTWAREAGENT ?x0) (electronicsagent ?x0) (taskagent ?x0) (testingagent ?x0)))
(:derived (DATALOG_SOFTWAREAGENT ?x0 - object)
          (or (codingagent ?x0) (softwareagent ?x0) (specificationsagent ?x0)))
(:derived (DATALOG_FULLNAME ?x0 - object)
          (or (exists (?y0 - object) (haspersonalinfo ?y0 ?x0)) (fullname ?x0)))
(:derived (DATALOG_ENGINEER ?x0 - object)
          (or (electronicengineer ?x0) (engineer ?x0) (informaticengineer ?x0) (materialsengineer ?x0)))
(:derived (DATALOG_DESIGNAGENT ?x0 - object)
          (or (designagent ?x0) (materialsagent ?x0)))
(:derived (AUX0 ?y0 - object)
          (and (DATALOG_SOFTWAREAGENT ?y0) (designer ?y0)))
(:derived (AUX1 ?y0 - object)
          (and (electronicengineer ?y0) (informaticengineer ?y0)))
(:derived (AUX2 ?y0 - object)
          (and (DATALOG_EMPLOYEE ?y0) (DATALOG_FULLNAME ?y0)))
(:derived (AUX3 ?y0 - object)
          (and (electronicsagent ?y0) (informaticengineer ?y0)))
(:derived (AUX4 ?y0 - object)
          (and (DATALOG_SOFTWAREAGENT ?y0) (materialsengineer ?y0)))
(:derived (AUX5 ?y0 - object)
          (and (developer ?y0) (specificationsagent ?y0)))
(:derived (AUX6 ?y0 - object)
          (and (codingagent ?y0) (electronicengineer ?y0)))
(:derived (AUX7 ?y0 - object)
          (and (designer ?y0) (electronicsagent ?y0)))
(:derived (AUX8 ?y0 - object)
          (and (electronicsagent ?y0) (materialsengineer ?y0)))
(:derived (AUX9 ?x1 - object ?x3 - object ?x2 - object)
          (or (= ?x1 ?x2) (= ?x1 ?x3) (= ?x2 ?x3) (not (electronicengineer ?x1)) (not (electronicengineer ?x2)) (not (electronicengineer ?x3))))
(:derived (AUX10 ?x1 - object ?x3 - object ?x2 - object)
          (or (= ?x1 ?x2) (= ?x1 ?x3) (= ?x2 ?x3) (not (informaticengineer ?x1)) (not (informaticengineer ?x2)) (not (informaticengineer ?x3))))
(:derived (AUX11)
          (exists (?x ?y - object) (AUX12 ?x ?y)))
(:derived (AUX12 ?x - object ?y - object)
          (and (DATALOG_QUERY0 ?x ?y) (not (= ?x ?y))))
(:action hireElectronicEng
  :parameters (?n - object)
  :precondition (not (DATALOG_INCONSISTENT))
  :effect (when (forall (?x1 ?x2 ?x3 - object) (AUX9 ?x1 ?x3 ?x2)) (electronicengineer ?n)))
(:action hireInformaticEng
  :parameters (?n - object)
  :precondition (not (DATALOG_INCONSISTENT))
  :effect (when (forall (?x1 ?x2 ?x3 - object) (AUX10 ?x1 ?x3 ?x2)) (informaticengineer ?n)))
(:action assignTaskAgent
  :parameters (?x - object)
  :precondition (and (DATALOG_EMPLOYEE ?x) (not (DATALOG_INCONSISTENT)))
  :effect (and (taskagent ?x)))
(:action assignElectronicsAgent
  :parameters (?x - object)
  :precondition (and (DATALOG_EMPLOYEE ?x) (not (DATALOG_INCONSISTENT)))
  :effect (and (electronicsagent ?x)))
(:action assignSoftwareAgent
  :parameters (?x - object)
  :precondition (and (DATALOG_EMPLOYEE ?x) (not (DATALOG_INCONSISTENT)))
  :effect (and (softwareagent ?x)))
(:action assignDesignAgent
  :parameters (?x - object)
  :precondition (and (DATALOG_EMPLOYEE ?x) (not (DATALOG_INCONSISTENT)))
  :effect (and (designagent ?x)))
(:action assignTestingAgent
  :parameters (?x - object)
  :precondition (and (DATALOG_EMPLOYEE ?x) (not (DATALOG_INCONSISTENT)))
  :effect (and (testingagent ?x)))
(:action assignMaterialsAgent
  :parameters (?x - object)
  :precondition (and (DATALOG_EMPLOYEE ?x) (not (DATALOG_INCONSISTENT)))
  :effect (and (materialsagent ?x)))
(:action assignCodingAgent
  :parameters (?x - object)
  :precondition (and (DATALOG_EMPLOYEE ?x) (not (DATALOG_INCONSISTENT)))
  :effect (and (codingagent ?x)))
(:action assignSpecificationsAgent
  :parameters (?x - object)
  :precondition (and (DATALOG_EMPLOYEE ?x) (not (DATALOG_INCONSISTENT)))
  :effect (and (specificationsagent ?x)))
(:action removePersonalInfo
  :parameters (?x ?y - object)
  :precondition (and (haspersonalinfo ?x ?y) (not (DATALOG_INCONSISTENT)))
  :effect (and (haspersonalinfo ?x ?y)))
)