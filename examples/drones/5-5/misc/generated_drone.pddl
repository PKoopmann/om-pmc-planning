(define (domain drone)
	(:requirements :strips :equality :disjunctive-preconditions :derived-predicates :negative-preconditions :conditional-effects :existential-preconditions)


	(:predicates 
    (false)
    (true)
    (inconsistent)
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
	  (KBquery_XveryCloseY ?x ?y)
	  (KBquery_WetDrone ?x)
	  (KBquery_Objectx ?x)
	  (KBquery_AvoidCondition ?x ?y)
	)

    (:derived (true)
        (not (false))
    )

    (:derived (inconsistent) 
        (or (WetDrone cb) (Drone cb) (WetDrone ee) (WetDrone da) (Drone ee) (Drone da))
    )

    (:derived (KBquery_WetDrone ?x)
        (or

            (and (= ?x aa) (or (WetDrone aa) (Drone aa)))
            (and (= ?x ab) (or (WetDrone ab) (Drone ab)))
            (and (= ?x ac) (or (Drone ac) (WetDrone ac)))
            (and (= ?x ad) (or (Drone ad) (WetDrone ad)))
            (and (= ?x ae) (or (Drone ae) (WetDrone ae)))
            (and (= ?x ba) (or (WetDrone ba) (Drone ba)))
            (and (= ?x bb) (or (Drone bb) (WetDrone bb)))
            (and (= ?x bc) (or (Drone bc) (WetDrone bc)))
            (and (= ?x bd) (or (WetDrone bd) (Drone bd)))
            (and (= ?x be) (or (WetDrone be) (Drone be)))
            (and (= ?x ca) (or (Drone ca) (WetDrone ca)))
            (and (= ?x cc) (or (WetDrone cc) (Drone cc)))
            (and (= ?x cd) (or (WetDrone cd) (Drone cd)))
            (and (= ?x ce) (or (WetDrone ce) (Drone ce)))
            (and (= ?x db) (or (Drone db) (WetDrone db)))
            (and (= ?x dc) (or (WetDrone dc) (Drone dc)))
            (and (= ?x dd) (or (WetDrone dd) (Drone dd)))
            (and (= ?x de) (or (WetDrone de) (Drone de)))
            (and (= ?x ea) (or (Drone ea) (WetDrone ea)))
            (and (= ?x eb) (or (Drone eb) (WetDrone eb)))
            (and (= ?x ec) (or (Drone ec) (WetDrone ec)))
            (and (= ?x ed) (or (WetDrone ed) (Drone ed)))

        )
    )


        )
    )

	(:action Move
	  :parameters (?x ?y)
        :precondition (and
            (not (inconsistent))
            (and 
	    (KBquery_XveryCloseY ?x ?y)
	    (not (KBquery_Objectx ?y))
	  )
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
