(define (problem Wsmo2VTAT_problem)
	(:domain Wsmo2VTAT)
	(:objects )
	(:init

	)
	(:goal (exists ( ?receipt ?fullTrip)
 		 (and 
			 (KBquery_invoice iswc_2007 ?receipt)
 			 (KBquery_itinerary iswc_2007 ?fullTrip)
			 ) 
 		 )
 	)

)
