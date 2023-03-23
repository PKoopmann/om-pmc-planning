(define (problem taskAssigment_problem)
	(:domain taskAssigment)
	(:objects a b c d e f g )
	(:init
		(Developer a)
		(Designer b)
		(Developer c)
		(Designer f)
	)
	(:goal (exists (?x ?y) 
 		 (and 
 			 (mko (and (ElectronicEngineer ?x) (ElectronicEngineer ?y))) 
 			 (not (mko (= ?x ?y))) 
 		 ) 
 	 ) 
 	)
)