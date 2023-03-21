(define (problem robotProblem)
	(:domain robot)
	(:objects robot)
	(:init
		(RightOf1 robot)
		(LeftOf27 robot)
		(AboveOf0 robot)
		(BelowOf27 robot)
	)
	(:goal (and (Column2 robot) (Row1 robot)))

)