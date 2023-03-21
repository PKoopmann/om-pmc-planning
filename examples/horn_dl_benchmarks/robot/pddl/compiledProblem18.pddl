(define (problem robotProblem)
(:domain robot)
(:init
       (rightof1 robot)
       (leftof17 robot)
       (aboveof0 robot)
       (belowof17 robot))
(:goal (and (DATALOG_QUERY68) (not (DATALOG_INCONSISTENT))))
)