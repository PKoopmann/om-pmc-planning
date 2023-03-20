(define (domain pipes)
	(:requirements :strips :equality :disjunctive-preconditions :derived-predicates :negative-preconditions :conditional-effects :existential-preconditions)


	(:predicates 
    (false)
    (true)
    (inconsistent)
		(nextTo ?wpA ?wpB)
		(hasPicture ?auv ?wp)
		(robotAt ?auv ?wp)
		(KBquery_inspectionNeeded ?wp)
		(KBquery_inspected ?wp)
	)

    (:derived (true)
        (not (false))
    )

    (:derived (inconsistent) 
        (or (robotAt auv dd) (robotAt auv db) (robotAt auv ab) (robotAt auv ef) (robotAt auv dc) (robotAt auv bb) (robotAt auv cb))
    )

    (:derived (KBquery_inspectionNeeded ?x)
        (or
            (and (= ?x gb) (true))
            (and (= ?x fd) (true))
            (and (= ?x de) (true))
            (and (= ?x cd) (true))
            (and (= ?x cg) (true))
            (and (= ?x fc) (true))
            (and (= ?x gc) (true))
            (and (= ?x cc) (true))
        )
    )

    (:derived (KBquery_inspected ?x)
        (or
            (and (= ?x gc) (hasPicture auv gc))
            (and (= ?x cc) (hasPicture auv cc))
            (and (= ?x cg) (hasPicture auv cg))
            (and (= ?x fc) (or (hasPicture auv fc) (hasPicture auv fd) (hasPicture auv gc)))
            (and (= ?x fd) (or (hasPicture auv fc) (hasPicture auv ee) (hasPicture auv fd)))
            (and (= ?x de) (or (hasPicture auv cd) (hasPicture auv de) (hasPicture auv df) (hasPicture auv ee)))
            (and (= ?x gb) (or (hasPicture auv gc) (hasPicture auv gb)))
            (and (= ?x cd) (or (hasPicture auv cd) (hasPicture auv cc) (hasPicture auv de)))
        )
    )

	(:action Move
	  :parameters (?auv ?wpA ?wpB)
        :precondition (and
            (not (inconsistent))
            (and 
	    (or (nextTo ?wpA ?wpB) (nextTo ?wpB ?wpA))
		(robotAt ?auv ?wpA)
	  )
        )
	  :effect (and
	    (not (robotAt ?auv ?wpA))
		(robotAt ?auv ?wpB)
	  )
	)

	(:action takePicture 
	  :parameters (?auv ?wp)
        :precondition (and
            (not (inconsistent))
            (and 
		(robotAt ?auv ?wp)
	  )
        )
	  :effect (and 
		(hasPicture ?auv ?wp)
	  )
	)
)
