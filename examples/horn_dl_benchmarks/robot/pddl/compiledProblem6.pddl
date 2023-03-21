(define (problem robotProblem)
(:domain robot)
(:init
       (rightof1 robot)
       (leftof5 robot)
       (aboveof0 robot)
       (belowof5 robot))
(:goal (and (DATALOG_QUERY20) (not (DATALOG_INCONSISTENT))))
)