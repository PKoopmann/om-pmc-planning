(define (problem taskAssigment_problem)
	(:domain taskAssigment)
	(:objects a b c d e f g h i j k l m n o p q r s )
	(:init
		(Developer c)
		(Engineer d)
		(Developer f)
		(Designer g)
		(Developer h)
		(Developer k)
		(Designer m)
		(Developer n)
		(Developer o)
		(Developer q)
		(Engineer s)
	)
	(:goal (exists (?x ?y) 
 		 (and 
 			 (mko (and (ElectronicEngineer ?x) (ElectronicEngineer ?y))) 
 			 (not (mko (= ?x ?y))) 
 		 ) 
 	 ) 
 	)
)