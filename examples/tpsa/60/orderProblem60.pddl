(define (problem Wsmo2TPSA_problem)
	(:domain Wsmo2TPSA)
	(:objects voipRequest voip aa ab ac ad ae af ag ah ai aj ak al am an ao ap aq ar as at au av aw ax ay az ba bb bc bd be bf bg bh bi bj bk bl bm bn bo bp bq br bs bt bu bv bw bx by bz ca cb cc cd ce cf cg ch ci cj ck )
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
