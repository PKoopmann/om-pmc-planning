(define (problem robotProblem)
(:domain robot)
(:init
       (rightof1 robot)
       (leftof14 robot)
       (aboveof0 robot)
       (belowof14 robot))
(:goal (and (DATALOG_QUERY56) (not (DATALOG_INCONSISTENT))))
)