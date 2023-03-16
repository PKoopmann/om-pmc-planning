(define (problem robotProblem)
(:domain robot)
(:init
       (rightof1 robot)
       (leftof15 robot)
       (aboveof0 robot)
       (belowof15 robot))
(:goal (and (DATALOG_QUERY60) (not (DATALOG_INCONSISTENT))))
)