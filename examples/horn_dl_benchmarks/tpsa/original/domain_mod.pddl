(define (domain Wsmo2TPSA)

(:predicates 
	(order ?x)
	(requestedService ?x ?y)
	(service ?x)
	(contract ?x)
	(requiredService ?x ?y)
	(ack ?x)
	(confirmation ?x)
	(hasService ?x ?y)
	(hardwareAck ?x)
	(forService ?x ?y)
	(crmAck ?x)
	(courierAck ?x)
	(contractConfirmation ?x)
	(hasContract ?x ?y)
	(orderConfirmation ?x)
	(activation ?x)
	(serviceActivation ?x)
	(invoice ?x)
	(greater ?x ?y)
	(notFree ?x)
)

(:action billingActivation
  :parameters (?x ?y)
  :precondition ( and (mko (activation ?x)) (not (= ?x ?y)))
  :effect (and
	(invoice ?y)
  )
)

(:action confirmOrder
  :parameters (?x ?y ?z)
  :precondition (and (mko (requestedService ?x ?y)) (mko (order ?x)) (mko (service ?y)) (not (= ?x ?y)) (not (= ?y ?z)) (not (= ?x ?z)))
  :effect (and
	(hasService ?z ?y) 
	(orderConfirmation ?z)
  )
)

(:action contractSaving
  :parameters (?x ?y ?z)
  :precondition (and (mko (courierAck ?x)) (mko (contract ?y)) (not (= ?x ?y)) (not (= ?y ?z)) (not (= ?x ?z)))
  :effect (and
	(crmAck ?z)
  )
)

(:action courierService
  :parameters (?x ?y)
  :precondition (and (mko (contract ?x)) (not (= ?x ?y)))
  :effect (and
    (courierAck ?y)
  )
)

(:action prepareContract
  :parameters (?x ?y ?z)
  :precondition (and (mko (hasService ?x ?y)) (mko (orderConfirmation ?x)) (mko (service ?y)) (not (= ?x ?y)) (not (= ?y ?z)) (not (= ?x ?z)))
  :effect (and
	(requiredService ?z ?y) 
	(contract ?z)
  )
)

(:action prepareHardware
  :parameters (?x ?y ?z)
  :precondition (and (mko (hasService ?x ?y)) (mko (confirmation ?x)) (mko (service ?y)) (not (= ?x ?y)) (not (= ?y ?z)) (not (= ?x ?z)))
  :effect (and
	(forService ?z ?y)
	(hardwareAck ?z)
  )
)

(:action productActivation
  :parameters (?x ?y ?z)
  :precondition (and (mko (crmAck ?x)) (mko (hardwareAck ?y)) (not (= ?x ?y)) (not (= ?y ?z)) (not (= ?x ?z)))
  :effect (and
    (serviceActivation ?z)
  )
)

)
