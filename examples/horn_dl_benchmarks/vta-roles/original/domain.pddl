(define (domain Wsmo2VTAT)

(:predicates 
	(invoice ?x ?y)
	(trip ?x)
	(flight ?x)
	(flightTicket ?x ?y)
	(hotelStay ?x)
	(carHotelBundleOption ?x ?y)
	(itinerary ?x ?y)
	(flightRequest ?x ?y)
	(hotelStayRequest ?x ?y)
	(hotelStayConfirmation ?x ?y)
	(carRentalRequest ?x ?y)
	(carRental ?x)
	(carRentalBooking ?x ?y)
	(airportShuttle ?x ?y)
	(directlyAfterObj ?x ?y)
	(notFree ?x)
)

(:action vtaShuttleService
  :parameters (?x ?z ?q ?y)
  :precondition (and 
		(mko (notFree ?q)) 
		(mko (directlyAfterObj ?q ?y))
		(mko (flightTicket ?z ?x)))
  :effect (and
    (airportShuttle ?z ?y) (notFree ?y)
    (not (notFree ?q))
  )
)

(:action vtaCarHotelBundlingService
  :parameters (?s ?x ?y ?q ?z)
  :precondition (and 
		(mko (notFree ?q)) 
		(mko (directlyAfterObj ?q ?z)) 
		(mko (hotelStayConfirmation ?s ?x)) 
		(mko (carRentalBooking ?s ?y)))
  :effect (and
    (carHotelBundleOption ?s ?z) (notFree ?z)
    (not (notFree ?q))
  )
)

(:action vtaCarRentalService
  :parameters (?z ?x ?q ?y)
  :precondition (and 
		(mko (notFree ?q)) 
		(mko (directlyAfterObj ?q ?y)) 
		(mko (carRental ?x)) 
		(mko (carRentalRequest ?z ?x)))
  :effect (and
    (carRentalBooking ?z ?y) (notFree ?y)
    (not (notFree ?q))
  )
)

(:action vtaHotelService
  :parameters (?z ?x ?q ?y)
  :precondition (and 
		(mko (notFree ?q)) 
		(mko (directlyAfterObj ?q ?y)) 
		(mko (hotelStay ?x) ) 
		(mko (hotelStayRequest ?z ?x)))
  :effect (and
    (hotelStayConfirmation ?z ?y)(notFree ?y)
    (not (notFree ?q))
  )
)

(:action vtaFlightService
  :parameters (?z ?x ?q ?y)
  :precondition (and 
		(mko (notFree ?q)) 
		(mko (directlyAfterObj ?q ?y)) 
		(mko (flightRequest ?z ?x)) 
		(mko (flight ?x)))
  :effect (and
    (flightTicket ?z ?y)(notFree ?y)
    (not (notFree ?q))
  )
)

(:action vtaTripCombinationService
  :parameters (?s ?x ?y ?z ?t ?q )
  :precondition (and 
		(mko (notFree ?q)) 
		(mko (directlyAfterObj ?q ?z)) 
		(mko (directlyAfterObj ?z ?t)) 
		(mko (airportShuttle ?s ?x)) 
		(mko (carHotelBundleOption ?s ?y)))
  :effect (and
    (itinerary ?s ?z) (invoice ?s ?t) (notFree ?t)
    (not (notFree ?q))
  )
)

(:action vtaTripMakerService
  :parameters (?x ?q ?y ?z ?t)
  :precondition (and 
		(mko (notFree ?q)) 
		(mko (directlyAfterObj ?q ?y)) 
		(mko (directlyAfterObj ?y ?z)) 
		(mko (directlyAfterObj ?z ?t)) 	
		(mko (trip ?x)))
  :effect (and
    (flightRequest ?x ?y) (hotelStayRequest ?x ?z) (carRentalRequest ?x ?t) (notFree ?t)
    (not (notFree ?q))
  )
)

)
