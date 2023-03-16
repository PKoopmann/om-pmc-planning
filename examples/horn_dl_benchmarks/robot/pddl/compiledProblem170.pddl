(define (problem robotProblem)
(:domain robot)
(:init
       (rightof1 robot)
       (leftof169 robot)
       (aboveof0 robot)
       (belowof169 robot))
(:goal (and (column2 robot) (row1 robot) (not (DATALOG_INCONSISTENT))))
)