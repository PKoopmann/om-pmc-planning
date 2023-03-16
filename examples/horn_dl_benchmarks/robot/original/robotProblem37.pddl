(define (problem robotProblem)
	(:domain robot)
	(:objects robot)
	(:init
		(RightOf1 robot)
		(LeftOf36 robot)
		(AboveOf0 robot)
		(BelowOf36 robot)
	)
	(:goal (and (Column2 robot) (Row1 robot)))

)