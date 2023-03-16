(define (domain Wsmo2VTAT)
(:constants
  iswc_2007 aa ab ac ad ae af ag ah ai aj ak al am an - object)
(:predicates
  (invoice ?x ?y - object)
  (trip ?x - object)
  (flight ?x - object)
  (flightticket ?x ?y - object)
  (hotelstay ?x - object)
  (carhotelbundleoption ?x ?y - object)
  (itinerary ?x ?y - object)
  (flightrequest ?x ?y - object)
  (hotelstayrequest ?x ?y - object)
  (hotelstayconfirmation ?x ?y - object)
  (carrentalrequest ?x ?y - object)
  (carrental ?x - object)
  (carrentalbooking ?x ?y - object)
  (airportshuttle ?x ?y - object)
  (directlyafterobj ?x ?y - object)
  (notfree ?x - object)
  (DATALOG_INCONSISTENT)
  (DATALOG_TRIP ?x0 - object)
  (DATALOG_QUERY0 ?x0 ?x1 - object)
  (DATALOG_CARRENTAL ?x0 - object)
  (DATALOG_FLIGHT ?x0 - object)
  (DATALOG_HOTELSTAY ?x0 - object)
  (AUX0 ?y0 - object)
  (AUX1 ?y0 - object)
  (AUX2 ?y0 - object)
  (AUX3))
(:derived (DATALOG_QUERY0 ?x0 ?x1 - object)
          (and (invoice iswc_2007 ?x1) (itinerary iswc_2007 ?x0)))
(:derived (DATALOG_INCONSISTENT)
          (or (exists (?y0 - object) (AUX0 ?y0)) (exists (?y0 - object) (AUX1 ?y0)) (exists (?y0 - object) (AUX2 ?y0))))
(:derived (DATALOG_TRIP ?x0 - object)
          (or (exists (?y0 - object) (airportshuttle ?x0 ?y0)) (exists (?y0 - object) (carhotelbundleoption ?x0 ?y0)) (exists (?y0 - object) (carrentalbooking ?x0 ?y0)) (exists (?y0 - object) (carrentalrequest ?x0 ?y0)) (exists (?y0 - object) (flightrequest ?x0 ?y0)) (exists (?y0 - object) (flightticket ?x0 ?y0)) (exists (?y0 - object) (hotelstayconfirmation ?x0 ?y0)) (exists (?y0 - object) (hotelstayrequest ?x0 ?y0)) (trip ?x0)))
(:derived (DATALOG_CARRENTAL ?x0 - object)
          (or (exists (?y0 - object) (carrentalrequest ?y0 ?x0)) (carrental ?x0)))
(:derived (DATALOG_FLIGHT ?x0 - object)
          (or (exists (?y0 - object) (flightrequest ?y0 ?x0)) (flight ?x0)))
(:derived (DATALOG_HOTELSTAY ?x0 - object)
          (or (exists (?y0 - object) (hotelstayrequest ?y0 ?x0)) (hotelstay ?x0)))
(:derived (AUX0 ?y0 - object)
          (and (DATALOG_CARRENTAL ?y0) (DATALOG_HOTELSTAY ?y0)))
(:derived (AUX1 ?y0 - object)
          (and (DATALOG_FLIGHT ?y0) (DATALOG_HOTELSTAY ?y0)))
(:derived (AUX2 ?y0 - object)
          (and (DATALOG_CARRENTAL ?y0) (DATALOG_FLIGHT ?y0)))
(:derived (AUX3)
          (exists (?receipt ?fullTrip - object) (DATALOG_QUERY0 ?fullTrip ?receipt)))
(:action vtaShuttleService
  :parameters (?x ?z ?q ?y - object)
  :precondition (and (directlyafterobj ?q ?y) (flightticket ?z ?x) (notfree ?q) (not (DATALOG_INCONSISTENT)))
  :effect (and (airportshuttle ?z ?y) (notfree ?y) (not (notfree ?q))))
(:action vtaCarHotelBundlingService
  :parameters (?s ?x ?y ?q ?z - object)
  :precondition (and (carrentalbooking ?s ?y) (directlyafterobj ?q ?z) (hotelstayconfirmation ?s ?x) (notfree ?q) (not (DATALOG_INCONSISTENT)))
  :effect (and (carhotelbundleoption ?s ?z) (notfree ?z) (not (notfree ?q))))
(:action vtaCarRentalService
  :parameters (?z ?x ?q ?y - object)
  :precondition (and (DATALOG_CARRENTAL ?x) (carrentalrequest ?z ?x) (directlyafterobj ?q ?y) (notfree ?q) (not (DATALOG_INCONSISTENT)))
  :effect (and (carrentalbooking ?z ?y) (notfree ?y) (not (notfree ?q))))
(:action vtaHotelService
  :parameters (?z ?x ?q ?y - object)
  :precondition (and (DATALOG_HOTELSTAY ?x) (directlyafterobj ?q ?y) (hotelstayrequest ?z ?x) (notfree ?q) (not (DATALOG_INCONSISTENT)))
  :effect (and (hotelstayconfirmation ?z ?y) (notfree ?y) (not (notfree ?q))))
(:action vtaFlightService
  :parameters (?z ?x ?q ?y - object)
  :precondition (and (DATALOG_FLIGHT ?x) (directlyafterobj ?q ?y) (flightrequest ?z ?x) (notfree ?q) (not (DATALOG_INCONSISTENT)))
  :effect (and (flightticket ?z ?y) (notfree ?y) (not (notfree ?q))))
(:action vtaTripCombinationService
  :parameters (?s ?x ?y ?z ?t ?q - object)
  :precondition (and (airportshuttle ?s ?x) (carhotelbundleoption ?s ?y) (directlyafterobj ?q ?z) (directlyafterobj ?z ?t) (notfree ?q) (not (DATALOG_INCONSISTENT)))
  :effect (and (itinerary ?s ?z) (invoice ?s ?t) (notfree ?t) (not (notfree ?q))))
(:action vtaTripMakerService
  :parameters (?x ?q ?y ?z ?t - object)
  :precondition (and (DATALOG_TRIP ?x) (directlyafterobj ?q ?y) (directlyafterobj ?y ?z) (directlyafterobj ?z ?t) (notfree ?q) (not (DATALOG_INCONSISTENT)))
  :effect (and (flightrequest ?x ?y) (hotelstayrequest ?x ?z) (carrentalrequest ?x ?t) (notfree ?t) (not (notfree ?q))))
)