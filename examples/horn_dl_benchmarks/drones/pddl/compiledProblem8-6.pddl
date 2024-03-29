(define (problem drone_problem)
(:domain drone)
(:init
       (wetdrone de)
       (drone ee)
       (drone fe)
       (drone ff)
       (drone dd)
       (drone ef)
       (human fc)
       (human db)
       (human hg)
       (human ae)
       (human ha)
       (human bc)
       (human ge)
       (human cf)
       (tree dg)
       (tree bh)
       (tree bb)
       (tree be)
       (tree hd)
       (tree ce)
       (tree fb)
       (tree ac)
       (lowvisibility env)
       (environment fd env)
       (environment dh env)
       (environment hh env)
       (environment gh env)
       (environment ga env)
       (environment ae env)
       (environment fb env)
       (environment hb env)
       (environment gc env)
       (environment ah env)
       (environment ea env)
       (environment cf env)
       (veryclose aa ab)
       (veryclose aa ba)
       (veryclose ab ac)
       (veryclose ba ca)
       (veryclose ac ad)
       (veryclose ca da)
       (veryclose ad ae)
       (veryclose da ea)
       (veryclose ae af)
       (veryclose ea fa)
       (veryclose af ag)
       (veryclose fa ga)
       (veryclose ag ah)
       (veryclose ga ha)
       (veryclose ba bb)
       (veryclose ab bb)
       (veryclose bb bc)
       (veryclose bb cb)
       (veryclose bc bd)
       (veryclose cb db)
       (veryclose bd be)
       (veryclose db eb)
       (veryclose be bf)
       (veryclose eb fb)
       (veryclose bf bg)
       (veryclose fb gb)
       (veryclose bg bh)
       (veryclose gb hb)
       (veryclose ca cb)
       (veryclose ac bc)
       (veryclose cb cc)
       (veryclose bc cc)
       (veryclose cc cd)
       (veryclose cc dc)
       (veryclose cd ce)
       (veryclose dc ec)
       (veryclose ce cf)
       (veryclose ec fc)
       (veryclose cf cg)
       (veryclose fc gc)
       (veryclose cg ch)
       (veryclose gc hc)
       (veryclose da db)
       (veryclose ad bd)
       (veryclose db dc)
       (veryclose bd cd)
       (veryclose dc dd)
       (veryclose cd dd)
       (veryclose dd de)
       (veryclose dd ed)
       (veryclose de df)
       (veryclose ed fd)
       (veryclose df dg)
       (veryclose fd gd)
       (veryclose dg dh)
       (veryclose gd hd)
       (veryclose ea eb)
       (veryclose ae be)
       (veryclose eb ec)
       (veryclose be ce)
       (veryclose ec ed)
       (veryclose ce de)
       (veryclose ed ee)
       (veryclose de ee)
       (veryclose ee ef)
       (veryclose ee fe)
       (veryclose ef eg)
       (veryclose fe ge)
       (veryclose eg eh)
       (veryclose ge he)
       (veryclose fa fb)
       (veryclose af bf)
       (veryclose fb fc)
       (veryclose bf cf)
       (veryclose fc fd)
       (veryclose cf df)
       (veryclose fd fe)
       (veryclose df ef)
       (veryclose fe ff)
       (veryclose ef ff)
       (veryclose ff fg)
       (veryclose ff gf)
       (veryclose fg fh)
       (veryclose gf hf)
       (veryclose ga gb)
       (veryclose ag bg)
       (veryclose gb gc)
       (veryclose bg cg)
       (veryclose gc gd)
       (veryclose cg dg)
       (veryclose gd ge)
       (veryclose dg eg)
       (veryclose ge gf)
       (veryclose eg fg)
       (veryclose gf gg)
       (veryclose fg gg)
       (veryclose gg gh)
       (veryclose gg hg)
       (veryclose ha hb)
       (veryclose ah bh)
       (veryclose hb hc)
       (veryclose bh ch)
       (veryclose hc hd)
       (veryclose ch dh)
       (veryclose hd he)
       (veryclose dh eh)
       (veryclose he hf)
       (veryclose eh fh)
       (veryclose hf hg)
       (veryclose fh gh)
       (veryclose hg hh)
       (veryclose gh hh)
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
       (near gh hg))
(:goal (and (not (DATALOG_INCONSISTENT)) (not (DATALOG_QUERY1))))
)