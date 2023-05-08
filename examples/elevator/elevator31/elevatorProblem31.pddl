(define (problem elevators_problem)
	(:domain elevators)
	(:objects pass_ah pass_ap pass_aa pass_am pass_ay pass_ag pass_bc pass_au pass_ai pass_ar pass_ae pass_ba ab ac ad af aj ak al an ao aq as at av aw ax az bb bd be )
	(:init
		(origin pass_ah ad)
		(destin pass_ah ax)
		(origin pass_ap ad)
		(destin pass_ap ac)
		(origin pass_aa al)
		(destin pass_aa ad)
		(origin pass_am aj)
		(destin pass_am ao)
		(origin pass_ay at)
		(destin pass_ay af)
		(origin pass_ag aq)
		(destin pass_ag az)
		(origin pass_bc al)
		(destin pass_bc bb)
		(origin pass_au bb)
		(destin pass_au at)
		(origin pass_ai av)
		(destin pass_ai aw)
		(origin pass_ar ab)
		(destin pass_ar az)
		(origin pass_ae al)
		(destin pass_ae av)
		(origin pass_ba aj)
		(destin pass_ba aw)
		(next ab ac)
		(next ac ad)
		(next ad af)
		(next af aj)
		(next aj ak)
		(next ak al)
		(next al an)
		(next an ao)
		(next ao aq)
		(next aq as)
		(next as at)
		(next at av)
		(next av aw)
		(next aw ax)
		(next ax az)
		(next az bb)
		(next bb bd)
		(next bd be)
		(lift_at be)


	)
	(:goal (not (exists (?x) 
 		 (and 
 			 (KBquery_passenger ?x)
 			 (not (KBquery_served ?x))
 		 )) 
 	 ))
)