(define (problem robotProblem)
	(:domain robot)
	(:objects robot)
	(:init
		(RightOf1 robot)
		(LeftOf14 robot)
		(AboveOf0 robot)
		(BelowOf14 robot)
	)
	(:goal (and (mko (Column2 robot)) (mko (Row1 robot))))

)