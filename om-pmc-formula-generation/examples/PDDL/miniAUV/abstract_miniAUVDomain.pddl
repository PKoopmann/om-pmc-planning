(define (domain miniAUV)
    (:requirements :typing :strips :equality :negative-preconditions :conditional-effects :disjunctive-preconditions :derived-predicates) 

    (:types 
        waypoint robot robotPart - object
        camera thruster - robotPart
    )

    (:predicates
        (at ?auv - robot ?wp - waypoint)
        (canTakePicture ?part - sensor)
    (canDrive ?part - actuator)
        (hasPhoto ?wp - waypoint)
        (dangerousForCamera ?from - waypoint ?to - waypoint)
        (dangerousForThruster ?from - waypoint ?to - waypoint)
        (KBquery_canTakePicture ?auv)
        (KBquery_canDrive ?auv)
        (inconsistent)
        (false) ; predicate that is always false. Do NEVER set this to true
        (true)   ; predicate that is always true. Do NEVER set this to false
    )

    (:action take-photo
        :parameters (
            ?robot - robot
            ?wp - waypoint
            ?camera - camera
        )
        :precondition (and 
            (at ?robot ?wp)
            (KBquery_canTakePicture ?robot) ; only take picture if auv can do so
        )
        :effect (and 
            (hasPhoto ?wp) ; get a photo of this waypoint
        )
    )

    (:action drive
        :parameters (
            ?robot - robot
            ?from - waypoint
            ?to - waypoint
            ?thruster - thruster
            ?camera - camera
        )
        :precondition (and 
            (at ?robot ?from)   
            (KBquery_canDrive ?robot) ; only move if you have a thruster
        )
        :effect (and 
            (when (not (dangerousForThruster ?from ?to)) (and
                (not (at ?robot ?from))   ; move from first to second waypoint
                (at ?robot ?to)
                )
            )
            ; on dagerous paths, things break...
            (when (dangerousForCamera ?from ?to) (not(canTakePicture ?camera)))
            (when (dangerousForThruster ?from ?to) (not(canDrive ?thruster)))
            
        )
    )
)
