(define (problem Wsmo2TPSA_problem)
	(:domain Wsmo2TPSA)
	(:objects voipRequest voip a b c d e f g h i j )
	(:init
		(requestedService voipRequest voip)
		(service voip)
		(order voipRequest)

 	)
	(:goal (exists (?x)
 		 (KBquery_invoice ?x)
		) 
 	)

)
