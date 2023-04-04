(define (domain pipes)
	(:requirements :strips :equality :disjunctive-preconditions :derived-predicates :negative-preconditions :conditional-effects :existential-preconditions)


	(:predicates 
		(nextTo ?wpA ?wpB)
		(hasPicture ?auv ?wp)
		(robotAt ?auv ?wp)
		(open ?v)
		(locatedAt ?x ?wp)
		(KBquery_WPTank ?wp)
		(KBquery_connectedToFailure ?wp)
	)

	(:action Move
	  :parameters (?auv ?wpA ?wpB)
	  :precondition (and    
	    (or (nextTo ?wpA ?wpB) (nextTo ?wpB ?wpA))
		(robotAt ?auv ?wpA)
	  )
	  :effect (and
	    (not (robotAt ?auv ?wpA))
		(robotAt ?auv ?wpB)
	  )
	)

	(:action takePicture 
	  :parameters (?auv ?wp)
	  :precondition (and 
		(robotAt ?auv ?wp)
	  )
	  :effect (and 
		(hasPicture ?auv ?wp)
	  )
	)

	(:action closeValve
		:parameters (?auv ?wp ?valve)
		:precondition (and 
			(robotAt ?auv ?wp)
			(locatedAt ?valve ?wp)
			(open ?valve)
		)
		:effect (and 
			(not (open ?valve))
		)
	)
	
)
