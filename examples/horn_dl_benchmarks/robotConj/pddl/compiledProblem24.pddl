(define (problem robotProblem)
(:domain robot)
(:init
       (rightof1 robot)
       (leftof23 robot)
       (aboveof0 robot)
       (belowof23 robot))
(:goal (and (DATALOG_COLUMN2 robot) (DATALOG_ROW1 robot) (not (DATALOG_INCONSISTENT))))
)