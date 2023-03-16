(define (problem robotProblem)
	(:domain robot)
	(:objects robot)
	(:init
		(RightOf1 robot)
		(LeftOf30 robot)
		(AboveOf0 robot)
		(BelowOf30 robot)
	)
	(:goal (and (Column2 robot) (Row1 robot)))

)