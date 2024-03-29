(define (problem BTcat_problem)
	(:domain BTcat)
	(:objects a b c d e f g h i j k l m n o p q r s t u v )
	(:init
		(cat e)
		(bomb f)
		(cat g)
		(cat h)
		(bomb k)
		(bomb m)
		(cat p)
		(cat u)
		(cat v)
		(contains q m)
		(contains c k)
		(contains r f)
		(contains d p)
		(contains t g)
		(contains l e)
		(contains i h)
		(contains b u)
		(contains a v)

	)
	(:goal (not (exists (?x) 
 		 (and 
 			 (KBquery_Package ?x)
 			 (not (KBquery_Disarmed ?x)) 
 		 ) 
 	 )) 
 	)

)
