(define (problem drone_problem)
	(:domain drone)
	(:objects aa ab ac ad ae af ag ah ba bb bc bd be bf bg bh ca cb cc cd ce cf cg ch da db dc dd de df dg dh ea eb ec ed ee ef eg eh fa fb fc fd fe ff fg fh ga gb gc gd ge gf gg gh ha hb hc hd he hf hg hh env )
	(:init
		(WetDrone ee)
		(Drone ef)
		(Drone fe)
		(Drone df)
		(Drone ff)
		(Human ch)
		(Human bh)
		(Human ae)
		(Human bb)
		(Human cg)
		(Human bf)
		(Human gd)
		(Human de)
		(Tree cd)
		(Tree ec)
		(Tree cb)
		(Tree hf)
		(Tree ea)
		(Tree be)
		(Tree ha)
		(Tree gh)
		(LowVisibility env)
		(environment ha env)
		(environment gc env)
		(environment ff env)
		(environment cc env)
		(environment bh env)
		(environment ab env)
		(environment bg env)
		(environment hh env)
		(environment df env)
		(environment fh env)
		(environment fg env)
		(environment bb env)
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
		(near aa bb)
		(near ab bc)
		(near ac bd)
		(near ad be)
		(near ae bf)
		(near af bg)
		(near ag bh)
		(near ab ba)
		(near ac bb)
		(near ad bc)
		(near ae bd)
		(near af be)
		(near ag bf)
		(near ah bg)
		(near ba cb)
		(near bb cc)
		(near bc cd)
		(near bd ce)
		(near be cf)
		(near bf cg)
		(near bg ch)
		(near bb ca)
		(near bc cb)
		(near bd cc)
		(near be cd)
		(near bf ce)
		(near bg cf)
		(near bh cg)
		(near ca db)
		(near cb dc)
		(near cc dd)
		(near cd de)
		(near ce df)
		(near cf dg)
		(near cg dh)
		(near cb da)
		(near cc db)
		(near cd dc)
		(near ce dd)
		(near cf de)
		(near cg df)
		(near ch dg)
		(near da eb)
		(near db ec)
		(near dc ed)
		(near dd ee)
		(near de ef)
		(near df eg)
		(near dg eh)
		(near db ea)
		(near dc eb)
		(near dd ec)
		(near de ed)
		(near df ee)
		(near dg ef)
		(near dh eg)
		(near ea fb)
		(near eb fc)
		(near ec fd)
		(near ed fe)
		(near ee ff)
		(near ef fg)
		(near eg fh)
		(near eb fa)
		(near ec fb)
		(near ed fc)
		(near ee fd)
		(near ef fe)
		(near eg ff)
		(near eh fg)
		(near fa gb)
		(near fb gc)
		(near fc gd)
		(near fd ge)
		(near fe gf)
		(near ff gg)
		(near fg gh)
		(near fb ga)
		(near fc gb)
		(near fd gc)
		(near fe gd)
		(near ff ge)
		(near fg gf)
		(near fh gg)
		(near ga hb)
		(near gb hc)
		(near gc hd)
		(near gd he)
		(near ge hf)
		(near gf hg)
		(near gg hh)
		(near gb ha)
		(near gc hb)
		(near gd hc)
		(near ge hd)
		(near gf he)
		(near gg hf)
		(near gh hg)
	)
	(:goal (not (mko (exists (?x ?y) 
 		 (and 
 			 (RiskOfPhysicalDamage ?x) 
 			 (RiskOfPhysicalDamage ?y) 
 			 (near ?x ?y) 
 		 )) 
 	 )) 
 	)

)