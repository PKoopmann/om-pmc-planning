(define (problem robotProblem)
	(:domain robot)
	(:objects robot)
	(:init
		(RightOf1 robot)
		(LeftOf199 robot)
		(AboveOf0 robot)
		(BelowOf199 robot)
	)
	(:goal (and (KBquery_Column2 robot) (KBquery_Row1 robot)))

)
