(define (problem robotProblem)
	(:domain robot)
	(:objects robot)
	(:init
		(RightOf1 robot)
		(LeftOf25 robot)
		(AboveOf0 robot)
		(BelowOf25 robot)
	)
	(:goal (and (Column2 robot) (Row1 robot)))

)