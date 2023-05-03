(define (problem Wsmo2VTAT_problem)
	(:domain Wsmo2VTAT)
	(:objects  )
	(:init

	)
	(:goal (exists ( ?receipt ?fullTrip)
 		 (and 
			 (KBquery_invoice ?receipt)
 			 (KBquery_itinerary ?fullTrip)
		 ) 
 		 )
 	)

)
