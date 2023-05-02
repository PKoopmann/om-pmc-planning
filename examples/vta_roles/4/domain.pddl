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

	(KBquery_notFree ?x)
	(KBquery_directlyAfterObj ?x ?y)
	(KBquery_flightTicket ?z ?x)
	(KBquery_hotelStayConfirmation ?z ?x)
	(KBquery_carRentalBooking ?s ?x)
	(KBquery_carRental ?x)
	(KBquery_carRentalRequest ?s ?x)
	(KBquery_hotelStay ?x)
	(KBquery_hotelStayRequest ?s ?x)
	(KBquery_flight ?x)
	(KBquery_flightRequest ?s ?x)
	(KBquery_airportShuttle ?s ?x)
	(KBquery_carHotelBundleOption ?s ?x)
	(KBquery_trip ?x)
	(KBquery_invoice ?s ?x)
	(KBquery_itinerary ?s ?x)
)

(:action vtaShuttleService
  :parameters (?x ?z ?q ?y)
  :precondition (and 
		(KBquery_notFree ?q)
		(KBquery_directlyAfterObj ?q ?y)
		(KBquery_flightTicket ?z ?x))
  :effect (and
    (airportShuttle ?z ?y) (notFree ?y)
    (not (notFree ?q))
  )
)

(:action vtaCarHotelBundlingService
  :parameters (?s ?x ?y ?q ?z)
  :precondition (and 
		(KBquery_notFree ?q)
		(KBquery_directlyAfterObj ?q ?z)
		(KBquery_hotelStayConfirmation ?s ?x)
		(KBquery_carRentalBooking ?s ?y))
  :effect (and
    (carHotelBundleOption ?s ?z) (notFree ?z)
    (not (notFree ?q))
  )
)

(:action vtaCarRentalService
  :parameters (?z ?x ?q ?y)
  :precondition (and 
		(KBquery_notFree ?q)
		(KBquery_directlyAfterObj ?q ?y)
		(KBquery_carRental ?x)
		(KBquery_carRentalRequest ?z ?x))
  :effect (and
    (carRentalBooking ?z ?y) (notFree ?y)
    (not (notFree ?q))
  )
)

(:action vtaHotelService
  :parameters (?z ?x ?q ?y)
  :precondition (and 
		(KBquery_notFree ?q)
		(KBquery_directlyAfterObj ?q ?y)
		(KBquery_hotelStay ?x) 
		(KBquery_hotelStayRequest ?z ?x))
  :effect (and
    (hotelStayConfirmation ?z ?y)(notFree ?y)
    (not (notFree ?q))
  )
)

(:action vtaFlightService
  :parameters (?z ?x ?q ?y)
  :precondition (and 
		(KBquery_notFree ?q)
		(KBquery_directlyAfterObj ?q ?y)
		(KBquery_flightRequest ?z ?x)
		(KBquery_flight ?x))
  :effect (and
    (flightTicket ?z ?y)(notFree ?y)
    (not (notFree ?q))
  )
)

(:action vtaTripCombinationService
  :parameters (?s ?x ?y ?z ?t ?q )
  :precondition (and 
		(KBquery_notFree ?q)
		(KBquery_directlyAfterObj ?q ?z)
		(KBquery_directlyAfterObj ?z ?t)
		(KBquery_airportShuttle ?s ?x)
		(KBquery_carHotelBundleOption ?s ?y))
  :effect (and
    (itinerary ?s ?z) (invoice ?s ?t) (notFree ?t)
    (not (notFree ?q))
  )
)

(:action vtaTripMakerService
  :parameters (?x ?q ?y ?z ?t)
  :precondition (and 
		(KBquery_notFree ?q)
		(KBquery_directlyAfterObj ?q ?y)
		(KBquery_directlyAfterObj ?y ?z)
		(KBquery_directlyAfterObj ?z ?t)
		(KBquery_trip ?x))
  :effect (and
    (flightRequest ?x ?y) (hotelStayRequest ?x ?z) (carRentalRequest ?x ?t) (notFree ?t)
    (not (notFree ?q))
  )
)

)
