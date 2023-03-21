(define (problem robotProblem)
(:domain robot)
(:init
       (rightof1 robot)
       (leftof21 robot)
       (aboveof0 robot)
       (belowof21 robot))
(:goal (and (DATALOG_COLUMN2 robot) (DATALOG_ROW1 robot) (not (DATALOG_INCONSISTENT))))
)