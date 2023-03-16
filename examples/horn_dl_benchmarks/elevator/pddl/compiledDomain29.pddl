(define (domain elevators)
(:constants
  pass_ab pass_ai pass_bb pass_ak pass_ad pass_ap pass_au pass_af pass_aj pass_ah pass_al aa ac ae ag am an ao aq ar as at av aw ax ay az ba bc - object)
(:predicates
  (passenger ?p - object)
  (boarded ?p - object)
  (served ?p - object)
  (floor ?p - object)
  (origin ?p ?f - object)
  (destin ?p ?f - object)
  (liftat ?f - object)
  (next ?f1 ?f2 - object)
  (DATALOG_QUERY0 ?x0 ?x1 - object)
  (DATALOG_PASSENGER ?x0 - object)
  (DATALOG_INCONSISTENT)
  (DATALOG_FLOOR ?x0 - object)
  (AUX0 ?y0 - object)
  (AUX1 ?y0 - object ?y2 - object ?y1 - object)
  (AUX2 ?x - object))
(:derived (DATALOG_QUERY0 ?x0 ?x1 - object)
          (and (boarded ?x1) (destin ?x1 ?x0)))
(:derived (DATALOG_PASSENGER ?x0 - object)
          (or (exists (?y0 - object) (destin ?x0 ?y0)) (exists (?y0 - object) (origin ?x0 ?y0)) (boarded ?x0) (passenger ?x0) (served ?x0)))
(:derived (DATALOG_INCONSISTENT)
          (or (exists (?y0 ?y1 ?y2 - object) (AUX1 ?y0 ?y2 ?y1)) (exists (?y0 - object) (AUX0 ?y0))))
(:derived (DATALOG_FLOOR ?x0 - object)
          (or (exists (?y0 - object) (destin ?y0 ?x0)) (exists (?y0 - object) (origin ?y0 ?x0)) (floor ?x0) (liftat ?x0)))
(:derived (AUX0 ?y0 - object)
          (and (DATALOG_FLOOR ?y0) (DATALOG_PASSENGER ?y0)))
(:derived (AUX1 ?y0 - object ?y2 - object ?y1 - object)
          (and (next ?y0 ?y1) (next ?y0 ?y2) (not (= ?y1 ?y2))))
(:derived (AUX2 ?x - object)
          (or (served ?x) (not (DATALOG_PASSENGER ?x))))
(:action stop
  :parameters (?p ?f - object)
  :precondition (and (DATALOG_PASSENGER ?p) (liftat ?f) (not (DATALOG_INCONSISTENT)))
  :effect (and (when (and (origin ?p ?f) (not (boarded ?p)) (not (served ?p))) (boarded ?p)) (when (DATALOG_QUERY0 ?f ?p) (and (served ?p) (not (boarded ?p))))))
(:action moveUp
  :parameters (?f1 ?f2 - object)
  :precondition (and (liftat ?f1) (next ?f1 ?f2) (not (DATALOG_INCONSISTENT)))
  :effect (when (and (liftat ?f1) (not (= ?f1 ?f2))) (and (liftat ?f2) (not (liftat ?f1)))))
(:action moveDown
  :parameters (?f1 ?f2 - object)
  :precondition (and (liftat ?f1) (next ?f2 ?f1) (not (DATALOG_INCONSISTENT)))
  :effect (when (and (liftat ?f1) (not (= ?f1 ?f2))) (and (liftat ?f2) (not (liftat ?f1)))))
)