(define (problem elevators_problem)
	(:domain elevators)
	(:objects pass_i pass_f pass_p pass_j pass_l pass_m pass_o a b c d e g h k n q r )
	(:init
		(origin pass_i c)
		(destin pass_i c)
		(origin pass_f n)
		(destin pass_f k)
		(origin pass_p g)
		(destin pass_p r)
		(origin pass_j b)
		(destin pass_j h)
		(origin pass_l q)
		(destin pass_l a)
		(origin pass_m n)
		(destin pass_m e)
		(origin pass_o c)
		(destin pass_o r)
		(next a b)
		(next b c)
		(next c d)
		(next d e)
		(next e g)
		(next g h)
		(next h k)
		(next k n)
		(next n q)
		(next q r)
		(lift_at c)


	)
	(:goal (not (exists (?x) 
 		 (and 
 			 (KBquery_passenger ?x)
 			 (not (KBquery_served ?x))
 		 )) 
 	 ))
)