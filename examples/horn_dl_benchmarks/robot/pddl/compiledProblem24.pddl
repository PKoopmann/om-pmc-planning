(define (problem robotProblem)
(:domain robot)
(:init
       (rightof1 robot)
       (leftof23 robot)
       (aboveof0 robot)
       (belowof23 robot))
(:goal (and (column2 robot) (row1 robot) (not (DATALOG_INCONSISTENT))))
)