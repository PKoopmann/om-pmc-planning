(define (problem robotProblem)
(:domain robot)
(:init
       (rightof1 robot)
       (leftof3 robot)
       (aboveof0 robot)
       (belowof3 robot))
(:goal (and (DATALOG_QUERY12) (not (DATALOG_INCONSISTENT))))
)