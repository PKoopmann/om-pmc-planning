(define (domain BTcat)
(:constants
  aa ab ac ad ae af ag ah ai aj ak al am an ao ap aq ar as at au av aw ax ay az ba bb - object)
(:predicates
  (cat ?x - object)
  (bomb ?x - object)
  (contains ?x ?y - object)
  (package ?x - object)
  (disarmed ?x - object)
  (object ?x - object)
  (DATALOG_INCONSISTENT)
  (DATALOG_QUERY0 ?x0 ?x1 - object)
  (DATALOG_PACKAGE ?x0 - object)
  (AUX0 ?y1 - object ?y2 - object ?y0 - object)
  (AUX1 ?y0 - object)
  (AUX2 ?x - object))
(:derived (DATALOG_QUERY0 ?x0 ?x1 - object)
          (and (bomb ?x1) (contains ?x0 ?x1)))
(:derived (DATALOG_INCONSISTENT)
          (or (exists (?y0 ?y1 ?y2 - object) (AUX0 ?y1 ?y2 ?y0)) (exists (?y0 - object) (AUX1 ?y0))))
(:derived (DATALOG_PACKAGE ?x0 - object)
          (or (exists (?y0 - object) (contains ?x0 ?y0)) (package ?x0)))
(:derived (AUX0 ?y1 - object ?y2 - object ?y0 - object)
          (and (contains ?y0 ?y1) (contains ?y0 ?y2) (not (= ?y1 ?y2))))
(:derived (AUX1 ?y0 - object)
          (and (bomb ?y0) (cat ?y0)))
(:derived (AUX2 ?x - object)
          (or (disarmed ?x) (not (DATALOG_PACKAGE ?x))))
(:action dunk
  :parameters (?x ?y - object)
  :precondition (and (DATALOG_PACKAGE ?x) (not (DATALOG_INCONSISTENT)))
  :effect (when (DATALOG_QUERY0 ?x ?y) (and (disarmed ?x))))
(:action let_the_cats_out
  :parameters (?x ?y - object)
  :precondition (and (DATALOG_PACKAGE ?x) (not (DATALOG_INCONSISTENT)))
  :effect (when (contains ?x ?y) (and (not (contains ?x ?y)) (cat ?y))))
)