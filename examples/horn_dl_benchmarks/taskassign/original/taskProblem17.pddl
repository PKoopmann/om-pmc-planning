(define (problem taskAssigment_problem)
	(:domain taskAssigment)
	(:objects a b c d e f g h i j k l m n o p q )
	(:init
		(Engineer b)
		(Designer d)
		(Engineer g)
		(Engineer h)
		(Engineer i)
		(Developer j)
		(Engineer k)
		(Developer n)
		(Engineer o)
		(Designer q)
	)
	(:goal (exists (?x ?y) 
 		 (and 
 			 (mko (and (ElectronicEngineer ?x) (ElectronicEngineer ?y))) 
 			 (not (mko (= ?x ?y))) 
 		 ) 
 	 ) 
 	)
)