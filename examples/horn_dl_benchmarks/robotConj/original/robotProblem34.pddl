(define (problem robotProblem)
	(:domain robot)
	(:objects robot)
	(:init
		(RightOf1 robot)
		(LeftOf33 robot)
		(AboveOf0 robot)
		(BelowOf33 robot)
	)
	(:goal (and (mko (Column2 robot)) (mko (Row1 robot))))

)