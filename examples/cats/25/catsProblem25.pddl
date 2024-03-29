(define (problem BTcat_problem)
	(:domain BTcat)
	(:objects aa ab ac ad ae af ag ah ai aj ak al am an ao ap aq ar as at au av aw ax ay az ba bb bc bd be bf bg bh bi bj bk bl bm bn bo bp bq br bs bt bu bv bw bx )
	(:init
		(cat aa)
		(cat ab)
		(bomb ae)
		(cat ak)
		(bomb am)
		(cat aq)
		(cat as)
		(bomb av)
		(cat ax)
		(cat ay)
		(cat az)
		(cat bc)
		(cat bd)
		(cat bf)
		(cat bg)
		(cat bi)
		(bomb bj)
		(bomb bk)
		(cat bl)
		(bomb bq)
		(bomb br)
		(cat bu)
		(contains ao ae)
		(contains bv bk)
		(contains bp am)
		(contains bx bj)
		(contains ai bq)
		(contains ag av)
		(contains ba br)
		(contains aw bi)
		(contains bb bd)
		(contains bw az)
		(contains aj bc)
		(contains ah as)
		(contains al bf)
		(contains bs aa)
		(contains at bg)
		(contains bh ab)
		(contains bo bl)
		(contains bt ay)
		(contains ac ax)
		(contains bm ak)
		(contains an bu)
		(contains ar aq)

	)
	(:goal (not (exists (?x) 
 		 (and 
 			 (KBquery_Package ?x)
 			 (not (KBquery_Disarmed ?x)) 
 		 ) 
 	 )) 
 	)

)
