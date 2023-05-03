(define (problem taskAssigment_problem)
	(:domain taskAssigment)
	(:objects a b c d e )
	(:init
		(Developer c)
		(Designer d)

	)
	(:goal (exists (?x ?y) 
 		 (and 
 			 (and (KBquery_ElectronicEngineer ?x) (KBquery_ElectronicEngineer ?y))
 			 (not (= ?x ?y))
 		 ) 
 	 ) 
 	)
)
