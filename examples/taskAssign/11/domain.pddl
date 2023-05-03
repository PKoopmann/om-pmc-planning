(define (domain taskAssigment)
	(:requirements :strips :equality :disjunctive-preconditions :derived-predicates :negative-preconditions :conditional-effects :existential-preconditions)

(:predicates 
	(Employee ?x)
	(Engineer ?x)
	(Designer ?x)
	(Developer ?x)
	(ElectronicEngineer ?x)
	(InformaticEngineer ?x)
	(MaterialsEngineer ?x)
	(TaskAgent ?x)
	(ElectronicsAgent ?x)
	(SoftwareAgent ?x)
	(DesignAgent ?x)
	(MaterialsAgent ?x)
	(TestingAgent ?x)
	(CodingAgent ?x)
	(SpecificationsAgent ?x)
	(FullName ?x)
	(hasPersonalInfo ?x ?y)
  (KBquery_ElectronicEngineer ?x)
  (KBquery_InformaticEngineer ?x)
  (KBquery_Employee ?x)
)

(:action hireElectronicEng
  :parameters (?n)
  :precondition (and)
  :effect (when
    (not
		(exists (?x1 ?x2 ?x3) 
			(and
				(KBquery_ElectronicEngineer ?x1)
				(KBquery_ElectronicEngineer ?x2)
				(KBquery_ElectronicEngineer ?x3)
				(not (= ?x1 ?x2))
				(not (= ?x1 ?x3))
				(not (= ?x2 ?x3))
			)
		)
	)
    (ElectronicEngineer ?n)
  )

)
  
(:action hireInformaticEng
  :parameters (?n)
  :precondition (and)
  :effect (when
    (not
		(exists (?x1 ?x2 ?x3) 
			(and
				(KBquery_InformaticEngineer ?x1)
				(KBquery_InformaticEngineer ?x2)
				(KBquery_InformaticEngineer ?x3)
				(not (= ?x1 ?x2))
				(not (= ?x1 ?x3))
				(not (= ?x2 ?x3))
			)
		)
	)
    (InformaticEngineer ?n)
  )

)


 
(:action assignTaskAgent
  :parameters (?x)
  :precondition (KBquery_Employee ?x)
  :effect (and
    (TaskAgent ?x)
  )

)
 
(:action assignElectronicsAgent
  :parameters (?x) 
  :precondition (KBquery_Employee ?x)
  :effect (and
	(ElectronicsAgent ?x)
  )

)
 
(:action assignSoftwareAgent
  :parameters (?x)
  :precondition (KBquery_Employee ?x)
  :effect (and 
	(SoftwareAgent ?x)
  )

)
 
(:action assignDesignAgent
  :parameters (?x)
  :precondition (KBquery_Employee ?x)
  :effect (and
    (DesignAgent ?x)
  )

)
 
(:action assignTestingAgent
  :parameters (?x)
  :precondition (KBquery_Employee ?x)
  :effect (and
    (TestingAgent ?x)
  )

)
 
(:action assignMaterialsAgent
  :parameters (?x)
  :precondition (KBquery_Employee ?x)
  :effect (and
    (MaterialsAgent ?x)
  )

)
 
(:action assignCodingAgent
  :parameters (?x)
  :precondition (KBquery_Employee ?x)
  :effect (and
    (CodingAgent ?x)
  )

)
 
(:action assignSpecificationsAgent
  :parameters (?x)
  :precondition (KBquery_Employee ?x)
  :effect (and
    (SpecificationsAgent ?x)
  )

)
 

)

