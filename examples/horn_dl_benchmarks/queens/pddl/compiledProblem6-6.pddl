(define (problem queen_problem)
(:domain queens)
(:init
       (queen fe)
       (queen bb)
       (queen ef)
       (queen aa)
       (queen bf)
       (queen db)
       (horinline aa ab)
       (verinline aa ba)
       (horinline ab ac)
       (verinline ba ca)
       (horinline ac ad)
       (verinline ca da)
       (horinline ad ae)
       (verinline da ea)
       (horinline ae af)
       (verinline ea fa)
       (horinline ba bb)
       (verinline ab bb)
       (horinline bb bc)
       (verinline bb cb)
       (horinline bc bd)
       (verinline cb db)
       (horinline bd be)
       (verinline db eb)
       (horinline be bf)
       (verinline eb fb)
       (horinline ca cb)
       (verinline ac bc)
       (horinline cb cc)
       (verinline bc cc)
       (horinline cc cd)
       (verinline cc dc)
       (horinline cd ce)
       (verinline dc ec)
       (horinline ce cf)
       (verinline ec fc)
       (horinline da db)
       (verinline ad bd)
       (horinline db dc)
       (verinline bd cd)
       (horinline dc dd)
       (verinline cd dd)
       (horinline dd de)
       (verinline dd ed)
       (horinline de df)
       (verinline ed fd)
       (horinline ea eb)
       (verinline ae be)
       (horinline eb ec)
       (verinline be ce)
       (horinline ec ed)
       (verinline ce de)
       (horinline ed ee)
       (verinline de ee)
       (horinline ee ef)
       (verinline ee fe)
       (horinline fa fb)
       (verinline af bf)
       (horinline fb fc)
       (verinline bf cf)
       (horinline fc fd)
       (verinline cf df)
       (horinline fd fe)
       (verinline df ef)
       (horinline fe ff)
       (verinline ef ff)
       (backdiagonal aa bb)
       (backdiagonal ab bc)
       (backdiagonal ac bd)
       (backdiagonal ad be)
       (backdiagonal ae bf)
       (rightdiagonal ab ba)
       (rightdiagonal ac bb)
       (rightdiagonal ad bc)
       (rightdiagonal ae bd)
       (rightdiagonal af be)
       (backdiagonal ba cb)
       (backdiagonal bb cc)
       (backdiagonal bc cd)
       (backdiagonal bd ce)
       (backdiagonal be cf)
       (rightdiagonal bb ca)
       (rightdiagonal bc cb)
       (rightdiagonal bd cc)
       (rightdiagonal be cd)
       (rightdiagonal bf ce)
       (backdiagonal ca db)
       (backdiagonal cb dc)
       (backdiagonal cc dd)
       (backdiagonal cd de)
       (backdiagonal ce df)
       (rightdiagonal cb da)
       (rightdiagonal cc db)
       (rightdiagonal cd dc)
       (rightdiagonal ce dd)
       (rightdiagonal cf de)
       (backdiagonal da eb)
       (backdiagonal db ec)
       (backdiagonal dc ed)
       (backdiagonal dd ee)
       (backdiagonal de ef)
       (rightdiagonal db ea)
       (rightdiagonal dc eb)
       (rightdiagonal dd ec)
       (rightdiagonal de ed)
       (rightdiagonal df ee)
       (backdiagonal ea fb)
       (backdiagonal eb fc)
       (backdiagonal ec fd)
       (backdiagonal ed fe)
       (backdiagonal ee ff)
       (rightdiagonal eb fa)
       (rightdiagonal ec fb)
       (rightdiagonal ed fc)
       (rightdiagonal ee fd)
       (rightdiagonal ef fe))
(:goal (forall (?x ?y - object) (AUX4 ?x ?y)))
)