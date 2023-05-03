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
 			 (and (KBquery_ElectronicEngineer ?x) (KBquery_ElectronicEngineer ?y))
 			 (not (= ?x ?y))
 		 ) 
 	 ) 
 	)
)
