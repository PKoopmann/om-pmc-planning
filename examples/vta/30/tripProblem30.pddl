(define (problem Wsmo2VTAT_problem)
	(:domain Wsmo2VTAT)
	(:objects iswc_2007 aa ab ac ad ae af ag ah ai aj ak al am an ao ap aq ar as at au av aw ax ay az ba bb bc bd be bf bg bh bi bj bk bl bm bn )
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
		(directlyAfterObj ay az)
		(directlyAfterObj az ba)
		(directlyAfterObj ba bb)
		(directlyAfterObj bb bc)
		(directlyAfterObj bc bd)
		(directlyAfterObj bd be)
		(directlyAfterObj be bf)
		(directlyAfterObj bf bg)
		(directlyAfterObj bg bh)
		(directlyAfterObj bh bi)
		(directlyAfterObj bi bj)
		(directlyAfterObj bj bk)
		(directlyAfterObj bk bl)
		(directlyAfterObj bl bm)
		(directlyAfterObj bm bn)

	)
	(:goal (exists ( ?receipt ?fullTrip)
 		 (and 
			 (KBquery_invoice ?receipt)
 			 (KBquery_itinerary ?fullTrip)
		 ) 
 		 )
 	)

)
