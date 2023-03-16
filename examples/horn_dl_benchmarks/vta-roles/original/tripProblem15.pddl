(define (problem Wsmo2VTAT_problem)
	(:domain Wsmo2VTAT)
	(:objects iswc_2007 aa ab ac ad ae af ag ah ai aj ak al am an ao ap aq ar as at au av aw ax ay )
	(:init
		(trip iswc_2007)
		(notFree iswc_2007)
		(directlyAfterObj iswc_2007 aa)
		(directlyAfterObj aa ab)
		(directlyAfterObj ab ac)
		(directlyAfterObj ac ad)
		(directlyAfterObj ad ae)
		(directlyAfterObj ae af)
		(directlyAfterObj af ag)
		(directlyAfterObj ag ah)
		(directlyAfterObj ah ai)
		(directlyAfterObj ai aj)
		(directlyAfterObj aj ak)
		(directlyAfterObj ak al)
		(directlyAfterObj al am)
		(directlyAfterObj am an)
		(directlyAfterObj an ao)
		(directlyAfterObj ao ap)
		(directlyAfterObj ap aq)
		(directlyAfterObj aq ar)
		(directlyAfterObj ar as)
		(directlyAfterObj as at)
		(directlyAfterObj at au)
		(directlyAfterObj au av)
		(directlyAfterObj av aw)
		(directlyAfterObj aw ax)
		(directlyAfterObj ax ay)
	)
	(:goal (exists ( ?receipt ?fullTrip)
 		 (mko (and 
			 (invoice iswc_2007 ?receipt)
 			 (itinerary iswc_2007 ?fullTrip)
			 ) 
 		 ))
 	)

)