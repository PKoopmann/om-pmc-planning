(define (problem robotProblem)
(:domain robot)
(:init
       (rightof1 robot)
       (leftof20 robot)
       (aboveof0 robot)
       (belowof20 robot))
(:goal (and (DATALOG_QUERY80) (not (DATALOG_INCONSISTENT))))
)