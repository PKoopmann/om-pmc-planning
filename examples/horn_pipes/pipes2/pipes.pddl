(define (domain pipes)
	(:requirements :strips :equality :disjunctive-preconditions :derived-predicates :negative-preconditions :conditional-effects :existential-preconditions)


	(:predicates 
		(nextTo ?wpA ?wpB)
		(hasPicture ?auv ?wp)
		(robotAt ?auv ?wp)
		(open ?v)
		(locatedAt ?x ?wp)
		(WPTank ?wp)
		(WPConnectedToFailure ?wp)
		(Rock ?x)
		(MediumRiskPipe ?x)
		(Mine ?x)
		(Pipe ?x)
		(ProtectedStructure ?x)
		(Robot ?x)
		(RustyPipe ?x)
		(UnsupportedPipe ?x)
		(pipefailure ?x)
		(ClosedValve ?x)
		(Tank ?x)
		(Dummy ?x)
		(Valve ?x)
		(WP ?x)
		(Wall ?x)
		(connectedTo ?x ?y)
		(OpenValve ?x)
		(flowconnectedto ?x ?y)
	)

	; manual tranlation of SWRL-rule
	(:derived (flowconnectedto ?x ?z)
		(or
			(connectedTo ?x ?z)
			(connectedTo ?z ?x)
			(exists (?y) 
				(and
					(OpenValve ?y)
					(flowconnectedto ?x ?y)
					(flowconnectedto ?y ?z)
				)
			)
			(exists (?y) 
				(and
					(Pipe ?y)
					(flowconnectedto ?x ?y)
					(flowconnectedto ?y ?z)
				)
			)
		)
		
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
		:parameters (?auv ?valve)
		:precondition (and  
			(exists (?wp) ( and
				(robotAt ?auv ?wp)
				(locatedAt ?valve ?wp)
			))
			(OpenValve ?valve)
		)
		:effect (and 
			(not (OpenValve ?valve))
		)
	)
	
)
