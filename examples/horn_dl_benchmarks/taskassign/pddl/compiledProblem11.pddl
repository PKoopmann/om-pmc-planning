(define (problem taskAssigment_problem)
(:domain taskAssigment)
(:init
       (engineer d)
       (developer e)
       (developer f)
       (developer g)
       (engineer i)
       (developer k))
(:goal (and (AUX11) (not (DATALOG_INCONSISTENT))))
)