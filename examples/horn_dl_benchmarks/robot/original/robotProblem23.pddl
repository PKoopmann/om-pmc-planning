(define (problem robotProblem)
	(:domain robot)
	(:objects robot)
	(:init
		(RightOf1 robot)
		(LeftOf22 robot)
		(AboveOf0 robot)
		(BelowOf22 robot)
	)
	(:goal (and (Column2 robot) (Row1 robot)))

)