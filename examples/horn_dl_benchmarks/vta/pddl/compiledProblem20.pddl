(define (problem Wsmo2VTAT_problem)
(:domain Wsmo2VTAT)
(:init
       (trip iswc_2007)
       (notfree iswc_2007)
       (directlyafterobj iswc_2007 aa)
       (directlyafterobj aa ab)
       (directlyafterobj ab ac)
       (directlyafterobj ac ad)
       (directlyafterobj ad ae)
       (directlyafterobj ae af)
       (directlyafterobj af ag)
       (directlyafterobj ag ah)
       (directlyafterobj ah ai)
       (directlyafterobj ai aj)
       (directlyafterobj aj ak)
       (directlyafterobj ak al)
       (directlyafterobj al am)
       (directlyafterobj am an)
       (directlyafterobj an ao)
       (directlyafterobj ao ap)
       (directlyafterobj ap aq)
       (directlyafterobj aq ar)
       (directlyafterobj ar as)
       (directlyafterobj as at)
       (directlyafterobj at au)
       (directlyafterobj au av)
       (directlyafterobj av aw)
       (directlyafterobj aw ax)
       (directlyafterobj ax ay)
       (directlyafterobj ay az)
       (directlyafterobj az ba)
       (directlyafterobj ba bb)
       (directlyafterobj bb bc)
       (directlyafterobj bc bd))
(:goal (and (AUX3) (not (DATALOG_INCONSISTENT))))
)