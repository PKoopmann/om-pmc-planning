(define (problem BTcat_problem)
	(:domain BTcat)
	(:objects a b c d e f g h i j k l )
	(:init
		(cat a)
		(cat f)
		(bomb i)
		(cat l)
		(contains h i)
		(contains j f)
		(contains c l)
		(contains b a)

	)
	(:goal (not (exists (?x) 
 		 (and 
 			 (KBquery_Package ?x)
 			 (not (KBquery_Disarmed ?x)) 
 		 ) 
 	 )) 
 	)

)
