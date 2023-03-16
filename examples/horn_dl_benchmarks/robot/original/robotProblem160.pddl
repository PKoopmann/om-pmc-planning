(define (problem robotProblem)
	(:domain robot)
	(:objects robot)
	(:init
		(RightOf1 robot)
		(LeftOf159 robot)
		(AboveOf0 robot)
		(BelowOf159 robot)
	)
	(:goal (and (Column2 robot) (Row1 robot)))

)