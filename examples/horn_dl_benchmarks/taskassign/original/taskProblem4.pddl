(define (problem taskAssigment_problem)
	(:domain taskAssigment)
	(:objects a b c d )
	(:init
		(Designer a)
		(Engineer d)
	)
	(:goal (exists (?x ?y) 
 		 (and 
 			 (mko (and (ElectronicEngineer ?x) (ElectronicEngineer ?y))) 
 			 (not (mko (= ?x ?y))) 
 		 ) 
 	 ) 
 	)
)