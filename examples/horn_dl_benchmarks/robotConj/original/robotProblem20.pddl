(define (problem robotProblem)
	(:domain robot)
	(:objects robot)
	(:init
		(RightOf1 robot)
		(LeftOf19 robot)
		(AboveOf0 robot)
		(BelowOf19 robot)
	)
	(:goal (and (mko (Column2 robot)) (mko (Row1 robot))))

)