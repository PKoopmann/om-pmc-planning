(define (problem robotProblem)
	(:domain robot)
	(:objects robot)
	(:init
		(RightOf1 robot)
		(LeftOf23 robot)
		(AboveOf0 robot)
		(BelowOf23 robot)
	)
	(:goal (and (Column2 robot) (Row1 robot)))

)