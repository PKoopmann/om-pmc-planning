(define (problem robotProblem)
(:domain robot)
(:init
       (rightof1 robot)
       (leftof9 robot)
       (aboveof0 robot)
       (belowof9 robot))
(:goal (and (DATALOG_QUERY36) (not (DATALOG_INCONSISTENT))))
)