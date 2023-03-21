(define (problem navigationMiniAUV)
    (:domain miniAUV)
    (:objects
        remaroAUV - robot
        rgbCamera - sensor
        backThruster - actuator
        startPoint - waypoint
        endPoint - waypoint
        photoPoint - waypoint
    )

    (:init
        (at remaroAUV startPoint)
        (dangerousForCamera startPoint photoPoint)
        (dangerousForThruster photoPoint endPoint)
        (canDrive backThruster)
        (canTakePicture rgbCamera)
    )

    (:goal
        (and
            (at remaroAUV endPoint)
            (hasPhoto photoPoint)
        )
    )
)
