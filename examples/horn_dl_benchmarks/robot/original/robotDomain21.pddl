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
		(Column15 ?x)
		(Column16 ?x)
		(Column17 ?x)
		(Column18 ?x)
		(Column19 ?x)
		(Column20 ?x)
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
		(RightOf15 ?x)
		(RightOf16 ?x)
		(RightOf17 ?x)
		(RightOf18 ?x)
		(RightOf19 ?x)
		(RightOf20 ?x)
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
		(LeftOf16 ?x)
		(LeftOf17 ?x)
		(LeftOf18 ?x)
		(LeftOf19 ?x)
		(LeftOf20 ?x)
		(LeftOf21 ?x)
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
		(Row15 ?x)
		(Row16 ?x)
		(Row17 ?x)
		(Row18 ?x)
		(Row19 ?x)
		(Row20 ?x)
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
		(AboveOf15 ?x)
		(AboveOf16 ?x)
		(AboveOf17 ?x)
		(AboveOf18 ?x)
		(AboveOf19 ?x)
		(AboveOf20 ?x)
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
		(BelowOf16 ?x)
		(BelowOf17 ?x)
		(BelowOf18 ?x)
		(BelowOf19 ?x)
		(BelowOf20 ?x)
		(BelowOf21 ?x)
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
			(when (mko (RightOf14 ?x))
				(and (RightOf15 ?x))
				)
			(when (mko (RightOf15 ?x))
				(and (RightOf16 ?x))
				)
			(when (mko (RightOf16 ?x))
				(and (RightOf17 ?x))
				)
			(when (mko (RightOf17 ?x))
				(and (RightOf18 ?x))
				)
			(when (mko (RightOf18 ?x))
				(and (RightOf19 ?x))
				)
			(when (mko (RightOf19 ?x))
				(and (RightOf20 ?x))
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
			(when (mko (LeftOf15 ?x))
				(and (LeftOf16 ?x)
				(not (LeftOf15 ?x)))
				)
			(when (mko (LeftOf16 ?x))
				(and (LeftOf17 ?x)
				(not (LeftOf16 ?x)))
				)
			(when (mko (LeftOf17 ?x))
				(and (LeftOf18 ?x)
				(not (LeftOf17 ?x)))
				)
			(when (mko (LeftOf18 ?x))
				(and (LeftOf19 ?x)
				(not (LeftOf18 ?x)))
				)
			(when (mko (LeftOf19 ?x))
				(and (LeftOf20 ?x)
				(not (LeftOf19 ?x)))
				)
			(when (mko (LeftOf20 ?x))
				(and (LeftOf21 ?x)
				(not (LeftOf20 ?x)))
				)
			(when (mko (Column0 ?x))
				(and (Column1 ?x)
				(not (Column0 ?x)))
				)
			(when (mko (Column1 ?x))
				(and (Column2 ?x)
				(not (Column1 ?x)))
				)
			(when (mko (Column2 ?x))
				(and (Column3 ?x)
				(not (Column2 ?x)))
				)
			(when (mko (Column3 ?x))
				(and (Column4 ?x)
				(not (Column3 ?x)))
				)
			(when (mko (Column4 ?x))
				(and (Column5 ?x)
				(not (Column4 ?x)))
				)
			(when (mko (Column5 ?x))
				(and (Column6 ?x)
				(not (Column5 ?x)))
				)
			(when (mko (Column6 ?x))
				(and (Column7 ?x)
				(not (Column6 ?x)))
				)
			(when (mko (Column7 ?x))
				(and (Column8 ?x)
				(not (Column7 ?x)))
				)
			(when (mko (Column8 ?x))
				(and (Column9 ?x)
				(not (Column8 ?x)))
				)
			(when (mko (Column9 ?x))
				(and (Column10 ?x)
				(not (Column9 ?x)))
				)
			(when (mko (Column10 ?x))
				(and (Column11 ?x)
				(not (Column10 ?x)))
				)
			(when (mko (Column11 ?x))
				(and (Column12 ?x)
				(not (Column11 ?x)))
				)
			(when (mko (Column12 ?x))
				(and (Column13 ?x)
				(not (Column12 ?x)))
				)
			(when (mko (Column13 ?x))
				(and (Column14 ?x)
				(not (Column13 ?x)))
				)
			(when (mko (Column14 ?x))
				(and (Column15 ?x)
				(not (Column14 ?x)))
				)
			(when (mko (Column15 ?x))
				(and (Column16 ?x)
				(not (Column15 ?x)))
				)
			(when (mko (Column16 ?x))
				(and (Column17 ?x)
				(not (Column16 ?x)))
				)
			(when (mko (Column17 ?x))
				(and (Column18 ?x)
				(not (Column17 ?x)))
				)
			(when (mko (Column18 ?x))
				(and (Column19 ?x)
				(not (Column18 ?x)))
				)
			(when (mko (Column19 ?x))
				(and (Column20 ?x)
				(not (Column19 ?x)))
				)
			(when (mko (and (RightOf0 ?x) (LeftOf1 ?x)))
				(and (Column1 ?x))
				)
			(when (mko (and (RightOf1 ?x) (LeftOf2 ?x)))
				(and (Column2 ?x))
				)
			(when (mko (and (RightOf2 ?x) (LeftOf3 ?x)))
				(and (Column3 ?x))
				)
			(when (mko (and (RightOf3 ?x) (LeftOf4 ?x)))
				(and (Column4 ?x))
				)
			(when (mko (and (RightOf4 ?x) (LeftOf5 ?x)))
				(and (Column5 ?x))
				)
			(when (mko (and (RightOf5 ?x) (LeftOf6 ?x)))
				(and (Column6 ?x))
				)
			(when (mko (and (RightOf6 ?x) (LeftOf7 ?x)))
				(and (Column7 ?x))
				)
			(when (mko (and (RightOf7 ?x) (LeftOf8 ?x)))
				(and (Column8 ?x))
				)
			(when (mko (and (RightOf8 ?x) (LeftOf9 ?x)))
				(and (Column9 ?x))
				)
			(when (mko (and (RightOf9 ?x) (LeftOf10 ?x)))
				(and (Column10 ?x))
				)
			(when (mko (and (RightOf10 ?x) (LeftOf11 ?x)))
				(and (Column11 ?x))
				)
			(when (mko (and (RightOf11 ?x) (LeftOf12 ?x)))
				(and (Column12 ?x))
				)
			(when (mko (and (RightOf12 ?x) (LeftOf13 ?x)))
				(and (Column13 ?x))
				)
			(when (mko (and (RightOf13 ?x) (LeftOf14 ?x)))
				(and (Column14 ?x))
				)
			(when (mko (and (RightOf14 ?x) (LeftOf15 ?x)))
				(and (Column15 ?x))
				)
			(when (mko (and (RightOf15 ?x) (LeftOf16 ?x)))
				(and (Column16 ?x))
				)
			(when (mko (and (RightOf16 ?x) (LeftOf17 ?x)))
				(and (Column17 ?x))
				)
			(when (mko (and (RightOf17 ?x) (LeftOf18 ?x)))
				(and (Column18 ?x))
				)
			(when (mko (and (RightOf18 ?x) (LeftOf19 ?x)))
				(and (Column19 ?x))
				)
			(when (mko (and (RightOf19 ?x) (LeftOf20 ?x)))
				(and (Column20 ?x))
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
			(when (mko (LeftOf16 ?x))
				(and (LeftOf15 ?x))
				)
			(when (mko (LeftOf17 ?x))
				(and (LeftOf16 ?x))
				)
			(when (mko (LeftOf18 ?x))
				(and (LeftOf17 ?x))
				)
			(when (mko (LeftOf19 ?x))
				(and (LeftOf18 ?x))
				)
			(when (mko (LeftOf20 ?x))
				(and (LeftOf19 ?x))
				)
			(when (mko (LeftOf21 ?x))
				(and (LeftOf20 ?x))
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
			(when (mko (RightOf15 ?x))
				(and (RightOf14 ?x)
				(RightOf15 ?x))
				)
			(when (mko (RightOf16 ?x))
				(and (RightOf15 ?x)
				(RightOf16 ?x))
				)
			(when (mko (RightOf17 ?x))
				(and (RightOf16 ?x)
				(RightOf17 ?x))
				)
			(when (mko (RightOf18 ?x))
				(and (RightOf17 ?x)
				(RightOf18 ?x))
				)
			(when (mko (RightOf19 ?x))
				(and (RightOf18 ?x)
				(RightOf19 ?x))
				)
			(when (mko (RightOf20 ?x))
				(and (RightOf19 ?x)
				(RightOf20 ?x))
				)
			(when (mko (Column1 ?x))
				(and (Column0 ?x)
				(not (Column1 ?x)))
				)
			(when (mko (Column2 ?x))
				(and (Column1 ?x)
				(not (Column2 ?x)))
				)
			(when (mko (Column3 ?x))
				(and (Column2 ?x)
				(not (Column3 ?x)))
				)
			(when (mko (Column4 ?x))
				(and (Column3 ?x)
				(not (Column4 ?x)))
				)
			(when (mko (Column5 ?x))
				(and (Column4 ?x)
				(not (Column5 ?x)))
				)
			(when (mko (Column6 ?x))
				(and (Column5 ?x)
				(not (Column6 ?x)))
				)
			(when (mko (Column7 ?x))
				(and (Column6 ?x)
				(not (Column7 ?x)))
				)
			(when (mko (Column8 ?x))
				(and (Column7 ?x)
				(not (Column8 ?x)))
				)
			(when (mko (Column9 ?x))
				(and (Column8 ?x)
				(not (Column9 ?x)))
				)
			(when (mko (Column10 ?x))
				(and (Column9 ?x)
				(not (Column10 ?x)))
				)
			(when (mko (Column11 ?x))
				(and (Column10 ?x)
				(not (Column11 ?x)))
				)
			(when (mko (Column12 ?x))
				(and (Column11 ?x)
				(not (Column12 ?x)))
				)
			(when (mko (Column13 ?x))
				(and (Column12 ?x)
				(not (Column13 ?x)))
				)
			(when (mko (Column14 ?x))
				(and (Column13 ?x)
				(not (Column14 ?x)))
				)
			(when (mko (Column15 ?x))
				(and (Column14 ?x)
				(not (Column15 ?x)))
				)
			(when (mko (Column16 ?x))
				(and (Column15 ?x)
				(not (Column16 ?x)))
				)
			(when (mko (Column17 ?x))
				(and (Column16 ?x)
				(not (Column17 ?x)))
				)
			(when (mko (Column18 ?x))
				(and (Column17 ?x)
				(not (Column18 ?x)))
				)
			(when (mko (Column19 ?x))
				(and (Column18 ?x)
				(not (Column19 ?x)))
				)
			(when (mko (Column20 ?x))
				(and (Column19 ?x)
				(not (Column20 ?x)))
				)
			(when (mko (and (RightOf1 ?x) (LeftOf2 ?x)))
				(and (Column0 ?x))
				)
			(when (mko (and (RightOf2 ?x) (LeftOf3 ?x)))
				(and (Column1 ?x))
				)
			(when (mko (and (RightOf3 ?x) (LeftOf4 ?x)))
				(and (Column2 ?x))
				)
			(when (mko (and (RightOf4 ?x) (LeftOf5 ?x)))
				(and (Column3 ?x))
				)
			(when (mko (and (RightOf5 ?x) (LeftOf6 ?x)))
				(and (Column4 ?x))
				)
			(when (mko (and (RightOf6 ?x) (LeftOf7 ?x)))
				(and (Column5 ?x))
				)
			(when (mko (and (RightOf7 ?x) (LeftOf8 ?x)))
				(and (Column6 ?x))
				)
			(when (mko (and (RightOf8 ?x) (LeftOf9 ?x)))
				(and (Column7 ?x))
				)
			(when (mko (and (RightOf9 ?x) (LeftOf10 ?x)))
				(and (Column8 ?x))
				)
			(when (mko (and (RightOf10 ?x) (LeftOf11 ?x)))
				(and (Column9 ?x))
				)
			(when (mko (and (RightOf11 ?x) (LeftOf12 ?x)))
				(and (Column10 ?x))
				)
			(when (mko (and (RightOf12 ?x) (LeftOf13 ?x)))
				(and (Column11 ?x))
				)
			(when (mko (and (RightOf13 ?x) (LeftOf14 ?x)))
				(and (Column12 ?x))
				)
			(when (mko (and (RightOf14 ?x) (LeftOf15 ?x)))
				(and (Column13 ?x))
				)
			(when (mko (and (RightOf15 ?x) (LeftOf16 ?x)))
				(and (Column14 ?x))
				)
			(when (mko (and (RightOf16 ?x) (LeftOf17 ?x)))
				(and (Column15 ?x))
				)
			(when (mko (and (RightOf17 ?x) (LeftOf18 ?x)))
				(and (Column16 ?x))
				)
			(when (mko (and (RightOf18 ?x) (LeftOf19 ?x)))
				(and (Column17 ?x))
				)
			(when (mko (and (RightOf19 ?x) (LeftOf20 ?x)))
				(and (Column18 ?x))
				)
			(when (mko (and (RightOf20 ?x) (LeftOf21 ?x)))
				(and (Column19 ?x))
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
			(when (mko (AboveOf14 ?x))
				(and (AboveOf15 ?x))
				)
			(when (mko (AboveOf15 ?x))
				(and (AboveOf16 ?x))
				)
			(when (mko (AboveOf16 ?x))
				(and (AboveOf17 ?x))
				)
			(when (mko (AboveOf17 ?x))
				(and (AboveOf18 ?x))
				)
			(when (mko (AboveOf18 ?x))
				(and (AboveOf19 ?x))
				)
			(when (mko (AboveOf19 ?x))
				(and (AboveOf20 ?x))
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
			(when (mko (BelowOf15 ?x))
				(and (BelowOf16 ?x)
				(not (BelowOf15 ?x)))
				)
			(when (mko (BelowOf16 ?x))
				(and (BelowOf17 ?x)
				(not (BelowOf16 ?x)))
				)
			(when (mko (BelowOf17 ?x))
				(and (BelowOf18 ?x)
				(not (BelowOf17 ?x)))
				)
			(when (mko (BelowOf18 ?x))
				(and (BelowOf19 ?x)
				(not (BelowOf18 ?x)))
				)
			(when (mko (BelowOf19 ?x))
				(and (BelowOf20 ?x)
				(not (BelowOf19 ?x)))
				)
			(when (mko (BelowOf20 ?x))
				(and (BelowOf21 ?x)
				(not (BelowOf20 ?x)))
				)
			(when (mko (Row0 ?x))
				(and (Row1 ?x)
				(not (Row0 ?x)))
				)
			(when (mko (Row1 ?x))
				(and (Row2 ?x)
				(not (Row1 ?x)))
				)
			(when (mko (Row2 ?x))
				(and (Row3 ?x)
				(not (Row2 ?x)))
				)
			(when (mko (Row3 ?x))
				(and (Row4 ?x)
				(not (Row3 ?x)))
				)
			(when (mko (Row4 ?x))
				(and (Row5 ?x)
				(not (Row4 ?x)))
				)
			(when (mko (Row5 ?x))
				(and (Row6 ?x)
				(not (Row5 ?x)))
				)
			(when (mko (Row6 ?x))
				(and (Row7 ?x)
				(not (Row6 ?x)))
				)
			(when (mko (Row7 ?x))
				(and (Row8 ?x)
				(not (Row7 ?x)))
				)
			(when (mko (Row8 ?x))
				(and (Row9 ?x)
				(not (Row8 ?x)))
				)
			(when (mko (Row9 ?x))
				(and (Row10 ?x)
				(not (Row9 ?x)))
				)
			(when (mko (Row10 ?x))
				(and (Row11 ?x)
				(not (Row10 ?x)))
				)
			(when (mko (Row11 ?x))
				(and (Row12 ?x)
				(not (Row11 ?x)))
				)
			(when (mko (Row12 ?x))
				(and (Row13 ?x)
				(not (Row12 ?x)))
				)
			(when (mko (Row13 ?x))
				(and (Row14 ?x)
				(not (Row13 ?x)))
				)
			(when (mko (Row14 ?x))
				(and (Row15 ?x)
				(not (Row14 ?x)))
				)
			(when (mko (Row15 ?x))
				(and (Row16 ?x)
				(not (Row15 ?x)))
				)
			(when (mko (Row16 ?x))
				(and (Row17 ?x)
				(not (Row16 ?x)))
				)
			(when (mko (Row17 ?x))
				(and (Row18 ?x)
				(not (Row17 ?x)))
				)
			(when (mko (Row18 ?x))
				(and (Row19 ?x)
				(not (Row18 ?x)))
				)
			(when (mko (Row19 ?x))
				(and (Row20 ?x)
				(not (Row19 ?x)))
				)
			(when (mko (and (AboveOf0 ?x) (BelowOf1 ?x)))
				(and (Row1 ?x))
				)
			(when (mko (and (AboveOf1 ?x) (BelowOf2 ?x)))
				(and (Row2 ?x))
				)
			(when (mko (and (AboveOf2 ?x) (BelowOf3 ?x)))
				(and (Row3 ?x))
				)
			(when (mko (and (AboveOf3 ?x) (BelowOf4 ?x)))
				(and (Row4 ?x))
				)
			(when (mko (and (AboveOf4 ?x) (BelowOf5 ?x)))
				(and (Row5 ?x))
				)
			(when (mko (and (AboveOf5 ?x) (BelowOf6 ?x)))
				(and (Row6 ?x))
				)
			(when (mko (and (AboveOf6 ?x) (BelowOf7 ?x)))
				(and (Row7 ?x))
				)
			(when (mko (and (AboveOf7 ?x) (BelowOf8 ?x)))
				(and (Row8 ?x))
				)
			(when (mko (and (AboveOf8 ?x) (BelowOf9 ?x)))
				(and (Row9 ?x))
				)
			(when (mko (and (AboveOf9 ?x) (BelowOf10 ?x)))
				(and (Row10 ?x))
				)
			(when (mko (and (AboveOf10 ?x) (BelowOf11 ?x)))
				(and (Row11 ?x))
				)
			(when (mko (and (AboveOf11 ?x) (BelowOf12 ?x)))
				(and (Row12 ?x))
				)
			(when (mko (and (AboveOf12 ?x) (BelowOf13 ?x)))
				(and (Row13 ?x))
				)
			(when (mko (and (AboveOf13 ?x) (BelowOf14 ?x)))
				(and (Row14 ?x))
				)
			(when (mko (and (AboveOf14 ?x) (BelowOf15 ?x)))
				(and (Row15 ?x))
				)
			(when (mko (and (AboveOf15 ?x) (BelowOf16 ?x)))
				(and (Row16 ?x))
				)
			(when (mko (and (AboveOf16 ?x) (BelowOf17 ?x)))
				(and (Row17 ?x))
				)
			(when (mko (and (AboveOf17 ?x) (BelowOf18 ?x)))
				(and (Row18 ?x))
				)
			(when (mko (and (AboveOf18 ?x) (BelowOf19 ?x)))
				(and (Row19 ?x))
				)
			(when (mko (and (AboveOf19 ?x) (BelowOf20 ?x)))
				(and (Row20 ?x))
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
			(when (mko (BelowOf16 ?x))
				(and (BelowOf15 ?x))
				)
			(when (mko (BelowOf17 ?x))
				(and (BelowOf16 ?x))
				)
			(when (mko (BelowOf18 ?x))
				(and (BelowOf17 ?x))
				)
			(when (mko (BelowOf19 ?x))
				(and (BelowOf18 ?x))
				)
			(when (mko (BelowOf20 ?x))
				(and (BelowOf19 ?x))
				)
			(when (mko (BelowOf21 ?x))
				(and (BelowOf20 ?x))
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
			(when (mko (AboveOf15 ?x))
				(and (AboveOf14 ?x)
				(not (AboveOf15 ?x)))
				)
			(when (mko (AboveOf16 ?x))
				(and (AboveOf15 ?x)
				(not (AboveOf16 ?x)))
				)
			(when (mko (AboveOf17 ?x))
				(and (AboveOf16 ?x)
				(not (AboveOf17 ?x)))
				)
			(when (mko (AboveOf18 ?x))
				(and (AboveOf17 ?x)
				(not (AboveOf18 ?x)))
				)
			(when (mko (AboveOf19 ?x))
				(and (AboveOf18 ?x)
				(not (AboveOf19 ?x)))
				)
			(when (mko (AboveOf20 ?x))
				(and (AboveOf19 ?x)
				(not (AboveOf20 ?x)))
				)
			(when (mko (Row1 ?x))
				(and (Row0 ?x)
				(not (Row1 ?x)))
				)
			(when (mko (Row2 ?x))
				(and (Row1 ?x)
				(not (Row2 ?x)))
				)
			(when (mko (Row3 ?x))
				(and (Row2 ?x)
				(not (Row3 ?x)))
				)
			(when (mko (Row4 ?x))
				(and (Row3 ?x)
				(not (Row4 ?x)))
				)
			(when (mko (Row5 ?x))
				(and (Row4 ?x)
				(not (Row5 ?x)))
				)
			(when (mko (Row6 ?x))
				(and (Row5 ?x)
				(not (Row6 ?x)))
				)
			(when (mko (Row7 ?x))
				(and (Row6 ?x)
				(not (Row7 ?x)))
				)
			(when (mko (Row8 ?x))
				(and (Row7 ?x)
				(not (Row8 ?x)))
				)
			(when (mko (Row9 ?x))
				(and (Row8 ?x)
				(not (Row9 ?x)))
				)
			(when (mko (Row10 ?x))
				(and (Row9 ?x)
				(not (Row10 ?x)))
				)
			(when (mko (Row11 ?x))
				(and (Row10 ?x)
				(not (Row11 ?x)))
				)
			(when (mko (Row12 ?x))
				(and (Row11 ?x)
				(not (Row12 ?x)))
				)
			(when (mko (Row13 ?x))
				(and (Row12 ?x)
				(not (Row13 ?x)))
				)
			(when (mko (Row14 ?x))
				(and (Row13 ?x)
				(not (Row14 ?x)))
				)
			(when (mko (Row15 ?x))
				(and (Row14 ?x)
				(not (Row15 ?x)))
				)
			(when (mko (Row16 ?x))
				(and (Row15 ?x)
				(not (Row16 ?x)))
				)
			(when (mko (Row17 ?x))
				(and (Row16 ?x)
				(not (Row17 ?x)))
				)
			(when (mko (Row18 ?x))
				(and (Row17 ?x)
				(not (Row18 ?x)))
				)
			(when (mko (Row19 ?x))
				(and (Row18 ?x)
				(not (Row19 ?x)))
				)
			(when (mko (Row20 ?x))
				(and (Row19 ?x)
				(not (Row20 ?x)))
				)
			(when (mko (and (AboveOf1 ?x) (BelowOf2 ?x)))
				(and (Row0 ?x))
				)
			(when (mko (and (AboveOf2 ?x) (BelowOf3 ?x)))
				(and (Row1 ?x))
				)
			(when (mko (and (AboveOf3 ?x) (BelowOf4 ?x)))
				(and (Row2 ?x))
				)
			(when (mko (and (AboveOf4 ?x) (BelowOf5 ?x)))
				(and (Row3 ?x))
				)
			(when (mko (and (AboveOf5 ?x) (BelowOf6 ?x)))
				(and (Row4 ?x))
				)
			(when (mko (and (AboveOf6 ?x) (BelowOf7 ?x)))
				(and (Row5 ?x))
				)
			(when (mko (and (AboveOf7 ?x) (BelowOf8 ?x)))
				(and (Row6 ?x))
				)
			(when (mko (and (AboveOf8 ?x) (BelowOf9 ?x)))
				(and (Row7 ?x))
				)
			(when (mko (and (AboveOf9 ?x) (BelowOf10 ?x)))
				(and (Row8 ?x))
				)
			(when (mko (and (AboveOf10 ?x) (BelowOf11 ?x)))
				(and (Row9 ?x))
				)
			(when (mko (and (AboveOf11 ?x) (BelowOf12 ?x)))
				(and (Row10 ?x))
				)
			(when (mko (and (AboveOf12 ?x) (BelowOf13 ?x)))
				(and (Row11 ?x))
				)
			(when (mko (and (AboveOf13 ?x) (BelowOf14 ?x)))
				(and (Row12 ?x))
				)
			(when (mko (and (AboveOf14 ?x) (BelowOf15 ?x)))
				(and (Row13 ?x))
				)
			(when (mko (and (AboveOf15 ?x) (BelowOf16 ?x)))
				(and (Row14 ?x))
				)
			(when (mko (and (AboveOf16 ?x) (BelowOf17 ?x)))
				(and (Row15 ?x))
				)
			(when (mko (and (AboveOf17 ?x) (BelowOf18 ?x)))
				(and (Row16 ?x))
				)
			(when (mko (and (AboveOf18 ?x) (BelowOf19 ?x)))
				(and (Row17 ?x))
				)
			(when (mko (and (AboveOf19 ?x) (BelowOf20 ?x)))
				(and (Row18 ?x))
				)
			(when (mko (and (AboveOf20 ?x) (BelowOf21 ?x)))
				(and (Row19 ?x))
				)
		))

)