(define (problem taskAssigment_problem)
	(:domain taskAssigment)
	(:objects a b c d e f )
	(:init
		(Engineer a)
		(Developer b)
		(Developer e)

	)
	(:goal (exists (?x ?y) 
 		 (and 
 			 (and (KBquery_ElectronicEngineer ?x) (KBquery_ElectronicEngineer ?y))
 			 (not (= ?x ?y))
 		 ) 
 	 ) 
 	)
)
