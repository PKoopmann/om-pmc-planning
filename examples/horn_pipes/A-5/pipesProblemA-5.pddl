(define (problem pipes_problem)
	(:domain pipes)
	(:objects aa ab ac ad ae ba bb bc bd be ca cb cc cd ce da db dc dd de ea eb ec ed ee auv pipeBA pipeBB pipeCB pipeDB pipeEB pipeED pipeFD tankFA tankFC tankFE tankLarge valveBD valveEA valveEC valveEE valveGD wall wall2 wall3 valveGG valveEI tankFG tankCI pipeHD pipeHE pipeHG pipeHH pipeIH pipeJH pipeHI pipeHJ pipeGI pipeFI pipeDI
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
		(nextTo ba bb)
		(nextTo ab bb)
		(nextTo bb bc)
		(nextTo bb cb)
		(nextTo bc bd)
		(nextTo cb db)
		(nextTo bd be)
		(nextTo db eb)
		(nextTo ca cb)
		(nextTo ac bc)
		(nextTo cb cc)
		(nextTo bc cc)
		(nextTo cc cd)
		(nextTo cc dc)
		(nextTo cd ce)
		(nextTo dc ec)
		(nextTo da db)
		(nextTo ad bd)
		(nextTo db dc)
		(nextTo bd cd)
		(nextTo dc dd)
		(nextTo cd dd)
		(nextTo dd de)
		(nextTo dd ed)
		(nextTo ea eb)
		(nextTo ae be)
		(nextTo eb ec)
		(nextTo be ce)
		(nextTo ec ed)
		(nextTo ce de)
		(nextTo ed ee)
		(nextTo de ee)
		(nextTo aa bb)
		(nextTo ab bc)
		(nextTo ac bd)
		(nextTo ad be)
		(nextTo ab ba)
		(nextTo ac bb)
		(nextTo ad bc)
		(nextTo ae bd)
		(nextTo ba cb)
		(nextTo bb cc)
		(nextTo bc cd)
		(nextTo bd ce)
		(nextTo bb ca)
		(nextTo bc cb)
		(nextTo bd cc)
		(nextTo be cd)
		(nextTo ca db)
		(nextTo cb dc)
		(nextTo cc dd)
		(nextTo cd de)
		(nextTo cb da)
		(nextTo cc db)
		(nextTo cd dc)
		(nextTo ce dd)
		(nextTo da eb)
		(nextTo db ec)
		(nextTo dc ed)
		(nextTo dd ee)
		(nextTo db ea)
		(nextTo dc eb)
		(nextTo dd ec)
		(nextTo de ed)

		(Pipe pipeBA)
		(Pipe pipeBB)
		(Pipe pipeDB)
		(Pipe pipeEB)
		(Pipe pipeED)
		(PipeFailure pipeCB)
		(Robot auv)
		(Tank tankLarge)
		(Valve valveBD)
		(Valve valveEA)
		(Valve valveEC)
		(Valve valveEE)
		(WP aa)
		(WP ab)
		(WP ac)
		(WP ad)
		(WP ae)
		(WP ba)
		(WP bb)
		(WP bc)
		(WP bd)
		(WP be)
		(WP ca)
		(WP cb)
		(WP cc)
		(WP cd)
		(WP ce)
		(WP da)
		(WP db)
		(WP dc)
		(WP dd)
		(WP de)
		(WP ea)
		(WP eb)
		(WP ec)
		(WP ed)
		(WP ee)

		(robotAt auv aa)
		(OpenValve valveBD)
		(OpenValve valveEA)
		(OpenValve valveEC)
		(OpenValve valveEE)
		(locatedAt valveBD bd)
		(locatedAt valveEA ea)
		(locatedAt valveEC ec)
		(locatedAt valveEE ee)


		
		(connectedTo pipeBA pipeBB)
		(connectedTo pipeBB pipeCB)
		(connectedTo pipeBB valveBD)
		(connectedTo pipeDB pipeCB)
		(connectedTo pipeEB pipeDB)
		(connectedTo pipeED valveEC)
		(connectedTo valveBD tankLarge)
		(connectedTo valveEA pipeEB)
		(connectedTo valveEC pipeEB)
		(connectedTo valveEE pipeED)



		(locatedAt pipeBA ba)
		(locatedAt pipeBB bb)
		(locatedAt pipeCB cb)
		(locatedAt pipeDB db)
		(locatedAt pipeEB eb)
		(locatedAt pipeED ed)
		(locatedAt tankLarge ae)
		(locatedAt tankLarge be)
		(locatedAt tankLarge ce)

		(Wall wall)
		(locatedAt wall ac)
		(locatedAt wall bc)
		(locatedAt wall cc)
		(locatedAt wall dc)

		(Wall wall2)

		(Wall wall3)




		

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