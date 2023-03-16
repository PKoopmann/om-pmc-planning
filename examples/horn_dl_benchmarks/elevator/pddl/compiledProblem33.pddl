(define (problem elevators_problem)
(:domain elevators)
(:init
       (origin pass_au ad)
       (destin pass_au ah)
       (origin pass_aq bc)
       (destin pass_aq av)
       (origin pass_ay ah)
       (destin pass_ay ao)
       (origin pass_an bf)
       (destin pass_an ah)
       (origin pass_ba ak)
       (destin pass_ba av)
       (origin pass_at ax)
       (destin pass_at bb)
       (origin pass_ag ap)
       (destin pass_ag bd)
       (origin pass_ac bb)
       (destin pass_ac aj)
       (origin pass_bg ah)
       (destin pass_bg be)
       (origin pass_al ap)
       (destin pass_al ab)
       (origin pass_ai ad)
       (destin pass_ai bc)
       (origin pass_ae ak)
       (destin pass_ae am)
       (origin pass_ar aw)
       (destin pass_ar aa)
       (next aa ab)
       (next ab ad)
       (next ad af)
       (next af ah)
       (next ah aj)
       (next aj ak)
       (next ak am)
       (next am ao)
       (next ao ap)
       (next ap as)
       (next as av)
       (next av aw)
       (next aw ax)
       (next ax az)
       (next az bb)
       (next bb bc)
       (next bc bd)
       (next bd be)
       (next be bf)
       (liftat ax))
(:goal (and (forall (?x - object) (AUX2 ?x)) (not (DATALOG_INCONSISTENT))))
)