(define (problem Wsmo2TPSA_problem)
	(:domain Wsmo2TPSA)
	(:objects voipRequest voip aa ab ac ad ae af ag ah ai aj ak al am an ao ap aq ar as at au av aw )
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
