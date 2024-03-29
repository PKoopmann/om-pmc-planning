(define (problem BTcat_problem)
	(:domain BTcat)
	(:objects aa ab ac ad ae af ag ah ai aj ak al am an ao ap aq ar as at au av aw ax ay az ba bb bc bd )
	(:init
		(cat ac)
		(cat ae)
		(cat ah)
		(cat ai)
		(cat aj)
		(bomb am)
		(cat ap)
		(cat ar)
		(bomb at)
		(cat au)
		(bomb az)
		(cat bc)
		(bomb bd)
		(contains aw at)
		(contains ak bd)
		(contains ba am)
		(contains ad az)
		(contains ao ac)
		(contains ax ap)
		(contains aa bc)
		(contains as ae)
		(contains av ah)
		(contains bb aj)
		(contains ag au)
		(contains ay ai)
		(contains al ar)

	)
	(:goal (not (exists (?x) 
 		 (and 
 			 (KBquery_Package ?x)
 			 (not (KBquery_Disarmed ?x)) 
 		 ) 
 	 )) 
 	)

)
