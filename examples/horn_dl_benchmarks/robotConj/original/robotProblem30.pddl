(define (problem robotProblem)
	(:domain robot)
	(:objects robot)
	(:init
		(RightOf1 robot)
		(LeftOf29 robot)
		(AboveOf0 robot)
		(BelowOf29 robot)
	)
	(:goal (and (mko (Column2 robot)) (mko (Row1 robot))))

)