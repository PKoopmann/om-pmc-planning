(define (problem BTcat_problem)
	(:domain BTcat)
	(:objects a b c d e f g h i j k l )
	(:init

	)
	(:goal (not (exists (?x) 
 		 (and 
 			 (KBquery_Package ?x)
 			 (not (KBquery_Disarmed ?x)) 
 		 ) 
 	 )) 
 	)

)
