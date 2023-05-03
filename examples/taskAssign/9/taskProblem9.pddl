(define (problem taskAssigment_problem)
	(:domain taskAssigment)
	(:objects a b c d e f g h i )
	(:init
		(Developer a)
		(Designer d)
		(Developer e)
		(Designer f)
		(Engineer g)

	)
	(:goal (exists (?x ?y) 
 		 (and 
 			 (and (KBquery_ElectronicEngineer ?x) (KBquery_ElectronicEngineer ?y))
 			 (not (= ?x ?y))
 		 ) 
 	 ) 
 	)
)
