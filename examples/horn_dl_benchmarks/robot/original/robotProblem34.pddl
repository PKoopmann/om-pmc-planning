(define (problem robotProblem)
	(:domain robot)
	(:objects robot)
	(:init
		(RightOf1 robot)
		(LeftOf33 robot)
		(AboveOf0 robot)
		(BelowOf33 robot)
	)
	(:goal (and (Column2 robot) (Row1 robot)))

)