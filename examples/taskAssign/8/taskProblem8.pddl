(define (problem taskAssigment_problem)
	(:domain taskAssigment)
	(:objects a b c d e f g h )
	(:init
		(Engineer a)
		(Designer f)
		(Engineer g)
		(Engineer h)

	)
	(:goal (exists (?x ?y) 
 		 (and 
 			 (and (KBquery_ElectronicEngineer ?x) (KBquery_ElectronicEngineer ?y))
 			 (not (= ?x ?y))
 		 ) 
 	 ) 
 	)
)
