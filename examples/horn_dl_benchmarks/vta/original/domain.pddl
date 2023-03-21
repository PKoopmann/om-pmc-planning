(define (domain Wsmo2VTAT)

(:predicates 
	(invoice ?x)
	(trip ?x)
	(flight ?x)
	(flightTicket ?x)
	(hotelStay ?x)
	(carHotelBundleOption ?x)
	(itinerary ?x)
	(flightRequest ?x)
	(hotelStayRequest ?x)
	(hotelStayConfirmation ?x)
	(carRentalRequest ?x)
	(carRental ?x)
	(carRentalBooking ?x)
	(airportShuttle ?x)
	(directlyAfterObj ?x ?y)
	(notFree ?x)
)

(:action vtaShuttleService
  :parameters (?x ?y ?q)
  :precondition (and 
		(mko (notFree ?q)) 
		(mko (directlyAfterObj ?q ?y))
		(mko (flightTicket ?x)))
  :effect (and
    (airportShuttle ?y) (notFree ?y)
    (not (notFree ?q))
  )
)

(:action vtaCarHotelBundlingService
  :parameters (?x ?y ?z ?q)
  :precondition (and 
		(mko (notFree ?q)) 
		(mko (directlyAfterObj ?q ?z))
		(mko (hotelStayConfirmation ?x)) 
		(mko (carRentalBooking ?y)))
  :effect (and
    (carHotelBundleOption ?z) (notFree ?z)
    (not (notFree ?q))
  )
)

(:action vtaCarRentalService
  :parameters (?x ?y ?q) 
  :precondition (and 
		(mko (notFree ?q)) 
		(mko (directlyAfterObj ?q ?y)) 
		(mko (carRental ?x)))
  :effect (and
    (carRentalBooking ?y) (notFree ?y)
    (not (notFree ?q))
  )
)

(:action vtaHotelService
  :parameters (?x ?y ?q)
  :precondition (and 
		(mko (notFree ?q)) 
		(mko (directlyAfterObj ?q ?y))
		(mko (hotelStay ?x) ))
  :effect (and
    (hotelStayConfirmation ?y) (notFree ?y)
    (not (notFree ?q))
  )
)

(:action vtaFlightService
  :parameters (?x ?y ?q)
  :precondition (and 
		(mko (notFree ?q)) 
		(mko (directlyAfterObj ?q ?y))
		(mko (flight ?x)))
  :effect (and
    (flightTicket ?y) (notFree ?y)
    (not (notFree ?q))
  )
)

(:action vtaTripCombinationService
  :parameters (?x ?y ?z ?t ?q)
  :precondition (and 
		(mko (notFree ?q)) 
		(mko (directlyAfterObj ?q ?z)) 
		(mko (directlyAfterObj ?z ?t))
		(mko (airportShuttle ?x)) 
		(mko (carHotelBundleOption ?y)))
  :effect (and
    (itinerary ?z) (invoice ?t) (notFree ?t)
    (not (notFree ?q))
  )
)

(:action vtaTripMakerService
  :parameters (?x ?y ?z ?t ?q)
  :precondition (and 
		(mko (notFree ?q)) 
		(mko (directlyAfterObj ?q ?y)) 
		(mko (directlyAfterObj ?y ?z)) 
		(mko (directlyAfterObj ?z ?t)) 
		(mko (trip ?x)))
  :effect (and 
    (flightRequest ?y) (hotelStayRequest ?z) (carRentalRequest ?t) (notFree ?t)
    (not (notFree ?q))
  )
)

)
