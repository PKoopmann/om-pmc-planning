(define (domain pipes)
	(:requirements :strips :equality :disjunctive-preconditions :derived-predicates :negative-preconditions :conditional-effects :existential-preconditions)


	(:predicates 
		(nextTo ?wpA ?wpB)
		(hasPicture ?auv ?wp)
		(robotAt ?auv ?wp)
		(MediumRiskPipe ?x)
		(RustyPipe ?x)
		(Mine ?x)
		(WP ?x)
		(Pipe ?x)
		(Rock ?x)
		(UnsupportedPipe ?x)
		(Robot ?x)
		(ProtectedStructure ?x)
		(locatedAt ?x ?y)
		(connectedTo ?x ?y)
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

)
