(define (domain elevators)

(:predicates 
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

(:action stop
  :parameters (?p ?f)
  :precondition (and (KBquery_lift_at ?f) (KBquery_passenger ?p))
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
  :precondition (and (KBquery_lift_at ?f1) (KBquery_next ?f1 ?f2))
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
  :precondition (and (KBquery_lift_at ?f1) (KBquery_next ?f2 ?f1))
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
