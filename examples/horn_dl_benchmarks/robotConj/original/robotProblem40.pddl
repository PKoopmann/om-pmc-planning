(define (problem robotProblem)
	(:domain robot)
	(:objects robot)
	(:init
		(RightOf1 robot)
		(LeftOf39 robot)
		(AboveOf0 robot)
		(BelowOf39 robot)
	)
	(:goal (and (mko (Column2 robot)) (mko (Row1 robot))))

)