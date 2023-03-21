(define (problem robotProblem)
	(:domain robot)
	(:objects robot)
	(:init
		(RightOf1 robot)
		(LeftOf9 robot)
		(AboveOf0 robot)
		(BelowOf9 robot)
	)
	(:goal (and (mko (Column2 robot)) (mko (Row1 robot))))

)