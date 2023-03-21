(define (problem robotProblem)
	(:domain robot)
	(:objects robot)
	(:init
		(RightOf1 robot)
		(LeftOf28 robot)
		(AboveOf0 robot)
		(BelowOf28 robot)
	)
	(:goal (and (Column2 robot) (Row1 robot)))

)