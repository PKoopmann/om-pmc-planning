(define (problem robotProblem)
(:domain robot)
(:init
       (rightof1 robot)
       (leftof11 robot)
       (aboveof0 robot)
       (belowof11 robot))
(:goal (and (DATALOG_QUERY44) (not (DATALOG_INCONSISTENT))))
)