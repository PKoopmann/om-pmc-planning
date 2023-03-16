(define (problem robotProblem)
	(:domain robot)
	(:objects robot)
	(:init
		(RightOf1 robot)
		(LeftOf35 robot)
		(AboveOf0 robot)
		(BelowOf35 robot)
	)
	(:goal (and (Column2 robot) (Row1 robot)))

)