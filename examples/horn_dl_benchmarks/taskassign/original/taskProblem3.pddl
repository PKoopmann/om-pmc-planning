(define (problem taskAssigment_problem)
	(:domain taskAssigment)
	(:objects a b c )
	(:init
		(Developer c)
	)
	(:goal (exists (?x ?y) 
 		 (and 
 			 (mko (and (ElectronicEngineer ?x) (ElectronicEngineer ?y))) 
 			 (not (mko (= ?x ?y))) 
 		 ) 
 	 ) 
 	)
)