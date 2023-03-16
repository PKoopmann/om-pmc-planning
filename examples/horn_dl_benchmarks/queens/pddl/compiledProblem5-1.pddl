(define (problem queen_problem)
(:domain queens)
(:init
       (queen ed)
       (horinline aa ab)
       (verinline aa ba)
       (horinline ab ac)
       (verinline ba ca)
       (horinline ac ad)
       (verinline ca da)
       (horinline ad ae)
       (verinline da ea)
       (horinline ba bb)
       (verinline ab bb)
       (horinline bb bc)
       (verinline bb cb)
       (horinline bc bd)
       (verinline cb db)
       (horinline bd be)
       (verinline db eb)
       (horinline ca cb)
       (verinline ac bc)
       (horinline cb cc)
       (verinline bc cc)
       (horinline cc cd)
       (verinline cc dc)
       (horinline cd ce)
       (verinline dc ec)
       (horinline da db)
       (verinline ad bd)
       (horinline db dc)
       (verinline bd cd)
       (horinline dc dd)
       (verinline cd dd)
       (horinline dd de)
       (verinline dd ed)
       (horinline ea eb)
       (verinline ae be)
       (horinline eb ec)
       (verinline be ce)
       (horinline ec ed)
       (verinline ce de)
       (horinline ed ee)
       (verinline de ee)
       (backdiagonal aa bb)
       (backdiagonal ab bc)
       (backdiagonal ac bd)
       (backdiagonal ad be)
       (rightdiagonal ab ba)
       (rightdiagonal ac bb)
       (rightdiagonal ad bc)
       (rightdiagonal ae bd)
       (backdiagonal ba cb)
       (backdiagonal bb cc)
       (backdiagonal bc cd)
       (backdiagonal bd ce)
       (rightdiagonal bb ca)
       (rightdiagonal bc cb)
       (rightdiagonal bd cc)
       (rightdiagonal be cd)
       (backdiagonal ca db)
       (backdiagonal cb dc)
       (backdiagonal cc dd)
       (backdiagonal cd de)
       (rightdiagonal cb da)
       (rightdiagonal cc db)
       (rightdiagonal cd dc)
       (rightdiagonal ce dd)
       (backdiagonal da eb)
       (backdiagonal db ec)
       (backdiagonal dc ed)
       (backdiagonal dd ee)
       (rightdiagonal db ea)
       (rightdiagonal dc eb)
       (rightdiagonal dd ec)
       (rightdiagonal de ed))
(:goal (forall (?x ?y - object) (AUX4 ?x ?y)))
)