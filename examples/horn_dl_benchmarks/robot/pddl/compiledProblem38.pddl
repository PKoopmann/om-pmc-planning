(define (problem robotProblem)
(:domain robot)
(:init
       (rightof1 robot)
       (leftof37 robot)
       (aboveof0 robot)
       (belowof37 robot))
(:goal (and (column2 robot) (row1 robot) (not (DATALOG_INCONSISTENT))))
)