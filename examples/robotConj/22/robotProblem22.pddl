(define (problem robotProblem)
	(:domain robot)
	(:objects robot)
	(:init
		(RightOf1 robot)
		(LeftOf21 robot)
		(AboveOf0 robot)
		(BelowOf21 robot)
	)
	(:goal (and (KBquery_Column2 robot) (KBquery_Row1 robot)))

)
