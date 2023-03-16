(define (problem robotProblem)
	(:domain robot)
	(:objects robot)
	(:init
		(RightOf1 robot)
		(LeftOf34 robot)
		(AboveOf0 robot)
		(BelowOf34 robot)
	)
	(:goal (and (mko (Column2 robot)) (mko (Row1 robot))))

)