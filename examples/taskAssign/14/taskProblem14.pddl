(define (problem taskAssigment_problem)
	(:domain taskAssigment)
	(:objects a b c d e f g h i j k l m n )
	(:init
		(Engineer b)
		(Designer c)
		(Engineer g)
		(Designer h)
		(Developer i)
		(Developer j)
		(Engineer m)
		(Designer n)

	)
	(:goal (exists (?x ?y) 
 		 (and 
 			 (and (KBquery_ElectronicEngineer ?x) (KBquery_ElectronicEngineer ?y))
 			 (not (= ?x ?y))
 		 ) 
 	 ) 
 	)
)
