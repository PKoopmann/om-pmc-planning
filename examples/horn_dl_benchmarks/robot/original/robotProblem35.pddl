(define (problem robotProblem)
	(:domain robot)
	(:objects robot)
	(:init
		(RightOf1 robot)
		(LeftOf34 robot)
		(AboveOf0 robot)
		(BelowOf34 robot)
	)
	(:goal (and (Column2 robot) (Row1 robot)))

)