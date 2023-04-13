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
        (or (lift_at pass_o) (and (boarded b) (lift_at b)) (served h) (served l) (and (lift_at c) (boarded c)) (served d) (boarded i) (boarded l) (boarded f) (and (boarded a) (lift_at a)) (served k) (boarded j) (lift_at pass_c) (and (boarded g) (lift_at g)) (served j) (and (lift_at g) (served g)) (and (served b) (lift_at b)) (boarded k) (boarded d) (lift_at pass_m) (and (lift_at c) (served c)) (and (lift_at e) (boarded e)) (served f) (served i) (and (lift_at a) (served a)) (and (lift_at e) (served e)) (lift_at pass_e) (lift_at pass_n) (boarded h) (lift_at pass_g))
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
