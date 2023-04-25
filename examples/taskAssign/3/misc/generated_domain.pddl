(define (domain taskAssigment)
	(:requirements :strips :equality :disjunctive-preconditions :derived-predicates :negative-preconditions :conditional-effects :existential-preconditions)

(:predicates 
    (false)
    (true)
    (inconsistent)
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

    (:derived (true)
        (not (false))
    )

    (:derived (inconsistent) 
        (or (and (CodingAgent b) (ElectronicEngineer b)) (and (ElectronicEngineer b) (InformaticEngineer b)) (and (InformaticEngineer c) (ElectronicsAgent c)) (and (InformaticEngineer b) (ElectronicsAgent b)) (and (ElectronicEngineer a) (CodingAgent a)) (SpecificationsAgent c) (and (CodingAgent c) (ElectronicEngineer c)) (and (InformaticEngineer c) (ElectronicEngineer c)) (and (InformaticEngineer a) (ElectronicsAgent a)) (and (ElectronicEngineer a) (InformaticEngineer a)))
    )

    (:derived (KBquery_ElectronicEngineer ?x)
        (or

            (and (= ?x a) (ElectronicEngineer a))
            (and (= ?x b) (ElectronicEngineer b))
            (and (= ?x c) (ElectronicEngineer c))

        )
    )

    (:derived (KBquery_InformaticEngineer ?x)
        (or

            (and (= ?x a) (InformaticEngineer a))
            (and (= ?x b) (InformaticEngineer b))
            (and (= ?x c) (InformaticEngineer c))

        )
    )

    (:derived (KBquery_Employee ?x)
        (or

            (and (= ?x a) (or (ElectronicsAgent a) (SpecificationsAgent a) (TestingAgent a) (DesignAgent a) (InformaticEngineer a) (SoftwareAgent a) (CodingAgent a) (ElectronicEngineer a) (MaterialsAgent a)))
            (and (= ?x b) (or (MaterialsAgent b) (InformaticEngineer b) (TestingAgent b) (CodingAgent b) (ElectronicsAgent b) (ElectronicEngineer b) (SpecificationsAgent b) (DesignAgent b) (SoftwareAgent b)))
            (= ?x c)

        )
    )

(:action hireElectronicEng
  :parameters (?n)
        :precondition (and
            (not (inconsistent))
            (and)
        )
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
        :precondition (and
            (not (inconsistent))
            (and)
        )
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
        :precondition (and
            (not (inconsistent))
            (KBquery_Employee ?x)
        )
  :effect (and
    (TaskAgent ?x)
  )

)
 
(:action assignElectronicsAgent
  :parameters (?x) 
        :precondition (and
            (not (inconsistent))
            (KBquery_Employee ?x)
        )
  :effect (and
	(ElectronicsAgent ?x)
  )

)
 
(:action assignSoftwareAgent
  :parameters (?x)
        :precondition (and
            (not (inconsistent))
            (KBquery_Employee ?x)
        )
  :effect (and 
	(SoftwareAgent ?x)
  )

)
 
(:action assignDesignAgent
  :parameters (?x)
        :precondition (and
            (not (inconsistent))
            (KBquery_Employee ?x)
        )
  :effect (and
    (DesignAgent ?x)
  )

)
 
(:action assignTestingAgent
  :parameters (?x)
        :precondition (and
            (not (inconsistent))
            (KBquery_Employee ?x)
        )
  :effect (and
    (TestingAgent ?x)
  )

)
 
(:action assignMaterialsAgent
  :parameters (?x)
        :precondition (and
            (not (inconsistent))
            (KBquery_Employee ?x)
        )
  :effect (and
    (MaterialsAgent ?x)
  )

)
 
(:action assignCodingAgent
  :parameters (?x)
        :precondition (and
            (not (inconsistent))
            (KBquery_Employee ?x)
        )
  :effect (and
    (CodingAgent ?x)
  )

)
 
(:action assignSpecificationsAgent
  :parameters (?x)
        :precondition (and
            (not (inconsistent))
            (KBquery_Employee ?x)
        )
  :effect (and
    (SpecificationsAgent ?x)
  )

)
 

)

