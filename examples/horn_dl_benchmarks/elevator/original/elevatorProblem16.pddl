(define (problem elevators_problem)
	(:domain elevators)
	(:objects pass_m pass_a pass_n pass_l pass_e pass_b c d f g h i j k o p )
	(:init
		(origin pass_m k)
		(destin pass_m j)
		(origin pass_a k)
		(destin pass_a o)
		(origin pass_n c)
		(destin pass_n o)
		(origin pass_l i)
		(destin pass_l d)
		(origin pass_e k)
		(destin pass_e f)
		(origin pass_b k)
		(destin pass_b k)
		(next c d)
		(next d f)
		(next f g)
		(next g h)
		(next h i)
		(next i j)
		(next j k)
		(next k o)
		(next o p)
		(lift_at i)
	)
	(:goal (not (exists (?x) 
 		 (and 
 			 (mko (passenger ?x)) 
 			 (not (mko (served ?x))) 
 		 )) 
 	 ))
)