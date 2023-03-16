(define (problem robotProblem)
(:domain robot)
(:init
       (rightof1 robot)
       (leftof10 robot)
       (aboveof0 robot)
       (belowof10 robot))
(:goal (and (DATALOG_QUERY40) (not (DATALOG_INCONSISTENT))))
)