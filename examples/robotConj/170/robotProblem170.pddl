(define (problem robotProblem)
	(:domain robot)
	(:objects robot)
	(:init
		(RightOf1 robot)
		(LeftOf169 robot)
		(AboveOf0 robot)
		(BelowOf169 robot)
	)
	(:goal (and (KBquery_Column2 robot) (KBquery_Row1 robot)))

)
