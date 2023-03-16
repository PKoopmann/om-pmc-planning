(define (problem robotProblem)
	(:domain robot)
	(:objects robot)
	(:init
		(RightOf1 robot)
		(LeftOf59 robot)
		(AboveOf0 robot)
		(BelowOf59 robot)
	)
	(:goal (and (Column2 robot) (Row1 robot)))

)