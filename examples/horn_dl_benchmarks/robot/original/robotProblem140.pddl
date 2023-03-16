(define (problem robotProblem)
	(:domain robot)
	(:objects robot)
	(:init
		(RightOf1 robot)
		(LeftOf139 robot)
		(AboveOf0 robot)
		(BelowOf139 robot)
	)
	(:goal (and (Column2 robot) (Row1 robot)))

)