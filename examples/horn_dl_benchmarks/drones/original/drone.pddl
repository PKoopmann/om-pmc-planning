(define (domain drone)

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
)

(:action Move
  :parameters (?x ?y)
  :precondition (and    
    (mko (and (Drone ?x) (veryClose ?x ?y)))
    (not (mko (Objectx ?y)))
  )
  :effect (and
    (when
      (not (mko (WetDrone ?x)))
      (and (not (Drone ?x)) (Drone ?y))
    )
    (when
      (mko (WetDrone ?x))
      (and (not (WetDrone ?x)) (not (Drone ?x)) (WetDrone ?y))
    )
  )
)
