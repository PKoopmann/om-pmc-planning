(define (problem robotProblem)
	(:domain robot)
	(:objects robot)
	(:init
		(RightOf1 robot)
		(LeftOf99 robot)
		(AboveOf0 robot)
		(BelowOf99 robot)
	)
	(:goal (and (Column2 robot) (Row1 robot)))

)