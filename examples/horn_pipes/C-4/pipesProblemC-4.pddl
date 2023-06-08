(define (problem pipes_problem)
	(:domain pipes)
	(:objects aa ab ac ad ba bb bc bd ca cb cc cd da db dc dd auv tankEE valveAC valveDC valveEF valveGC wallAH wallBA wallDD wallID pipeCC pipeCD pipeCE pipeCF pipeEC pipeFC pipeHC pipeIC pipeJC
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



		(Pipe pipeCC)
		(PipeFailure pipeCD)


		(locatedAt pipeCC cc)
		(locatedAt pipeCD cd)

	

		
		(Robot auv)
		(robotAt auv aa)

		(Valve valveDC)
		(Valve valveAC)

		(OpenValve valveAC)
		(OpenValve valveDC)

		(locatedAt valveAC ac)
		(locatedAt valveDC dc)

		(Wall wallBA)
		(Wall wallAH)
		(Wall wallDD)
		(Wall wallID)

		;(locatedAt wallBA ba)
		(locatedAt wallBA bb)
		(locatedAt wallBA bc)
		(locatedAt wallBA bd)
		(locatedAt wallDD dd)
	
		(connectedTo valveAC pipeCC)
		(connectedTo pipeCC pipeCD)
		(connectedTo pipeCC valveDC)

		

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
