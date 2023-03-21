(define (problem robotProblem)
	(:domain robot)
	(:objects robot)
	(:init
		(RightOf1 robot)
		(LeftOf15 robot)
		(AboveOf0 robot)
		(BelowOf15 robot)
	)
	(:goal (and (mko (Column2 robot)) (mko (Row1 robot))))

)