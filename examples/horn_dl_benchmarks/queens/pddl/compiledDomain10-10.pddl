(define (domain queens)
(:constants
  aa ab ac ad ae af ag ah ai aj ba bb bc bd be bf bg bh bi bj ca cb cc cd ce cf cg ch ci cj da db dc dd de df dg dh di dj ea eb ec ed ee ef eg eh ei ej fa fb fc fd fe ff fg fh fi fj ga gb gc gd ge gf gg gh gi gj ha hb hc hd he hf hg hh hi hj ia ib ic id ie if ig ih ii ij ja jb jc jd je jf jg jh ji jj - object)
(:predicates
  (queen ?x - object)
  (figure ?x - object)
  (rightdiagonal ?x ?y - object)
  (backdiagonal ?x ?y - object)
  (inline ?x ?y - object)
  (horinline ?x ?y - object)
  (verinline ?x ?y - object)
  (DATALOG_RIGHTDIAGONAL ?x0 ?x1 - object)
  (DATALOG_INLINE ?x0 ?x1 - object)
  (DATALOG_VERINLINE ?x0 ?x1 - object)
  (DATALOG_HORINLINE ?x0 ?x1 - object)
  (DATALOG_FIGURE ?x0 - object)
  (DATALOG_BACKDIAGONAL ?x0 ?x1 - object)
  (DATALOG_QUERY0 ?x0 ?x1 - object)
  (AUX0 ?x1 - object ?y0 - object ?x0 - object)
  (AUX1 ?x1 - object ?y0 - object ?x0 - object)
  (AUX2 ?x1 - object ?y0 - object ?x0 - object)
  (AUX3 ?x1 - object ?y0 - object ?x0 - object)
  (AUX4 ?x - object ?y - object))
(:derived (DATALOG_QUERY0 ?x0 ?x1 - object)
          (and (DATALOG_INLINE ?x0 ?x1) (queen ?x0)))
(:derived (DATALOG_RIGHTDIAGONAL ?x0 ?x1 - object)
          (or (exists (?y0 - object) (AUX0 ?x1 ?y0 ?x0)) (DATALOG_RIGHTDIAGONAL ?x1 ?x0) (rightdiagonal ?x0 ?x1)))
(:derived (DATALOG_INLINE ?x0 ?x1 - object)
          (or (DATALOG_BACKDIAGONAL ?x0 ?x1) (DATALOG_HORINLINE ?x0 ?x1) (DATALOG_INLINE ?x1 ?x0) (DATALOG_RIGHTDIAGONAL ?x0 ?x1) (DATALOG_VERINLINE ?x0 ?x1) (inline ?x0 ?x1)))
(:derived (DATALOG_VERINLINE ?x0 ?x1 - object)
          (or (exists (?y0 - object) (AUX1 ?x1 ?y0 ?x0)) (DATALOG_VERINLINE ?x1 ?x0) (verinline ?x0 ?x1)))
(:derived (DATALOG_HORINLINE ?x0 ?x1 - object)
          (or (exists (?y0 - object) (AUX2 ?x1 ?y0 ?x0)) (DATALOG_HORINLINE ?x1 ?x0) (horinline ?x0 ?x1)))
(:derived (DATALOG_FIGURE ?x0 - object)
          (or (figure ?x0) (queen ?x0)))
(:derived (DATALOG_BACKDIAGONAL ?x0 ?x1 - object)
          (or (exists (?y0 - object) (AUX3 ?x1 ?y0 ?x0)) (DATALOG_BACKDIAGONAL ?x1 ?x0) (backdiagonal ?x0 ?x1)))
(:derived (AUX0 ?x1 - object ?y0 - object ?x0 - object)
          (and (DATALOG_RIGHTDIAGONAL ?x0 ?y0) (DATALOG_RIGHTDIAGONAL ?y0 ?x1)))
(:derived (AUX1 ?x1 - object ?y0 - object ?x0 - object)
          (and (DATALOG_VERINLINE ?x0 ?y0) (DATALOG_VERINLINE ?y0 ?x1)))
(:derived (AUX2 ?x1 - object ?y0 - object ?x0 - object)
          (and (DATALOG_HORINLINE ?x0 ?y0) (DATALOG_HORINLINE ?y0 ?x1)))
(:derived (AUX3 ?x1 - object ?y0 - object ?x0 - object)
          (and (DATALOG_BACKDIAGONAL ?x0 ?y0) (DATALOG_BACKDIAGONAL ?y0 ?x1)))
(:derived (AUX4 ?x - object ?y - object)
          (or (= ?x ?y) (not (DATALOG_INLINE ?x ?y)) (not (queen ?x)) (not (queen ?y))))
(:action Move
  :parameters (?x ?y - object)
  :precondition (and (DATALOG_QUERY0 ?x ?y) (not (DATALOG_FIGURE ?y)))
  :effect (and (not (queen ?x)) (queen ?y)))
)