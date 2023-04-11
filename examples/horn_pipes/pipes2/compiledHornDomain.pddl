(define (domain pipes)
(:requirements :strips :equality :disjunctive-preconditions :derived-predicates :negative-preconditions :conditional-effects :existential-preconditions)
(:constants
  aa ab ac ad ae af ag auv ba bb bc bd be bf bg ca cb cc cd ce cf cg da db dc dd de df dg ea eb ec ed ee ef eg fa fb fc fd fe ff fg ga gb gc gd ge gf gg pipeBA pipeBB pipeCB pipeDB pipeEB pipeED pipeFD tankFA tankFC tankFE tankLarge valveBD valveEA valveEC valveEE valveGD wall - object)
(:predicates
  (nextto ?wpA ?wpB - object)
  (haspicture ?auv ?wp - object)
  (robotat ?auv ?wp - object)
  (open ?v - object)
  (locatedat ?x ?wp - object)
  (wptank ?wp - object)
  (wpconnectedtofailure ?wp - object)
  (rock ?x - object)
  (mediumriskpipe ?x - object)
  (mine ?x - object)
  (pipe ?x - object)
  (protectedstructure ?x - object)
  (robot ?x - object)
  (rustypipe ?x - object)
  (unsupportedpipe ?x - object)
  (pipefailure ?x - object)
  (closedvalve ?x - object)
  (tank ?x - object)
  (dummy ?x - object)
  (valve ?x - object)
  (wp ?x - object)
  (wall ?x - object)
  (connectedto ?x ?y - object)
  (openvalve ?x - object)
  (flowconnectedto ?x ?y - object)
  (DATALOG_WPTANK ?x0 - object)
  (DATALOG_VALVE ?x0 - object)
  (DATALOG_PIPELINEINFRASTRUCTURE ?x0 - object)
  (DATALOG_HIGHRISK ?x0 - object)
  (DATALOG_INCONSISTENT)
  (DATALOG_RISK ?x0 - object)
  (DATALOG_FLOWCONNECTEDTOSOMEPIPEFAILURE ?x0 - object)
  (DATALOG_CONNECTEDTO ?x0 ?x1 - object)
  (DATALOG_WP ?x0 - object)
  (DATALOG_PIPE ?x0 - object)
  (DATALOG_RUSTYPIPEORUNSUPPORTEDPIPE ?x0 - object)
  (DATALOG_FORBIDDENWP ?x0 - object)
  (DATALOG_WPCONNECTEDTOFAILURE ?x0 - object)
  (DATALOG_PROTECTEDSTRUCTURE ?x0 - object)
  (DATALOG_ROBOTAT ?x0 ?x1 - object)
  (DATALOG_MINEORPROTECTEDSTRUCTURE ?x0 - object)
  (DATALOG_CONNECTEDTOSOMERUSTYPIPE ?x0 - object)
  (DATALOG_HASOBJECTSOMEROCK ?x0 - object)
  (DATALOG_FLOWCONNECTEDTOFAILURE ?x0 - object)
  (DATALOG_INVERSEHASPICTURESOMEROBOT ?x0 - object)
  (DATALOG_HASOBJECTSOMEMEDIUMRISKPIPE ?x0 - object)
  (DATALOG_HASOBJECT ?x0 ?x1 - object)
  (DATALOG_HASOBJECTSOMEFLOWCONNECTEDTOFAILURE ?x0 - object)
  (DATALOG_LOCATEDATSOMEINVERSEHASPICTURESOMEROBOT ?x0 - object)
  (DATALOG_MEDIUMRISKPIPE ?x0 - object)
  (DATALOG_COVERED ?x0 - object)
  (DATALOG_MEDIUMRISK ?x0 - object)
  (DATALOG_HASOBJECTSOMETANK ?x0 - object)
  (DATALOG_HASOBJECTSOMEPIPE ?x0 - object)
  (DATALOG_HASOBJECTSOMEMINEORPROTECTEDSTRUCTURE ?x0 - object)
  (DATALOG_LOCATEDAT ?x0 ?x1 - object)
  (DATALOG_HASOBJECTSOMEPIPEANDCONNECTEDTOSOMELOCATEDATSOMEINVERSEHASPICTURESOMEROBOT ?x0 - object)
  (DATALOG_PIPEANDCONNECTEDTOSOMELOCATEDATSOMEINVERSEHASPICTURESOMEROBOT ?x0 - object)
  (DATALOG_INVERSEROBOTATSOMEROBOT ?x0 - object)
  (DATALOG_HASOBJECTSOMERUSTYPIPEORUNSUPPORTEDPIPE ?x0 - object)
  (DATALOG_CONNECTEDTOSOMELOCATEDATSOMEINVERSEHASPICTURESOMEROBOT ?x0 - object)
  (DATALOG_ROBOT ?x0 - object)
  (AUX0 ?y - object ?z - object ?x - object)
  (AUX1 ?y - object ?z - object ?x - object)
  (AUX2 ?y0 - object ?x0 - object)
  (AUX3 ?y0 - object ?x0 - object)
  (AUX4 ?y0 - object ?x0 - object)
  (AUX5 ?y0 - object ?x0 - object)
  (AUX6 ?y0 - object ?x0 - object)
  (AUX7 ?y0 - object ?x0 - object)
  (AUX8 ?y0 - object ?x0 - object)
  (AUX9 ?y0 - object ?x0 - object)
  (AUX10 ?y0 - object ?x0 - object)
  (AUX11 ?y0 - object ?x0 - object)
  (AUX12 ?y0 - object ?x0 - object)
  (AUX13 ?y0 - object ?x0 - object)
  (AUX14 ?y0 - object ?x0 - object)
  (AUX15 ?x0 - object)
  (AUX16 ?x0 - object)
  (AUX17 ?y0 - object)
  (AUX18 ?y0 - object)
  (AUX19 ?y0 - object)
  (AUX20 ?y0 - object ?x0 - object)
  (AUX21 ?x0 - object)
  (AUX22 ?x0 - object)
  (AUX23 ?x0 - object)
  (AUX24 ?x0 - object)
  (AUX25 ?x0 - object)
  (AUX26 ?x0 - object)
  (AUX27 ?x0 - object)
  (AUX28 ?wpB - object ?wpA - object)
  (AUX29 ?valve - object ?auv - object)
  (AUX30 ?valve - object ?auv - object ?wp - object)
  (AUX31 ?wp - object)
  (AUX32 ?wp - object))
(:derived (flowconnectedto ?x ?z - object)
          (or (exists (?y - object) (AUX0 ?y ?z ?x)) (exists (?y - object) (AUX1 ?y ?z ?x)) (connectedto ?x ?z) (connectedto ?z ?x)))
(:derived (DATALOG_FORBIDDENWP ?x0 - object)
          (and (DATALOG_HASOBJECTSOMEMINEORPROTECTEDSTRUCTURE ?x0) (DATALOG_WP ?x0)))
(:derived (DATALOG_CONNECTEDTOSOMERUSTYPIPE ?x0 - object)
          (exists (?y0 - object) (AUX2 ?y0 ?x0)))
(:derived (DATALOG_HASOBJECTSOMEROCK ?x0 - object)
          (exists (?y0 - object) (AUX3 ?y0 ?x0)))
(:derived (DATALOG_FLOWCONNECTEDTOFAILURE ?x0 - object)
          (and (DATALOG_FLOWCONNECTEDTOSOMEPIPEFAILURE ?x0) (DATALOG_PIPELINEINFRASTRUCTURE ?x0)))
(:derived (DATALOG_INVERSEHASPICTURESOMEROBOT ?x0 - object)
          (exists (?y0 - object) (AUX4 ?y0 ?x0)))
(:derived (DATALOG_HASOBJECTSOMEMEDIUMRISKPIPE ?x0 - object)
          (exists (?y0 - object) (AUX5 ?y0 ?x0)))
(:derived (DATALOG_HASOBJECT ?x0 ?x1 - object)
          (DATALOG_LOCATEDAT ?x1 ?x0))
(:derived (DATALOG_HASOBJECTSOMEFLOWCONNECTEDTOFAILURE ?x0 - object)
          (exists (?y0 - object) (AUX6 ?y0 ?x0)))
(:derived (DATALOG_LOCATEDATSOMEINVERSEHASPICTURESOMEROBOT ?x0 - object)
          (exists (?y0 - object) (AUX7 ?y0 ?x0)))
(:derived (DATALOG_HASOBJECTSOMETANK ?x0 - object)
          (exists (?y0 - object) (AUX8 ?y0 ?x0)))
(:derived (DATALOG_HASOBJECTSOMEPIPE ?x0 - object)
          (exists (?y0 - object) (AUX9 ?y0 ?x0)))
(:derived (DATALOG_HASOBJECTSOMEMINEORPROTECTEDSTRUCTURE ?x0 - object)
          (exists (?y0 - object) (AUX10 ?y0 ?x0)))
(:derived (DATALOG_HASOBJECTSOMEPIPEANDCONNECTEDTOSOMELOCATEDATSOMEINVERSEHASPICTURESOMEROBOT ?x0 - object)
          (exists (?y0 - object) (AUX11 ?y0 ?x0)))
(:derived (DATALOG_PIPEANDCONNECTEDTOSOMELOCATEDATSOMEINVERSEHASPICTURESOMEROBOT ?x0 - object)
          (and (DATALOG_CONNECTEDTOSOMELOCATEDATSOMEINVERSEHASPICTURESOMEROBOT ?x0) (DATALOG_PIPE ?x0)))
(:derived (DATALOG_INVERSEROBOTATSOMEROBOT ?x0 - object)
          (exists (?y0 - object) (AUX12 ?y0 ?x0)))
(:derived (DATALOG_HASOBJECTSOMERUSTYPIPEORUNSUPPORTEDPIPE ?x0 - object)
          (exists (?y0 - object) (AUX13 ?y0 ?x0)))
(:derived (DATALOG_CONNECTEDTOSOMELOCATEDATSOMEINVERSEHASPICTURESOMEROBOT ?x0 - object)
          (exists (?y0 - object) (AUX14 ?y0 ?x0)))
(:derived (DATALOG_WPTANK ?x0 - object)
          (or (AUX15 ?x0) (wptank ?x0)))
(:derived (DATALOG_VALVE ?x0 - object)
          (or (closedvalve ?x0) (openvalve ?x0) (valve ?x0)))
(:derived (DATALOG_PIPELINEINFRASTRUCTURE ?x0 - object)
          (or (DATALOG_FLOWCONNECTEDTOFAILURE ?x0) (DATALOG_PIPE ?x0) (DATALOG_VALVE ?x0) (tank ?x0)))
(:derived (DATALOG_HIGHRISK ?x0 - object)
          (or (AUX16 ?x0) (DATALOG_WPCONNECTEDTOFAILURE ?x0)))
(:derived (DATALOG_INCONSISTENT)
          (or (exists (?y0 - object) (AUX17 ?y0)) (exists (?y0 - object) (AUX18 ?y0)) (exists (?y0 - object) (AUX19 ?y0))))
(:derived (DATALOG_RISK ?x0 - object)
          (or (DATALOG_COVERED ?x0) (DATALOG_HIGHRISK ?x0) (DATALOG_MEDIUMRISK ?x0)))
(:derived (DATALOG_FLOWCONNECTEDTOSOMEPIPEFAILURE ?x0 - object)
          (or (exists (?y0 - object) (AUX20 ?y0 ?x0)) (DATALOG_FLOWCONNECTEDTOFAILURE ?x0)))
(:derived (DATALOG_CONNECTEDTO ?x0 ?x1 - object)
          (or (DATALOG_CONNECTEDTO ?x1 ?x0) (connectedto ?x0 ?x1)))
(:derived (DATALOG_WP ?x0 - object)
          (or (exists (?y0 - object) (DATALOG_LOCATEDAT ?y0 ?x0)) (exists (?y0 - object) (DATALOG_ROBOTAT ?y0 ?x0)) (DATALOG_FORBIDDENWP ?x0) (DATALOG_RISK ?x0) (DATALOG_WPTANK ?x0) (wp ?x0)))
(:derived (DATALOG_PIPE ?x0 - object)
          (or (DATALOG_MEDIUMRISKPIPE ?x0) (pipe ?x0) (pipefailure ?x0) (rustypipe ?x0) (unsupportedpipe ?x0)))
(:derived (DATALOG_RUSTYPIPEORUNSUPPORTEDPIPE ?x0 - object)
          (or (rustypipe ?x0) (unsupportedpipe ?x0)))
(:derived (DATALOG_WPCONNECTEDTOFAILURE ?x0 - object)
          (or (AUX21 ?x0) (wpconnectedtofailure ?x0)))
(:derived (DATALOG_PROTECTEDSTRUCTURE ?x0 - object)
          (or (protectedstructure ?x0) (tank ?x0) (wall ?x0)))
(:derived (DATALOG_ROBOTAT ?x0 ?x1 - object)
          (or (DATALOG_ROBOTAT ?x0 ?x1) (robotat ?x0 ?x1)))
(:derived (DATALOG_MINEORPROTECTEDSTRUCTURE ?x0 - object)
          (or (DATALOG_PROTECTEDSTRUCTURE ?x0) (mine ?x0)))
(:derived (DATALOG_MEDIUMRISKPIPE ?x0 - object)
          (or (AUX22 ?x0) (mediumriskpipe ?x0)))
(:derived (DATALOG_COVERED ?x0 - object)
          (or (AUX23 ?x0) (AUX24 ?x0) (AUX25 ?x0)))
(:derived (DATALOG_MEDIUMRISK ?x0 - object)
          (or (AUX26 ?x0) (AUX27 ?x0)))
(:derived (DATALOG_LOCATEDAT ?x0 ?x1 - object)
          (or (DATALOG_HASOBJECT ?x1 ?x0) (locatedat ?x0 ?x1)))
(:derived (DATALOG_ROBOT ?x0 - object)
          (or (exists (?y0 - object) (DATALOG_ROBOTAT ?x0 ?y0)) (robot ?x0)))
(:derived (AUX0 ?y - object ?z - object ?x - object)
          (and (flowconnectedto ?x ?y) (flowconnectedto ?y ?z) (openvalve ?y)))
(:derived (AUX1 ?y - object ?z - object ?x - object)
          (and (flowconnectedto ?x ?y) (flowconnectedto ?y ?z) (pipe ?y)))
(:derived (AUX2 ?y0 - object ?x0 - object)
          (and (DATALOG_CONNECTEDTO ?x0 ?y0) (rustypipe ?y0)))
(:derived (AUX3 ?y0 - object ?x0 - object)
          (and (DATALOG_HASOBJECT ?x0 ?y0) (rock ?y0)))
(:derived (AUX4 ?y0 - object ?x0 - object)
          (and (DATALOG_ROBOT ?y0) (haspicture ?y0 ?x0)))
(:derived (AUX5 ?y0 - object ?x0 - object)
          (and (DATALOG_HASOBJECT ?x0 ?y0) (DATALOG_MEDIUMRISKPIPE ?y0)))
(:derived (AUX6 ?y0 - object ?x0 - object)
          (and (DATALOG_FLOWCONNECTEDTOFAILURE ?y0) (DATALOG_HASOBJECT ?x0 ?y0)))
(:derived (AUX7 ?y0 - object ?x0 - object)
          (and (DATALOG_INVERSEHASPICTURESOMEROBOT ?y0) (DATALOG_LOCATEDAT ?x0 ?y0)))
(:derived (AUX8 ?y0 - object ?x0 - object)
          (and (DATALOG_HASOBJECT ?x0 ?y0) (tank ?y0)))
(:derived (AUX9 ?y0 - object ?x0 - object)
          (and (DATALOG_HASOBJECT ?x0 ?y0) (DATALOG_PIPE ?y0)))
(:derived (AUX10 ?y0 - object ?x0 - object)
          (and (DATALOG_HASOBJECT ?x0 ?y0) (DATALOG_MINEORPROTECTEDSTRUCTURE ?y0)))
(:derived (AUX11 ?y0 - object ?x0 - object)
          (and (DATALOG_HASOBJECT ?x0 ?y0) (DATALOG_PIPEANDCONNECTEDTOSOMELOCATEDATSOMEINVERSEHASPICTURESOMEROBOT ?y0)))
(:derived (AUX12 ?y0 - object ?x0 - object)
          (and (DATALOG_ROBOT ?y0) (DATALOG_ROBOTAT ?y0 ?x0)))
(:derived (AUX13 ?y0 - object ?x0 - object)
          (and (DATALOG_HASOBJECT ?x0 ?y0) (DATALOG_RUSTYPIPEORUNSUPPORTEDPIPE ?y0)))
(:derived (AUX14 ?y0 - object ?x0 - object)
          (and (DATALOG_CONNECTEDTO ?x0 ?y0) (DATALOG_LOCATEDATSOMEINVERSEHASPICTURESOMEROBOT ?y0)))
(:derived (AUX15 ?x0 - object)
          (and (DATALOG_HASOBJECTSOMETANK ?x0) (DATALOG_WP ?x0)))
(:derived (AUX16 ?x0 - object)
          (and (DATALOG_HASOBJECTSOMERUSTYPIPEORUNSUPPORTEDPIPE ?x0) (DATALOG_WP ?x0)))
(:derived (AUX17 ?y0 - object)
          (and (DATALOG_FORBIDDENWP ?y0) (DATALOG_INVERSEROBOTATSOMEROBOT ?y0)))
(:derived (AUX18 ?y0 - object)
          (and (tank ?y0) (wall ?y0)))
(:derived (AUX19 ?y0 - object)
          (and (closedvalve ?y0) (openvalve ?y0)))
(:derived (AUX20 ?y0 - object ?x0 - object)
          (and (flowconnectedto ?x0 ?y0) (pipefailure ?y0)))
(:derived (AUX21 ?x0 - object)
          (and (DATALOG_HASOBJECTSOMEFLOWCONNECTEDTOFAILURE ?x0) (DATALOG_WP ?x0)))
(:derived (AUX22 ?x0 - object)
          (and (DATALOG_CONNECTEDTOSOMERUSTYPIPE ?x0) (DATALOG_PIPE ?x0)))
(:derived (AUX23 ?x0 - object)
          (and (DATALOG_HASOBJECTSOMEPIPEANDCONNECTEDTOSOMELOCATEDATSOMEINVERSEHASPICTURESOMEROBOT ?x0) (DATALOG_MEDIUMRISK ?x0)))
(:derived (AUX24 ?x0 - object)
          (and (DATALOG_HIGHRISK ?x0) (DATALOG_INVERSEHASPICTURESOMEROBOT ?x0)))
(:derived (AUX25 ?x0 - object)
          (and (DATALOG_INVERSEHASPICTURESOMEROBOT ?x0) (DATALOG_MEDIUMRISK ?x0)))
(:derived (AUX26 ?x0 - object)
          (and (DATALOG_HASOBJECTSOMEMEDIUMRISKPIPE ?x0) (DATALOG_WP ?x0)))
(:derived (AUX27 ?x0 - object)
          (and (DATALOG_HASOBJECTSOMEPIPE ?x0) (DATALOG_HASOBJECTSOMEROCK ?x0) (DATALOG_WP ?x0)))
(:derived (AUX28 ?wpB - object ?wpA - object)
          (or (nextto ?wpA ?wpB) (nextto ?wpB ?wpA)))
(:derived (AUX29 ?valve - object ?auv - object)
          (exists (?wp - object) (AUX30 ?valve ?auv ?wp)))
(:derived (AUX30 ?valve - object ?auv - object ?wp - object)
          (and (locatedat ?valve ?wp) (robotat ?auv ?wp)))
(:derived (AUX31 ?wp - object)
          (or (haspicture auv ?wp) (not (DATALOG_WPCONNECTEDTOFAILURE ?wp))))
(:derived (AUX32 ?wp - object)
          (or (not (DATALOG_WPCONNECTEDTOFAILURE ?wp)) (not (DATALOG_WPTANK ?wp))))
(:action Move
  :parameters (?auv ?wpA ?wpB - object)
  :precondition (and (AUX28 ?wpB ?wpA) (robotat ?auv ?wpA) (not (DATALOG_INCONSISTENT)))
  :effect (and (not (robotat ?auv ?wpA)) (robotat ?auv ?wpB)))
(:action takePicture
  :parameters (?auv ?wp - object)
  :precondition (and (robotat ?auv ?wp) (not (DATALOG_INCONSISTENT)))
  :effect (and (haspicture ?auv ?wp)))
(:action closeValve
  :parameters (?auv ?valve - object)
  :precondition (and (AUX29 ?valve ?auv) (openvalve ?valve) (not (DATALOG_INCONSISTENT)))
  :effect (and (not (openvalve ?valve))))
)