(define (problem robotProblem)
	(:domain robot)
	(:objects robot)
	(:init
		(RightOf1 robot)
		(LeftOf39 robot)
		(AboveOf0 robot)
		(BelowOf39 robot)
	)
	(:goal (and (Column2 robot) (Row1 robot)))

)