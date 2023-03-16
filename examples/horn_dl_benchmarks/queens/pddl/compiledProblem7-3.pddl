(define (problem queen_problem)
(:domain queens)
(:init
       (queen fa)
       (queen ba)
       (queen cb)
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
       (horinline af ag)
       (verinline fa ga)
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
       (horinline bf bg)
       (verinline fb gb)
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
       (horinline cf cg)
       (verinline fc gc)
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
       (horinline df dg)
       (verinline fd gd)
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
       (horinline ef eg)
       (verinline fe ge)
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
       (horinline ff fg)
       (verinline ff gf)
       (horinline ga gb)
       (verinline ag bg)
       (horinline gb gc)
       (verinline bg cg)
       (horinline gc gd)
       (verinline cg dg)
       (horinline gd ge)
       (verinline dg eg)
       (horinline ge gf)
       (verinline eg fg)
       (horinline gf gg)
       (verinline fg gg)
       (backdiagonal aa bb)
       (backdiagonal ab bc)
       (backdiagonal ac bd)
       (backdiagonal ad be)
       (backdiagonal ae bf)
       (backdiagonal af bg)
       (rightdiagonal ab ba)
       (rightdiagonal ac bb)
       (rightdiagonal ad bc)
       (rightdiagonal ae bd)
       (rightdiagonal af be)
       (rightdiagonal ag bf)
       (backdiagonal ba cb)
       (backdiagonal bb cc)
       (backdiagonal bc cd)
       (backdiagonal bd ce)
       (backdiagonal be cf)
       (backdiagonal bf cg)
       (rightdiagonal bb ca)
       (rightdiagonal bc cb)
       (rightdiagonal bd cc)
       (rightdiagonal be cd)
       (rightdiagonal bf ce)
       (rightdiagonal bg cf)
       (backdiagonal ca db)
       (backdiagonal cb dc)
       (backdiagonal cc dd)
       (backdiagonal cd de)
       (backdiagonal ce df)
       (backdiagonal cf dg)
       (rightdiagonal cb da)
       (rightdiagonal cc db)
       (rightdiagonal cd dc)
       (rightdiagonal ce dd)
       (rightdiagonal cf de)
       (rightdiagonal cg df)
       (backdiagonal da eb)
       (backdiagonal db ec)
       (backdiagonal dc ed)
       (backdiagonal dd ee)
       (backdiagonal de ef)
       (backdiagonal df eg)
       (rightdiagonal db ea)
       (rightdiagonal dc eb)
       (rightdiagonal dd ec)
       (rightdiagonal de ed)
       (rightdiagonal df ee)
       (rightdiagonal dg ef)
       (backdiagonal ea fb)
       (backdiagonal eb fc)
       (backdiagonal ec fd)
       (backdiagonal ed fe)
       (backdiagonal ee ff)
       (backdiagonal ef fg)
       (rightdiagonal eb fa)
       (rightdiagonal ec fb)
       (rightdiagonal ed fc)
       (rightdiagonal ee fd)
       (rightdiagonal ef fe)
       (rightdiagonal eg ff)
       (backdiagonal fa gb)
       (backdiagonal fb gc)
       (backdiagonal fc gd)
       (backdiagonal fd ge)
       (backdiagonal fe gf)
       (backdiagonal ff gg)
       (rightdiagonal fb ga)
       (rightdiagonal fc gb)
       (rightdiagonal fd gc)
       (rightdiagonal fe gd)
       (rightdiagonal ff ge)
       (rightdiagonal fg gf))
(:goal (forall (?x ?y - object) (AUX4 ?y ?x)))
)