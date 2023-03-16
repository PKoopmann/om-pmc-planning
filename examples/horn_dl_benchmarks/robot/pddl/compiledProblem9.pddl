(define (problem robotProblem)
(:domain robot)
(:init
       (rightof1 robot)
       (leftof8 robot)
       (aboveof0 robot)
       (belowof8 robot))
(:goal (and (DATALOG_QUERY32) (not (DATALOG_INCONSISTENT))))
)