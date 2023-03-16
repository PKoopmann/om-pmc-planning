(define (domain robot)
	(:predicates
		(Columns ?x)
		(Rows ?x)
		(Column0 ?x)
		(Column1 ?x)
		(Column2 ?x)
		(Column3 ?x)
		(Column4 ?x)
		(Column5 ?x)
		(Column6 ?x)
		(Column7 ?x)
		(Column8 ?x)
		(Column9 ?x)
		(Column10 ?x)
		(Column11 ?x)
		(Column12 ?x)
		(Column13 ?x)
		(Column14 ?x)
		(RightOf0 ?x)
		(RightOf1 ?x)
		(RightOf2 ?x)
		(RightOf3 ?x)
		(RightOf4 ?x)
		(RightOf5 ?x)
		(RightOf6 ?x)
		(RightOf7 ?x)
		(RightOf8 ?x)
		(RightOf9 ?x)
		(RightOf10 ?x)
		(RightOf11 ?x)
		(RightOf12 ?x)
		(RightOf13 ?x)
		(RightOf14 ?x)
		(LeftOf1 ?x)
		(LeftOf2 ?x)
		(LeftOf3 ?x)
		(LeftOf4 ?x)
		(LeftOf5 ?x)
		(LeftOf6 ?x)
		(LeftOf7 ?x)
		(LeftOf8 ?x)
		(LeftOf9 ?x)
		(LeftOf10 ?x)
		(LeftOf11 ?x)
		(LeftOf12 ?x)
		(LeftOf13 ?x)
		(LeftOf14 ?x)
		(LeftOf15 ?x)
		(Row0 ?x)
		(Row1 ?x)
		(Row2 ?x)
		(Row3 ?x)
		(Row4 ?x)
		(Row5 ?x)
		(Row6 ?x)
		(Row7 ?x)
		(Row8 ?x)
		(Row9 ?x)
		(Row10 ?x)
		(Row11 ?x)
		(Row12 ?x)
		(Row13 ?x)
		(Row14 ?x)
		(AboveOf0 ?x)
		(AboveOf1 ?x)
		(AboveOf2 ?x)
		(AboveOf3 ?x)
		(AboveOf4 ?x)
		(AboveOf5 ?x)
		(AboveOf6 ?x)
		(AboveOf7 ?x)
		(AboveOf8 ?x)
		(AboveOf9 ?x)
		(AboveOf10 ?x)
		(AboveOf11 ?x)
		(AboveOf12 ?x)
		(AboveOf13 ?x)
		(AboveOf14 ?x)
		(BelowOf1 ?x)
		(BelowOf2 ?x)
		(BelowOf3 ?x)
		(BelowOf4 ?x)
		(BelowOf5 ?x)
		(BelowOf6 ?x)
		(BelowOf7 ?x)
		(BelowOf8 ?x)
		(BelowOf9 ?x)
		(BelowOf10 ?x)
		(BelowOf11 ?x)
		(BelowOf12 ?x)
		(BelowOf13 ?x)
		(BelowOf14 ?x)
		(BelowOf15 ?x)
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
			(when (mko (RightOf3 ?x))
				(and (RightOf4 ?x))
				)
			(when (mko (RightOf4 ?x))
				(and (RightOf5 ?x))
				)
			(when (mko (RightOf5 ?x))
				(and (RightOf6 ?x))
				)
			(when (mko (RightOf6 ?x))
				(and (RightOf7 ?x))
				)
			(when (mko (RightOf7 ?x))
				(and (RightOf8 ?x))
				)
			(when (mko (RightOf8 ?x))
				(and (RightOf9 ?x))
				)
			(when (mko (RightOf9 ?x))
				(and (RightOf10 ?x))
				)
			(when (mko (RightOf10 ?x))
				(and (RightOf11 ?x))
				)
			(when (mko (RightOf11 ?x))
				(and (RightOf12 ?x))
				)
			(when (mko (RightOf12 ?x))
				(and (RightOf13 ?x))
				)
			(when (mko (RightOf13 ?x))
				(and (RightOf14 ?x))
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
			(when (mko (LeftOf4 ?x))
				(and (LeftOf5 ?x)
				(not (LeftOf4 ?x)))
				)
			(when (mko (LeftOf5 ?x))
				(and (LeftOf6 ?x)
				(not (LeftOf5 ?x)))
				)
			(when (mko (LeftOf6 ?x))
				(and (LeftOf7 ?x)
				(not (LeftOf6 ?x)))
				)
			(when (mko (LeftOf7 ?x))
				(and (LeftOf8 ?x)
				(not (LeftOf7 ?x)))
				)
			(when (mko (LeftOf8 ?x))
				(and (LeftOf9 ?x)
				(not (LeftOf8 ?x)))
				)
			(when (mko (LeftOf9 ?x))
				(and (LeftOf10 ?x)
				(not (LeftOf9 ?x)))
				)
			(when (mko (LeftOf10 ?x))
				(and (LeftOf11 ?x)
				(not (LeftOf10 ?x)))
				)
			(when (mko (LeftOf11 ?x))
				(and (LeftOf12 ?x)
				(not (LeftOf11 ?x)))
				)
			(when (mko (LeftOf12 ?x))
				(and (LeftOf13 ?x)
				(not (LeftOf12 ?x)))
				)
			(when (mko (LeftOf13 ?x))
				(and (LeftOf14 ?x)
				(not (LeftOf13 ?x)))
				)
			(when (mko (LeftOf14 ?x))
				(and (LeftOf15 ?x)
				(not (LeftOf14 ?x)))
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
			(when (mko (LeftOf5 ?x))
				(and (LeftOf4 ?x))
				)
			(when (mko (LeftOf6 ?x))
				(and (LeftOf5 ?x))
				)
			(when (mko (LeftOf7 ?x))
				(and (LeftOf6 ?x))
				)
			(when (mko (LeftOf8 ?x))
				(and (LeftOf7 ?x))
				)
			(when (mko (LeftOf9 ?x))
				(and (LeftOf8 ?x))
				)
			(when (mko (LeftOf10 ?x))
				(and (LeftOf9 ?x))
				)
			(when (mko (LeftOf11 ?x))
				(and (LeftOf10 ?x))
				)
			(when (mko (LeftOf12 ?x))
				(and (LeftOf11 ?x))
				)
			(when (mko (LeftOf13 ?x))
				(and (LeftOf12 ?x))
				)
			(when (mko (LeftOf14 ?x))
				(and (LeftOf13 ?x))
				)
			(when (mko (LeftOf15 ?x))
				(and (LeftOf14 ?x))
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
			(when (mko (RightOf4 ?x))
				(and (RightOf3 ?x)
				(RightOf4 ?x))
				)
			(when (mko (RightOf5 ?x))
				(and (RightOf4 ?x)
				(RightOf5 ?x))
				)
			(when (mko (RightOf6 ?x))
				(and (RightOf5 ?x)
				(RightOf6 ?x))
				)
			(when (mko (RightOf7 ?x))
				(and (RightOf6 ?x)
				(RightOf7 ?x))
				)
			(when (mko (RightOf8 ?x))
				(and (RightOf7 ?x)
				(RightOf8 ?x))
				)
			(when (mko (RightOf9 ?x))
				(and (RightOf8 ?x)
				(RightOf9 ?x))
				)
			(when (mko (RightOf10 ?x))
				(and (RightOf9 ?x)
				(RightOf10 ?x))
				)
			(when (mko (RightOf11 ?x))
				(and (RightOf10 ?x)
				(RightOf11 ?x))
				)
			(when (mko (RightOf12 ?x))
				(and (RightOf11 ?x)
				(RightOf12 ?x))
				)
			(when (mko (RightOf13 ?x))
				(and (RightOf12 ?x)
				(RightOf13 ?x))
				)
			(when (mko (RightOf14 ?x))
				(and (RightOf13 ?x)
				(RightOf14 ?x))
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
			(when (mko (AboveOf3 ?x))
				(and (AboveOf4 ?x))
				)
			(when (mko (AboveOf4 ?x))
				(and (AboveOf5 ?x))
				)
			(when (mko (AboveOf5 ?x))
				(and (AboveOf6 ?x))
				)
			(when (mko (AboveOf6 ?x))
				(and (AboveOf7 ?x))
				)
			(when (mko (AboveOf7 ?x))
				(and (AboveOf8 ?x))
				)
			(when (mko (AboveOf8 ?x))
				(and (AboveOf9 ?x))
				)
			(when (mko (AboveOf9 ?x))
				(and (AboveOf10 ?x))
				)
			(when (mko (AboveOf10 ?x))
				(and (AboveOf11 ?x))
				)
			(when (mko (AboveOf11 ?x))
				(and (AboveOf12 ?x))
				)
			(when (mko (AboveOf12 ?x))
				(and (AboveOf13 ?x))
				)
			(when (mko (AboveOf13 ?x))
				(and (AboveOf14 ?x))
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
			(when (mko (BelowOf4 ?x))
				(and (BelowOf5 ?x)
				(not (BelowOf4 ?x)))
				)
			(when (mko (BelowOf5 ?x))
				(and (BelowOf6 ?x)
				(not (BelowOf5 ?x)))
				)
			(when (mko (BelowOf6 ?x))
				(and (BelowOf7 ?x)
				(not (BelowOf6 ?x)))
				)
			(when (mko (BelowOf7 ?x))
				(and (BelowOf8 ?x)
				(not (BelowOf7 ?x)))
				)
			(when (mko (BelowOf8 ?x))
				(and (BelowOf9 ?x)
				(not (BelowOf8 ?x)))
				)
			(when (mko (BelowOf9 ?x))
				(and (BelowOf10 ?x)
				(not (BelowOf9 ?x)))
				)
			(when (mko (BelowOf10 ?x))
				(and (BelowOf11 ?x)
				(not (BelowOf10 ?x)))
				)
			(when (mko (BelowOf11 ?x))
				(and (BelowOf12 ?x)
				(not (BelowOf11 ?x)))
				)
			(when (mko (BelowOf12 ?x))
				(and (BelowOf13 ?x)
				(not (BelowOf12 ?x)))
				)
			(when (mko (BelowOf13 ?x))
				(and (BelowOf14 ?x)
				(not (BelowOf13 ?x)))
				)
			(when (mko (BelowOf14 ?x))
				(and (BelowOf15 ?x)
				(not (BelowOf14 ?x)))
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
			(when (mko (BelowOf5 ?x))
				(and (BelowOf4 ?x))
				)
			(when (mko (BelowOf6 ?x))
				(and (BelowOf5 ?x))
				)
			(when (mko (BelowOf7 ?x))
				(and (BelowOf6 ?x))
				)
			(when (mko (BelowOf8 ?x))
				(and (BelowOf7 ?x))
				)
			(when (mko (BelowOf9 ?x))
				(and (BelowOf8 ?x))
				)
			(when (mko (BelowOf10 ?x))
				(and (BelowOf9 ?x))
				)
			(when (mko (BelowOf11 ?x))
				(and (BelowOf10 ?x))
				)
			(when (mko (BelowOf12 ?x))
				(and (BelowOf11 ?x))
				)
			(when (mko (BelowOf13 ?x))
				(and (BelowOf12 ?x))
				)
			(when (mko (BelowOf14 ?x))
				(and (BelowOf13 ?x))
				)
			(when (mko (BelowOf15 ?x))
				(and (BelowOf14 ?x))
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
			(when (mko (AboveOf4 ?x))
				(and (AboveOf3 ?x)
				(not (AboveOf4 ?x)))
				)
			(when (mko (AboveOf5 ?x))
				(and (AboveOf4 ?x)
				(not (AboveOf5 ?x)))
				)
			(when (mko (AboveOf6 ?x))
				(and (AboveOf5 ?x)
				(not (AboveOf6 ?x)))
				)
			(when (mko (AboveOf7 ?x))
				(and (AboveOf6 ?x)
				(not (AboveOf7 ?x)))
				)
			(when (mko (AboveOf8 ?x))
				(and (AboveOf7 ?x)
				(not (AboveOf8 ?x)))
				)
			(when (mko (AboveOf9 ?x))
				(and (AboveOf8 ?x)
				(not (AboveOf9 ?x)))
				)
			(when (mko (AboveOf10 ?x))
				(and (AboveOf9 ?x)
				(not (AboveOf10 ?x)))
				)
			(when (mko (AboveOf11 ?x))
				(and (AboveOf10 ?x)
				(not (AboveOf11 ?x)))
				)
			(when (mko (AboveOf12 ?x))
				(and (AboveOf11 ?x)
				(not (AboveOf12 ?x)))
				)
			(when (mko (AboveOf13 ?x))
				(and (AboveOf12 ?x)
				(not (AboveOf13 ?x)))
				)
			(when (mko (AboveOf14 ?x))
				(and (AboveOf13 ?x)
				(not (AboveOf14 ?x)))
				)
		))

)