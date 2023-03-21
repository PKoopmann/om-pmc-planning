(define (problem robotProblem)
	(:domain robot)
	(:objects robot)
	(:init
		(RightOf1 robot)
		(LeftOf41 robot)
		(AboveOf0 robot)
		(BelowOf41 robot)
	)
	(:goal (and (Column2 robot) (Row1 robot)))

)