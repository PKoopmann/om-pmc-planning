(define (domain drone)
(:constants
  aa ab ac ad ae af ag ah ai aj ba bb bc bd be bf bg bh bi bj ca cb cc cd ce cf cg ch ci cj da db dc dd de df dg dh di dj ea eb ec ed ee ef eg eh ei ej fa fb fc fd fe ff fg fh fi fj ga gb gc gd ge gf gg gh gi gj ha hb hc hd he hf hg hh hi hj ia ib ic id ie if ig ih ii ij ja jb jc jd je jf jg jh ji jj env - object)
(:predicates
  (environment ?x ?y - object)
  (rain ?x - object)
  (drone ?x - object)
  (wetdrone ?x - object)
  (lowvisibility ?x - object)
  (near ?x ?y - object)
  (veryclose ?x ?y - object)
  (human ?x - object)
  (movingobject ?x - object)
  (objectx ?x - object)
  (riskofphysicaldamage ?x - object)
  (tree ?x - object)
  (DATALOG_INCONSISTENT)
  (DATALOG_ENVIRONMENTSOMELOWVISIBILITY ?x0 - object)
  (DATALOG_QUERY0 ?x0 ?x1 - object)
  (DATALOG_MOVINGOBJECT ?x0 - object)
  (DATALOG_NEARSOMEOBJECTX ?x0 - object)
  (DATALOG_OBJECTX ?x0 - object)
  (DATALOG_DRONE ?x0 - object)
  (DATALOG_LOWVISIBILITY ?x0 - object)
  (DATALOG_QUERY1)
  (DATALOG_RISKOFPHYSICALDAMAGE ?x0 - object)
  (DATALOG_VERYCLOSESOMEOBJECTX ?x0 - object)
  (DATALOG_VERYCLOSE ?x0 ?x1 - object)
  (DATALOG_NEAR ?x0 ?x1 - object)
  (DATALOG_NEARSOMEMOVINGOBJECT ?x0 - object)
  (AUX0 ?y0 - object ?x0 - object)
  (AUX1 ?y0 - object ?y1 - object)
  (AUX2 ?y0 - object ?x0 - object)
  (AUX3 ?y0 - object ?x0 - object)
  (AUX4 ?y0 - object)
  (AUX5 ?y0 - object)
  (AUX6 ?y0 - object ?x0 - object)
  (AUX7 ?x0 - object)
  (AUX8 ?x0 - object)
  (AUX9 ?x0 - object))
(:derived (DATALOG_QUERY0 ?x0 ?x1 - object)
          (and (DATALOG_DRONE ?x0) (DATALOG_VERYCLOSE ?x0 ?x1)))
(:derived (DATALOG_NEARSOMEOBJECTX ?x0 - object)
          (exists (?y0 - object) (AUX0 ?y0 ?x0)))
(:derived (DATALOG_QUERY1)
          (exists (?y0 ?y1 - object) (AUX1 ?y0 ?y1)))
(:derived (DATALOG_VERYCLOSESOMEOBJECTX ?x0 - object)
          (exists (?y0 - object) (AUX2 ?y0 ?x0)))
(:derived (DATALOG_NEARSOMEMOVINGOBJECT ?x0 - object)
          (exists (?y0 - object) (AUX3 ?y0 ?x0)))
(:derived (DATALOG_INCONSISTENT)
          (or (exists (?y0 - object) (AUX4 ?y0)) (exists (?y0 - object) (AUX5 ?y0))))
(:derived (DATALOG_ENVIRONMENTSOMELOWVISIBILITY ?x0 - object)
          (or (exists (?y0 - object) (AUX6 ?y0 ?x0)) (wetdrone ?x0)))
(:derived (DATALOG_MOVINGOBJECT ?x0 - object)
          (or (DATALOG_DRONE ?x0) (human ?x0) (movingobject ?x0)))
(:derived (DATALOG_OBJECTX ?x0 - object)
          (or (DATALOG_MOVINGOBJECT ?x0) (objectx ?x0) (tree ?x0)))
(:derived (DATALOG_DRONE ?x0 - object)
          (or (drone ?x0) (wetdrone ?x0)))
(:derived (DATALOG_LOWVISIBILITY ?x0 - object)
          (or (lowvisibility ?x0) (rain ?x0)))
(:derived (DATALOG_RISKOFPHYSICALDAMAGE ?x0 - object)
          (or (AUX7 ?x0) (AUX8 ?x0) (AUX9 ?x0) (riskofphysicaldamage ?x0)))
(:derived (DATALOG_VERYCLOSE ?x0 ?x1 - object)
          (or (DATALOG_VERYCLOSE ?x1 ?x0) (veryclose ?x0 ?x1)))
(:derived (DATALOG_NEAR ?x0 ?x1 - object)
          (or (DATALOG_NEAR ?x1 ?x0) (DATALOG_VERYCLOSE ?x0 ?x1) (near ?x0 ?x1)))
(:derived (AUX0 ?y0 - object ?x0 - object)
          (and (DATALOG_NEAR ?x0 ?y0) (DATALOG_OBJECTX ?y0)))
(:derived (AUX1 ?y0 - object ?y1 - object)
          (and (DATALOG_NEAR ?y0 ?y1) (DATALOG_RISKOFPHYSICALDAMAGE ?y0) (DATALOG_RISKOFPHYSICALDAMAGE ?y1)))
(:derived (AUX2 ?y0 - object ?x0 - object)
          (and (DATALOG_OBJECTX ?y0) (DATALOG_VERYCLOSE ?x0 ?y0)))
(:derived (AUX3 ?y0 - object ?x0 - object)
          (and (DATALOG_MOVINGOBJECT ?y0) (DATALOG_NEAR ?x0 ?y0)))
(:derived (AUX4 ?y0 - object)
          (and (DATALOG_OBJECTX ?y0) (rain ?y0)))
(:derived (AUX5 ?y0 - object)
          (and (DATALOG_DRONE ?y0) (human ?y0)))
(:derived (AUX6 ?y0 - object ?x0 - object)
          (and (DATALOG_LOWVISIBILITY ?y0) (environment ?x0 ?y0)))
(:derived (AUX7 ?x0 - object)
          (and (DATALOG_DRONE ?x0) (DATALOG_VERYCLOSESOMEOBJECTX ?x0)))
(:derived (AUX8 ?x0 - object)
          (and (DATALOG_DRONE ?x0) (DATALOG_ENVIRONMENTSOMELOWVISIBILITY ?x0) (DATALOG_NEARSOMEOBJECTX ?x0)))
(:derived (AUX9 ?x0 - object)
          (and (DATALOG_DRONE ?x0) (DATALOG_NEARSOMEMOVINGOBJECT ?x0)))
(:action Move
  :parameters (?x ?y - object)
  :precondition (and (DATALOG_QUERY0 ?x ?y) (not (DATALOG_OBJECTX ?y)) (not (DATALOG_INCONSISTENT)))
  :effect (and (when (not (wetdrone ?x)) (and (not (drone ?x)) (drone ?y))) (when (wetdrone ?x) (and (not (wetdrone ?x)) (not (drone ?x)) (wetdrone ?y)))))
)