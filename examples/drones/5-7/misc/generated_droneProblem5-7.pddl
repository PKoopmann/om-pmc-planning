(define (problem drone_problem)
	(:domain drone)
	(:objects aa ab ac ad ae ba bb bc bd be ca cb cc cd ce da db dc dd de ea eb ec ed ee env )
	(:init
		(WetDrone cc)
		(Drone bc)
		(Drone cd)
		(Drone ac)
		(Drone ce)
		(Drone dd)
		(Drone ad)
		(Human da)
		(Human ea)
		(Human ae)
		(Tree ed)
		(Tree ee)
		(Tree db)
		(LowVisibility env)
		(environment eb env)
		(environment be env)
		(environment cb env)
		(environment ed env)
		(environment be env)
		(veryClose aa ab)
		(veryClose aa ba)
		(veryClose ab ac)
		(veryClose ba ca)
		(veryClose ac ad)
		(veryClose ca da)
		(veryClose ad ae)
		(veryClose da ea)
		(veryClose ba bb)
		(veryClose ab bb)
		(veryClose bb bc)
		(veryClose bb cb)
		(veryClose bc bd)
		(veryClose cb db)
		(veryClose bd be)
		(veryClose db eb)
		(veryClose ca cb)
		(veryClose ac bc)
		(veryClose cb cc)
		(veryClose bc cc)
		(veryClose cc cd)
		(veryClose cc dc)
		(veryClose cd ce)
		(veryClose dc ec)
		(veryClose da db)
		(veryClose ad bd)
		(veryClose db dc)
		(veryClose bd cd)
		(veryClose dc dd)
		(veryClose cd dd)
		(veryClose dd de)
		(veryClose dd ed)
		(veryClose ea eb)
		(veryClose ae be)
		(veryClose eb ec)
		(veryClose be ce)
		(veryClose ec ed)
		(veryClose ce de)
		(veryClose ed ee)
		(veryClose de ee)
		(near aa bb)
		(near ab bc)
		(near ac bd)
		(near ad be)
		(near ab ba)
		(near ac bb)
		(near ad bc)
		(near ae bd)
		(near ba cb)
		(near bb cc)
		(near bc cd)
		(near bd ce)
		(near bb ca)
		(near bc cb)
		(near bd cc)
		(near be cd)
		(near ca db)
		(near cb dc)
		(near cc dd)
		(near cd de)
		(near cb da)
		(near cc db)
		(near cd dc)
		(near ce dd)
		(near da eb)
		(near db ec)
		(near dc ed)
		(near dd ee)
		(near db ea)
		(near dc eb)
		(near dd ec)
		(near de ed)
	)
    (:goal (and
        (not (inconsistent))
        (and
		(not (exists (?x ?y) (KBquery_AvoidCondition ?x ?y))))
	)

)
)
