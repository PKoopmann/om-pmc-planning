(define (problem robotProblem)
(:domain robot)
(:init
       (rightof1 robot)
       (leftof6 robot)
       (aboveof0 robot)
       (belowof6 robot))
(:goal (and (DATALOG_QUERY24) (not (DATALOG_INCONSISTENT))))
)