(define (domain pipes)
	(:requirements :strips :equality :disjunctive-preconditions :derived-predicates :negative-preconditions :conditional-effects :existential-preconditions)


	(:predicates 
    (false)
    (true)
    (inconsistent)
		(nextTo ?wpA ?wpB)
		(hasPicture ?auv ?wp)
		(robotAt ?auv ?wp)
		(open ?v)
		(locatedAt ?x ?wp)
		(KBquery_WPTank ?wp)
		(KBquery_connectedToFailure ?wp)
	)

    (:derived (true)
        (not (false))
    )

    (:derived (inconsistent) 
        (robotAt auv cf)
    )

    (:derived (KBquery_connectedToFailure ?x)
        (or

            (= ?x ba)
            (= ?x bb)
            (= ?x cb)

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

	(:action closeValve
		:parameters (?auv ?valve)
        :precondition (and
            (not (inconsistent))
            (and 
			(exists (?wp) ( and
				(robotAt ?auv ?wp)
				(locatedAt ?valve ?wp)
			))
			(open ?valve)
		)
        )
		:effect (and 
			(not (open ?valve))
		)
	)
	
)
