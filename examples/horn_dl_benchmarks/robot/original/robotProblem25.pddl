(define (problem robotProblem)
	(:domain robot)
	(:objects robot)
	(:init
		(RightOf1 robot)
		(LeftOf24 robot)
		(AboveOf0 robot)
		(BelowOf24 robot)
	)
	(:goal (and (Column2 robot) (Row1 robot)))

)