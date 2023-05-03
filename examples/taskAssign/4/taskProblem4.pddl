(define (problem taskAssigment_problem)
	(:domain taskAssigment)
	(:objects a b c d )
	(:init
		(Designer a)
		(Engineer d)

	)
	(:goal (exists (?x ?y) 
 		 (and 
 			 (and (KBquery_ElectronicEngineer ?x) (KBquery_ElectronicEngineer ?y))
 			 (not (= ?x ?y))
 		 ) 
 	 ) 
 	)
)
