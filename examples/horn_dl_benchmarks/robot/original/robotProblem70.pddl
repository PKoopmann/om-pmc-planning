(define (problem robotProblem)
	(:domain robot)
	(:objects robot)
	(:init
		(RightOf1 robot)
		(LeftOf69 robot)
		(AboveOf0 robot)
		(BelowOf69 robot)
	)
	(:goal (and (Column2 robot) (Row1 robot)))

)