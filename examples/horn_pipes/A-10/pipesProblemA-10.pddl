(define (problem pipes_problem)
	(:domain pipes)
	(:objects aa ab ac ad ae af ag ah ai aj ba bb bc bd be bf bg bh bi bj ca cb cc cd ce cf cg ch ci cj da db dc dd de df dg dh di dj ea eb ec ed ee ef eg eh ei ej fa fb fc fd fe ff fg fh fi fj ga gb gc gd ge gf gg gh gi gj ha hb hc hd he hf hg hh hi hj ia ib ic id ie if ig ih ii ij ja jb jc jd je jf jg jh ji jj auv pipeBA pipeBB pipeCB pipeDB pipeEB pipeED pipeFD tankFA tankFC tankFE tankLarge valveBD valveEA valveEC valveEE valveGD wall wall2 wall3 valveGG valveEI tankFG tankCI pipeHD pipeHE pipeHG pipeHH pipeIH pipeJH pipeHI pipeHJ pipeGI pipeFI pipeDI
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
		(nextTo ai aj)
		(nextTo ia ja)
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
		(nextTo bi bj)
		(nextTo ib jb)
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
		(nextTo ci cj)
		(nextTo ic jc)
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
		(nextTo di dj)
		(nextTo id jd)
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
		(nextTo ei ej)
		(nextTo ie je)
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
		(nextTo fi fj)
		(nextTo if jf)
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
		(nextTo gi gj)
		(nextTo ig jg)
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
		(nextTo hi hj)
		(nextTo ih jh)
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
		(nextTo ii ij)
		(nextTo ii ji)
		(nextTo ja jb)
		(nextTo aj bj)
		(nextTo jb jc)
		(nextTo bj cj)
		(nextTo jc jd)
		(nextTo cj dj)
		(nextTo jd je)
		(nextTo dj ej)
		(nextTo je jf)
		(nextTo ej fj)
		(nextTo jf jg)
		(nextTo fj gj)
		(nextTo jg jh)
		(nextTo gj hj)
		(nextTo jh ji)
		(nextTo hj ij)
		(nextTo ji jj)
		(nextTo ij jj)
		(nextTo aa bb)
		(nextTo ab bc)
		(nextTo ac bd)
		(nextTo ad be)
		(nextTo ae bf)
		(nextTo af bg)
		(nextTo ag bh)
		(nextTo ah bi)
		(nextTo ai bj)
		(nextTo ab ba)
		(nextTo ac bb)
		(nextTo ad bc)
		(nextTo ae bd)
		(nextTo af be)
		(nextTo ag bf)
		(nextTo ah bg)
		(nextTo ai bh)
		(nextTo aj bi)
		(nextTo ba cb)
		(nextTo bb cc)
		(nextTo bc cd)
		(nextTo bd ce)
		(nextTo be cf)
		(nextTo bf cg)
		(nextTo bg ch)
		(nextTo bh ci)
		(nextTo bi cj)
		(nextTo bb ca)
		(nextTo bc cb)
		(nextTo bd cc)
		(nextTo be cd)
		(nextTo bf ce)
		(nextTo bg cf)
		(nextTo bh cg)
		(nextTo bi ch)
		(nextTo bj ci)
		(nextTo ca db)
		(nextTo cb dc)
		(nextTo cc dd)
		(nextTo cd de)
		(nextTo ce df)
		(nextTo cf dg)
		(nextTo cg dh)
		(nextTo ch di)
		(nextTo ci dj)
		(nextTo cb da)
		(nextTo cc db)
		(nextTo cd dc)
		(nextTo ce dd)
		(nextTo cf de)
		(nextTo cg df)
		(nextTo ch dg)
		(nextTo ci dh)
		(nextTo cj di)
		(nextTo da eb)
		(nextTo db ec)
		(nextTo dc ed)
		(nextTo dd ee)
		(nextTo de ef)
		(nextTo df eg)
		(nextTo dg eh)
		(nextTo dh ei)
		(nextTo di ej)
		(nextTo db ea)
		(nextTo dc eb)
		(nextTo dd ec)
		(nextTo de ed)
		(nextTo df ee)
		(nextTo dg ef)
		(nextTo dh eg)
		(nextTo di eh)
		(nextTo dj ei)
		(nextTo ea fb)
		(nextTo eb fc)
		(nextTo ec fd)
		(nextTo ed fe)
		(nextTo ee ff)
		(nextTo ef fg)
		(nextTo eg fh)
		(nextTo eh fi)
		(nextTo ei fj)
		(nextTo eb fa)
		(nextTo ec fb)
		(nextTo ed fc)
		(nextTo ee fd)
		(nextTo ef fe)
		(nextTo eg ff)
		(nextTo eh fg)
		(nextTo ei fh)
		(nextTo ej fi)
		(nextTo fa gb)
		(nextTo fb gc)
		(nextTo fc gd)
		(nextTo fd ge)
		(nextTo fe gf)
		(nextTo ff gg)
		(nextTo fg gh)
		(nextTo fh gi)
		(nextTo fi gj)
		(nextTo fb ga)
		(nextTo fc gb)
		(nextTo fd gc)
		(nextTo fe gd)
		(nextTo ff ge)
		(nextTo fg gf)
		(nextTo fh gg)
		(nextTo fi gh)
		(nextTo fj gi)
		(nextTo ga hb)
		(nextTo gb hc)
		(nextTo gc hd)
		(nextTo gd he)
		(nextTo ge hf)
		(nextTo gf hg)
		(nextTo gg hh)
		(nextTo gh hi)
		(nextTo gi hj)
		(nextTo gb ha)
		(nextTo gc hb)
		(nextTo gd hc)
		(nextTo ge hd)
		(nextTo gf he)
		(nextTo gg hf)
		(nextTo gh hg)
		(nextTo gi hh)
		(nextTo gj hi)
		(nextTo ha ib)
		(nextTo hb ic)
		(nextTo hc id)
		(nextTo hd ie)
		(nextTo he if)
		(nextTo hf ig)
		(nextTo hg ih)
		(nextTo hh ii)
		(nextTo hi ij)
		(nextTo hb ia)
		(nextTo hc ib)
		(nextTo hd ic)
		(nextTo he id)
		(nextTo hf ie)
		(nextTo hg if)
		(nextTo hh ig)
		(nextTo hi ih)
		(nextTo hj ii)
		(nextTo ia jb)
		(nextTo ib jc)
		(nextTo ic jd)
		(nextTo id je)
		(nextTo ie jf)
		(nextTo if jg)
		(nextTo ig jh)
		(nextTo ih ji)
		(nextTo ii jj)
		(nextTo ib ja)
		(nextTo ic jb)
		(nextTo id jc)
		(nextTo ie jd)
		(nextTo if je)
		(nextTo ig jf)
		(nextTo ih jg)
		(nextTo ii jh)
		(nextTo ij ji)

		(Pipe pipeBA)
		(Pipe pipeBB)
		(Pipe pipeDB)
		(Pipe pipeEB)
		(Pipe pipeED)
		(Pipe pipeFD)
		(Pipe pipeHD)
		(Pipe pipeHE)
		(Pipe pipeHG)
		(Pipe pipeHH)
		(Pipe pipeHI)
		(Pipe pipeHJ)
		(Pipe pipeJH)
		(Pipe pipeGI)
		(Pipe pipeFI)
		(Pipe pipeDI)
		(PipeFailure pipeCB)
		(PipeFailure pipeIH)
		(Robot auv)
		(Tank tankFA)
		(Tank tankFC)
		(Tank tankFE)
		(Tank tankLarge)
		(Tank tankFG)
		(Tank tankCI)
		(Valve valveBD)
		(Valve valveEA)
		(Valve valveEC)
		(Valve valveEE)
		(Valve valveGD)
		(Valve valveGG)
		(Valve valveEI)
		(WP aa)
		(WP ab)
		(WP ac)
		(WP ad)
		(WP ae)
		(WP af)
		(WP ag)
		(WP ah)
		(WP ai)
		(WP aj)
		(WP ba)
		(WP bb)
		(WP bc)
		(WP bd)
		(WP be)
		(WP bf)
		(WP bg)
		(WP bh)
		(WP bi)
		(WP bj)
		(WP ca)
		(WP cb)
		(WP cc)
		(WP cd)
		(WP ce)
		(WP cf)
		(WP cg)
		(WP ch)
		(WP ci)
		(WP cj)
		(WP da)
		(WP db)
		(WP dc)
		(WP dd)
		(WP de)
		(WP df)
		(WP dg)
		(WP dh)
		(WP di)
		(WP dj)
		(WP ea)
		(WP eb)
		(WP ec)
		(WP ed)
		(WP ee)
		(WP ef)
		(WP eg)
		(WP eh)
		(WP ei)
		(WP ej)
		(WP fa)
		(WP fb)
		(WP fc)
		(WP fd)
		(WP fe)
		(WP ff)
		(WP fg)
		(WP fh)
		(WP fi)
		(WP fj)
		(WP ga)
		(WP gb)
		(WP gc)
		(WP gd)
		(WP ge)
		(WP gf)
		(WP gg)
		(WP gh)
		(WP gi)
		(WP gj)
		(WP ha)
		(WP hb)
		(WP hc)
		(WP hd)
		(WP he)
		(WP hf)
		(WP hg)
		(WP hh)
		(WP hi)
		(WP hj)
		(WP ia)
		(WP ib)
		(WP ic)
		(WP id)
		(WP ie)
		(WP if)
		(WP ig)
		(WP ih)
		(WP ii)
		(WP ij)
		(WP ja)
		(WP jb)
		(WP jc)
		(WP jd)
		(WP je)
		(WP jf)
		(WP jg)
		(WP jh)
		(WP ji)
		(WP jj)

		(robotAt auv aa)
		(OpenValve valveBD)
		(OpenValve valveEA)
		(OpenValve valveEC)
		(OpenValve valveEE)
		(OpenValve valveGD)
		(OpenValve valveGG)
		(OpenValve valveEI)
		(locatedAt valveBD bd)
		(locatedAt valveEA ea)
		(locatedAt valveEC ec)
		(locatedAt valveEE ee)
		(locatedAt valveGD gd)
		(locatedAt valveGG gg)
		(locatedAt valveEI ei)


		
		(connectedTo pipeBA pipeBB)
		(connectedTo pipeBB pipeCB)
		(connectedTo pipeBB valveBD)
		(connectedTo pipeDB pipeCB)
		(connectedTo pipeEB pipeDB)
		(connectedTo pipeED valveEC)
		(connectedTo pipeFD pipeED)
		(connectedTo valveBD tankLarge)
		(connectedTo valveEA pipeEB)
		(connectedTo valveEA tankFA)
		(connectedTo valveEC pipeEB)
		(connectedTo valveEC tankFC)
		(connectedTo valveEE pipeED)
		(connectedTo valveEE tankFE)
		(connectedTo valveGD pipeFD)
		(connectedTo valveGD pipeHD)
		(connectedTo pipeHD pipeHE)
		(connectedTo pipeHE pipeHG)
		(connectedTo pipeHG valveGG)
		(connectedTo valveGG tankFG)
		(connectedTo pipeHG pipeHH)
		(connectedTo pipeHH pipeIH)
		(connectedTo pipeIH pipeJH)
		(connectedTo pipeHH pipeHI)
		(connectedTo pipeHI pipeHJ)
		(connectedTo pipeHI pipeGI)
		(connectedTo pipeGI pipeFI)
		(connectedTo pipeFI valveEI)
		(connectedTo valveEI pipeDI)
		(connectedTo pipeDI tankCI)



		(locatedAt pipeBA ba)
		(locatedAt pipeBB bb)
		(locatedAt pipeCB cb)
		(locatedAt pipeDB db)
		(locatedAt pipeEB eb)
		(locatedAt pipeED ed)
		(locatedAt pipeFD fd)
		(locatedAt pipeHD hd)
		(locatedAt pipeHE he)
		(locatedAt pipeHG hg)
		(locatedAt pipeHH hh)
		(locatedAt pipeHI hi)
		(locatedAt pipeHJ hj)
		(locatedAt pipeJH jh)
		(locatedAt pipeGI gi)
		(locatedAt pipeFI fi)
		(locatedAt pipeDI di)
		(locatedAt pipeIH ih)
		(locatedAt tankFA fa)
		(locatedAt tankFC fc)
		(locatedAt tankFE fe)
		(locatedAt tankFG fg)
		(locatedAt tankCI ci)
		(locatedAt tankLarge ae)
		(locatedAt tankLarge af)
		(locatedAt tankLarge be)
		(locatedAt tankLarge bf)
		(locatedAt tankLarge ce)
		(locatedAt tankLarge cf)

		(Wall wall)
		(locatedAt wall ac)
		(locatedAt wall bc)
		(locatedAt wall cc)
		(locatedAt wall dc)

		(Wall wall2)
		(locatedAt wall2 ha)
		(locatedAt wall2 hb)
		(locatedAt wall2 hc)
		(locatedAt wall2 ia)
		(locatedAt wall2 ib)
		(locatedAt wall2 ic)
		(locatedAt wall2 ja)
		(locatedAt wall2 jb)
		(locatedAt wall2 jc)

		(Wall wall3)
		(locatedAt wall3 hg)
		(locatedAt wall3 ig)
		(locatedAt wall3 jg)




		

	)
	(:goal (and
		;(robotAt auv gg) 
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