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
		(Column21 ?x)
		(Column22 ?x)
		(Column23 ?x)
		(Column24 ?x)
		(Column25 ?x)
		(Column26 ?x)
		(Column27 ?x)
		(Column28 ?x)
		(Column29 ?x)
		(Column30 ?x)
		(Column31 ?x)
		(Column32 ?x)
		(Column33 ?x)
		(Column34 ?x)
		(Column35 ?x)
		(Column36 ?x)
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
		(RightOf27 ?x)
		(RightOf28 ?x)
		(RightOf29 ?x)
		(RightOf30 ?x)
		(RightOf31 ?x)
		(RightOf32 ?x)
		(RightOf33 ?x)
		(RightOf34 ?x)
		(RightOf35 ?x)
		(RightOf36 ?x)
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
		(LeftOf28 ?x)
		(LeftOf29 ?x)
		(LeftOf30 ?x)
		(LeftOf31 ?x)
		(LeftOf32 ?x)
		(LeftOf33 ?x)
		(LeftOf34 ?x)
		(LeftOf35 ?x)
		(LeftOf36 ?x)
		(LeftOf37 ?x)
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
		(Row27 ?x)
		(Row28 ?x)
		(Row29 ?x)
		(Row30 ?x)
		(Row31 ?x)
		(Row32 ?x)
		(Row33 ?x)
		(Row34 ?x)
		(Row35 ?x)
		(Row36 ?x)
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
		(AboveOf27 ?x)
		(AboveOf28 ?x)
		(AboveOf29 ?x)
		(AboveOf30 ?x)
		(AboveOf31 ?x)
		(AboveOf32 ?x)
		(AboveOf33 ?x)
		(AboveOf34 ?x)
		(AboveOf35 ?x)
		(AboveOf36 ?x)
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
		(BelowOf28 ?x)
		(BelowOf29 ?x)
		(BelowOf30 ?x)
		(BelowOf31 ?x)
		(BelowOf32 ?x)
		(BelowOf33 ?x)
		(BelowOf34 ?x)
		(BelowOf35 ?x)
		(BelowOf36 ?x)
		(BelowOf37 ?x)
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
			(when (mko (RightOf20 ?x))
				(and (RightOf21 ?x))
				)
			(when (mko (RightOf21 ?x))
				(and (RightOf22 ?x))
				)
			(when (mko (RightOf22 ?x))
				(and (RightOf23 ?x))
				)
			(when (mko (RightOf23 ?x))
				(and (RightOf24 ?x))
				)
			(when (mko (RightOf24 ?x))
				(and (RightOf25 ?x))
				)
			(when (mko (RightOf25 ?x))
				(and (RightOf26 ?x))
				)
			(when (mko (RightOf26 ?x))
				(and (RightOf27 ?x))
				)
			(when (mko (RightOf27 ?x))
				(and (RightOf28 ?x))
				)
			(when (mko (RightOf28 ?x))
				(and (RightOf29 ?x))
				)
			(when (mko (RightOf29 ?x))
				(and (RightOf30 ?x))
				)
			(when (mko (RightOf30 ?x))
				(and (RightOf31 ?x))
				)
			(when (mko (RightOf31 ?x))
				(and (RightOf32 ?x))
				)
			(when (mko (RightOf32 ?x))
				(and (RightOf33 ?x))
				)
			(when (mko (RightOf33 ?x))
				(and (RightOf34 ?x))
				)
			(when (mko (RightOf34 ?x))
				(and (RightOf35 ?x))
				)
			(when (mko (RightOf35 ?x))
				(and (RightOf36 ?x))
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
			(when (mko (LeftOf21 ?x))
				(and (LeftOf22 ?x)
				(not (LeftOf21 ?x)))
				)
			(when (mko (LeftOf22 ?x))
				(and (LeftOf23 ?x)
				(not (LeftOf22 ?x)))
				)
			(when (mko (LeftOf23 ?x))
				(and (LeftOf24 ?x)
				(not (LeftOf23 ?x)))
				)
			(when (mko (LeftOf24 ?x))
				(and (LeftOf25 ?x)
				(not (LeftOf24 ?x)))
				)
			(when (mko (LeftOf25 ?x))
				(and (LeftOf26 ?x)
				(not (LeftOf25 ?x)))
				)
			(when (mko (LeftOf26 ?x))
				(and (LeftOf27 ?x)
				(not (LeftOf26 ?x)))
				)
			(when (mko (LeftOf27 ?x))
				(and (LeftOf28 ?x)
				(not (LeftOf27 ?x)))
				)
			(when (mko (LeftOf28 ?x))
				(and (LeftOf29 ?x)
				(not (LeftOf28 ?x)))
				)
			(when (mko (LeftOf29 ?x))
				(and (LeftOf30 ?x)
				(not (LeftOf29 ?x)))
				)
			(when (mko (LeftOf30 ?x))
				(and (LeftOf31 ?x)
				(not (LeftOf30 ?x)))
				)
			(when (mko (LeftOf31 ?x))
				(and (LeftOf32 ?x)
				(not (LeftOf31 ?x)))
				)
			(when (mko (LeftOf32 ?x))
				(and (LeftOf33 ?x)
				(not (LeftOf32 ?x)))
				)
			(when (mko (LeftOf33 ?x))
				(and (LeftOf34 ?x)
				(not (LeftOf33 ?x)))
				)
			(when (mko (LeftOf34 ?x))
				(and (LeftOf35 ?x)
				(not (LeftOf34 ?x)))
				)
			(when (mko (LeftOf35 ?x))
				(and (LeftOf36 ?x)
				(not (LeftOf35 ?x)))
				)
			(when (mko (LeftOf36 ?x))
				(and (LeftOf37 ?x)
				(not (LeftOf36 ?x)))
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
			(when (mko (LeftOf22 ?x))
				(and (LeftOf21 ?x))
				)
			(when (mko (LeftOf23 ?x))
				(and (LeftOf22 ?x))
				)
			(when (mko (LeftOf24 ?x))
				(and (LeftOf23 ?x))
				)
			(when (mko (LeftOf25 ?x))
				(and (LeftOf24 ?x))
				)
			(when (mko (LeftOf26 ?x))
				(and (LeftOf25 ?x))
				)
			(when (mko (LeftOf27 ?x))
				(and (LeftOf26 ?x))
				)
			(when (mko (LeftOf28 ?x))
				(and (LeftOf27 ?x))
				)
			(when (mko (LeftOf29 ?x))
				(and (LeftOf28 ?x))
				)
			(when (mko (LeftOf30 ?x))
				(and (LeftOf29 ?x))
				)
			(when (mko (LeftOf31 ?x))
				(and (LeftOf30 ?x))
				)
			(when (mko (LeftOf32 ?x))
				(and (LeftOf31 ?x))
				)
			(when (mko (LeftOf33 ?x))
				(and (LeftOf32 ?x))
				)
			(when (mko (LeftOf34 ?x))
				(and (LeftOf33 ?x))
				)
			(when (mko (LeftOf35 ?x))
				(and (LeftOf34 ?x))
				)
			(when (mko (LeftOf36 ?x))
				(and (LeftOf35 ?x))
				)
			(when (mko (LeftOf37 ?x))
				(and (LeftOf36 ?x))
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
			(when (mko (RightOf21 ?x))
				(and (RightOf20 ?x)
				(RightOf21 ?x))
				)
			(when (mko (RightOf22 ?x))
				(and (RightOf21 ?x)
				(RightOf22 ?x))
				)
			(when (mko (RightOf23 ?x))
				(and (RightOf22 ?x)
				(RightOf23 ?x))
				)
			(when (mko (RightOf24 ?x))
				(and (RightOf23 ?x)
				(RightOf24 ?x))
				)
			(when (mko (RightOf25 ?x))
				(and (RightOf24 ?x)
				(RightOf25 ?x))
				)
			(when (mko (RightOf26 ?x))
				(and (RightOf25 ?x)
				(RightOf26 ?x))
				)
			(when (mko (RightOf27 ?x))
				(and (RightOf26 ?x)
				(RightOf27 ?x))
				)
			(when (mko (RightOf28 ?x))
				(and (RightOf27 ?x)
				(RightOf28 ?x))
				)
			(when (mko (RightOf29 ?x))
				(and (RightOf28 ?x)
				(RightOf29 ?x))
				)
			(when (mko (RightOf30 ?x))
				(and (RightOf29 ?x)
				(RightOf30 ?x))
				)
			(when (mko (RightOf31 ?x))
				(and (RightOf30 ?x)
				(RightOf31 ?x))
				)
			(when (mko (RightOf32 ?x))
				(and (RightOf31 ?x)
				(RightOf32 ?x))
				)
			(when (mko (RightOf33 ?x))
				(and (RightOf32 ?x)
				(RightOf33 ?x))
				)
			(when (mko (RightOf34 ?x))
				(and (RightOf33 ?x)
				(RightOf34 ?x))
				)
			(when (mko (RightOf35 ?x))
				(and (RightOf34 ?x)
				(RightOf35 ?x))
				)
			(when (mko (RightOf36 ?x))
				(and (RightOf35 ?x)
				(RightOf36 ?x))
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
			(when (mko (AboveOf20 ?x))
				(and (AboveOf21 ?x))
				)
			(when (mko (AboveOf21 ?x))
				(and (AboveOf22 ?x))
				)
			(when (mko (AboveOf22 ?x))
				(and (AboveOf23 ?x))
				)
			(when (mko (AboveOf23 ?x))
				(and (AboveOf24 ?x))
				)
			(when (mko (AboveOf24 ?x))
				(and (AboveOf25 ?x))
				)
			(when (mko (AboveOf25 ?x))
				(and (AboveOf26 ?x))
				)
			(when (mko (AboveOf26 ?x))
				(and (AboveOf27 ?x))
				)
			(when (mko (AboveOf27 ?x))
				(and (AboveOf28 ?x))
				)
			(when (mko (AboveOf28 ?x))
				(and (AboveOf29 ?x))
				)
			(when (mko (AboveOf29 ?x))
				(and (AboveOf30 ?x))
				)
			(when (mko (AboveOf30 ?x))
				(and (AboveOf31 ?x))
				)
			(when (mko (AboveOf31 ?x))
				(and (AboveOf32 ?x))
				)
			(when (mko (AboveOf32 ?x))
				(and (AboveOf33 ?x))
				)
			(when (mko (AboveOf33 ?x))
				(and (AboveOf34 ?x))
				)
			(when (mko (AboveOf34 ?x))
				(and (AboveOf35 ?x))
				)
			(when (mko (AboveOf35 ?x))
				(and (AboveOf36 ?x))
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
			(when (mko (BelowOf21 ?x))
				(and (BelowOf22 ?x)
				(not (BelowOf21 ?x)))
				)
			(when (mko (BelowOf22 ?x))
				(and (BelowOf23 ?x)
				(not (BelowOf22 ?x)))
				)
			(when (mko (BelowOf23 ?x))
				(and (BelowOf24 ?x)
				(not (BelowOf23 ?x)))
				)
			(when (mko (BelowOf24 ?x))
				(and (BelowOf25 ?x)
				(not (BelowOf24 ?x)))
				)
			(when (mko (BelowOf25 ?x))
				(and (BelowOf26 ?x)
				(not (BelowOf25 ?x)))
				)
			(when (mko (BelowOf26 ?x))
				(and (BelowOf27 ?x)
				(not (BelowOf26 ?x)))
				)
			(when (mko (BelowOf27 ?x))
				(and (BelowOf28 ?x)
				(not (BelowOf27 ?x)))
				)
			(when (mko (BelowOf28 ?x))
				(and (BelowOf29 ?x)
				(not (BelowOf28 ?x)))
				)
			(when (mko (BelowOf29 ?x))
				(and (BelowOf30 ?x)
				(not (BelowOf29 ?x)))
				)
			(when (mko (BelowOf30 ?x))
				(and (BelowOf31 ?x)
				(not (BelowOf30 ?x)))
				)
			(when (mko (BelowOf31 ?x))
				(and (BelowOf32 ?x)
				(not (BelowOf31 ?x)))
				)
			(when (mko (BelowOf32 ?x))
				(and (BelowOf33 ?x)
				(not (BelowOf32 ?x)))
				)
			(when (mko (BelowOf33 ?x))
				(and (BelowOf34 ?x)
				(not (BelowOf33 ?x)))
				)
			(when (mko (BelowOf34 ?x))
				(and (BelowOf35 ?x)
				(not (BelowOf34 ?x)))
				)
			(when (mko (BelowOf35 ?x))
				(and (BelowOf36 ?x)
				(not (BelowOf35 ?x)))
				)
			(when (mko (BelowOf36 ?x))
				(and (BelowOf37 ?x)
				(not (BelowOf36 ?x)))
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
			(when (mko (BelowOf22 ?x))
				(and (BelowOf21 ?x))
				)
			(when (mko (BelowOf23 ?x))
				(and (BelowOf22 ?x))
				)
			(when (mko (BelowOf24 ?x))
				(and (BelowOf23 ?x))
				)
			(when (mko (BelowOf25 ?x))
				(and (BelowOf24 ?x))
				)
			(when (mko (BelowOf26 ?x))
				(and (BelowOf25 ?x))
				)
			(when (mko (BelowOf27 ?x))
				(and (BelowOf26 ?x))
				)
			(when (mko (BelowOf28 ?x))
				(and (BelowOf27 ?x))
				)
			(when (mko (BelowOf29 ?x))
				(and (BelowOf28 ?x))
				)
			(when (mko (BelowOf30 ?x))
				(and (BelowOf29 ?x))
				)
			(when (mko (BelowOf31 ?x))
				(and (BelowOf30 ?x))
				)
			(when (mko (BelowOf32 ?x))
				(and (BelowOf31 ?x))
				)
			(when (mko (BelowOf33 ?x))
				(and (BelowOf32 ?x))
				)
			(when (mko (BelowOf34 ?x))
				(and (BelowOf33 ?x))
				)
			(when (mko (BelowOf35 ?x))
				(and (BelowOf34 ?x))
				)
			(when (mko (BelowOf36 ?x))
				(and (BelowOf35 ?x))
				)
			(when (mko (BelowOf37 ?x))
				(and (BelowOf36 ?x))
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
			(when (mko (AboveOf21 ?x))
				(and (AboveOf20 ?x)
				(not (AboveOf21 ?x)))
				)
			(when (mko (AboveOf22 ?x))
				(and (AboveOf21 ?x)
				(not (AboveOf22 ?x)))
				)
			(when (mko (AboveOf23 ?x))
				(and (AboveOf22 ?x)
				(not (AboveOf23 ?x)))
				)
			(when (mko (AboveOf24 ?x))
				(and (AboveOf23 ?x)
				(not (AboveOf24 ?x)))
				)
			(when (mko (AboveOf25 ?x))
				(and (AboveOf24 ?x)
				(not (AboveOf25 ?x)))
				)
			(when (mko (AboveOf26 ?x))
				(and (AboveOf25 ?x)
				(not (AboveOf26 ?x)))
				)
			(when (mko (AboveOf27 ?x))
				(and (AboveOf26 ?x)
				(not (AboveOf27 ?x)))
				)
			(when (mko (AboveOf28 ?x))
				(and (AboveOf27 ?x)
				(not (AboveOf28 ?x)))
				)
			(when (mko (AboveOf29 ?x))
				(and (AboveOf28 ?x)
				(not (AboveOf29 ?x)))
				)
			(when (mko (AboveOf30 ?x))
				(and (AboveOf29 ?x)
				(not (AboveOf30 ?x)))
				)
			(when (mko (AboveOf31 ?x))
				(and (AboveOf30 ?x)
				(not (AboveOf31 ?x)))
				)
			(when (mko (AboveOf32 ?x))
				(and (AboveOf31 ?x)
				(not (AboveOf32 ?x)))
				)
			(when (mko (AboveOf33 ?x))
				(and (AboveOf32 ?x)
				(not (AboveOf33 ?x)))
				)
			(when (mko (AboveOf34 ?x))
				(and (AboveOf33 ?x)
				(not (AboveOf34 ?x)))
				)
			(when (mko (AboveOf35 ?x))
				(and (AboveOf34 ?x)
				(not (AboveOf35 ?x)))
				)
			(when (mko (AboveOf36 ?x))
				(and (AboveOf35 ?x)
				(not (AboveOf36 ?x)))
				)
		))

)