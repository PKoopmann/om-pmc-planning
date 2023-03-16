(define (problem robotProblem)
	(:domain robot)
	(:objects robot)
	(:init
		(RightOf1 robot)
		(LeftOf31 robot)
		(AboveOf0 robot)
		(BelowOf31 robot)
	)
	(:goal (and (mko (Column2 robot)) (mko (Row1 robot))))

)