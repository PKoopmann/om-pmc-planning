(define (problem robotProblem)
(:domain robot)
(:init
       (rightof1 robot)
       (leftof179 robot)
       (aboveof0 robot)
       (belowof179 robot))
(:goal (and (DATALOG_COLUMN2 robot) (DATALOG_ROW1 robot) (not (DATALOG_INCONSISTENT))))
)