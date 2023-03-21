(define (problem robotProblem)
(:domain robot)
(:init
       (rightof1 robot)
       (leftof2 robot)
       (aboveof0 robot)
       (belowof2 robot))
(:goal (and (DATALOG_QUERY8) (not (DATALOG_INCONSISTENT))))
)