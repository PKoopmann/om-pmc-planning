(define (problem elevators_problem)
	(:domain elevators)
	(:objects pass_af pass_az pass_au pass_ac pass_ai pass_ab pass_an pass_ah pass_ak pass_ay aa ad ae ag aj al am ao ap aq ar as at av aw ax ba )
	(:init
		(origin pass_af at)
		(destin pass_af aq)
		(origin pass_az ao)
		(destin pass_az at)
		(origin pass_au ap)
		(destin pass_au ar)
		(origin pass_ac ax)
		(destin pass_ac ap)
		(origin pass_ai ag)
		(destin pass_ai aa)
		(origin pass_ab ap)
		(destin pass_ab ad)
		(origin pass_an av)
		(destin pass_an ao)
		(origin pass_ah ap)
		(destin pass_ah av)
		(origin pass_ak aq)
		(destin pass_ak as)
		(origin pass_ay ar)
		(destin pass_ay ba)
		(next aa ad)
		(next ad ae)
		(next ae ag)
		(next ag aj)
		(next aj al)
		(next al am)
		(next am ao)
		(next ao ap)
		(next ap aq)
		(next aq ar)
		(next ar as)
		(next as at)
		(next at av)
		(next av aw)
		(next aw ax)
		(next ax ba)
		(lift_at ag)


	)
	(:goal (not (exists (?x) 
 		 (and 
 			 (KBquery_passenger ?x)
 			 (not (KBquery_served ?x))
 		 )) 
 	 ))
)
