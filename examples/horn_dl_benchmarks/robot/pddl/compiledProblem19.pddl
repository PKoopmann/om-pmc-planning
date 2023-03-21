(define (problem robotProblem)
(:domain robot)
(:init
       (rightof1 robot)
       (leftof18 robot)
       (aboveof0 robot)
       (belowof18 robot))
(:goal (and (DATALOG_QUERY72) (not (DATALOG_INCONSISTENT))))
)