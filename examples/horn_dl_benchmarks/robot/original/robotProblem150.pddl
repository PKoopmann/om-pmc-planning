(define (problem robotProblem)
	(:domain robot)
	(:objects robot)
	(:init
		(RightOf1 robot)
		(LeftOf149 robot)
		(AboveOf0 robot)
		(BelowOf149 robot)
	)
	(:goal (and (Column2 robot) (Row1 robot)))

)