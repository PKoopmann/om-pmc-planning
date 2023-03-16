(define (problem robotProblem)
	(:domain robot)
	(:objects robot)
	(:init
		(RightOf1 robot)
		(LeftOf49 robot)
		(AboveOf0 robot)
		(BelowOf49 robot)
	)
	(:goal (and (Column2 robot) (Row1 robot)))

)