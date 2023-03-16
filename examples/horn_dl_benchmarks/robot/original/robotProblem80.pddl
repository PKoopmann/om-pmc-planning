(define (problem robotProblem)
	(:domain robot)
	(:objects robot)
	(:init
		(RightOf1 robot)
		(LeftOf79 robot)
		(AboveOf0 robot)
		(BelowOf79 robot)
	)
	(:goal (and (Column2 robot) (Row1 robot)))

)