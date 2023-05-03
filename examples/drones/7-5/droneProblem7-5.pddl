(define (problem drone_problem)
	(:domain drone)
	(:objects aa ab ac ad ae af ag ba bb bc bd be bf bg ca cb cc cd ce cf cg da db dc dd de df dg ea eb ec ed ee ef eg fa fb fc fd fe ff fg ga gb gc gd ge gf gg env )
	(:init
		(WetDrone dd)
		(Drone dc)
		(Drone de)
		(Drone ce)
		(Drone be)
		(Human df)
		(Human cf)
		(Human eb)
		(Human fe)
		(Human bd)
		(Human ef)
		(Tree fg)
		(Tree cg)
		(Tree ae)
		(Tree fd)
		(Tree bf)
		(Tree fc)
		(LowVisibility env)
		(environment cc env)
		(environment gc env)
		(environment cg env)
		(environment de env)
		(environment db env)
		(environment ef env)
		(environment fa env)
		(environment cc env)
		(environment dd env)
		(veryClose aa ab)
		(veryClose aa ba)
		(veryClose ab ac)
		(veryClose ba ca)
		(veryClose ac ad)
		(veryClose ca da)
		(veryClose ad ae)
		(veryClose da ea)
		(veryClose ae af)
		(veryClose ea fa)
		(veryClose af ag)
		(veryClose fa ga)
		(veryClose ba bb)
		(veryClose ab bb)
		(veryClose bb bc)
		(veryClose bb cb)
		(veryClose bc bd)
		(veryClose cb db)
		(veryClose bd be)
		(veryClose db eb)
		(veryClose be bf)
		(veryClose eb fb)
		(veryClose bf bg)
		(veryClose fb gb)
		(veryClose ca cb)
		(veryClose ac bc)
		(veryClose cb cc)
		(veryClose bc cc)
		(veryClose cc cd)
		(veryClose cc dc)
		(veryClose cd ce)
		(veryClose dc ec)
		(veryClose ce cf)
		(veryClose ec fc)
		(veryClose cf cg)
		(veryClose fc gc)
		(veryClose da db)
		(veryClose ad bd)
		(veryClose db dc)
		(veryClose bd cd)
		(veryClose dc dd)
		(veryClose cd dd)
		(veryClose dd de)
		(veryClose dd ed)
		(veryClose de df)
		(veryClose ed fd)
		(veryClose df dg)
		(veryClose fd gd)
		(veryClose ea eb)
		(veryClose ae be)
		(veryClose eb ec)
		(veryClose be ce)
		(veryClose ec ed)
		(veryClose ce de)
		(veryClose ed ee)
		(veryClose de ee)
		(veryClose ee ef)
		(veryClose ee fe)
		(veryClose ef eg)
		(veryClose fe ge)
		(veryClose fa fb)
		(veryClose af bf)
		(veryClose fb fc)
		(veryClose bf cf)
		(veryClose fc fd)
		(veryClose cf df)
		(veryClose fd fe)
		(veryClose df ef)
		(veryClose fe ff)
		(veryClose ef ff)
		(veryClose ff fg)
		(veryClose ff gf)
		(veryClose ga gb)
		(veryClose ag bg)
		(veryClose gb gc)
		(veryClose bg cg)
		(veryClose gc gd)
		(veryClose cg dg)
		(veryClose gd ge)
		(veryClose dg eg)
		(veryClose ge gf)
		(veryClose eg fg)
		(veryClose gf gg)
		(veryClose fg gg)
		(near aa bb)
		(near ab bc)
		(near ac bd)
		(near ad be)
		(near ae bf)
		(near af bg)
		(near ab ba)
		(near ac bb)
		(near ad bc)
		(near ae bd)
		(near af be)
		(near ag bf)
		(near ba cb)
		(near bb cc)
		(near bc cd)
		(near bd ce)
		(near be cf)
		(near bf cg)
		(near bb ca)
		(near bc cb)
		(near bd cc)
		(near be cd)
		(near bf ce)
		(near bg cf)
		(near ca db)
		(near cb dc)
		(near cc dd)
		(near cd de)
		(near ce df)
		(near cf dg)
		(near cb da)
		(near cc db)
		(near cd dc)
		(near ce dd)
		(near cf de)
		(near cg df)
		(near da eb)
		(near db ec)
		(near dc ed)
		(near dd ee)
		(near de ef)
		(near df eg)
		(near db ea)
		(near dc eb)
		(near dd ec)
		(near de ed)
		(near df ee)
		(near dg ef)
		(near ea fb)
		(near eb fc)
		(near ec fd)
		(near ed fe)
		(near ee ff)
		(near ef fg)
		(near eb fa)
		(near ec fb)
		(near ed fc)
		(near ee fd)
		(near ef fe)
		(near eg ff)
		(near fa gb)
		(near fb gc)
		(near fc gd)
		(near fd ge)
		(near fe gf)
		(near ff gg)
		(near fb ga)
		(near fc gb)
		(near fd gc)
		(near fe gd)
		(near ff ge)
		(near fg gf)
		
	)
	(:goal (and
		(not (exists (?x ?y) (KBquery_AvoidCondition ?x ?y))))
	)

)
