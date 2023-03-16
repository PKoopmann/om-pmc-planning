(define (problem robotProblem)
(:domain robot)
(:init
       (rightof1 robot)
       (leftof29 robot)
       (aboveof0 robot)
       (belowof29 robot))
(:goal (and (DATALOG_COLUMN2 robot) (DATALOG_ROW1 robot) (not (DATALOG_INCONSISTENT))))
)