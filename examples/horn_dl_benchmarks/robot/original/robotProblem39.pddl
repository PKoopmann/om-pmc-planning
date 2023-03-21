(define (problem robotProblem)
	(:domain robot)
	(:objects robot)
	(:init
		(RightOf1 robot)
		(LeftOf38 robot)
		(AboveOf0 robot)
		(BelowOf38 robot)
	)
	(:goal (and (Column2 robot) (Row1 robot)))

)