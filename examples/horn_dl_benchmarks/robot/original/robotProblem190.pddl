(define (problem robotProblem)
	(:domain robot)
	(:objects robot)
	(:init
		(RightOf1 robot)
		(LeftOf189 robot)
		(AboveOf0 robot)
		(BelowOf189 robot)
	)
	(:goal (and (Column2 robot) (Row1 robot)))

)