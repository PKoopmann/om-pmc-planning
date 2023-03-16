(define (problem taskAssigment_problem)
	(:domain taskAssigment)
	(:objects a b c d e f g h i j k l m n o p q r s t )
	(:init
		(Engineer f)
		(Designer h)
		(Developer i)
		(Engineer k)
		(Developer l)
		(Engineer m)
		(Developer n)
		(Engineer o)
		(Designer q)
		(Developer r)
		(Developer s)
	)
	(:goal (exists (?x ?y) 
 		 (and 
 			 (mko (and (ElectronicEngineer ?x) (ElectronicEngineer ?y))) 
 			 (not (mko (= ?x ?y))) 
 		 ) 
 	 ) 
 	)
)