(define (problem robotProblem)
	(:domain robot)
	(:objects robot)
	(:init
		(RightOf1 robot)
		(LeftOf26 robot)
		(AboveOf0 robot)
		(BelowOf26 robot)
	)
	(:goal (and (Column2 robot) (Row1 robot)))

)