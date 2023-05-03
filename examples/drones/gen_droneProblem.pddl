(define (problem drone_problem)
	(:domain drone)
	(:objects )
	(:init
		
	)
	(:goal (and
		(not (exists (?x ?y) (KBquery_AvoidCondition ?x ?y))))
	)

)
