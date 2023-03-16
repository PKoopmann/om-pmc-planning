(define (problem robotProblem)
(:domain robot)
(:init
       (rightof1 robot)
       (leftof7 robot)
       (aboveof0 robot)
       (belowof7 robot))
(:goal (and (DATALOG_QUERY28) (not (DATALOG_INCONSISTENT))))
)