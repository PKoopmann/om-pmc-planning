(define (domain elevators)

(:predicates 
    (false)
    (true)
    (inconsistent)
	(passenger ?p)
	(boarded ?p)
	(served ?p)
	(floor ?p)
	(origin ?p ?f)
	(destin ?p ?f)
 	(lift_at ?f)
	(next ?f1 ?f2)
	(KBquery_lift_at ?f)
	(KBquery_passenger ?p)
	(KBquery_served ?p)
	(KBquery_origin ?p ?f)
	(KBquery_boarded ?p)
	(KBquery_destin ?p ?f)
	(KBquery_next ?f1 ?f2)
)

    (:derived (true)
        (not (false))
    )

    (:derived (inconsistent) 
        (false)
    )

    (:derived (KBquery_lift_at ?x)
        (or

            (and (= ?x a) (lift_at a))
            (and (= ?x b) (lift_at b))
            (and (= ?x d) (lift_at d))
            (and (= ?x f) (lift_at f))
            (and (= ?x h) (lift_at h))
            (and (= ?x i) (lift_at i))
            (and (= ?x j) (lift_at j))
            (and (= ?x k) (lift_at k))
            (and (= ?x l) (lift_at l))

        )
    )

    (:derived (KBquery_passenger ?x)
        (or

            (= ?x pass_c)
            (= ?x pass_e)
            (= ?x pass_g)
            (= ?x pass_m)
            (= ?x pass_n)
            (= ?x pass_o)

        )
    )

    (:derived (KBquery_served ?x)
        (or

            (and (= ?x pass_c) (served pass_c))
            (and (= ?x pass_e) (served pass_e))
            (and (= ?x pass_g) (served pass_g))
            (and (= ?x pass_m) (served pass_m))
            (and (= ?x pass_n) (served pass_n))
            (and (= ?x pass_o) (served pass_o))

        )
    )

    (:derived (KBquery_boarded ?x)
        (or

            (and (= ?x pass_c) (boarded pass_c))
            (and (= ?x pass_e) (boarded pass_e))
            (and (= ?x pass_g) (boarded pass_g))
            (and (= ?x pass_m) (boarded pass_m))
            (and (= ?x pass_n) (boarded pass_n))
            (and (= ?x pass_o) (boarded pass_o))

        )
    )

    (:derived (KBquery_origin ?x ?y)
        (or

            (and (= ?y h) (= ?x pass_c))
            (and (= ?y j) (= ?x pass_e))
            (and (= ?y k) (= ?x pass_g))
            (and (= ?y i) (= ?x pass_m))
            (and (= ?y i) (= ?x pass_n))
            (and (= ?y d) (= ?x pass_o))

        )
    )

    (:derived (KBquery_destin ?x ?y)
        (or

 
            (and (= ?y i) (= ?x pass_c))
            (and (= ?y f) (= ?x pass_e))
            (and (= ?y d) (= ?x pass_g))
            (and (= ?y l) (= ?x pass_m))
            (and (= ?y h) (= ?x pass_n))
            (and (= ?y j) (= ?x pass_o))

        )
    )

    (:derived (KBquery_next ?x ?y)
        (or

            (and (= ?y b) (= ?x a))
            (and (= ?y d) (= ?x b))
            (and (= ?y f) (= ?x d))
            (and (= ?y h) (= ?x f))
            (and (= ?y i) (= ?x h))
            (and (= ?y j) (= ?x i))
            (and (= ?y k) (= ?x j))
            (and (= ?y l) (= ?x k))

        )
    )

(:action stop
  :parameters (?p ?f)
        :precondition (and
            (not (inconsistent))
            (and (KBquery_lift_at ?f) (KBquery_passenger ?p))
        )
  :effect (and
   (when 
	(and 
		(KBquery_origin ?p ?f)
		(not (KBquery_served ?p))
		(not (KBquery_served ?p))
	)
    (boarded ?p)
  )
  (when 
	(and 
		(KBquery_destin ?p ?f) 
		(KBquery_boarded ?p)
	)
    (and (served ?p) (not (boarded ?p)))
  )
  )
)

(:action moveUp
  :parameters (?f1 ?f2)
        :precondition (and
            (not (inconsistent))
            (and (KBquery_lift_at ?f1) (KBquery_next ?f1 ?f2))
        )
  :effect (when
	(and
		(KBquery_lift_at ?f1)
		(not (= ?f1 ?f2))
	)
    (and
		(lift_at ?f2)
		(not (lift_at ?f1))
	)
)
)

(:action moveDown
  :parameters (?f1 ?f2)
        :precondition (and
            (not (inconsistent))
            (and (KBquery_lift_at ?f1) (KBquery_next ?f2 ?f1))
        )
  :effect ( when
    (and
		(KBquery_lift_at ?f1)
		(not (= ?f1 ?f2))
	)
    (and
		(lift_at ?f2)
		(not (lift_at ?f1))
	)
)
)
  
)
