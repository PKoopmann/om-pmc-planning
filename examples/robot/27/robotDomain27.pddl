(define (domain robot)
	(:predicates
(KBquery_AboveOf0 ?x)
(KBquery_AboveOf1 ?x)
(KBquery_AboveOf10 ?x)
(KBquery_AboveOf11 ?x)
(KBquery_AboveOf12 ?x)
(KBquery_AboveOf13 ?x)
(KBquery_AboveOf14 ?x)
(KBquery_AboveOf15 ?x)
(KBquery_AboveOf16 ?x)
(KBquery_AboveOf17 ?x)
(KBquery_AboveOf18 ?x)
(KBquery_AboveOf19 ?x)
(KBquery_AboveOf2 ?x)
(KBquery_AboveOf20 ?x)
(KBquery_AboveOf21 ?x)
(KBquery_AboveOf22 ?x)
(KBquery_AboveOf23 ?x)
(KBquery_AboveOf24 ?x)
(KBquery_AboveOf25 ?x)
(KBquery_AboveOf26 ?x)
(KBquery_AboveOf3 ?x)
(KBquery_AboveOf4 ?x)
(KBquery_AboveOf5 ?x)
(KBquery_AboveOf6 ?x)
(KBquery_AboveOf7 ?x)
(KBquery_AboveOf8 ?x)
(KBquery_AboveOf9 ?x)
(KBquery_BelowOf1 ?x)
(KBquery_BelowOf10 ?x)
(KBquery_BelowOf11 ?x)
(KBquery_BelowOf12 ?x)
(KBquery_BelowOf13 ?x)
(KBquery_BelowOf14 ?x)
(KBquery_BelowOf15 ?x)
(KBquery_BelowOf16 ?x)
(KBquery_BelowOf17 ?x)
(KBquery_BelowOf18 ?x)
(KBquery_BelowOf19 ?x)
(KBquery_BelowOf2 ?x)
(KBquery_BelowOf20 ?x)
(KBquery_BelowOf21 ?x)
(KBquery_BelowOf22 ?x)
(KBquery_BelowOf23 ?x)
(KBquery_BelowOf24 ?x)
(KBquery_BelowOf25 ?x)
(KBquery_BelowOf26 ?x)
(KBquery_BelowOf27 ?x)
(KBquery_BelowOf3 ?x)
(KBquery_BelowOf4 ?x)
(KBquery_BelowOf5 ?x)
(KBquery_BelowOf6 ?x)
(KBquery_BelowOf7 ?x)
(KBquery_BelowOf8 ?x)
(KBquery_BelowOf9 ?x)
(KBquery_Column0 ?x)
(KBquery_Column1 ?x)
(KBquery_Column10 ?x)
(KBquery_Column11 ?x)
(KBquery_Column12 ?x)
(KBquery_Column13 ?x)
(KBquery_Column14 ?x)
(KBquery_Column15 ?x)
(KBquery_Column16 ?x)
(KBquery_Column17 ?x)
(KBquery_Column18 ?x)
(KBquery_Column19 ?x)
(KBquery_Column2 ?x)
(KBquery_Column20 ?x)
(KBquery_Column21 ?x)
(KBquery_Column22 ?x)
(KBquery_Column23 ?x)
(KBquery_Column24 ?x)
(KBquery_Column25 ?x)
(KBquery_Column26 ?x)
(KBquery_Column3 ?x)
(KBquery_Column4 ?x)
(KBquery_Column5 ?x)
(KBquery_Column6 ?x)
(KBquery_Column7 ?x)
(KBquery_Column8 ?x)
(KBquery_Column9 ?x)
(KBquery_Columns ?x)
(KBquery_LeftOf1 ?x)
(KBquery_LeftOf10 ?x)
(KBquery_LeftOf11 ?x)
(KBquery_LeftOf12 ?x)
(KBquery_LeftOf13 ?x)
(KBquery_LeftOf14 ?x)
(KBquery_LeftOf15 ?x)
(KBquery_LeftOf16 ?x)
(KBquery_LeftOf17 ?x)
(KBquery_LeftOf18 ?x)
(KBquery_LeftOf19 ?x)
(KBquery_LeftOf2 ?x)
(KBquery_LeftOf20 ?x)
(KBquery_LeftOf21 ?x)
(KBquery_LeftOf22 ?x)
(KBquery_LeftOf23 ?x)
(KBquery_LeftOf24 ?x)
(KBquery_LeftOf25 ?x)
(KBquery_LeftOf26 ?x)
(KBquery_LeftOf27 ?x)
(KBquery_LeftOf3 ?x)
(KBquery_LeftOf4 ?x)
(KBquery_LeftOf5 ?x)
(KBquery_LeftOf6 ?x)
(KBquery_LeftOf7 ?x)
(KBquery_LeftOf8 ?x)
(KBquery_LeftOf9 ?x)
(KBquery_RightOf0 ?x)
(KBquery_RightOf1 ?x)
(KBquery_RightOf10 ?x)
(KBquery_RightOf11 ?x)
(KBquery_RightOf12 ?x)
(KBquery_RightOf13 ?x)
(KBquery_RightOf14 ?x)
(KBquery_RightOf15 ?x)
(KBquery_RightOf16 ?x)
(KBquery_RightOf17 ?x)
(KBquery_RightOf18 ?x)
(KBquery_RightOf19 ?x)
(KBquery_RightOf2 ?x)
(KBquery_RightOf20 ?x)
(KBquery_RightOf21 ?x)
(KBquery_RightOf22 ?x)
(KBquery_RightOf23 ?x)
(KBquery_RightOf24 ?x)
(KBquery_RightOf25 ?x)
(KBquery_RightOf26 ?x)
(KBquery_RightOf3 ?x)
(KBquery_RightOf4 ?x)
(KBquery_RightOf5 ?x)
(KBquery_RightOf6 ?x)
(KBquery_RightOf7 ?x)
(KBquery_RightOf8 ?x)
(KBquery_RightOf9 ?x)
(KBquery_Row0 ?x)
(KBquery_Row1 ?x)
(KBquery_Row10 ?x)
(KBquery_Row11 ?x)
(KBquery_Row12 ?x)
(KBquery_Row13 ?x)
(KBquery_Row14 ?x)
(KBquery_Row15 ?x)
(KBquery_Row16 ?x)
(KBquery_Row17 ?x)
(KBquery_Row18 ?x)
(KBquery_Row19 ?x)
(KBquery_Row2 ?x)
(KBquery_Row20 ?x)
(KBquery_Row21 ?x)
(KBquery_Row22 ?x)
(KBquery_Row23 ?x)
(KBquery_Row24 ?x)
(KBquery_Row25 ?x)
(KBquery_Row26 ?x)
(KBquery_Row3 ?x)
(KBquery_Row4 ?x)
(KBquery_Row5 ?x)
(KBquery_Row6 ?x)
(KBquery_Row7 ?x)
(KBquery_Row8 ?x)
(KBquery_Row9 ?x)
(KBquery_Rows ?x)
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
		(Column21 ?x)
		(Column22 ?x)
		(Column23 ?x)
		(Column24 ?x)
		(Column25 ?x)
		(Column26 ?x)
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
		(RightOf21 ?x)
		(RightOf22 ?x)
		(RightOf23 ?x)
		(RightOf24 ?x)
		(RightOf25 ?x)
		(RightOf26 ?x)
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
		(LeftOf22 ?x)
		(LeftOf23 ?x)
		(LeftOf24 ?x)
		(LeftOf25 ?x)
		(LeftOf26 ?x)
		(LeftOf27 ?x)
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
		(Row21 ?x)
		(Row22 ?x)
		(Row23 ?x)
		(Row24 ?x)
		(Row25 ?x)
		(Row26 ?x)
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
		(AboveOf21 ?x)
		(AboveOf22 ?x)
		(AboveOf23 ?x)
		(AboveOf24 ?x)
		(AboveOf25 ?x)
		(AboveOf26 ?x)
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
		(BelowOf22 ?x)
		(BelowOf23 ?x)
		(BelowOf24 ?x)
		(BelowOf25 ?x)
		(BelowOf26 ?x)
		(BelowOf27 ?x)
	)
	(:action moveRight
		:parameters (?x)
		:precondition (and (KBquery_Columns ?x))
		:effect (and 
			(when (KBquery_RightOf0 ?x)
				(and (RightOf1 ?x))
				)
			(when (KBquery_RightOf1 ?x)
				(and (RightOf2 ?x))
				)
			(when (KBquery_RightOf2 ?x)
				(and (RightOf3 ?x))
				)
			(when (KBquery_RightOf3 ?x)
				(and (RightOf4 ?x))
				)
			(when (KBquery_RightOf4 ?x)
				(and (RightOf5 ?x))
				)
			(when (KBquery_RightOf5 ?x)
				(and (RightOf6 ?x))
				)
			(when (KBquery_RightOf6 ?x)
				(and (RightOf7 ?x))
				)
			(when (KBquery_RightOf7 ?x)
				(and (RightOf8 ?x))
				)
			(when (KBquery_RightOf8 ?x)
				(and (RightOf9 ?x))
				)
			(when (KBquery_RightOf9 ?x)
				(and (RightOf10 ?x))
				)
			(when (KBquery_RightOf10 ?x)
				(and (RightOf11 ?x))
				)
			(when (KBquery_RightOf11 ?x)
				(and (RightOf12 ?x))
				)
			(when (KBquery_RightOf12 ?x)
				(and (RightOf13 ?x))
				)
			(when (KBquery_RightOf13 ?x)
				(and (RightOf14 ?x))
				)
			(when (KBquery_RightOf14 ?x)
				(and (RightOf15 ?x))
				)
			(when (KBquery_RightOf15 ?x)
				(and (RightOf16 ?x))
				)
			(when (KBquery_RightOf16 ?x)
				(and (RightOf17 ?x))
				)
			(when (KBquery_RightOf17 ?x)
				(and (RightOf18 ?x))
				)
			(when (KBquery_RightOf18 ?x)
				(and (RightOf19 ?x))
				)
			(when (KBquery_RightOf19 ?x)
				(and (RightOf20 ?x))
				)
			(when (KBquery_RightOf20 ?x)
				(and (RightOf21 ?x))
				)
			(when (KBquery_RightOf21 ?x)
				(and (RightOf22 ?x))
				)
			(when (KBquery_RightOf22 ?x)
				(and (RightOf23 ?x))
				)
			(when (KBquery_RightOf23 ?x)
				(and (RightOf24 ?x))
				)
			(when (KBquery_RightOf24 ?x)
				(and (RightOf25 ?x))
				)
			(when (KBquery_RightOf25 ?x)
				(and (RightOf26 ?x))
				)
			(when (KBquery_LeftOf1 ?x)
				(and (LeftOf2 ?x)
				(not (LeftOf1 ?x)))
				)
			(when (KBquery_LeftOf2 ?x)
				(and (LeftOf3 ?x)
				(not (LeftOf2 ?x)))
				)
			(when (KBquery_LeftOf3 ?x)
				(and (LeftOf4 ?x)
				(not (LeftOf3 ?x)))
				)
			(when (KBquery_LeftOf4 ?x)
				(and (LeftOf5 ?x)
				(not (LeftOf4 ?x)))
				)
			(when (KBquery_LeftOf5 ?x)
				(and (LeftOf6 ?x)
				(not (LeftOf5 ?x)))
				)
			(when (KBquery_LeftOf6 ?x)
				(and (LeftOf7 ?x)
				(not (LeftOf6 ?x)))
				)
			(when (KBquery_LeftOf7 ?x)
				(and (LeftOf8 ?x)
				(not (LeftOf7 ?x)))
				)
			(when (KBquery_LeftOf8 ?x)
				(and (LeftOf9 ?x)
				(not (LeftOf8 ?x)))
				)
			(when (KBquery_LeftOf9 ?x)
				(and (LeftOf10 ?x)
				(not (LeftOf9 ?x)))
				)
			(when (KBquery_LeftOf10 ?x)
				(and (LeftOf11 ?x)
				(not (LeftOf10 ?x)))
				)
			(when (KBquery_LeftOf11 ?x)
				(and (LeftOf12 ?x)
				(not (LeftOf11 ?x)))
				)
			(when (KBquery_LeftOf12 ?x)
				(and (LeftOf13 ?x)
				(not (LeftOf12 ?x)))
				)
			(when (KBquery_LeftOf13 ?x)
				(and (LeftOf14 ?x)
				(not (LeftOf13 ?x)))
				)
			(when (KBquery_LeftOf14 ?x)
				(and (LeftOf15 ?x)
				(not (LeftOf14 ?x)))
				)
			(when (KBquery_LeftOf15 ?x)
				(and (LeftOf16 ?x)
				(not (LeftOf15 ?x)))
				)
			(when (KBquery_LeftOf16 ?x)
				(and (LeftOf17 ?x)
				(not (LeftOf16 ?x)))
				)
			(when (KBquery_LeftOf17 ?x)
				(and (LeftOf18 ?x)
				(not (LeftOf17 ?x)))
				)
			(when (KBquery_LeftOf18 ?x)
				(and (LeftOf19 ?x)
				(not (LeftOf18 ?x)))
				)
			(when (KBquery_LeftOf19 ?x)
				(and (LeftOf20 ?x)
				(not (LeftOf19 ?x)))
				)
			(when (KBquery_LeftOf20 ?x)
				(and (LeftOf21 ?x)
				(not (LeftOf20 ?x)))
				)
			(when (KBquery_LeftOf21 ?x)
				(and (LeftOf22 ?x)
				(not (LeftOf21 ?x)))
				)
			(when (KBquery_LeftOf22 ?x)
				(and (LeftOf23 ?x)
				(not (LeftOf22 ?x)))
				)
			(when (KBquery_LeftOf23 ?x)
				(and (LeftOf24 ?x)
				(not (LeftOf23 ?x)))
				)
			(when (KBquery_LeftOf24 ?x)
				(and (LeftOf25 ?x)
				(not (LeftOf24 ?x)))
				)
			(when (KBquery_LeftOf25 ?x)
				(and (LeftOf26 ?x)
				(not (LeftOf25 ?x)))
				)
			(when (KBquery_LeftOf26 ?x)
				(and (LeftOf27 ?x)
				(not (LeftOf26 ?x)))
				)
			(when (KBquery_Column0 ?x)
				(and (Column1 ?x)
				(not (Column0 ?x)))
				)
			(when (KBquery_Column1 ?x)
				(and (Column2 ?x)
				(not (Column1 ?x)))
				)
			(when (KBquery_Column2 ?x)
				(and (Column3 ?x)
				(not (Column2 ?x)))
				)
			(when (KBquery_Column3 ?x)
				(and (Column4 ?x)
				(not (Column3 ?x)))
				)
			(when (KBquery_Column4 ?x)
				(and (Column5 ?x)
				(not (Column4 ?x)))
				)
			(when (KBquery_Column5 ?x)
				(and (Column6 ?x)
				(not (Column5 ?x)))
				)
			(when (KBquery_Column6 ?x)
				(and (Column7 ?x)
				(not (Column6 ?x)))
				)
			(when (KBquery_Column7 ?x)
				(and (Column8 ?x)
				(not (Column7 ?x)))
				)
			(when (KBquery_Column8 ?x)
				(and (Column9 ?x)
				(not (Column8 ?x)))
				)
			(when (KBquery_Column9 ?x)
				(and (Column10 ?x)
				(not (Column9 ?x)))
				)
			(when (KBquery_Column10 ?x)
				(and (Column11 ?x)
				(not (Column10 ?x)))
				)
			(when (KBquery_Column11 ?x)
				(and (Column12 ?x)
				(not (Column11 ?x)))
				)
			(when (KBquery_Column12 ?x)
				(and (Column13 ?x)
				(not (Column12 ?x)))
				)
			(when (KBquery_Column13 ?x)
				(and (Column14 ?x)
				(not (Column13 ?x)))
				)
			(when (KBquery_Column14 ?x)
				(and (Column15 ?x)
				(not (Column14 ?x)))
				)
			(when (KBquery_Column15 ?x)
				(and (Column16 ?x)
				(not (Column15 ?x)))
				)
			(when (KBquery_Column16 ?x)
				(and (Column17 ?x)
				(not (Column16 ?x)))
				)
			(when (KBquery_Column17 ?x)
				(and (Column18 ?x)
				(not (Column17 ?x)))
				)
			(when (KBquery_Column18 ?x)
				(and (Column19 ?x)
				(not (Column18 ?x)))
				)
			(when (KBquery_Column19 ?x)
				(and (Column20 ?x)
				(not (Column19 ?x)))
				)
			(when (KBquery_Column20 ?x)
				(and (Column21 ?x)
				(not (Column20 ?x)))
				)
			(when (KBquery_Column21 ?x)
				(and (Column22 ?x)
				(not (Column21 ?x)))
				)
			(when (KBquery_Column22 ?x)
				(and (Column23 ?x)
				(not (Column22 ?x)))
				)
			(when (KBquery_Column23 ?x)
				(and (Column24 ?x)
				(not (Column23 ?x)))
				)
			(when (KBquery_Column24 ?x)
				(and (Column25 ?x)
				(not (Column24 ?x)))
				)
			(when (KBquery_Column25 ?x)
				(and (Column26 ?x)
				(not (Column25 ?x)))
				)
			(when (and (KBquery_RightOf0 ?x) (KBquery_LeftOf1 ?x))
				(and (Column1 ?x))
				)
			(when (and (KBquery_RightOf1 ?x) (KBquery_LeftOf2 ?x))
				(and (Column2 ?x))
				)
			(when (and (KBquery_RightOf2 ?x) (KBquery_LeftOf3 ?x))
				(and (Column3 ?x))
				)
			(when (and (KBquery_RightOf3 ?x) (KBquery_LeftOf4 ?x))
				(and (Column4 ?x))
				)
			(when (and (KBquery_RightOf4 ?x) (KBquery_LeftOf5 ?x))
				(and (Column5 ?x))
				)
			(when (and (KBquery_RightOf5 ?x) (KBquery_LeftOf6 ?x))
				(and (Column6 ?x))
				)
			(when (and (KBquery_RightOf6 ?x) (KBquery_LeftOf7 ?x))
				(and (Column7 ?x))
				)
			(when (and (KBquery_RightOf7 ?x) (KBquery_LeftOf8 ?x))
				(and (Column8 ?x))
				)
			(when (and (KBquery_RightOf8 ?x) (KBquery_LeftOf9 ?x))
				(and (Column9 ?x))
				)
			(when (and (KBquery_RightOf9 ?x) (KBquery_LeftOf10 ?x))
				(and (Column10 ?x))
				)
			(when (and (KBquery_RightOf10 ?x) (KBquery_LeftOf11 ?x))
				(and (Column11 ?x))
				)
			(when (and (KBquery_RightOf11 ?x) (KBquery_LeftOf12 ?x))
				(and (Column12 ?x))
				)
			(when (and (KBquery_RightOf12 ?x) (KBquery_LeftOf13 ?x))
				(and (Column13 ?x))
				)
			(when (and (KBquery_RightOf13 ?x) (KBquery_LeftOf14 ?x))
				(and (Column14 ?x))
				)
			(when (and (KBquery_RightOf14 ?x) (KBquery_LeftOf15 ?x))
				(and (Column15 ?x))
				)
			(when (and (KBquery_RightOf15 ?x) (KBquery_LeftOf16 ?x))
				(and (Column16 ?x))
				)
			(when (and (KBquery_RightOf16 ?x) (KBquery_LeftOf17 ?x))
				(and (Column17 ?x))
				)
			(when (and (KBquery_RightOf17 ?x) (KBquery_LeftOf18 ?x))
				(and (Column18 ?x))
				)
			(when (and (KBquery_RightOf18 ?x) (KBquery_LeftOf19 ?x))
				(and (Column19 ?x))
				)
			(when (and (KBquery_RightOf19 ?x) (KBquery_LeftOf20 ?x))
				(and (Column20 ?x))
				)
			(when (and (KBquery_RightOf20 ?x) (KBquery_LeftOf21 ?x))
				(and (Column21 ?x))
				)
			(when (and (KBquery_RightOf21 ?x) (KBquery_LeftOf22 ?x))
				(and (Column22 ?x))
				)
			(when (and (KBquery_RightOf22 ?x) (KBquery_LeftOf23 ?x))
				(and (Column23 ?x))
				)
			(when (and (KBquery_RightOf23 ?x) (KBquery_LeftOf24 ?x))
				(and (Column24 ?x))
				)
			(when (and (KBquery_RightOf24 ?x) (KBquery_LeftOf25 ?x))
				(and (Column25 ?x))
				)
			(when (and (KBquery_RightOf25 ?x) (KBquery_LeftOf26 ?x))
				(and (Column26 ?x))
				)
		))
	(:action moveLeft
		:parameters (?x)
		:precondition (and (KBquery_Columns ?x))
		:effect (and 
			(when (KBquery_LeftOf2 ?x)
				(and (LeftOf1 ?x))
				)
			(when (KBquery_LeftOf3 ?x)
				(and (LeftOf2 ?x))
				)
			(when (KBquery_LeftOf4 ?x)
				(and (LeftOf3 ?x))
				)
			(when (KBquery_LeftOf5 ?x)
				(and (LeftOf4 ?x))
				)
			(when (KBquery_LeftOf6 ?x)
				(and (LeftOf5 ?x))
				)
			(when (KBquery_LeftOf7 ?x)
				(and (LeftOf6 ?x))
				)
			(when (KBquery_LeftOf8 ?x)
				(and (LeftOf7 ?x))
				)
			(when (KBquery_LeftOf9 ?x)
				(and (LeftOf8 ?x))
				)
			(when (KBquery_LeftOf10 ?x)
				(and (LeftOf9 ?x))
				)
			(when (KBquery_LeftOf11 ?x)
				(and (LeftOf10 ?x))
				)
			(when (KBquery_LeftOf12 ?x)
				(and (LeftOf11 ?x))
				)
			(when (KBquery_LeftOf13 ?x)
				(and (LeftOf12 ?x))
				)
			(when (KBquery_LeftOf14 ?x)
				(and (LeftOf13 ?x))
				)
			(when (KBquery_LeftOf15 ?x)
				(and (LeftOf14 ?x))
				)
			(when (KBquery_LeftOf16 ?x)
				(and (LeftOf15 ?x))
				)
			(when (KBquery_LeftOf17 ?x)
				(and (LeftOf16 ?x))
				)
			(when (KBquery_LeftOf18 ?x)
				(and (LeftOf17 ?x))
				)
			(when (KBquery_LeftOf19 ?x)
				(and (LeftOf18 ?x))
				)
			(when (KBquery_LeftOf20 ?x)
				(and (LeftOf19 ?x))
				)
			(when (KBquery_LeftOf21 ?x)
				(and (LeftOf20 ?x))
				)
			(when (KBquery_LeftOf22 ?x)
				(and (LeftOf21 ?x))
				)
			(when (KBquery_LeftOf23 ?x)
				(and (LeftOf22 ?x))
				)
			(when (KBquery_LeftOf24 ?x)
				(and (LeftOf23 ?x))
				)
			(when (KBquery_LeftOf25 ?x)
				(and (LeftOf24 ?x))
				)
			(when (KBquery_LeftOf26 ?x)
				(and (LeftOf25 ?x))
				)
			(when (KBquery_LeftOf27 ?x)
				(and (LeftOf26 ?x))
				)
			(when (KBquery_RightOf1 ?x)
				(and (RightOf0 ?x)
				(RightOf1 ?x))
				)
			(when (KBquery_RightOf2 ?x)
				(and (RightOf1 ?x)
				(RightOf2 ?x))
				)
			(when (KBquery_RightOf3 ?x)
				(and (RightOf2 ?x)
				(RightOf3 ?x))
				)
			(when (KBquery_RightOf4 ?x)
				(and (RightOf3 ?x)
				(RightOf4 ?x))
				)
			(when (KBquery_RightOf5 ?x)
				(and (RightOf4 ?x)
				(RightOf5 ?x))
				)
			(when (KBquery_RightOf6 ?x)
				(and (RightOf5 ?x)
				(RightOf6 ?x))
				)
			(when (KBquery_RightOf7 ?x)
				(and (RightOf6 ?x)
				(RightOf7 ?x))
				)
			(when (KBquery_RightOf8 ?x)
				(and (RightOf7 ?x)
				(RightOf8 ?x))
				)
			(when (KBquery_RightOf9 ?x)
				(and (RightOf8 ?x)
				(RightOf9 ?x))
				)
			(when (KBquery_RightOf10 ?x)
				(and (RightOf9 ?x)
				(RightOf10 ?x))
				)
			(when (KBquery_RightOf11 ?x)
				(and (RightOf10 ?x)
				(RightOf11 ?x))
				)
			(when (KBquery_RightOf12 ?x)
				(and (RightOf11 ?x)
				(RightOf12 ?x))
				)
			(when (KBquery_RightOf13 ?x)
				(and (RightOf12 ?x)
				(RightOf13 ?x))
				)
			(when (KBquery_RightOf14 ?x)
				(and (RightOf13 ?x)
				(RightOf14 ?x))
				)
			(when (KBquery_RightOf15 ?x)
				(and (RightOf14 ?x)
				(RightOf15 ?x))
				)
			(when (KBquery_RightOf16 ?x)
				(and (RightOf15 ?x)
				(RightOf16 ?x))
				)
			(when (KBquery_RightOf17 ?x)
				(and (RightOf16 ?x)
				(RightOf17 ?x))
				)
			(when (KBquery_RightOf18 ?x)
				(and (RightOf17 ?x)
				(RightOf18 ?x))
				)
			(when (KBquery_RightOf19 ?x)
				(and (RightOf18 ?x)
				(RightOf19 ?x))
				)
			(when (KBquery_RightOf20 ?x)
				(and (RightOf19 ?x)
				(RightOf20 ?x))
				)
			(when (KBquery_RightOf21 ?x)
				(and (RightOf20 ?x)
				(RightOf21 ?x))
				)
			(when (KBquery_RightOf22 ?x)
				(and (RightOf21 ?x)
				(RightOf22 ?x))
				)
			(when (KBquery_RightOf23 ?x)
				(and (RightOf22 ?x)
				(RightOf23 ?x))
				)
			(when (KBquery_RightOf24 ?x)
				(and (RightOf23 ?x)
				(RightOf24 ?x))
				)
			(when (KBquery_RightOf25 ?x)
				(and (RightOf24 ?x)
				(RightOf25 ?x))
				)
			(when (KBquery_RightOf26 ?x)
				(and (RightOf25 ?x)
				(RightOf26 ?x))
				)
			(when (KBquery_Column1 ?x)
				(and (Column0 ?x)
				(not (Column1 ?x)))
				)
			(when (KBquery_Column2 ?x)
				(and (Column1 ?x)
				(not (Column2 ?x)))
				)
			(when (KBquery_Column3 ?x)
				(and (Column2 ?x)
				(not (Column3 ?x)))
				)
			(when (KBquery_Column4 ?x)
				(and (Column3 ?x)
				(not (Column4 ?x)))
				)
			(when (KBquery_Column5 ?x)
				(and (Column4 ?x)
				(not (Column5 ?x)))
				)
			(when (KBquery_Column6 ?x)
				(and (Column5 ?x)
				(not (Column6 ?x)))
				)
			(when (KBquery_Column7 ?x)
				(and (Column6 ?x)
				(not (Column7 ?x)))
				)
			(when (KBquery_Column8 ?x)
				(and (Column7 ?x)
				(not (Column8 ?x)))
				)
			(when (KBquery_Column9 ?x)
				(and (Column8 ?x)
				(not (Column9 ?x)))
				)
			(when (KBquery_Column10 ?x)
				(and (Column9 ?x)
				(not (Column10 ?x)))
				)
			(when (KBquery_Column11 ?x)
				(and (Column10 ?x)
				(not (Column11 ?x)))
				)
			(when (KBquery_Column12 ?x)
				(and (Column11 ?x)
				(not (Column12 ?x)))
				)
			(when (KBquery_Column13 ?x)
				(and (Column12 ?x)
				(not (Column13 ?x)))
				)
			(when (KBquery_Column14 ?x)
				(and (Column13 ?x)
				(not (Column14 ?x)))
				)
			(when (KBquery_Column15 ?x)
				(and (Column14 ?x)
				(not (Column15 ?x)))
				)
			(when (KBquery_Column16 ?x)
				(and (Column15 ?x)
				(not (Column16 ?x)))
				)
			(when (KBquery_Column17 ?x)
				(and (Column16 ?x)
				(not (Column17 ?x)))
				)
			(when (KBquery_Column18 ?x)
				(and (Column17 ?x)
				(not (Column18 ?x)))
				)
			(when (KBquery_Column19 ?x)
				(and (Column18 ?x)
				(not (Column19 ?x)))
				)
			(when (KBquery_Column20 ?x)
				(and (Column19 ?x)
				(not (Column20 ?x)))
				)
			(when (KBquery_Column21 ?x)
				(and (Column20 ?x)
				(not (Column21 ?x)))
				)
			(when (KBquery_Column22 ?x)
				(and (Column21 ?x)
				(not (Column22 ?x)))
				)
			(when (KBquery_Column23 ?x)
				(and (Column22 ?x)
				(not (Column23 ?x)))
				)
			(when (KBquery_Column24 ?x)
				(and (Column23 ?x)
				(not (Column24 ?x)))
				)
			(when (KBquery_Column25 ?x)
				(and (Column24 ?x)
				(not (Column25 ?x)))
				)
			(when (KBquery_Column26 ?x)
				(and (Column25 ?x)
				(not (Column26 ?x)))
				)
			(when (and (KBquery_RightOf1 ?x) (KBquery_LeftOf2 ?x))
				(and (Column0 ?x))
				)
			(when (and (KBquery_RightOf2 ?x) (KBquery_LeftOf3 ?x))
				(and (Column1 ?x))
				)
			(when (and (KBquery_RightOf3 ?x) (KBquery_LeftOf4 ?x))
				(and (Column2 ?x))
				)
			(when (and (KBquery_RightOf4 ?x) (KBquery_LeftOf5 ?x))
				(and (Column3 ?x))
				)
			(when (and (KBquery_RightOf5 ?x) (KBquery_LeftOf6 ?x))
				(and (Column4 ?x))
				)
			(when (and (KBquery_RightOf6 ?x) (KBquery_LeftOf7 ?x))
				(and (Column5 ?x))
				)
			(when (and (KBquery_RightOf7 ?x) (KBquery_LeftOf8 ?x))
				(and (Column6 ?x))
				)
			(when (and (KBquery_RightOf8 ?x) (KBquery_LeftOf9 ?x))
				(and (Column7 ?x))
				)
			(when (and (KBquery_RightOf9 ?x) (KBquery_LeftOf10 ?x))
				(and (Column8 ?x))
				)
			(when (and (KBquery_RightOf10 ?x) (KBquery_LeftOf11 ?x))
				(and (Column9 ?x))
				)
			(when (and (KBquery_RightOf11 ?x) (KBquery_LeftOf12 ?x))
				(and (Column10 ?x))
				)
			(when (and (KBquery_RightOf12 ?x) (KBquery_LeftOf13 ?x))
				(and (Column11 ?x))
				)
			(when (and (KBquery_RightOf13 ?x) (KBquery_LeftOf14 ?x))
				(and (Column12 ?x))
				)
			(when (and (KBquery_RightOf14 ?x) (KBquery_LeftOf15 ?x))
				(and (Column13 ?x))
				)
			(when (and (KBquery_RightOf15 ?x) (KBquery_LeftOf16 ?x))
				(and (Column14 ?x))
				)
			(when (and (KBquery_RightOf16 ?x) (KBquery_LeftOf17 ?x))
				(and (Column15 ?x))
				)
			(when (and (KBquery_RightOf17 ?x) (KBquery_LeftOf18 ?x))
				(and (Column16 ?x))
				)
			(when (and (KBquery_RightOf18 ?x) (KBquery_LeftOf19 ?x))
				(and (Column17 ?x))
				)
			(when (and (KBquery_RightOf19 ?x) (KBquery_LeftOf20 ?x))
				(and (Column18 ?x))
				)
			(when (and (KBquery_RightOf20 ?x) (KBquery_LeftOf21 ?x))
				(and (Column19 ?x))
				)
			(when (and (KBquery_RightOf21 ?x) (KBquery_LeftOf22 ?x))
				(and (Column20 ?x))
				)
			(when (and (KBquery_RightOf22 ?x) (KBquery_LeftOf23 ?x))
				(and (Column21 ?x))
				)
			(when (and (KBquery_RightOf23 ?x) (KBquery_LeftOf24 ?x))
				(and (Column22 ?x))
				)
			(when (and (KBquery_RightOf24 ?x) (KBquery_LeftOf25 ?x))
				(and (Column23 ?x))
				)
			(when (and (KBquery_RightOf25 ?x) (KBquery_LeftOf26 ?x))
				(and (Column24 ?x))
				)
			(when (and (KBquery_RightOf26 ?x) (KBquery_LeftOf27 ?x))
				(and (Column25 ?x))
				)
		))
	(:action moveUp
		:parameters (?x)
		:precondition (and (KBquery_Rows ?x))
		:effect (and 
			(when (KBquery_AboveOf0 ?x)
				(and (AboveOf1 ?x))
				)
			(when (KBquery_AboveOf1 ?x)
				(and (AboveOf2 ?x))
				)
			(when (KBquery_AboveOf2 ?x)
				(and (AboveOf3 ?x))
				)
			(when (KBquery_AboveOf3 ?x)
				(and (AboveOf4 ?x))
				)
			(when (KBquery_AboveOf4 ?x)
				(and (AboveOf5 ?x))
				)
			(when (KBquery_AboveOf5 ?x)
				(and (AboveOf6 ?x))
				)
			(when (KBquery_AboveOf6 ?x)
				(and (AboveOf7 ?x))
				)
			(when (KBquery_AboveOf7 ?x)
				(and (AboveOf8 ?x))
				)
			(when (KBquery_AboveOf8 ?x)
				(and (AboveOf9 ?x))
				)
			(when (KBquery_AboveOf9 ?x)
				(and (AboveOf10 ?x))
				)
			(when (KBquery_AboveOf10 ?x)
				(and (AboveOf11 ?x))
				)
			(when (KBquery_AboveOf11 ?x)
				(and (AboveOf12 ?x))
				)
			(when (KBquery_AboveOf12 ?x)
				(and (AboveOf13 ?x))
				)
			(when (KBquery_AboveOf13 ?x)
				(and (AboveOf14 ?x))
				)
			(when (KBquery_AboveOf14 ?x)
				(and (AboveOf15 ?x))
				)
			(when (KBquery_AboveOf15 ?x)
				(and (AboveOf16 ?x))
				)
			(when (KBquery_AboveOf16 ?x)
				(and (AboveOf17 ?x))
				)
			(when (KBquery_AboveOf17 ?x)
				(and (AboveOf18 ?x))
				)
			(when (KBquery_AboveOf18 ?x)
				(and (AboveOf19 ?x))
				)
			(when (KBquery_AboveOf19 ?x)
				(and (AboveOf20 ?x))
				)
			(when (KBquery_AboveOf20 ?x)
				(and (AboveOf21 ?x))
				)
			(when (KBquery_AboveOf21 ?x)
				(and (AboveOf22 ?x))
				)
			(when (KBquery_AboveOf22 ?x)
				(and (AboveOf23 ?x))
				)
			(when (KBquery_AboveOf23 ?x)
				(and (AboveOf24 ?x))
				)
			(when (KBquery_AboveOf24 ?x)
				(and (AboveOf25 ?x))
				)
			(when (KBquery_AboveOf25 ?x)
				(and (AboveOf26 ?x))
				)
			(when (KBquery_BelowOf1 ?x)
				(and (BelowOf2 ?x)
				(not (BelowOf1 ?x)))
				)
			(when (KBquery_BelowOf2 ?x)
				(and (BelowOf3 ?x)
				(not (BelowOf2 ?x)))
				)
			(when (KBquery_BelowOf3 ?x)
				(and (BelowOf4 ?x)
				(not (BelowOf3 ?x)))
				)
			(when (KBquery_BelowOf4 ?x)
				(and (BelowOf5 ?x)
				(not (BelowOf4 ?x)))
				)
			(when (KBquery_BelowOf5 ?x)
				(and (BelowOf6 ?x)
				(not (BelowOf5 ?x)))
				)
			(when (KBquery_BelowOf6 ?x)
				(and (BelowOf7 ?x)
				(not (BelowOf6 ?x)))
				)
			(when (KBquery_BelowOf7 ?x)
				(and (BelowOf8 ?x)
				(not (BelowOf7 ?x)))
				)
			(when (KBquery_BelowOf8 ?x)
				(and (BelowOf9 ?x)
				(not (BelowOf8 ?x)))
				)
			(when (KBquery_BelowOf9 ?x)
				(and (BelowOf10 ?x)
				(not (BelowOf9 ?x)))
				)
			(when (KBquery_BelowOf10 ?x)
				(and (BelowOf11 ?x)
				(not (BelowOf10 ?x)))
				)
			(when (KBquery_BelowOf11 ?x)
				(and (BelowOf12 ?x)
				(not (BelowOf11 ?x)))
				)
			(when (KBquery_BelowOf12 ?x)
				(and (BelowOf13 ?x)
				(not (BelowOf12 ?x)))
				)
			(when (KBquery_BelowOf13 ?x)
				(and (BelowOf14 ?x)
				(not (BelowOf13 ?x)))
				)
			(when (KBquery_BelowOf14 ?x)
				(and (BelowOf15 ?x)
				(not (BelowOf14 ?x)))
				)
			(when (KBquery_BelowOf15 ?x)
				(and (BelowOf16 ?x)
				(not (BelowOf15 ?x)))
				)
			(when (KBquery_BelowOf16 ?x)
				(and (BelowOf17 ?x)
				(not (BelowOf16 ?x)))
				)
			(when (KBquery_BelowOf17 ?x)
				(and (BelowOf18 ?x)
				(not (BelowOf17 ?x)))
				)
			(when (KBquery_BelowOf18 ?x)
				(and (BelowOf19 ?x)
				(not (BelowOf18 ?x)))
				)
			(when (KBquery_BelowOf19 ?x)
				(and (BelowOf20 ?x)
				(not (BelowOf19 ?x)))
				)
			(when (KBquery_BelowOf20 ?x)
				(and (BelowOf21 ?x)
				(not (BelowOf20 ?x)))
				)
			(when (KBquery_BelowOf21 ?x)
				(and (BelowOf22 ?x)
				(not (BelowOf21 ?x)))
				)
			(when (KBquery_BelowOf22 ?x)
				(and (BelowOf23 ?x)
				(not (BelowOf22 ?x)))
				)
			(when (KBquery_BelowOf23 ?x)
				(and (BelowOf24 ?x)
				(not (BelowOf23 ?x)))
				)
			(when (KBquery_BelowOf24 ?x)
				(and (BelowOf25 ?x)
				(not (BelowOf24 ?x)))
				)
			(when (KBquery_BelowOf25 ?x)
				(and (BelowOf26 ?x)
				(not (BelowOf25 ?x)))
				)
			(when (KBquery_BelowOf26 ?x)
				(and (BelowOf27 ?x)
				(not (BelowOf26 ?x)))
				)
			(when (KBquery_Row0 ?x)
				(and (Row1 ?x)
				(not (Row0 ?x)))
				)
			(when (KBquery_Row1 ?x)
				(and (Row2 ?x)
				(not (Row1 ?x)))
				)
			(when (KBquery_Row2 ?x)
				(and (Row3 ?x)
				(not (Row2 ?x)))
				)
			(when (KBquery_Row3 ?x)
				(and (Row4 ?x)
				(not (Row3 ?x)))
				)
			(when (KBquery_Row4 ?x)
				(and (Row5 ?x)
				(not (Row4 ?x)))
				)
			(when (KBquery_Row5 ?x)
				(and (Row6 ?x)
				(not (Row5 ?x)))
				)
			(when (KBquery_Row6 ?x)
				(and (Row7 ?x)
				(not (Row6 ?x)))
				)
			(when (KBquery_Row7 ?x)
				(and (Row8 ?x)
				(not (Row7 ?x)))
				)
			(when (KBquery_Row8 ?x)
				(and (Row9 ?x)
				(not (Row8 ?x)))
				)
			(when (KBquery_Row9 ?x)
				(and (Row10 ?x)
				(not (Row9 ?x)))
				)
			(when (KBquery_Row10 ?x)
				(and (Row11 ?x)
				(not (Row10 ?x)))
				)
			(when (KBquery_Row11 ?x)
				(and (Row12 ?x)
				(not (Row11 ?x)))
				)
			(when (KBquery_Row12 ?x)
				(and (Row13 ?x)
				(not (Row12 ?x)))
				)
			(when (KBquery_Row13 ?x)
				(and (Row14 ?x)
				(not (Row13 ?x)))
				)
			(when (KBquery_Row14 ?x)
				(and (Row15 ?x)
				(not (Row14 ?x)))
				)
			(when (KBquery_Row15 ?x)
				(and (Row16 ?x)
				(not (Row15 ?x)))
				)
			(when (KBquery_Row16 ?x)
				(and (Row17 ?x)
				(not (Row16 ?x)))
				)
			(when (KBquery_Row17 ?x)
				(and (Row18 ?x)
				(not (Row17 ?x)))
				)
			(when (KBquery_Row18 ?x)
				(and (Row19 ?x)
				(not (Row18 ?x)))
				)
			(when (KBquery_Row19 ?x)
				(and (Row20 ?x)
				(not (Row19 ?x)))
				)
			(when (KBquery_Row20 ?x)
				(and (Row21 ?x)
				(not (Row20 ?x)))
				)
			(when (KBquery_Row21 ?x)
				(and (Row22 ?x)
				(not (Row21 ?x)))
				)
			(when (KBquery_Row22 ?x)
				(and (Row23 ?x)
				(not (Row22 ?x)))
				)
			(when (KBquery_Row23 ?x)
				(and (Row24 ?x)
				(not (Row23 ?x)))
				)
			(when (KBquery_Row24 ?x)
				(and (Row25 ?x)
				(not (Row24 ?x)))
				)
			(when (KBquery_Row25 ?x)
				(and (Row26 ?x)
				(not (Row25 ?x)))
				)
			(when (and (KBquery_AboveOf0 ?x) (KBquery_BelowOf1 ?x))
				(and (Row1 ?x))
				)
			(when (and (KBquery_AboveOf1 ?x) (KBquery_BelowOf2 ?x))
				(and (Row2 ?x))
				)
			(when (and (KBquery_AboveOf2 ?x) (KBquery_BelowOf3 ?x))
				(and (Row3 ?x))
				)
			(when (and (KBquery_AboveOf3 ?x) (KBquery_BelowOf4 ?x))
				(and (Row4 ?x))
				)
			(when (and (KBquery_AboveOf4 ?x) (KBquery_BelowOf5 ?x))
				(and (Row5 ?x))
				)
			(when (and (KBquery_AboveOf5 ?x) (KBquery_BelowOf6 ?x))
				(and (Row6 ?x))
				)
			(when (and (KBquery_AboveOf6 ?x) (KBquery_BelowOf7 ?x))
				(and (Row7 ?x))
				)
			(when (and (KBquery_AboveOf7 ?x) (KBquery_BelowOf8 ?x))
				(and (Row8 ?x))
				)
			(when (and (KBquery_AboveOf8 ?x) (KBquery_BelowOf9 ?x))
				(and (Row9 ?x))
				)
			(when (and (KBquery_AboveOf9 ?x) (KBquery_BelowOf10 ?x))
				(and (Row10 ?x))
				)
			(when (and (KBquery_AboveOf10 ?x) (KBquery_BelowOf11 ?x))
				(and (Row11 ?x))
				)
			(when (and (KBquery_AboveOf11 ?x) (KBquery_BelowOf12 ?x))
				(and (Row12 ?x))
				)
			(when (and (KBquery_AboveOf12 ?x) (KBquery_BelowOf13 ?x))
				(and (Row13 ?x))
				)
			(when (and (KBquery_AboveOf13 ?x) (KBquery_BelowOf14 ?x))
				(and (Row14 ?x))
				)
			(when (and (KBquery_AboveOf14 ?x) (KBquery_BelowOf15 ?x))
				(and (Row15 ?x))
				)
			(when (and (KBquery_AboveOf15 ?x) (KBquery_BelowOf16 ?x))
				(and (Row16 ?x))
				)
			(when (and (KBquery_AboveOf16 ?x) (KBquery_BelowOf17 ?x))
				(and (Row17 ?x))
				)
			(when (and (KBquery_AboveOf17 ?x) (KBquery_BelowOf18 ?x))
				(and (Row18 ?x))
				)
			(when (and (KBquery_AboveOf18 ?x) (KBquery_BelowOf19 ?x))
				(and (Row19 ?x))
				)
			(when (and (KBquery_AboveOf19 ?x) (KBquery_BelowOf20 ?x))
				(and (Row20 ?x))
				)
			(when (and (KBquery_AboveOf20 ?x) (KBquery_BelowOf21 ?x))
				(and (Row21 ?x))
				)
			(when (and (KBquery_AboveOf21 ?x) (KBquery_BelowOf22 ?x))
				(and (Row22 ?x))
				)
			(when (and (KBquery_AboveOf22 ?x) (KBquery_BelowOf23 ?x))
				(and (Row23 ?x))
				)
			(when (and (KBquery_AboveOf23 ?x) (KBquery_BelowOf24 ?x))
				(and (Row24 ?x))
				)
			(when (and (KBquery_AboveOf24 ?x) (KBquery_BelowOf25 ?x))
				(and (Row25 ?x))
				)
			(when (and (KBquery_AboveOf25 ?x) (KBquery_BelowOf26 ?x))
				(and (Row26 ?x))
				)
		))
	(:action moveDown
		:parameters (?x)
		:precondition (and (KBquery_Rows ?x))
		:effect (and 
			(when (KBquery_BelowOf2 ?x)
				(and (BelowOf1 ?x))
				)
			(when (KBquery_BelowOf3 ?x)
				(and (BelowOf2 ?x))
				)
			(when (KBquery_BelowOf4 ?x)
				(and (BelowOf3 ?x))
				)
			(when (KBquery_BelowOf5 ?x)
				(and (BelowOf4 ?x))
				)
			(when (KBquery_BelowOf6 ?x)
				(and (BelowOf5 ?x))
				)
			(when (KBquery_BelowOf7 ?x)
				(and (BelowOf6 ?x))
				)
			(when (KBquery_BelowOf8 ?x)
				(and (BelowOf7 ?x))
				)
			(when (KBquery_BelowOf9 ?x)
				(and (BelowOf8 ?x))
				)
			(when (KBquery_BelowOf10 ?x)
				(and (BelowOf9 ?x))
				)
			(when (KBquery_BelowOf11 ?x)
				(and (BelowOf10 ?x))
				)
			(when (KBquery_BelowOf12 ?x)
				(and (BelowOf11 ?x))
				)
			(when (KBquery_BelowOf13 ?x)
				(and (BelowOf12 ?x))
				)
			(when (KBquery_BelowOf14 ?x)
				(and (BelowOf13 ?x))
				)
			(when (KBquery_BelowOf15 ?x)
				(and (BelowOf14 ?x))
				)
			(when (KBquery_BelowOf16 ?x)
				(and (BelowOf15 ?x))
				)
			(when (KBquery_BelowOf17 ?x)
				(and (BelowOf16 ?x))
				)
			(when (KBquery_BelowOf18 ?x)
				(and (BelowOf17 ?x))
				)
			(when (KBquery_BelowOf19 ?x)
				(and (BelowOf18 ?x))
				)
			(when (KBquery_BelowOf20 ?x)
				(and (BelowOf19 ?x))
				)
			(when (KBquery_BelowOf21 ?x)
				(and (BelowOf20 ?x))
				)
			(when (KBquery_BelowOf22 ?x)
				(and (BelowOf21 ?x))
				)
			(when (KBquery_BelowOf23 ?x)
				(and (BelowOf22 ?x))
				)
			(when (KBquery_BelowOf24 ?x)
				(and (BelowOf23 ?x))
				)
			(when (KBquery_BelowOf25 ?x)
				(and (BelowOf24 ?x))
				)
			(when (KBquery_BelowOf26 ?x)
				(and (BelowOf25 ?x))
				)
			(when (KBquery_BelowOf27 ?x)
				(and (BelowOf26 ?x))
				)
			(when (KBquery_AboveOf1 ?x)
				(and (AboveOf0 ?x)
				(not (AboveOf1 ?x)))
				)
			(when (KBquery_AboveOf2 ?x)
				(and (AboveOf1 ?x)
				(not (AboveOf2 ?x)))
				)
			(when (KBquery_AboveOf3 ?x)
				(and (AboveOf2 ?x)
				(not (AboveOf3 ?x)))
				)
			(when (KBquery_AboveOf4 ?x)
				(and (AboveOf3 ?x)
				(not (AboveOf4 ?x)))
				)
			(when (KBquery_AboveOf5 ?x)
				(and (AboveOf4 ?x)
				(not (AboveOf5 ?x)))
				)
			(when (KBquery_AboveOf6 ?x)
				(and (AboveOf5 ?x)
				(not (AboveOf6 ?x)))
				)
			(when (KBquery_AboveOf7 ?x)
				(and (AboveOf6 ?x)
				(not (AboveOf7 ?x)))
				)
			(when (KBquery_AboveOf8 ?x)
				(and (AboveOf7 ?x)
				(not (AboveOf8 ?x)))
				)
			(when (KBquery_AboveOf9 ?x)
				(and (AboveOf8 ?x)
				(not (AboveOf9 ?x)))
				)
			(when (KBquery_AboveOf10 ?x)
				(and (AboveOf9 ?x)
				(not (AboveOf10 ?x)))
				)
			(when (KBquery_AboveOf11 ?x)
				(and (AboveOf10 ?x)
				(not (AboveOf11 ?x)))
				)
			(when (KBquery_AboveOf12 ?x)
				(and (AboveOf11 ?x)
				(not (AboveOf12 ?x)))
				)
			(when (KBquery_AboveOf13 ?x)
				(and (AboveOf12 ?x)
				(not (AboveOf13 ?x)))
				)
			(when (KBquery_AboveOf14 ?x)
				(and (AboveOf13 ?x)
				(not (AboveOf14 ?x)))
				)
			(when (KBquery_AboveOf15 ?x)
				(and (AboveOf14 ?x)
				(not (AboveOf15 ?x)))
				)
			(when (KBquery_AboveOf16 ?x)
				(and (AboveOf15 ?x)
				(not (AboveOf16 ?x)))
				)
			(when (KBquery_AboveOf17 ?x)
				(and (AboveOf16 ?x)
				(not (AboveOf17 ?x)))
				)
			(when (KBquery_AboveOf18 ?x)
				(and (AboveOf17 ?x)
				(not (AboveOf18 ?x)))
				)
			(when (KBquery_AboveOf19 ?x)
				(and (AboveOf18 ?x)
				(not (AboveOf19 ?x)))
				)
			(when (KBquery_AboveOf20 ?x)
				(and (AboveOf19 ?x)
				(not (AboveOf20 ?x)))
				)
			(when (KBquery_AboveOf21 ?x)
				(and (AboveOf20 ?x)
				(not (AboveOf21 ?x)))
				)
			(when (KBquery_AboveOf22 ?x)
				(and (AboveOf21 ?x)
				(not (AboveOf22 ?x)))
				)
			(when (KBquery_AboveOf23 ?x)
				(and (AboveOf22 ?x)
				(not (AboveOf23 ?x)))
				)
			(when (KBquery_AboveOf24 ?x)
				(and (AboveOf23 ?x)
				(not (AboveOf24 ?x)))
				)
			(when (KBquery_AboveOf25 ?x)
				(and (AboveOf24 ?x)
				(not (AboveOf25 ?x)))
				)
			(when (KBquery_AboveOf26 ?x)
				(and (AboveOf25 ?x)
				(not (AboveOf26 ?x)))
				)
			(when (KBquery_Row1 ?x)
				(and (Row0 ?x)
				(not (Row1 ?x)))
				)
			(when (KBquery_Row2 ?x)
				(and (Row1 ?x)
				(not (Row2 ?x)))
				)
			(when (KBquery_Row3 ?x)
				(and (Row2 ?x)
				(not (Row3 ?x)))
				)
			(when (KBquery_Row4 ?x)
				(and (Row3 ?x)
				(not (Row4 ?x)))
				)
			(when (KBquery_Row5 ?x)
				(and (Row4 ?x)
				(not (Row5 ?x)))
				)
			(when (KBquery_Row6 ?x)
				(and (Row5 ?x)
				(not (Row6 ?x)))
				)
			(when (KBquery_Row7 ?x)
				(and (Row6 ?x)
				(not (Row7 ?x)))
				)
			(when (KBquery_Row8 ?x)
				(and (Row7 ?x)
				(not (Row8 ?x)))
				)
			(when (KBquery_Row9 ?x)
				(and (Row8 ?x)
				(not (Row9 ?x)))
				)
			(when (KBquery_Row10 ?x)
				(and (Row9 ?x)
				(not (Row10 ?x)))
				)
			(when (KBquery_Row11 ?x)
				(and (Row10 ?x)
				(not (Row11 ?x)))
				)
			(when (KBquery_Row12 ?x)
				(and (Row11 ?x)
				(not (Row12 ?x)))
				)
			(when (KBquery_Row13 ?x)
				(and (Row12 ?x)
				(not (Row13 ?x)))
				)
			(when (KBquery_Row14 ?x)
				(and (Row13 ?x)
				(not (Row14 ?x)))
				)
			(when (KBquery_Row15 ?x)
				(and (Row14 ?x)
				(not (Row15 ?x)))
				)
			(when (KBquery_Row16 ?x)
				(and (Row15 ?x)
				(not (Row16 ?x)))
				)
			(when (KBquery_Row17 ?x)
				(and (Row16 ?x)
				(not (Row17 ?x)))
				)
			(when (KBquery_Row18 ?x)
				(and (Row17 ?x)
				(not (Row18 ?x)))
				)
			(when (KBquery_Row19 ?x)
				(and (Row18 ?x)
				(not (Row19 ?x)))
				)
			(when (KBquery_Row20 ?x)
				(and (Row19 ?x)
				(not (Row20 ?x)))
				)
			(when (KBquery_Row21 ?x)
				(and (Row20 ?x)
				(not (Row21 ?x)))
				)
			(when (KBquery_Row22 ?x)
				(and (Row21 ?x)
				(not (Row22 ?x)))
				)
			(when (KBquery_Row23 ?x)
				(and (Row22 ?x)
				(not (Row23 ?x)))
				)
			(when (KBquery_Row24 ?x)
				(and (Row23 ?x)
				(not (Row24 ?x)))
				)
			(when (KBquery_Row25 ?x)
				(and (Row24 ?x)
				(not (Row25 ?x)))
				)
			(when (KBquery_Row26 ?x)
				(and (Row25 ?x)
				(not (Row26 ?x)))
				)
			(when (and (KBquery_AboveOf1 ?x) (KBquery_BelowOf2 ?x))
				(and (Row0 ?x))
				)
			(when (and (KBquery_AboveOf2 ?x) (KBquery_BelowOf3 ?x))
				(and (Row1 ?x))
				)
			(when (and (KBquery_AboveOf3 ?x) (KBquery_BelowOf4 ?x))
				(and (Row2 ?x))
				)
			(when (and (KBquery_AboveOf4 ?x) (KBquery_BelowOf5 ?x))
				(and (Row3 ?x))
				)
			(when (and (KBquery_AboveOf5 ?x) (KBquery_BelowOf6 ?x))
				(and (Row4 ?x))
				)
			(when (and (KBquery_AboveOf6 ?x) (KBquery_BelowOf7 ?x))
				(and (Row5 ?x))
				)
			(when (and (KBquery_AboveOf7 ?x) (KBquery_BelowOf8 ?x))
				(and (Row6 ?x))
				)
			(when (and (KBquery_AboveOf8 ?x) (KBquery_BelowOf9 ?x))
				(and (Row7 ?x))
				)
			(when (and (KBquery_AboveOf9 ?x) (KBquery_BelowOf10 ?x))
				(and (Row8 ?x))
				)
			(when (and (KBquery_AboveOf10 ?x) (KBquery_BelowOf11 ?x))
				(and (Row9 ?x))
				)
			(when (and (KBquery_AboveOf11 ?x) (KBquery_BelowOf12 ?x))
				(and (Row10 ?x))
				)
			(when (and (KBquery_AboveOf12 ?x) (KBquery_BelowOf13 ?x))
				(and (Row11 ?x))
				)
			(when (and (KBquery_AboveOf13 ?x) (KBquery_BelowOf14 ?x))
				(and (Row12 ?x))
				)
			(when (and (KBquery_AboveOf14 ?x) (KBquery_BelowOf15 ?x))
				(and (Row13 ?x))
				)
			(when (and (KBquery_AboveOf15 ?x) (KBquery_BelowOf16 ?x))
				(and (Row14 ?x))
				)
			(when (and (KBquery_AboveOf16 ?x) (KBquery_BelowOf17 ?x))
				(and (Row15 ?x))
				)
			(when (and (KBquery_AboveOf17 ?x) (KBquery_BelowOf18 ?x))
				(and (Row16 ?x))
				)
			(when (and (KBquery_AboveOf18 ?x) (KBquery_BelowOf19 ?x))
				(and (Row17 ?x))
				)
			(when (and (KBquery_AboveOf19 ?x) (KBquery_BelowOf20 ?x))
				(and (Row18 ?x))
				)
			(when (and (KBquery_AboveOf20 ?x) (KBquery_BelowOf21 ?x))
				(and (Row19 ?x))
				)
			(when (and (KBquery_AboveOf21 ?x) (KBquery_BelowOf22 ?x))
				(and (Row20 ?x))
				)
			(when (and (KBquery_AboveOf22 ?x) (KBquery_BelowOf23 ?x))
				(and (Row21 ?x))
				)
			(when (and (KBquery_AboveOf23 ?x) (KBquery_BelowOf24 ?x))
				(and (Row22 ?x))
				)
			(when (and (KBquery_AboveOf24 ?x) (KBquery_BelowOf25 ?x))
				(and (Row23 ?x))
				)
			(when (and (KBquery_AboveOf25 ?x) (KBquery_BelowOf26 ?x))
				(and (Row24 ?x))
				)
			(when (and (KBquery_AboveOf26 ?x) (KBquery_BelowOf27 ?x))
				(and (Row25 ?x))
				)
		))

)
