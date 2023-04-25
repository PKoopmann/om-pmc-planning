(define (domain Wsmo2TPSA)

(:predicates 
    (false)
    (true)
    (inconsistent)
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

  (KBquery_activation ?x)
  (KBquery_order ?x)
  (KBquery_service ?x)
  (KBquery_courierAck ?x)
  (KBquery_contract ?x)
  (KBquery_orderConfirmation ?x)
  (KBquery_confirmation ?x)
  (KBquery_crmAck ?x)
  (KBquery_hardwareAck ?x)
  (KBquery_invoice ?x)
  (KBquery_requestedService ?x ?y)
  (KBquery_hasService ?x ?y)
)

    (:derived (true)
        (not (false))
    )

(:action billingActivation
  :parameters (?x ?y)
        :precondition (and
            (not (inconsistent))
            (KBquery_activation ?x)
        )
  :effect (and
	(invoice ?y)
  )
)

(:action confirmOrder
  :parameters (?x ?y ?z)
        :precondition (and
            (not (inconsistent))
            (and (KBquery_requestedService ?x ?y) (KBquery_order ?x) (KBquery_service ?y))
        )
  :effect (and
	(hasService ?z ?y) 
	(orderConfirmation ?z)
  )
)

(:action contractSaving
  :parameters (?x ?y ?z)
        :precondition (and
            (not (inconsistent))
            (and (KBquery_courierAck ?x) (KBquery_contract ?y))
        )
  :effect (and
	(crmAck ?z)
  )
)

(:action courierService
  :parameters (?x ?y)
        :precondition (and
            (not (inconsistent))
            (KBquery_contract ?x)
        )
  :effect (and
    (courierAck ?y)
  )
)

(:action prepareContract
  :parameters (?x ?y ?z)
        :precondition (and
            (not (inconsistent))
            (and (KBquery_hasService ?x ?y) (KBquery_orderConfirmation ?x) (KBquery_service ?y))
        )
  :effect (and
	(requiredService ?z ?y) 
	(contract ?z)
  )
)

(:action prepareHardware
  :parameters (?x ?y ?z)
        :precondition (and
            (not (inconsistent))
            (and (KBquery_hasService ?x ?y) (KBquery_confirmation ?x) (KBquery_service ?y))
        )
  :effect (and
	(forService ?z ?y)
	(hardwareAck ?z)
  )
)

(:action productActivation
  :parameters (?x ?y ?z)
        :precondition (and
            (not (inconsistent))
            (and (KBquery_crmAck ?x) (KBquery_hardwareAck ?y))
        )
  :effect (and
    (serviceActivation ?z)
  )
)

)
