(define (problem pipes_problem)
	(:domain pipes)
	(:objects aa ab ac ad ae af ag ah ai ba bb bc bd be bf bg bh bi ca cb cc cd ce cf cg ch ci da db dc dd de df dg dh di ea eb ec ed ee ef eg eh ei fa fb fc fd fe ff fg fh fi ga gb gc gd ge gf gg gh gi ha hb hc hd he hf hg hh hi ia ib ic id ie if ig ih ii auv tankEE valveAC valveDC valveEF valveGC wallAH wallBA wallDD wallID pipeCC pipeCD pipeCE pipeCF pipeEC pipeFC pipeHC pipeIC pipeJC
)
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

		(WP aa)
		(WP ab)
		(WP ac)
		(WP ad)
		(WP ae)
		(WP af)
		(WP ag)
		(WP ah)
		(WP ai)
		(WP ba)
		(WP bb)
		(WP bc)
		(WP bd)
		(WP be)
		(WP bf)
		(WP bg)
		(WP bh)
		(WP bi)
		(WP ca)
		(WP cb)
		(WP cc)
		(WP cd)
		(WP ce)
		(WP cf)
		(WP cg)
		(WP ch)
		(WP ci)
		(WP da)
		(WP db)
		(WP dc)
		(WP dd)
		(WP de)
		(WP df)
		(WP dg)
		(WP dh)
		(WP di)
		(WP ea)
		(WP eb)
		(WP ec)
		(WP ed)
		(WP ee)
		(WP ef)
		(WP eg)
		(WP eh)
		(WP ei)
		(WP fa)
		(WP fb)
		(WP fc)
		(WP fd)
		(WP fe)
		(WP ff)
		(WP fg)
		(WP fh)
		(WP fi)
		(WP ga)
		(WP gb)
		(WP gc)
		(WP gd)
		(WP ge)
		(WP gf)
		(WP gg)
		(WP gh)
		(WP gi)
		(WP ha)
		(WP hb)
		(WP hc)
		(WP hd)
		(WP he)
		(WP hf)
		(WP hg)
		(WP hh)
		(WP hi)
		(WP ia)
		(WP ib)
		(WP ic)
		(WP id)
		(WP ie)
		(WP if)
		(WP ig)
		(WP ih)
		(WP ii)



		(Pipe pipeCC)
		(PipeFailure pipeCD)
		(Pipe pipeCE)
		(Pipe pipeCF)
		(Pipe pipeEC)
		(Pipe pipeFC)
		(Pipe pipeHC)
		(Pipe pipeIC)


		(locatedAt pipeCC cc)
		(locatedAt pipeCD cd)
		(locatedAt pipeCE ce)
		(locatedAt pipeCF cf)
		(locatedAt pipeEC ec)
		(locatedAt pipeFC fc)
		(locatedAt pipeHC hc)
		(locatedAt pipeIC ic)

	
		(Tank tankEE)

		(locatedAt tankEE ee)
		
		(Robot auv)
		(robotAt auv aa)

		(Valve valveDC)
		(Valve valveEF)
		(Valve valveGC)
		(Valve valveAC)

		(OpenValve valveAC)
		(OpenValve valveDC)
		(OpenValve valveEF)
		(OpenValve valveGC)

		(locatedAt valveAC ac)
		(locatedAt valveDC dc)
		(locatedAt valveEF ef)
		(locatedAt valveGC gc)

		(Wall wallBA)
		(Wall wallAH)
		(Wall wallDD)
		(Wall wallID)

		;(locatedAt wallBA ba)
		(locatedAt wallBA bb)
		(locatedAt wallBA bc)
		(locatedAt wallBA bd)
		(locatedAt wallBA be)
		(locatedAt wallBA bf)
		(locatedAt wallAH ah)
		(locatedAt wallAH bh)
		(locatedAt wallDD dd)
		(locatedAt wallDD de)
		(locatedAt wallDD df)
		(locatedAt wallDD dg)
		(locatedAt wallDD dh)
		(locatedAt wallDD di)
		(locatedAt wallDD ed)
		(locatedAt wallDD fd)
		(locatedAt wallDD fi)
		(locatedAt wallDD gd)
		(locatedAt wallDD ge)
		(locatedAt wallDD gf)
		(locatedAt wallDD gg)
		(locatedAt wallDD gh)
		(locatedAt wallDD gi)
		(locatedAt wallID id)
		(locatedAt wallID ie)
		(locatedAt wallID if)
		(locatedAt wallID ig)
		(locatedAt wallID ih)
	
		(connectedTo valveAC pipeCC)
		(connectedTo pipeCC pipeCD)
		(connectedTo pipeCD pipeCE)
		(connectedTo pipeCE pipeCF)
		(connectedTo pipeCC valveDC)
		(connectedTo pipeCF valveEF)
		(connectedTo valveDC pipeEC)
		(connectedTo pipeEC pipeFC)
		(connectedTo pipeFC valveGC)
		(connectedTo valveGC pipeHC)
		(connectedTo pipeHC pipeIC)

		

	)
	(:goal (and
		(forall (?wp) (or 
			(not (mko (WPConnectedToFailure ?wp)))
			(hasPicture auv ?wp)
			)
		)
		(not (exists (?wp) (and 
			(mko (WPTank ?wp))
			(mko (WPConnectedToFailure ?wp))
		))
		)
	)
	)
)
