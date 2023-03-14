(define (domain miniAUV)
    (:requirements :typing :strips :equality :negative-preconditions :conditional-effects :disjunctive-preconditions :derived-predicates) 

    (:types 
        waypoint robot robotPart - object
        sensor actuator - robotPart
    )

    (:predicates
        (at ?auv - robot ?wp - waypoint)
        (canTakePicture ?part - sensor)
        (canDrive ?part - actuator)
        (hasPhoto ?wp - waypoint)
        (dangerousForCamera ?from - waypoint ?to - waypoint)
        (dangerousForThruster ?from - waypoint ?to - waypoint)
        (KBquery_canTakePicture ?x)
        (KBquery_canDrive ?x)
        (inconsistent)
        (false) ; predicate that is always false. Do NEVER set this to true
        (true)   ; predicate that is always true. Do NEVER set this to false
    )

    inconsistent = false

    KBquery_canTakePicture ?x =
        if (inconsistent)
             then true
        if ((?x == remaroAUV))
            then ((canTakePicture rgbCamera))
    else
        false;


    KBquery_canDrive ?x =
        if (inconsistent)
             then true
        if ((?x == remaroAUV))
            then ((canDrive backThruster))
    else
        false;


    (:action take-photo
        :parameters (
            ?robot - robot
            ?wp - waypoint
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
            ?thruster - actuator
            ?camera - sensor
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
