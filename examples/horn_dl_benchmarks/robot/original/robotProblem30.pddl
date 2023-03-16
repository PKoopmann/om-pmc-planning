(define (problem robotProblem)
	(:domain robot)
	(:objects robot)
	(:init
		(RightOf1 robot)
		(LeftOf29 robot)
		(AboveOf0 robot)
		(BelowOf29 robot)
	)
	(:goal (and (Column2 robot) (Row1 robot)))

)