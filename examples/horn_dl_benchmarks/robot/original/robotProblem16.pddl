(define (problem robotProblem)
	(:domain robot)
	(:objects robot)
	(:init
		(RightOf1 robot)
		(LeftOf15 robot)
		(AboveOf0 robot)
		(BelowOf15 robot)
	)
	(:goal (mko (and (Column2 robot) (Row1 robot))))

)