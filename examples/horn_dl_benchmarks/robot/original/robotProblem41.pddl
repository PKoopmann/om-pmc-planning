(define (problem robotProblem)
	(:domain robot)
	(:objects robot)
	(:init
		(RightOf1 robot)
		(LeftOf40 robot)
		(AboveOf0 robot)
		(BelowOf40 robot)
	)
	(:goal (and (Column2 robot) (Row1 robot)))

)