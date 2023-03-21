(define (problem robotProblem)
	(:domain robot)
	(:objects robot)
	(:init
		(RightOf1 robot)
		(LeftOf31 robot)
		(AboveOf0 robot)
		(BelowOf31 robot)
	)
	(:goal (and (Column2 robot) (Row1 robot)))

)