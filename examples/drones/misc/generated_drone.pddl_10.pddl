(define (domain drone)
	(:requirements :strips :equality :disjunctive-preconditions :derived-predicates :negative-preconditions :conditional-effects :existential-preconditions)


	(:predicates 
		(environment ?x ?y)
		(Rain ?x)
		(Drone ?x)
		(WetDrone ?x)
		(LowVisibility ?x)
		(near ?x ?y)
		(veryClose ?x ?y)
		(Human ?x)
		(MovingObject ?x)
		(Objectx ?x)
		(RiskOfPhysicalDamage ?x)
	  (Tree ?x)
	  (false) ; predicate that is always false. Do NEVER set this to true
	  (true)   ; predicate that is always true. Do NEVER set this to false
	  (KBquery_XveryCloseY ?x ?y)
	  (KBquery_WetDrone ?x)
	  (KBquery_Objectx ?x)
	  (KBquery_AvoidCondition ?x ?y)
	  (inconsistent)
	)

	(:action Move
	  :parameters (?x ?y)
	  :precondition (and    
	    (not (inconsistent))
	    (KBquery_XveryCloseY ?x ?y)
	    (not (KBquery_Objectx ?y))
	  )
	  :effect (and
	    (when
	      (not (KBquery_WetDrone ?x))
	      (and (not (Drone ?x)) (Drone ?y))
	    )
	    (when
	      (KBquery_WetDrone ?x)
	      (and (not (WetDrone ?x)) (not (Drone ?x)) (WetDrone ?y))
	    )
	  )
	)
)
