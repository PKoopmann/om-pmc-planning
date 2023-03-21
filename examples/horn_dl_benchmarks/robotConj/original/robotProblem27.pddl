(define (problem robotProblem)
	(:domain robot)
	(:objects robot)
	(:init
		(RightOf1 robot)
		(LeftOf26 robot)
		(AboveOf0 robot)
		(BelowOf26 robot)
	)
	(:goal (and (mko (Column2 robot)) (mko (Row1 robot))))

)