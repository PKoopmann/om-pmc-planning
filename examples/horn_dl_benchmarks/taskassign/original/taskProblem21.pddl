(define (problem taskAssigment_problem)
	(:domain taskAssigment)
	(:objects a b c d e f g h i j k l m n o p q r s t u )
	(:init
		(Developer a)
		(Developer d)
		(Engineer f)
		(Designer g)
		(Developer h)
		(Designer i)
		(Engineer k)
		(Engineer n)
		(Developer o)
		(Engineer p)
		(Developer s)
		(Developer t)
	)
	(:goal (exists (?x ?y) 
 		 (and 
 			 (mko (and (ElectronicEngineer ?x) (ElectronicEngineer ?y))) 
 			 (not (mko (= ?x ?y))) 
 		 ) 
 	 ) 
 	)
)