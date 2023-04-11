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
        (or (robotAt auv ae) (robotAt auv cc) (robotAt auv cf) (robotAt auv fc) (robotAt auv af) (robotAt auv ac) (robotAt auv be) (robotAt auv fe) (robotAt auv fa) (robotAt auv dc) (robotAt auv bf) (robotAt auv bc) (robotAt auv ce))
    )

    (:derived (KBquery_connectedToFailure ?x)
        (or

            (and (= ?x ae) (open valveBD))
            (and (= ?x af) (open valveBD))
            (and (= ?x ba) (robotAt auv ba))
            (= ?x bb)
            (= ?x bd)
            (and (= ?x be) (open valveBD))
            (and (= ?x bf) (open valveBD))
            (= ?x cb)
            (and (= ?x ce) (open valveBD))
            (and (= ?x cf) (open valveBD))
            (= ?x db)
            (= ?x ea)
            (= ?x eb)
            (= ?x ec)
            (and (= ?x ed) (open valveEC))
            (and (= ?x ee) (open valveEC))
            (and (= ?x fa) (open valveEA))
            (and (= ?x fc) (open valveEC))
            (and (= ?x fd) (open valveEC))
            (and (= ?x fe) (and (open valveEE) (open valveEC)))
            (and (= ?x gd) (open valveEC))

        )
    )

    (:derived (KBquery_WPTank ?x)
        (or

            (= ?x ae)
            (= ?x af)
            (= ?x be)
            (= ?x bf)
            (= ?x ce)
            (= ?x cf)
            (= ?x fa)
            (= ?x fc)
            (= ?x fe)

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
