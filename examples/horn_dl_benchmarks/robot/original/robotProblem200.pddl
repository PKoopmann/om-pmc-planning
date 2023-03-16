(define (problem robotProblem)
	(:domain robot)
	(:objects robot)
	(:init
		(RightOf1 robot)
		(LeftOf199 robot)
		(AboveOf0 robot)
		(BelowOf199 robot)
	)
	(:goal (and (Column2 robot) (Row1 robot)))

)