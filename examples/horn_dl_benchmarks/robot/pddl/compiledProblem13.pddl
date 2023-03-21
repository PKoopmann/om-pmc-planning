(define (problem robotProblem)
(:domain robot)
(:init
       (rightof1 robot)
       (leftof12 robot)
       (aboveof0 robot)
       (belowof12 robot))
(:goal (and (DATALOG_QUERY48) (not (DATALOG_INCONSISTENT))))
)