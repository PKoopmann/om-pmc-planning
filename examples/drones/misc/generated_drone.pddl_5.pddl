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

    (:derived (inconsistent) 
        (or (WetDrone cb) (Drone cb) (WetDrone ee) (WetDrone da) (Drone ee) (Drone da))
    )

    (:derived (KBquery_WetDrone ?x)
        (or
            (inconsistent) 
            (and (= ?x ad) (or (Drone ad) (WetDrone ad)))
            (and (= ?x de) (or (WetDrone de) (Drone de)))
            (and (= ?x bd) (or (WetDrone bd) (Drone bd)))
            (and (= ?x be) (or (WetDrone be) (Drone be)))
            (and (= ?x eb) (or (Drone eb) (WetDrone eb)))
            (and (= ?x ca) (or (Drone ca) (WetDrone ca)))
            (and (= ?x ba) (or (WetDrone ba) (Drone ba)))
            (and (= ?x aa) (or (WetDrone aa) (Drone aa)))
            (and (= ?x dd) (or (WetDrone dd) (Drone dd)))
            (and (= ?x ab) (or (WetDrone ab) (Drone ab)))
            (and (= ?x ae) (or (Drone ae) (WetDrone ae)))
            (and (= ?x da) (false))
            (and (= ?x bb) (or (Drone bb) (WetDrone bb)))
            (and (= ?x ac) (or (Drone ac) (WetDrone ac)))
            (and (= ?x ce) (or (WetDrone ce) (Drone ce)))
            (and (= ?x bc) (or (Drone bc) (WetDrone bc)))
            (and (= ?x db) (or (Drone db) (WetDrone db)))
            (and (= ?x ed) (or (WetDrone ed) (Drone ed)))
            (and (= ?x ec) (or (Drone ec) (WetDrone ec)))
            (and (= ?x cb) (false))
            (and (= ?x dc) (or (WetDrone dc) (Drone dc)))
            (and (= ?x cd) (or (WetDrone cd) (Drone cd)))
            (and (= ?x ee) (false))
            (and (= ?x cc) (or (WetDrone cc) (Drone cc)))
            (and (= ?x ea) (or (Drone ea) (WetDrone ea)))
        )
    )

    (:derived (KBquery_Objectx ?x)
        (or
            (inconsistent) 
            (and (= ?x ad) (or (Drone ad) (WetDrone ad)))
            (and (= ?x de) (or (WetDrone de) (Drone de)))
            (and (= ?x bd) (or (WetDrone bd) (Drone bd)))
            (and (= ?x ed) (true))
            (and (= ?x be) (or (WetDrone be) (Drone be)))
            (and (= ?x eb) (or (Drone eb) (WetDrone eb)))
            (and (= ?x ca) (or (Drone ca) (WetDrone ca)))
            (and (= ?x ba) (or (WetDrone ba) (Drone ba)))
            (and (= ?x da) (true))
            (and (= ?x aa) (or (WetDrone aa) (Drone aa)))
            (and (= ?x dd) (or (WetDrone dd) (Drone dd)))
            (and (= ?x ab) (or (WetDrone ab) (Drone ab)))
            (and (= ?x ae) (or (Drone ae) (WetDrone ae)))
            (and (= ?x bb) (or (Drone bb) (WetDrone bb)))
            (and (= ?x bc) (or (Drone bc) (WetDrone bc)))
            (and (= ?x db) (or (Drone db) (WetDrone db)))
            (and (= ?x ee) (true))
            (and (= ?x ec) (or (Drone ec) (WetDrone ec)))
            (and (= ?x dc) (or (WetDrone dc) (Drone dc)))
            (and (= ?x ce) (true))
            (and (= ?x cd) (or (WetDrone cd) (Drone cd)))
            (and (= ?x cb) (true))
            (and (= ?x cc) (or (WetDrone cc) (Drone cc)))
            (and (= ?x ac) (true))
            (and (= ?x ea) (or (Drone ea) (WetDrone ea)))
        )
    )

    (:derived (KBquery_XveryCloseY ?x ?y)
        (or
            (inconsistent) 
            (and (= ?y env) (= ?x ed) (or (WetDrone ed) (Drone ed)) (false))
            (and (= ?y env) (= ?x de) (or (WetDrone de) (Drone de)) (false))
            (and (= ?y env) (= ?x eb) (or (Drone eb) (WetDrone eb)) (false))
            (and (= ?y env) (= ?x cc) (or (WetDrone cc) (Drone cc)) (false))
            (and (= ?y env) (= ?x da) (false))
            (and (= ?y env) (= ?x bc) (or (Drone bc) (WetDrone bc)) (false))
            (and (= ?y env) (= ?x bb) (or (Drone bb) (WetDrone bb)) (false))
            (and (= ?y env) (= ?x aa) (or (WetDrone aa) (Drone aa)) (false))
            (and (= ?y env) (= ?x ad) (or (Drone ad) (WetDrone ad)) (false))
            (and (= ?y env) (= ?x ea) (or (Drone ea) (WetDrone ea)) (false))
            (and (= ?y env) (= ?x cd) (or (WetDrone cd) (Drone cd)) (false))
            (and (= ?y env) (= ?x ee) (false))
            (and (= ?y env) (= ?x be) (or (WetDrone be) (Drone be)) (false))
            (and (= ?y env) (= ?x ac) (or (Drone ac) (WetDrone ac)) (false))
            (and (= ?y env) (= ?x ab) (or (WetDrone ab) (Drone ab)) (false))
            (and (= ?y env) (= ?x ca) (or (Drone ca) (WetDrone ca)) (false))
            (and (= ?y env) (= ?x dc) (or (WetDrone dc) (Drone dc)) (false))
            (and (= ?y env) (= ?x ce) (or (WetDrone ce) (Drone ce)) (false))
            (and (= ?y env) (= ?x db) (or (Drone db) (WetDrone db)) (false))
            (and (= ?y env) (= ?x bd) (or (WetDrone bd) (Drone bd)) (false))
            (and (= ?y env) (= ?x ec) (or (Drone ec) (WetDrone ec)) (false))
            (and (= ?y env) (= ?x ba) (or (WetDrone ba) (Drone ba)) (false))
            (and (= ?y env) (= ?x ae) (or (Drone ae) (WetDrone ae)) (false))
            (and (= ?y env) (= ?x cb) (false))
            (and (= ?y env) (= ?x dd) (or (WetDrone dd) (Drone dd)) (false))
        )
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
