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
)

(:action stop
  :parameters (?p ?f)
  :precondition (and (mko (lift_at ?f)) (mko (passenger ?p)))
  :effect (and
   (when 
	(and 
		(mko (origin ?p ?f)) 
		(not (mko (served ?p))) 
		(not (mko (boarded ?p)))
	)
    (boarded ?p)
  )
  (when 
	(mko (and 
		(destin ?p ?f) 
		(boarded ?p)
	))
    (and (served ?p) (not (boarded ?p)))
  )
  )
)

(:action moveUp
  :parameters (?f1 ?f2)
  :precondition (and (mko (lift_at ?f1)) (mko (next ?f1 ?f2)))
  :effect (when
	(and
		(mko (lift_at ?f1))
		(not (mko (= ?f1 ?f2)))
	)
    (and
		(lift_at ?f2)
		(not (lift_at ?f1))
	)
)
)

(:action moveDown
  :parameters (?f1 ?f2)
  :precondition (and (mko (lift_at ?f1)) (mko (next ?f2 ?f1)))
  :effect ( when
    (and
		(mko (lift_at ?f1))
		(not (mko (= ?f1 ?f2)))
	)
    (and
		(lift_at ?f2)
		(not (lift_at ?f1))
	)
)
)
  
)
