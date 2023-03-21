(define (domain taskAssigment)

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
)

(:action hireElectronicEng
  :parameters (?n)
  :precondition (and)
  :effect (when
    (not
		(exists (?x1 ?x2 ?x3) 
			(and
				(mko (ElectronicEngineer ?x1))
				(mko (ElectronicEngineer ?x2))
				(mko (ElectronicEngineer ?x3))
				(not (mko (= ?x1 ?x2)))
				(not (mko (= ?x1 ?x3)))
				(not (mko (= ?x2 ?x3)))
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
				(mko (InformaticEngineer ?x1))
				(mko (InformaticEngineer ?x2))
				(mko (InformaticEngineer ?x3))
				(not (mko (= ?x1 ?x2)))
				(not (mko (= ?x1 ?x3)))
				(not (mko (= ?x2 ?x3)))
			)
		)
	)
    (InformaticEngineer ?n)
  )

)


 
(:action assignTaskAgent
  :parameters (?x)
  :precondition (mko (Employee ?x))
  :effect (and
    (TaskAgent ?x)
  )

)
 
(:action assignElectronicsAgent
  :parameters (?x) 
  :precondition (mko (Employee ?x))
  :effect (and
	(ElectronicsAgent ?x)
  )

)
 
(:action assignSoftwareAgent
  :parameters (?x)
  :precondition (mko (Employee ?x))
  :effect (and 
	(SoftwareAgent ?x)
  )

)
 
(:action assignDesignAgent
  :parameters (?x)
  :precondition (mko (Employee ?x))
  :effect (and
    (DesignAgent ?x)
  )

)
 
(:action assignTestingAgent
  :parameters (?x)
  :precondition (mko (Employee ?x))
  :effect (and
    (TestingAgent ?x)
  )

)
 
(:action assignMaterialsAgent
  :parameters (?x)
  :precondition (mko (Employee ?x))
  :effect (and
    (MaterialsAgent ?x)
  )

)
 
(:action assignCodingAgent
  :parameters (?x)
  :precondition (mko (Employee ?x))
  :effect (and
    (CodingAgent ?x)
  )

)
 
(:action assignSpecificationsAgent
  :parameters (?x)
  :precondition (mko (Employee ?x))
  :effect (and
    (SpecificationsAgent ?x)
  )

)
 
(:action removePersonalInfo
  :parameters (?x ?y)
  :precondition (mko (hasPersonalInfo ?x ?y))
  :effect (and
    (hasPersonalInfo ?x ?y)
  )

)

)

