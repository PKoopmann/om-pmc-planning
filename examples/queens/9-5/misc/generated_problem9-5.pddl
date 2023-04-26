(define (problem queen_problem)
	(:domain queens)
	(:objects aa ab ac ad ae af ag ah ai ba bb bc bd be bf bg bh bi ca cb cc cd ce cf cg ch ci da db dc dd de df dg dh di ea eb ec ed ee ef eg eh ei fa fb fc fd fe ff fg fh fi ga gb gc gd ge gf gg gh gi ha hb hc hd he hf hg hh hi ia ib ic id ie if ig ih ii  )
	(:init
		(Queen hb)
		(Queen ee)
		(Queen ig)
		(Queen ei)
		(Queen af)
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
		(horinline ag ah)
		(verinline ga ha)
		(horinline ah ai)
		(verinline ha ia)
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
		(horinline bg bh)
		(verinline gb hb)
		(horinline bh bi)
		(verinline hb ib)
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
		(horinline cg ch)
		(verinline gc hc)
		(horinline ch ci)
		(verinline hc ic)
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
		(horinline dg dh)
		(verinline gd hd)
		(horinline dh di)
		(verinline hd id)
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
		(horinline eg eh)
		(verinline ge he)
		(horinline eh ei)
		(verinline he ie)
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
		(horinline fg fh)
		(verinline gf hf)
		(horinline fh fi)
		(verinline hf if)
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
		(horinline gg gh)
		(verinline gg hg)
		(horinline gh gi)
		(verinline hg ig)
		(horinline ha hb)
		(verinline ah bh)
		(horinline hb hc)
		(verinline bh ch)
		(horinline hc hd)
		(verinline ch dh)
		(horinline hd he)
		(verinline dh eh)
		(horinline he hf)
		(verinline eh fh)
		(horinline hf hg)
		(verinline fh gh)
		(horinline hg hh)
		(verinline gh hh)
		(horinline hh hi)
		(verinline hh ih)
		(horinline ia ib)
		(verinline ai bi)
		(horinline ib ic)
		(verinline bi ci)
		(horinline ic id)
		(verinline ci di)
		(horinline id ie)
		(verinline di ei)
		(horinline ie if)
		(verinline ei fi)
		(horinline if ig)
		(verinline fi gi)
		(horinline ig ih)
		(verinline gi hi)
		(horinline ih ii)
		(verinline hi ii)
		(backdiagonal aa bb)
		(backdiagonal ab bc)
		(backdiagonal ac bd)
		(backdiagonal ad be)
		(backdiagonal ae bf)
		(backdiagonal af bg)
		(backdiagonal ag bh)
		(backdiagonal ah bi)
		(rightdiagonal ab ba)
		(rightdiagonal ac bb)
		(rightdiagonal ad bc)
		(rightdiagonal ae bd)
		(rightdiagonal af be)
		(rightdiagonal ag bf)
		(rightdiagonal ah bg)
		(rightdiagonal ai bh)
		(backdiagonal ba cb)
		(backdiagonal bb cc)
		(backdiagonal bc cd)
		(backdiagonal bd ce)
		(backdiagonal be cf)
		(backdiagonal bf cg)
		(backdiagonal bg ch)
		(backdiagonal bh ci)
		(rightdiagonal bb ca)
		(rightdiagonal bc cb)
		(rightdiagonal bd cc)
		(rightdiagonal be cd)
		(rightdiagonal bf ce)
		(rightdiagonal bg cf)
		(rightdiagonal bh cg)
		(rightdiagonal bi ch)
		(backdiagonal ca db)
		(backdiagonal cb dc)
		(backdiagonal cc dd)
		(backdiagonal cd de)
		(backdiagonal ce df)
		(backdiagonal cf dg)
		(backdiagonal cg dh)
		(backdiagonal ch di)
		(rightdiagonal cb da)
		(rightdiagonal cc db)
		(rightdiagonal cd dc)
		(rightdiagonal ce dd)
		(rightdiagonal cf de)
		(rightdiagonal cg df)
		(rightdiagonal ch dg)
		(rightdiagonal ci dh)
		(backdiagonal da eb)
		(backdiagonal db ec)
		(backdiagonal dc ed)
		(backdiagonal dd ee)
		(backdiagonal de ef)
		(backdiagonal df eg)
		(backdiagonal dg eh)
		(backdiagonal dh ei)
		(rightdiagonal db ea)
		(rightdiagonal dc eb)
		(rightdiagonal dd ec)
		(rightdiagonal de ed)
		(rightdiagonal df ee)
		(rightdiagonal dg ef)
		(rightdiagonal dh eg)
		(rightdiagonal di eh)
		(backdiagonal ea fb)
		(backdiagonal eb fc)
		(backdiagonal ec fd)
		(backdiagonal ed fe)
		(backdiagonal ee ff)
		(backdiagonal ef fg)
		(backdiagonal eg fh)
		(backdiagonal eh fi)
		(rightdiagonal eb fa)
		(rightdiagonal ec fb)
		(rightdiagonal ed fc)
		(rightdiagonal ee fd)
		(rightdiagonal ef fe)
		(rightdiagonal eg ff)
		(rightdiagonal eh fg)
		(rightdiagonal ei fh)
		(backdiagonal fa gb)
		(backdiagonal fb gc)
		(backdiagonal fc gd)
		(backdiagonal fd ge)
		(backdiagonal fe gf)
		(backdiagonal ff gg)
		(backdiagonal fg gh)
		(backdiagonal fh gi)
		(rightdiagonal fb ga)
		(rightdiagonal fc gb)
		(rightdiagonal fd gc)
		(rightdiagonal fe gd)
		(rightdiagonal ff ge)
		(rightdiagonal fg gf)
		(rightdiagonal fh gg)
		(rightdiagonal fi gh)
		(backdiagonal ga hb)
		(backdiagonal gb hc)
		(backdiagonal gc hd)
		(backdiagonal gd he)
		(backdiagonal ge hf)
		(backdiagonal gf hg)
		(backdiagonal gg hh)
		(backdiagonal gh hi)
		(rightdiagonal gb ha)
		(rightdiagonal gc hb)
		(rightdiagonal gd hc)
		(rightdiagonal ge hd)
		(rightdiagonal gf he)
		(rightdiagonal gg hf)
		(rightdiagonal gh hg)
		(rightdiagonal gi hh)
		(backdiagonal ha ib)
		(backdiagonal hb ic)
		(backdiagonal hc id)
		(backdiagonal hd ie)
		(backdiagonal he if)
		(backdiagonal hf ig)
		(backdiagonal hg ih)
		(backdiagonal hh ii)
		(rightdiagonal hb ia)
		(rightdiagonal hc ib)
		(rightdiagonal hd ic)
		(rightdiagonal he id)
		(rightdiagonal hf ie)
		(rightdiagonal hg if)
		(rightdiagonal hh ig)
		(rightdiagonal hi ih)
	)
    (:goal (and
        (not (inconsistent))
        (not (exists (?x ?y)
 		 (and 
 			 (not (= ?x ?y)) 
 			 (Queen ?x) 
 			 (Queen ?y) 
 			 (KBquery_Inline ?x ?y) 
 		 ) 
 	 )) 
 	)

)
)
