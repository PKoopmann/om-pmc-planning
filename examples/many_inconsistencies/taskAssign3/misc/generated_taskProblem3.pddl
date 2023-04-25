(define (problem taskAssigment_problem)
	(:domain taskAssigment)
	(:objects a b c )
	(:init
		(Developer c)
	)
    (:goal (and
        (not (inconsistent))
        (exists (?x ?y)
 		 (and 
 			 (and (KBquery_ElectronicEngineer ?x) (KBquery_ElectronicEngineer ?y))
 			 (not (= ?x ?y))
 		 ) 
 	 ) 
 	)
)
)
