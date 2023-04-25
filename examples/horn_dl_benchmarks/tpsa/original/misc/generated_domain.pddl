(define (domain Wsmo2TPSA)
(:constants
  voipRequest voip a b c d e f g - object)
(:predicates
  (order ?x - object)
  (requestedservice ?x ?y - object)
  (service ?x - object)
  (contract ?x - object)
  (requiredservice ?x ?y - object)
  (ack ?x - object)
  (confirmation ?x - object)
  (hasservice ?x ?y - object)
  (hardwareack ?x - object)
  (forservice ?x ?y - object)
  (crmack ?x - object)
  (courierack ?x - object)
  (contractconfirmation ?x - object)
  (hascontract ?x ?y - object)
  (orderconfirmation ?x - object)
  (activation ?x - object)
  (serviceactivation ?x - object)
  (invoice ?x - object)
  (greater ?x ?y - object)
  (notfree ?x - object)
  (DATALOG_CONFIRMATION ?x0 - object)
  (DATALOG_SERVICE ?x0 - object)
  (DATALOG_INCONSISTENT)
  (DATALOG_ACK ?x0 - object)
  (DATALOG_ACTIVATION ?x0 - object)
  (DATALOG_CONTRACT ?x0 - object)
  (AUX0 ?y0 - object)
  (AUX1))
(:derived (DATALOG_INCONSISTENT)
          (exists (?y0 - object) (AUX0 ?y0)))
(:derived (DATALOG_CONFIRMATION ?x0 - object)
          (or (confirmation ?x0) (contractconfirmation ?x0) (orderconfirmation ?x0)))
(:derived (DATALOG_SERVICE ?x0 - object)
          (or (exists (?y0 - object) (forservice ?y0 ?x0)) (exists (?y0 - object) (hasservice ?y0 ?x0)) (exists (?y0 - object) (requestedservice ?y0 ?x0)) (exists (?y0 - object) (requiredservice ?y0 ?x0)) (service ?x0)))
(:derived (DATALOG_ACK ?x0 - object)
          (or (ack ?x0) (courierack ?x0) (crmack ?x0) (hardwareack ?x0)))
(:derived (DATALOG_ACTIVATION ?x0 - object)
          (or (activation ?x0) (serviceactivation ?x0)))
(:derived (DATALOG_CONTRACT ?x0 - object)
          (or (exists (?y0 - object) (hascontract ?y0 ?x0)) (contract ?x0)))
(:derived (AUX0 ?y0 - object)
          (and (DATALOG_CONTRACT ?y0) (DATALOG_SERVICE ?y0)))
(:derived (AUX1)
          (exists (?x - object) (invoice ?x)))
(:action billingActivation
  :parameters (?x ?y - object)
  :precondition (and (DATALOG_ACTIVATION ?x) (not (DATALOG_INCONSISTENT)))
  :effect (and (invoice ?y)))
(:action confirmOrder
  :parameters (?x ?y ?z - object)
  :precondition (and (DATALOG_SERVICE ?y) (order ?x) (requestedservice ?x ?y) (not (DATALOG_INCONSISTENT)))
  :effect (and (hasservice ?z ?y) (orderconfirmation ?z)))
(:action contractSaving
  :parameters (?x ?y ?z - object)
  :precondition (and (DATALOG_CONTRACT ?y) (courierack ?x) (not (DATALOG_INCONSISTENT)))
  :effect (and (crmack ?z)))
(:action courierService
  :parameters (?x ?y - object)
  :precondition (and (DATALOG_CONTRACT ?x) (not (DATALOG_INCONSISTENT)))
  :effect (and (courierack ?y)))
(:action prepareContract
  :parameters (?x ?y ?z - object)
  :precondition (and (DATALOG_SERVICE ?y) (hasservice ?x ?y) (orderconfirmation ?x) (not (DATALOG_INCONSISTENT)))
  :effect (and (requiredservice ?z ?y) (contract ?z)))
(:action prepareHardware
  :parameters (?x ?y ?z - object)
  :precondition (and (DATALOG_CONFIRMATION ?x) (DATALOG_SERVICE ?y) (hasservice ?x ?y) (not (DATALOG_INCONSISTENT)))
  :effect (and (forservice ?z ?y) (hardwareack ?z)))
(:action productActivation
  :parameters (?x ?y ?z - object)
  :precondition (and (crmack ?x) (hardwareack ?y) (not (DATALOG_INCONSISTENT)))
  :effect (and (serviceactivation ?z)))
)