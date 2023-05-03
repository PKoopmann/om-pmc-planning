(define (problem taskAssigment_problem)
	(:domain taskAssigment)
	(:objects a b c d e f g h i j )
	(:init
		(Engineer a)
		(Developer f)
		(Engineer h)
		(Developer i)
		(Designer j)

	)
	(:goal (exists (?x ?y) 
 		 (and 
 			 (and (KBquery_ElectronicEngineer ?x) (KBquery_ElectronicEngineer ?y))
 			 (not (= ?x ?y))
 		 ) 
 	 ) 
 	)
)
