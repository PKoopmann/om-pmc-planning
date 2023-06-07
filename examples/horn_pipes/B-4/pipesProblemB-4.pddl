(define (problem pipes_problem)
	(:domain pipes)
	(:objects aa ab ac ad ba bb bc bd ca cb cc cd da db dc dd auv tankBA tankAH tankDF tankJB valveCC valveCE valveEB valveEG valveGG valveIB pipeAD pipeBD pipeCD pipeCF pipeCG pipeCH pipeCI pipeDB pipeDI pipeEF pipeEH pipeEI pipeFB pipeFI pipeGB pipeGC pipeGD pipeGE pipeGF pipeGH pipeGI wallED wallHA
)
	(:init
		(nextTo aa ab)
		(nextTo aa ba)
		(nextTo ab ac)
		(nextTo ba ca)
		(nextTo ac ad)
		(nextTo ca da)
		(nextTo ba bb)
		(nextTo ab bb)
		(nextTo bb bc)
		(nextTo bb cb)
		(nextTo bc bd)
		(nextTo cb db)
		(nextTo ca cb)
		(nextTo ac bc)
		(nextTo cb cc)
		(nextTo bc cc)
		(nextTo cc cd)
		(nextTo cc dc)
		(nextTo da db)
		(nextTo ad bd)
		(nextTo db dc)
		(nextTo bd cd)
		(nextTo dc dd)
		(nextTo cd dd)
		(nextTo aa bb)
		(nextTo ab bc)
		(nextTo ac bd)
		(nextTo ab ba)
		(nextTo ac bb)
		(nextTo ad bc)
		(nextTo ba cb)
		(nextTo bb cc)
		(nextTo bc cd)
		(nextTo bb ca)
		(nextTo bc cb)
		(nextTo bd cc)
		(nextTo ca db)
		(nextTo cb dc)
		(nextTo cc dd)
		(nextTo cb da)
		(nextTo cc db)
		(nextTo cd dc)

		(WP aa)
		(WP ab)
		(WP ac)
		(WP ad)
		(WP ba)
		(WP bb)
		(WP bc)
		(WP bd)
		(WP ca)
		(WP cb)
		(WP cc)
		(WP cd)
		(WP da)
		(WP db)
		(WP dc)
		(WP dd)



		(Pipe pipeAD)
		(Pipe pipeBD)
		(PipeFailure pipeCD)
		(Pipe pipeDB)

		(locatedAt pipeAD ad)
		(locatedAt pipeBD bd)
		(locatedAt pipeCD cd)
		(locatedAt pipeDB db)



		
		(Tank tankBA)

		(locatedAt tankBA ba)
		(locatedAt tankBA bb)
		(locatedAt tankBA ca)
		(locatedAt tankBA cb)
		
		(Robot auv)
		(robotAt auv aa)

		(Valve valveCC)

		(OpenValve valveCC)

		(locatedAt valveCC cc)

		(Wall wallED)
		(Wall wallHA)


		
		(connectedTo pipeAD pipeBD)
		(connectedTo pipeBD pipeCD)
		(connectedTo tankBA valveCC)
		(connectedTo valveCC pipeCD)
		(connectedTo tankBA pipeDB)

		

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
