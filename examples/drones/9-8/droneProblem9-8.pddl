(define (problem drone_problem)
	(:domain drone)
	(:objects aa ab ac ad ae af ag ah ai ba bb bc bd be bf bg bh bi ca cb cc cd ce cf cg ch ci da db dc dd de df dg dh di ea eb ec ed ee ef eg eh ei fa fb fc fd fe ff fg fh fi ga gb gc gd ge gf gg gh gi ha hb hc hd he hf hg hh hi ia ib ic id ie if ig ih ii env )
	(:init
		(WetDrone df)
		(WetDrone fe)
		(Drone ee)
		(Drone de)
		(Drone ce)
		(Drone be)
		(Drone ae)
		(Drone fd)
		(Human bd)
		(Human ec)
		(Human if)
		(Human ie)
		(Human hg)
		(Human bc)
		(Human fa)
		(Human hi)
		(Human id)
		(Human ci)
		(Tree gc)
		(Tree hh)
		(Tree di)
		(Tree ha)
		(Tree bf)
		(Tree hf)
		(Tree cc)
		(Tree ga)
		(Tree hb)
		(Tree ba)
		(LowVisibility env)
		(environment ed env)
		(environment dg env)
		(environment gd env)
		(environment hd env)
		(environment ei env)
		(environment ef env)
		(environment ed env)
		(environment fa env)
		(environment fi env)
		(environment ch env)
		(environment ci env)
		(environment hg env)
		(environment eh env)
		(environment dd env)
		(environment eg env)
		(environment ab env)
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
		(veryClose ag ah)
		(veryClose ga ha)
		(veryClose ah ai)
		(veryClose ha ia)
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
		(veryClose bg bh)
		(veryClose gb hb)
		(veryClose bh bi)
		(veryClose hb ib)
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
		(veryClose cg ch)
		(veryClose gc hc)
		(veryClose ch ci)
		(veryClose hc ic)
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
		(veryClose dg dh)
		(veryClose gd hd)
		(veryClose dh di)
		(veryClose hd id)
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
		(veryClose eg eh)
		(veryClose ge he)
		(veryClose eh ei)
		(veryClose he ie)
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
		(veryClose fg fh)
		(veryClose gf hf)
		(veryClose fh fi)
		(veryClose hf if)
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
		(veryClose gg gh)
		(veryClose gg hg)
		(veryClose gh gi)
		(veryClose hg ig)
		(veryClose ha hb)
		(veryClose ah bh)
		(veryClose hb hc)
		(veryClose bh ch)
		(veryClose hc hd)
		(veryClose ch dh)
		(veryClose hd he)
		(veryClose dh eh)
		(veryClose he hf)
		(veryClose eh fh)
		(veryClose hf hg)
		(veryClose fh gh)
		(veryClose hg hh)
		(veryClose gh hh)
		(veryClose hh hi)
		(veryClose hh ih)
		(veryClose ia ib)
		(veryClose ai bi)
		(veryClose ib ic)
		(veryClose bi ci)
		(veryClose ic id)
		(veryClose ci di)
		(veryClose id ie)
		(veryClose di ei)
		(veryClose ie if)
		(veryClose ei fi)
		(veryClose if ig)
		(veryClose fi gi)
		(veryClose ig ih)
		(veryClose gi hi)
		(veryClose ih ii)
		(veryClose hi ii)
		(near aa bb)
		(near ab bc)
		(near ac bd)
		(near ad be)
		(near ae bf)
		(near af bg)
		(near ag bh)
		(near ah bi)
		(near ab ba)
		(near ac bb)
		(near ad bc)
		(near ae bd)
		(near af be)
		(near ag bf)
		(near ah bg)
		(near ai bh)
		(near ba cb)
		(near bb cc)
		(near bc cd)
		(near bd ce)
		(near be cf)
		(near bf cg)
		(near bg ch)
		(near bh ci)
		(near bb ca)
		(near bc cb)
		(near bd cc)
		(near be cd)
		(near bf ce)
		(near bg cf)
		(near bh cg)
		(near bi ch)
		(near ca db)
		(near cb dc)
		(near cc dd)
		(near cd de)
		(near ce df)
		(near cf dg)
		(near cg dh)
		(near ch di)
		(near cb da)
		(near cc db)
		(near cd dc)
		(near ce dd)
		(near cf de)
		(near cg df)
		(near ch dg)
		(near ci dh)
		(near da eb)
		(near db ec)
		(near dc ed)
		(near dd ee)
		(near de ef)
		(near df eg)
		(near dg eh)
		(near dh ei)
		(near db ea)
		(near dc eb)
		(near dd ec)
		(near de ed)
		(near df ee)
		(near dg ef)
		(near dh eg)
		(near di eh)
		(near ea fb)
		(near eb fc)
		(near ec fd)
		(near ed fe)
		(near ee ff)
		(near ef fg)
		(near eg fh)
		(near eh fi)
		(near eb fa)
		(near ec fb)
		(near ed fc)
		(near ee fd)
		(near ef fe)
		(near eg ff)
		(near eh fg)
		(near ei fh)
		(near fa gb)
		(near fb gc)
		(near fc gd)
		(near fd ge)
		(near fe gf)
		(near ff gg)
		(near fg gh)
		(near fh gi)
		(near fb ga)
		(near fc gb)
		(near fd gc)
		(near fe gd)
		(near ff ge)
		(near fg gf)
		(near fh gg)
		(near fi gh)
		(near ga hb)
		(near gb hc)
		(near gc hd)
		(near gd he)
		(near ge hf)
		(near gf hg)
		(near gg hh)
		(near gh hi)
		(near gb ha)
		(near gc hb)
		(near gd hc)
		(near ge hd)
		(near gf he)
		(near gg hf)
		(near gh hg)
		(near gi hh)
		(near ha ib)
		(near hb ic)
		(near hc id)
		(near hd ie)
		(near he if)
		(near hf ig)
		(near hg ih)
		(near hh ii)
		(near hb ia)
		(near hc ib)
		(near hd ic)
		(near he id)
		(near hf ie)
		(near hg if)
		(near hh ig)
		(near hi ih)
		
	)
	(:goal (and
		(not (exists (?x ?y) (KBquery_AvoidCondition ?x ?y))))
	)

)
