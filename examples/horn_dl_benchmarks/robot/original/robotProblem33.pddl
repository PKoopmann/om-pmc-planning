(define (problem robotProblem)
	(:domain robot)
	(:objects robot)
	(:init
		(RightOf1 robot)
		(LeftOf32 robot)
		(AboveOf0 robot)
		(BelowOf32 robot)
	)
	(:goal (and (Column2 robot) (Row1 robot)))

)