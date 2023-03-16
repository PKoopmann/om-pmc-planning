(define (problem robotProblem)
(:domain robot)
(:init
       (rightof1 robot)
       (leftof19 robot)
       (aboveof0 robot)
       (belowof19 robot))
(:goal (and (DATALOG_QUERY76) (not (DATALOG_INCONSISTENT))))
)