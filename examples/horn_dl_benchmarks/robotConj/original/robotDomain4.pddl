(define (domain robot)
	(:predicates
		(Columns ?x)
		(Rows ?x)
		(Column0 ?x)
		(Column1 ?x)
		(Column2 ?x)
		(Column3 ?x)
		(RightOf0 ?x)
		(RightOf1 ?x)
		(RightOf2 ?x)
		(RightOf3 ?x)
		(LeftOf1 ?x)
		(LeftOf2 ?x)
		(LeftOf3 ?x)
		(LeftOf4 ?x)
		(Row0 ?x)
		(Row1 ?x)
		(Row2 ?x)
		(Row3 ?x)
		(AboveOf0 ?x)
		(AboveOf1 ?x)
		(AboveOf2 ?x)
		(AboveOf3 ?x)
		(BelowOf1 ?x)
		(BelowOf2 ?x)
		(BelowOf3 ?x)
		(BelowOf4 ?x)
	)
	(:action moveRight
		:parameters (?x)
		:precondition (and (mko (Columns ?x)))
		:effect (and 
			(when (mko (RightOf0 ?x))
				(and (RightOf1 ?x))
				)
			(when (mko (RightOf1 ?x))
				(and (RightOf2 ?x))
				)
			(when (mko (RightOf2 ?x))
				(and (RightOf3 ?x))
				)
			(when (mko (LeftOf1 ?x))
				(and (LeftOf2 ?x)
				(not (LeftOf1 ?x)))
				)
			(when (mko (LeftOf2 ?x))
				(and (LeftOf3 ?x)
				(not (LeftOf2 ?x)))
				)
			(when (mko (LeftOf3 ?x))
				(and (LeftOf4 ?x)
				(not (LeftOf3 ?x)))
				)
		))
	(:action moveLeft
		:parameters (?x)
		:precondition (and (mko (Columns ?x)))
		:effect (and 
			(when (mko (LeftOf2 ?x))
				(and (LeftOf1 ?x))
				)
			(when (mko (LeftOf3 ?x))
				(and (LeftOf2 ?x))
				)
			(when (mko (LeftOf4 ?x))
				(and (LeftOf3 ?x))
				)
			(when (mko (RightOf1 ?x))
				(and (RightOf0 ?x)
				(RightOf1 ?x))
				)
			(when (mko (RightOf2 ?x))
				(and (RightOf1 ?x)
				(RightOf2 ?x))
				)
			(when (mko (RightOf3 ?x))
				(and (RightOf2 ?x)
				(RightOf3 ?x))
				)
		))
	(:action moveUp
		:parameters (?x)
		:precondition (and (mko (Rows ?x)))
		:effect (and 
			(when (mko (AboveOf0 ?x))
				(and (AboveOf1 ?x))
				)
			(when (mko (AboveOf1 ?x))
				(and (AboveOf2 ?x))
				)
			(when (mko (AboveOf2 ?x))
				(and (AboveOf3 ?x))
				)
			(when (mko (BelowOf1 ?x))
				(and (BelowOf2 ?x)
				(not (BelowOf1 ?x)))
				)
			(when (mko (BelowOf2 ?x))
				(and (BelowOf3 ?x)
				(not (BelowOf2 ?x)))
				)
			(when (mko (BelowOf3 ?x))
				(and (BelowOf4 ?x)
				(not (BelowOf3 ?x)))
				)
		))
	(:action moveDown
		:parameters (?x)
		:precondition (and (mko (Rows ?x)))
		:effect (and 
			(when (mko (BelowOf2 ?x))
				(and (BelowOf1 ?x))
				)
			(when (mko (BelowOf3 ?x))
				(and (BelowOf2 ?x))
				)
			(when (mko (BelowOf4 ?x))
				(and (BelowOf3 ?x))
				)
			(when (mko (AboveOf1 ?x))
				(and (AboveOf0 ?x)
				(not (AboveOf1 ?x)))
				)
			(when (mko (AboveOf2 ?x))
				(and (AboveOf1 ?x)
				(not (AboveOf2 ?x)))
				)
			(when (mko (AboveOf3 ?x))
				(and (AboveOf2 ?x)
				(not (AboveOf3 ?x)))
				)
		))

)