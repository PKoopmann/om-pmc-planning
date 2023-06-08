(define (problem pipes_problem)
	(:domain pipes)
	(:objects aa ab ac ad ae af ag ah ba bb bc bd be bf bg bh ca cb cc cd ce cf cg ch da db dc dd de df dg dh ea eb ec ed ee ef eg eh fa fb fc fd fe ff fg fh ga gb gc gd ge gf gg gh ha hb hc hd he hf hg hh auv tankBA tankAH tankDF tankJB valveCC valveCE valveEB valveEG valveGG valveIB pipeAD pipeBD pipeCD pipeCF pipeCG pipeCH pipeCI pipeDB pipeDI pipeEF pipeEH pipeEI pipeFB pipeFI pipeGB pipeGC pipeGD pipeGE pipeGF pipeGH pipeGI wallED wallHA
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
		(nextTo aa bb)
		(nextTo ab bc)
		(nextTo ac bd)
		(nextTo ad be)
		(nextTo ae bf)
		(nextTo af bg)
		(nextTo ag bh)
		(nextTo ab ba)
		(nextTo ac bb)
		(nextTo ad bc)
		(nextTo ae bd)
		(nextTo af be)
		(nextTo ag bf)
		(nextTo ah bg)
		(nextTo ba cb)
		(nextTo bb cc)
		(nextTo bc cd)
		(nextTo bd ce)
		(nextTo be cf)
		(nextTo bf cg)
		(nextTo bg ch)
		(nextTo bb ca)
		(nextTo bc cb)
		(nextTo bd cc)
		(nextTo be cd)
		(nextTo bf ce)
		(nextTo bg cf)
		(nextTo bh cg)
		(nextTo ca db)
		(nextTo cb dc)
		(nextTo cc dd)
		(nextTo cd de)
		(nextTo ce df)
		(nextTo cf dg)
		(nextTo cg dh)
		(nextTo cb da)
		(nextTo cc db)
		(nextTo cd dc)
		(nextTo ce dd)
		(nextTo cf de)
		(nextTo cg df)
		(nextTo ch dg)
		(nextTo da eb)
		(nextTo db ec)
		(nextTo dc ed)
		(nextTo dd ee)
		(nextTo de ef)
		(nextTo df eg)
		(nextTo dg eh)
		(nextTo db ea)
		(nextTo dc eb)
		(nextTo dd ec)
		(nextTo de ed)
		(nextTo df ee)
		(nextTo dg ef)
		(nextTo dh eg)
		(nextTo ea fb)
		(nextTo eb fc)
		(nextTo ec fd)
		(nextTo ed fe)
		(nextTo ee ff)
		(nextTo ef fg)
		(nextTo eg fh)
		(nextTo eb fa)
		(nextTo ec fb)
		(nextTo ed fc)
		(nextTo ee fd)
		(nextTo ef fe)
		(nextTo eg ff)
		(nextTo eh fg)
		(nextTo fa gb)
		(nextTo fb gc)
		(nextTo fc gd)
		(nextTo fd ge)
		(nextTo fe gf)
		(nextTo ff gg)
		(nextTo fg gh)
		(nextTo fb ga)
		(nextTo fc gb)
		(nextTo fd gc)
		(nextTo fe gd)
		(nextTo ff ge)
		(nextTo fg gf)
		(nextTo fh gg)
		(nextTo ga hb)
		(nextTo gb hc)
		(nextTo gc hd)
		(nextTo gd he)
		(nextTo ge hf)
		(nextTo gf hg)
		(nextTo gg hh)
		(nextTo gb ha)
		(nextTo gc hb)
		(nextTo gd hc)
		(nextTo ge hd)
		(nextTo gf he)
		(nextTo gg hf)
		(nextTo gh hg)

		(WP aa)
		(WP ab)
		(WP ac)
		(WP ad)
		(WP ae)
		(WP af)
		(WP ag)
		(WP ah)
		(WP ba)
		(WP bb)
		(WP bc)
		(WP bd)
		(WP be)
		(WP bf)
		(WP bg)
		(WP bh)
		(WP ca)
		(WP cb)
		(WP cc)
		(WP cd)
		(WP ce)
		(WP cf)
		(WP cg)
		(WP ch)
		(WP da)
		(WP db)
		(WP dc)
		(WP dd)
		(WP de)
		(WP df)
		(WP dg)
		(WP dh)
		(WP ea)
		(WP eb)
		(WP ec)
		(WP ed)
		(WP ee)
		(WP ef)
		(WP eg)
		(WP eh)
		(WP fa)
		(WP fb)
		(WP fc)
		(WP fd)
		(WP fe)
		(WP ff)
		(WP fg)
		(WP fh)
		(WP ga)
		(WP gb)
		(WP gc)
		(WP gd)
		(WP ge)
		(WP gf)
		(WP gg)
		(WP gh)
		(WP ha)
		(WP hb)
		(WP hc)
		(WP hd)
		(WP he)
		(WP hf)
		(WP hg)
		(WP hh)



		(Pipe pipeAD)
		(Pipe pipeBD)
		(PipeFailure pipeCD)
		(Pipe pipeCF)
		(Pipe pipeCG)
		(Pipe pipeCH)
		(Pipe pipeDB)
		(Pipe pipeEF)
		(Pipe pipeEH)
		(Pipe pipeFB)
		(PipeFailure pipeGB)
		(Pipe pipeGC)
		(Pipe pipeGD)
		(Pipe pipeGE)
		(Pipe pipeGF)
		(Pipe pipeGH)

		(locatedAt pipeAD ad)
		(locatedAt pipeBD bd)
		(locatedAt pipeCD cd)
		(locatedAt pipeCF cf)
		(locatedAt pipeCG cg)
		(locatedAt pipeCH ch)
		(locatedAt pipeDB db)
		(locatedAt pipeEF ef)
		(locatedAt pipeEH eh)
		(locatedAt pipeFB fb)
		(locatedAt pipeGB gb)
		(locatedAt pipeGC gc)
		(locatedAt pipeGD gd)
		(locatedAt pipeGE ge)
		(locatedAt pipeGF gf)
		(locatedAt pipeGH gh)



		
		(Tank tankBA)
		(Tank tankAH)
		(Tank tankDF)

		(locatedAt tankBA ba)
		(locatedAt tankBA bb)
		(locatedAt tankBA ca)
		(locatedAt tankBA cb)
		(locatedAt tankAH ah)
		(locatedAt tankAH bh)
		(locatedAt tankDF df)
		
		(Robot auv)
		(robotAt auv aa)

		(Valve valveCC)
		(Valve valveCE)
		(Valve valveEB)
		(Valve valveEG)
		(Valve valveGG)

		(OpenValve valveCC)
		(OpenValve valveCE)
		(OpenValve valveEB)
		(OpenValve valveEG)
		(OpenValve valveGG)

		(locatedAt valveCC cc)
		(locatedAt valveCE ce)
		(locatedAt valveEB eb)
		(locatedAt valveEG eg)
		(locatedAt valveGG gg)

		(Wall wallED)
		(Wall wallHA)

		(locatedAt wallED ed)
		(locatedAt wallED ee)
		(locatedAt wallED fe)
		(locatedAt wallED ff)
		(locatedAt wallHA ha)
		(locatedAt wallHA hb)
		(locatedAt wallHA hc)
		(locatedAt wallHA hd)
		(locatedAt wallHA he)
		(locatedAt wallHA hf)
		(locatedAt wallHA hg)
		(locatedAt wallHA hh)

		
		(connectedTo pipeAD pipeBD)
		(connectedTo pipeBD pipeCD)
		(connectedTo tankAH pipeCH)
		(connectedTo tankBA valveCC)
		(connectedTo valveCC pipeCD)
		(connectedTo pipeCD valveCE)
		(connectedTo valveCE pipeCF)
		(connectedTo pipeCF pipeCG)
		(connectedTo pipeCG pipeCH)
		(connectedTo tankBA pipeDB)
		(connectedTo pipeCF tankDF)
		(connectedTo pipeDB valveEB)
		(connectedTo tankDF pipeEF)
		(connectedTo pipeEF valveEG)
		(connectedTo valveEG pipeEH)
		(connectedTo valveEB pipeFB)
		(connectedTo pipeFB pipeGB)
		(connectedTo pipeGB pipeGC)
		(connectedTo pipeGC pipeGD)
		(connectedTo pipeGD pipeGE)
		(connectedTo pipeGE pipeGF)
		(connectedTo pipeGF valveGG)
		(connectedTo valveGG pipeGH)

		

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