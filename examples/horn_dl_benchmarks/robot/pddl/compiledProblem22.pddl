(define (problem robotProblem)
(:domain robot)
(:init
       (rightof1 robot)
       (leftof21 robot)
       (aboveof0 robot)
       (belowof21 robot))
(:goal (and (DATALOG_QUERY84) (not (DATALOG_INCONSISTENT))))
)