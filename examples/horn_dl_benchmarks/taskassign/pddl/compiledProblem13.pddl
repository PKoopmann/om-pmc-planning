(define (problem taskAssigment_problem)
(:domain taskAssigment)
(:init
       (designer b)
       (engineer c)
       (developer e)
       (designer f)
       (developer i)
       (engineer k)
       (engineer m))
(:goal (and (AUX11) (not (DATALOG_INCONSISTENT))))
)