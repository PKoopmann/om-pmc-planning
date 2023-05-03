(define (problem elevators_problem)
	(:domain elevators)
	(:objects  )
	(:init


	)
	(:goal (not (exists (?x) 
 		 (and 
 			 (KBquery_passenger ?x)
 			 (not (KBquery_served ?x))
 		 )) 
 	 ))
)
