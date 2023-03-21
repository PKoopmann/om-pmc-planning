(define (problem robotProblem)
	(:domain robot)
	(:objects robot)
	(:init
		(RightOf1 robot)
		(LeftOf19 robot)
		(AboveOf0 robot)
		(BelowOf19 robot)
	)
	(:goal (mko (and (Column2 robot) (Row1 robot))))

)