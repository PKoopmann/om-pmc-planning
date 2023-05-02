(define (domain robot)
	(:predicates
(KBquery_AboveOf0 ?x)
(KBquery_AboveOf1 ?x)
(KBquery_AboveOf10 ?x)
(KBquery_AboveOf2 ?x)
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
(KBquery_BelowOf2 ?x)
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
(KBquery_Column2 ?x)
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
(KBquery_LeftOf2 ?x)
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
(KBquery_RightOf2 ?x)
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
(KBquery_Row2 ?x)
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
		))

)
