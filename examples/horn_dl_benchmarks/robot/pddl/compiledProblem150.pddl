(define (problem robotProblem)
(:domain robot)
(:init
       (rightof1 robot)
       (leftof149 robot)
       (aboveof0 robot)
       (belowof149 robot))
(:goal (and (column2 robot) (row1 robot) (not (DATALOG_INCONSISTENT))))
)