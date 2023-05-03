(define (domain Wsmo2VTAT)
	(:requirements :strips :equality :disjunctive-preconditions :derived-predicates :negative-preconditions :conditional-effects :existential-preconditions)


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
  (KBquery_notFree ?x)
  (KBquery_directlyAfterObj ?x ?y)
  (KBquery_flightTicket ?x)
  (KBquery_hotelStayConfirmation ?x)
  (KBquery_carRentalBooking ?x)
  (KBquery_carRental ?x)
  (KBquery_hotelStay ?x)
  (KBquery_flight ?x)
  (KBquery_airportShuttle ?x)
  (KBquery_carHotelBundleOption ?x)
  (KBquery_trip ?x)
  (KBquery_invoice ?x)
  (KBquery_itinerary ?x)  
)

(:action vtaShuttleService
  :parameters (?x ?y ?q)
  :precondition (and 
		(KBquery_notFree ?q)
		(KBquery_directlyAfterObj ?q ?y)
		(KBquery_flightTicket ?x))
  :effect (and
    (airportShuttle ?y) (notFree ?y)
    (not (notFree ?q))
  )
)

(:action vtaCarHotelBundlingService
  :parameters (?x ?y ?z ?q)
  :precondition (and 
		(KBquery_notFree ?q)
		(KBquery_directlyAfterObj ?q ?z)
		(KBquery_hotelStayConfirmation ?x)
		(KBquery_carRentalBooking ?y))
  :effect (and
    (carHotelBundleOption ?z) (notFree ?z)
    (not (notFree ?q))
  )
)

(:action vtaCarRentalService
  :parameters (?x ?y ?q) 
  :precondition (and 
		(KBquery_notFree ?q)
		(KBquery_directlyAfterObj ?q ?y)
		(KBquery_carRental ?x))
  :effect (and
    (carRentalBooking ?y) (notFree ?y)
    (not (notFree ?q))
  )
)

(:action vtaHotelService
  :parameters (?x ?y ?q)
  :precondition (and 
		(KBquery_notFree ?q)
		(KBquery_directlyAfterObj ?q ?y)
		(KBquery_hotelStay ?x) )
  :effect (and
    (hotelStayConfirmation ?y) (notFree ?y)
    (not (notFree ?q))
  )
)

(:action vtaFlightService
  :parameters (?x ?y ?q)
  :precondition (and 
		(KBquery_notFree ?q)
		(KBquery_directlyAfterObj ?q ?y)
		(KBquery_flight ?x))
  :effect (and
    (flightTicket ?y) (notFree ?y)
    (not (notFree ?q))
  )
)

(:action vtaTripCombinationService
  :parameters (?x ?y ?z ?t ?q)
  :precondition (and 
		(KBquery_notFree ?q)
		(KBquery_directlyAfterObj ?q ?z)
		(KBquery_directlyAfterObj ?z ?t)
		(KBquery_airportShuttle ?x)
		(KBquery_carHotelBundleOption ?y))
  :effect (and
    (itinerary ?z) (invoice ?t) (notFree ?t)
    (not (notFree ?q))
  )
)

(:action vtaTripMakerService
  :parameters (?x ?y ?z ?t ?q)
  :precondition (and 
		(KBquery_notFree ?q)
		(KBquery_directlyAfterObj ?q ?y)
		(KBquery_directlyAfterObj ?y ?z)
		(KBquery_directlyAfterObj ?z ?t)
		(KBquery_trip ?x))
  :effect (and 
    (flightRequest ?y) (hotelStayRequest ?z) (carRentalRequest ?t) (notFree ?t)
    (not (notFree ?q))
  )
)

)
