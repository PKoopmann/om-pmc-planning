(define (problem taskAssigment_problem)
	(:domain taskAssigment)
	(:objects a b c d e f g h i j k l m n o p q r )
	(:init
		(Designer a)
		(Engineer c)
		(Developer d)
		(Designer f)
		(Designer g)
		(Engineer h)
		(Engineer j)
		(Developer m)
		(Developer n)
		(Engineer p)

	)
	(:goal (exists (?x ?y) 
 		 (and 
 			 (and (KBquery_ElectronicEngineer ?x) (KBquery_ElectronicEngineer ?y))
 			 (not (= ?x ?y))
 		 ) 
 	 ) 
 	)
)
