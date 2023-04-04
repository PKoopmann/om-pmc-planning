(define (problem pipes_problem)
	(:domain pipes)
	(:objects aa ab ac ad ae af ag ba bb bc bd be bf bg ca cb cc cd ce cf cg da db dc dd de df dg ea eb ec ed ee ef eg fa fb fc fd fe ff fg ga gb gc gd ge gf gg auv valveBD valveEA valveEC valveEE valveGD)
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
		(nextTo aa bb)
		(nextTo ab bc)
		(nextTo ac bd)
		(nextTo ad be)
		(nextTo ae bf)
		(nextTo af bg)
		(nextTo ab ba)
		(nextTo ac bb)
		(nextTo ad bc)
		(nextTo ae bd)
		(nextTo af be)
		(nextTo ag bf)
		(nextTo ba cb)
		(nextTo bb cc)
		(nextTo bc cd)
		(nextTo bd ce)
		(nextTo be cf)
		(nextTo bf cg)
		(nextTo bb ca)
		(nextTo bc cb)
		(nextTo bd cc)
		(nextTo be cd)
		(nextTo bf ce)
		(nextTo bg cf)
		(nextTo ca db)
		(nextTo cb dc)
		(nextTo cc dd)
		(nextTo cd de)
		(nextTo ce df)
		(nextTo cf dg)
		(nextTo cb da)
		(nextTo cc db)
		(nextTo cd dc)
		(nextTo ce dd)
		(nextTo cf de)
		(nextTo cg df)
		(nextTo da eb)
		(nextTo db ec)
		(nextTo dc ed)
		(nextTo dd ee)
		(nextTo de ef)
		(nextTo df eg)
		(nextTo db ea)
		(nextTo dc eb)
		(nextTo dd ec)
		(nextTo de ed)
		(nextTo df ee)
		(nextTo dg ef)
		(nextTo ea fb)
		(nextTo eb fc)
		(nextTo ec fd)
		(nextTo ed fe)
		(nextTo ee ff)
		(nextTo ef fg)
		(nextTo eb fa)
		(nextTo ec fb)
		(nextTo ed fc)
		(nextTo ee fd)
		(nextTo ef fe)
		(nextTo eg ff)
		(nextTo fa gb)
		(nextTo fb gc)
		(nextTo fc gd)
		(nextTo fd ge)
		(nextTo fe gf)
		(nextTo ff gg)
		(nextTo fb ga)
		(nextTo fc gb)
		(nextTo fd gc)
		(nextTo fe gd)
		(nextTo ff ge)
		(nextTo fg gf)

		(robotAt auv gg)
		(open valveBD)
		(open valveEA)
		(open valveEC)
		(open valveEE)
		(open valveGD)
		(locatedAt valveBD bd)
		(locatedAt valveEA ea)
		(locatedAt valveEC ec)
		(locatedAt valveEE ee)
		(locatedAt valveGD gd)
	)
    (:goal (and
        (not (inconsistent))
        (and
		(robotAt auv gg) 
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
