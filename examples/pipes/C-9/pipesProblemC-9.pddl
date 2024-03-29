(define (problem pipes_problem)
	(:domain pipes)
	(:objects aa ab ac ad ae af ag ah ai ba bb bc bd be bf bg bh bi ca cb cc cd ce cf cg ch ci da db dc dd de df dg dh di ea eb ec ed ee ef eg eh ei fa fb fc fd fe ff fg fh fi ga gb gc gd ge gf gg gh gi ha hb hc hd he hf hg hh hi ia ib ic id ie if ig ih ii auv valveAC valveDC valveEF valveGC)
	(:init
		(nextTo aa ab)
		(nextTo aa ba)
		(nextTo ab ac)
		(nextTo ba ca)
		(nextTo ac ad)
		(nextTo ca da)
		(nextTo ad ae)
		(nextTo da ea)
		(nextTo ae af)
		(nextTo ea fa)
		(nextTo af ag)
		(nextTo fa ga)
		(nextTo ag ah)
		(nextTo ga ha)
		(nextTo ah ai)
		(nextTo ha ia)
		(nextTo ba bb)
		(nextTo ab bb)
		(nextTo bb bc)
		(nextTo bb cb)
		(nextTo bc bd)
		(nextTo cb db)
		(nextTo bd be)
		(nextTo db eb)
		(nextTo be bf)
		(nextTo eb fb)
		(nextTo bf bg)
		(nextTo fb gb)
		(nextTo bg bh)
		(nextTo gb hb)
		(nextTo bh bi)
		(nextTo hb ib)
		(nextTo ca cb)
		(nextTo ac bc)
		(nextTo cb cc)
		(nextTo bc cc)
		(nextTo cc cd)
		(nextTo cc dc)
		(nextTo cd ce)
		(nextTo dc ec)
		(nextTo ce cf)
		(nextTo ec fc)
		(nextTo cf cg)
		(nextTo fc gc)
		(nextTo cg ch)
		(nextTo gc hc)
		(nextTo ch ci)
		(nextTo hc ic)
		(nextTo da db)
		(nextTo ad bd)
		(nextTo db dc)
		(nextTo bd cd)
		(nextTo dc dd)
		(nextTo cd dd)
		(nextTo dd de)
		(nextTo dd ed)
		(nextTo de df)
		(nextTo ed fd)
		(nextTo df dg)
		(nextTo fd gd)
		(nextTo dg dh)
		(nextTo gd hd)
		(nextTo dh di)
		(nextTo hd id)
		(nextTo ea eb)
		(nextTo ae be)
		(nextTo eb ec)
		(nextTo be ce)
		(nextTo ec ed)
		(nextTo ce de)
		(nextTo ed ee)
		(nextTo de ee)
		(nextTo ee ef)
		(nextTo ee fe)
		(nextTo ef eg)
		(nextTo fe ge)
		(nextTo eg eh)
		(nextTo ge he)
		(nextTo eh ei)
		(nextTo he ie)
		(nextTo fa fb)
		(nextTo af bf)
		(nextTo fb fc)
		(nextTo bf cf)
		(nextTo fc fd)
		(nextTo cf df)
		(nextTo fd fe)
		(nextTo df ef)
		(nextTo fe ff)
		(nextTo ef ff)
		(nextTo ff fg)
		(nextTo ff gf)
		(nextTo fg fh)
		(nextTo gf hf)
		(nextTo fh fi)
		(nextTo hf if)
		(nextTo ga gb)
		(nextTo ag bg)
		(nextTo gb gc)
		(nextTo bg cg)
		(nextTo gc gd)
		(nextTo cg dg)
		(nextTo gd ge)
		(nextTo dg eg)
		(nextTo ge gf)
		(nextTo eg fg)
		(nextTo gf gg)
		(nextTo fg gg)
		(nextTo gg gh)
		(nextTo gg hg)
		(nextTo gh gi)
		(nextTo hg ig)
		(nextTo ha hb)
		(nextTo ah bh)
		(nextTo hb hc)
		(nextTo bh ch)
		(nextTo hc hd)
		(nextTo ch dh)
		(nextTo hd he)
		(nextTo dh eh)
		(nextTo he hf)
		(nextTo eh fh)
		(nextTo hf hg)
		(nextTo fh gh)
		(nextTo hg hh)
		(nextTo gh hh)
		(nextTo hh hi)
		(nextTo hh ih)
		(nextTo ia ib)
		(nextTo ai bi)
		(nextTo ib ic)
		(nextTo bi ci)
		(nextTo ic id)
		(nextTo ci di)
		(nextTo id ie)
		(nextTo di ei)
		(nextTo ie if)
		(nextTo ei fi)
		(nextTo if ig)
		(nextTo fi gi)
		(nextTo ig ih)
		(nextTo gi hi)
		(nextTo ih ii)
		(nextTo hi ii)
		(nextTo aa bb)
		(nextTo ab bc)
		(nextTo ac bd)
		(nextTo ad be)
		(nextTo ae bf)
		(nextTo af bg)
		(nextTo ag bh)
		(nextTo ah bi)
		(nextTo ab ba)
		(nextTo ac bb)
		(nextTo ad bc)
		(nextTo ae bd)
		(nextTo af be)
		(nextTo ag bf)
		(nextTo ah bg)
		(nextTo ai bh)
		(nextTo ba cb)
		(nextTo bb cc)
		(nextTo bc cd)
		(nextTo bd ce)
		(nextTo be cf)
		(nextTo bf cg)
		(nextTo bg ch)
		(nextTo bh ci)
		(nextTo bb ca)
		(nextTo bc cb)
		(nextTo bd cc)
		(nextTo be cd)
		(nextTo bf ce)
		(nextTo bg cf)
		(nextTo bh cg)
		(nextTo bi ch)
		(nextTo ca db)
		(nextTo cb dc)
		(nextTo cc dd)
		(nextTo cd de)
		(nextTo ce df)
		(nextTo cf dg)
		(nextTo cg dh)
		(nextTo ch di)
		(nextTo cb da)
		(nextTo cc db)
		(nextTo cd dc)
		(nextTo ce dd)
		(nextTo cf de)
		(nextTo cg df)
		(nextTo ch dg)
		(nextTo ci dh)
		(nextTo da eb)
		(nextTo db ec)
		(nextTo dc ed)
		(nextTo dd ee)
		(nextTo de ef)
		(nextTo df eg)
		(nextTo dg eh)
		(nextTo dh ei)
		(nextTo db ea)
		(nextTo dc eb)
		(nextTo dd ec)
		(nextTo de ed)
		(nextTo df ee)
		(nextTo dg ef)
		(nextTo dh eg)
		(nextTo di eh)
		(nextTo ea fb)
		(nextTo eb fc)
		(nextTo ec fd)
		(nextTo ed fe)
		(nextTo ee ff)
		(nextTo ef fg)
		(nextTo eg fh)
		(nextTo eh fi)
		(nextTo eb fa)
		(nextTo ec fb)
		(nextTo ed fc)
		(nextTo ee fd)
		(nextTo ef fe)
		(nextTo eg ff)
		(nextTo eh fg)
		(nextTo ei fh)
		(nextTo fa gb)
		(nextTo fb gc)
		(nextTo fc gd)
		(nextTo fd ge)
		(nextTo fe gf)
		(nextTo ff gg)
		(nextTo fg gh)
		(nextTo fh gi)
		(nextTo fb ga)
		(nextTo fc gb)
		(nextTo fd gc)
		(nextTo fe gd)
		(nextTo ff ge)
		(nextTo fg gf)
		(nextTo fh gg)
		(nextTo fi gh)
		(nextTo ga hb)
		(nextTo gb hc)
		(nextTo gc hd)
		(nextTo gd he)
		(nextTo ge hf)
		(nextTo gf hg)
		(nextTo gg hh)
		(nextTo gh hi)
		(nextTo gb ha)
		(nextTo gc hb)
		(nextTo gd hc)
		(nextTo ge hd)
		(nextTo gf he)
		(nextTo gg hf)
		(nextTo gh hg)
		(nextTo gi hh)
		(nextTo ha ib)
		(nextTo hb ic)
		(nextTo hc id)
		(nextTo hd ie)
		(nextTo he if)
		(nextTo hf ig)
		(nextTo hg ih)
		(nextTo hh ii)
		(nextTo hb ia)
		(nextTo hc ib)
		(nextTo hd ic)
		(nextTo he id)
		(nextTo hf ie)
		(nextTo hg if)
		(nextTo hh ig)
		(nextTo hi ih)

		(robotAt auv aa)
		(open valveAC)
		(open valveDC)
		(open valveEF)
		(open valveGC)

		(locatedAt valveAC ac)
		(locatedAt valveDC dc)
		(locatedAt valveEF ef)
		(locatedAt valveGC gc)
	)
	(:goal (and
		(forall (?wp) (or 
			(not (KBquery_connectedToFailure ?wp))  
			(hasPicture auv ?wp)
			)
		)
		(not (exists (?wp) (and 
			(KBquery_WPTank ?wp) 
			(KBquery_connectedToFailure ?wp)
		))
		)
	)
	)
)
