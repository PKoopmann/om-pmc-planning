(define (problem taskAssigment_problem)
	(:domain taskAssigment)
	(:objects a b c d e f g h i j k l m n o )
	(:init
		(Designer b)
		(Engineer d)
		(Engineer e)
		(Designer f)
		(Engineer g)
		(Designer j)
		(Engineer k)
		(Engineer o)

	)
	(:goal (exists (?x ?y) 
 		 (and 
 			 (and (KBquery_ElectronicEngineer ?x) (KBquery_ElectronicEngineer ?y))
 			 (not (= ?x ?y))
 		 ) 
 	 ) 
 	)
)
