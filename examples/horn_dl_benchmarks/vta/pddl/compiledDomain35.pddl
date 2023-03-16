(define (domain Wsmo2VTAT)
(:constants
  iswc_2007 aa ab ac ad ae af ag ah ai aj ak al am an ao ap aq ar as at au av aw ax ay az ba bb bc bd be bf bg bh bi bj bk bl bm bn bo bp bq br bs - object)
(:predicates
  (invoice ?x - object)
  (trip ?x - object)
  (flight ?x - object)
  (flightticket ?x - object)
  (hotelstay ?x - object)
  (carhotelbundleoption ?x - object)
  (itinerary ?x - object)
  (flightrequest ?x - object)
  (hotelstayrequest ?x - object)
  (hotelstayconfirmation ?x - object)
  (carrentalrequest ?x - object)
  (carrental ?x - object)
  (carrentalbooking ?x - object)
  (airportshuttle ?x - object)
  (directlyafterobj ?x ?y - object)
  (notfree ?x - object)
  (DATALOG_HOTELSTAY ?x0 - object)
  (DATALOG_INCONSISTENT)
  (DATALOG_FLIGHT ?x0 - object)
  (DATALOG_QUERY0 ?x0 ?x1 - object)
  (DATALOG_CARRENTAL ?x0 - object)
  (AUX0 ?y0 - object)
  (AUX1 ?y0 - object)
  (AUX2 ?y0 - object)
  (AUX3))
(:derived (DATALOG_QUERY0 ?x0 ?x1 - object)
          (and (invoice ?x1) (itinerary ?x0)))
(:derived (DATALOG_HOTELSTAY ?x0 - object)
          (or (hotelstay ?x0) (hotelstayrequest ?x0)))
(:derived (DATALOG_INCONSISTENT)
          (or (exists (?y0 - object) (AUX0 ?y0)) (exists (?y0 - object) (AUX1 ?y0)) (exists (?y0 - object) (AUX2 ?y0))))
(:derived (DATALOG_FLIGHT ?x0 - object)
          (or (flight ?x0) (flightrequest ?x0)))
(:derived (DATALOG_CARRENTAL ?x0 - object)
          (or (carrental ?x0) (carrentalrequest ?x0)))
(:derived (AUX0 ?y0 - object)
          (and (carrentalrequest ?y0) (hotelstayrequest ?y0)))
(:derived (AUX1 ?y0 - object)
          (and (flightrequest ?y0) (hotelstayrequest ?y0)))
(:derived (AUX2 ?y0 - object)
          (and (carrentalrequest ?y0) (flightrequest ?y0)))
(:derived (AUX3)
          (exists (?receipt ?fullTrip - object) (DATALOG_QUERY0 ?fullTrip ?receipt)))
(:action vtaShuttleService
  :parameters (?x ?y ?q - object)
  :precondition (and (directlyafterobj ?q ?y) (flightticket ?x) (notfree ?q) (not (DATALOG_INCONSISTENT)))
  :effect (and (airportshuttle ?y) (notfree ?y) (not (notfree ?q))))
(:action vtaCarHotelBundlingService
  :parameters (?x ?y ?z ?q - object)
  :precondition (and (carrentalbooking ?y) (directlyafterobj ?q ?z) (hotelstayconfirmation ?x) (notfree ?q) (not (DATALOG_INCONSISTENT)))
  :effect (and (carhotelbundleoption ?z) (notfree ?z) (not (notfree ?q))))
(:action vtaCarRentalService
  :parameters (?x ?y ?q - object)
  :precondition (and (DATALOG_CARRENTAL ?x) (directlyafterobj ?q ?y) (notfree ?q) (not (DATALOG_INCONSISTENT)))
  :effect (and (carrentalbooking ?y) (notfree ?y) (not (notfree ?q))))
(:action vtaHotelService
  :parameters (?x ?y ?q - object)
  :precondition (and (DATALOG_HOTELSTAY ?x) (directlyafterobj ?q ?y) (notfree ?q) (not (DATALOG_INCONSISTENT)))
  :effect (and (hotelstayconfirmation ?y) (notfree ?y) (not (notfree ?q))))
(:action vtaFlightService
  :parameters (?x ?y ?q - object)
  :precondition (and (DATALOG_FLIGHT ?x) (directlyafterobj ?q ?y) (notfree ?q) (not (DATALOG_INCONSISTENT)))
  :effect (and (flightticket ?y) (notfree ?y) (not (notfree ?q))))
(:action vtaTripCombinationService
  :parameters (?x ?y ?z ?t ?q - object)
  :precondition (and (airportshuttle ?x) (carhotelbundleoption ?y) (directlyafterobj ?q ?z) (directlyafterobj ?z ?t) (notfree ?q) (not (DATALOG_INCONSISTENT)))
  :effect (and (itinerary ?z) (invoice ?t) (notfree ?t) (not (notfree ?q))))
(:action vtaTripMakerService
  :parameters (?x ?y ?z ?t ?q - object)
  :precondition (and (directlyafterobj ?q ?y) (directlyafterobj ?y ?z) (directlyafterobj ?z ?t) (notfree ?q) (trip ?x) (not (DATALOG_INCONSISTENT)))
  :effect (and (flightrequest ?y) (hotelstayrequest ?z) (carrentalrequest ?t) (notfree ?t) (not (notfree ?q))))
)