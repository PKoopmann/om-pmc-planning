(define (problem robotProblem)
	(:domain robot)
	(:objects robot)
	(:init
		(RightOf1 robot)
		(LeftOf37 robot)
		(AboveOf0 robot)
		(BelowOf37 robot)
	)
	(:goal (and (Column2 robot) (Row1 robot)))

)