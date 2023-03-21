(define (problem robotProblem)
	(:domain robot)
	(:objects robot)
	(:init
		(RightOf1 robot)
		(LeftOf129 robot)
		(AboveOf0 robot)
		(BelowOf129 robot)
	)
	(:goal (and (Column2 robot) (Row1 robot)))

)