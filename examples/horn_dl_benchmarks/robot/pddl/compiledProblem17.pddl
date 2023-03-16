(define (problem robotProblem)
(:domain robot)
(:init
       (rightof1 robot)
       (leftof16 robot)
       (aboveof0 robot)
       (belowof16 robot))
(:goal (and (DATALOG_QUERY64) (not (DATALOG_INCONSISTENT))))
)