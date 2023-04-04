(define (domain pipes)
	(:requirements :strips :equality :disjunctive-preconditions :derived-predicates :negative-preconditions :conditional-effects :existential-preconditions)


	(:predicates 
		(nextTo ?wpA ?wpB)
		(hasPicture ?auv ?wp)
		(robotAt ?auv ?wp)
		(Rock ?x)
		(MediumRiskPipe ?x)
		(Mine ?x)
		(Pipe ?x)
		(ProtectedStructure ?x)
		(Robot ?x)
		(RustyPipe ?x)
		(UnsupportedPipe ?x)
		(WP ?x)
		(connectedTo ?x ?y)
		(locatedAt ?x ?y)
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
