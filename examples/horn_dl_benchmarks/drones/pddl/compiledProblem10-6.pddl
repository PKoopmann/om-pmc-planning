(define (problem drone_problem)
(:domain drone)
(:init
       (wetdrone ff)
       (drone fe)
       (drone ee)
       (drone gf)
       (drone gg)
       (drone de)
       (human fh)
       (human bg)
       (human cb)
       (human ag)
       (human ae)
       (human hj)
       (human bd)
       (human ec)
       (human jd)
       (human hc)
       (human gh)
       (human ic)
       (tree ji)
       (tree bi)
       (tree di)
       (tree bh)
       (tree fg)
       (tree ab)
       (tree jf)
       (tree dg)
       (tree gi)
       (tree cc)
       (tree gb)
       (tree aj)
       (tree ge)
       (lowvisibility env)
       (environment ej env)
       (environment ae env)
       (environment bj env)
       (environment bf env)
       (environment id env)
       (environment aa env)
       (environment jh env)
       (environment fh env)
       (environment fb env)
       (environment dh env)
       (environment jj env)
       (environment bg env)
       (environment ib env)
       (environment dc env)
       (environment ic env)
       (environment hh env)
       (environment ch env)
       (environment hh env)
       (environment ea env)
       (environment fh env)
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
       (veryclose ah ai)
       (veryclose ha ia)
       (veryclose ai aj)
       (veryclose ia ja)
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
       (veryclose bh bi)
       (veryclose hb ib)
       (veryclose bi bj)
       (veryclose ib jb)
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
       (veryclose ch ci)
       (veryclose hc ic)
       (veryclose ci cj)
       (veryclose ic jc)
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
       (veryclose dh di)
       (veryclose hd id)
       (veryclose di dj)
       (veryclose id jd)
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
       (veryclose eh ei)
       (veryclose he ie)
       (veryclose ei ej)
       (veryclose ie je)
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
       (veryclose fh fi)
       (veryclose hf if)
       (veryclose fi fj)
       (veryclose if jf)
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
       (veryclose gh gi)
       (veryclose hg ig)
       (veryclose gi gj)
       (veryclose ig jg)
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
       (veryclose hh hi)
       (veryclose hh ih)
       (veryclose hi hj)
       (veryclose ih jh)
       (veryclose ia ib)
       (veryclose ai bi)
       (veryclose ib ic)
       (veryclose bi ci)
       (veryclose ic id)
       (veryclose ci di)
       (veryclose id ie)
       (veryclose di ei)
       (veryclose ie if)
       (veryclose ei fi)
       (veryclose if ig)
       (veryclose fi gi)
       (veryclose ig ih)
       (veryclose gi hi)
       (veryclose ih ii)
       (veryclose hi ii)
       (veryclose ii ij)
       (veryclose ii ji)
       (veryclose ja jb)
       (veryclose aj bj)
       (veryclose jb jc)
       (veryclose bj cj)
       (veryclose jc jd)
       (veryclose cj dj)
       (veryclose jd je)
       (veryclose dj ej)
       (veryclose je jf)
       (veryclose ej fj)
       (veryclose jf jg)
       (veryclose fj gj)
       (veryclose jg jh)
       (veryclose gj hj)
       (veryclose jh ji)
       (veryclose hj ij)
       (veryclose ji jj)
       (veryclose ij jj)
       (near aa bb)
       (near ab bc)
       (near ac bd)
       (near ad be)
       (near ae bf)
       (near af bg)
       (near ag bh)
       (near ah bi)
       (near ai bj)
       (near ab ba)
       (near ac bb)
       (near ad bc)
       (near ae bd)
       (near af be)
       (near ag bf)
       (near ah bg)
       (near ai bh)
       (near aj bi)
       (near ba cb)
       (near bb cc)
       (near bc cd)
       (near bd ce)
       (near be cf)
       (near bf cg)
       (near bg ch)
       (near bh ci)
       (near bi cj)
       (near bb ca)
       (near bc cb)
       (near bd cc)
       (near be cd)
       (near bf ce)
       (near bg cf)
       (near bh cg)
       (near bi ch)
       (near bj ci)
       (near ca db)
       (near cb dc)
       (near cc dd)
       (near cd de)
       (near ce df)
       (near cf dg)
       (near cg dh)
       (near ch di)
       (near ci dj)
       (near cb da)
       (near cc db)
       (near cd dc)
       (near ce dd)
       (near cf de)
       (near cg df)
       (near ch dg)
       (near ci dh)
       (near cj di)
       (near da eb)
       (near db ec)
       (near dc ed)
       (near dd ee)
       (near de ef)
       (near df eg)
       (near dg eh)
       (near dh ei)
       (near di ej)
       (near db ea)
       (near dc eb)
       (near dd ec)
       (near de ed)
       (near df ee)
       (near dg ef)
       (near dh eg)
       (near di eh)
       (near dj ei)
       (near ea fb)
       (near eb fc)
       (near ec fd)
       (near ed fe)
       (near ee ff)
       (near ef fg)
       (near eg fh)
       (near eh fi)
       (near ei fj)
       (near eb fa)
       (near ec fb)
       (near ed fc)
       (near ee fd)
       (near ef fe)
       (near eg ff)
       (near eh fg)
       (near ei fh)
       (near ej fi)
       (near fa gb)
       (near fb gc)
       (near fc gd)
       (near fd ge)
       (near fe gf)
       (near ff gg)
       (near fg gh)
       (near fh gi)
       (near fi gj)
       (near fb ga)
       (near fc gb)
       (near fd gc)
       (near fe gd)
       (near ff ge)
       (near fg gf)
       (near fh gg)
       (near fi gh)
       (near fj gi)
       (near ga hb)
       (near gb hc)
       (near gc hd)
       (near gd he)
       (near ge hf)
       (near gf hg)
       (near gg hh)
       (near gh hi)
       (near gi hj)
       (near gb ha)
       (near gc hb)
       (near gd hc)
       (near ge hd)
       (near gf he)
       (near gg hf)
       (near gh hg)
       (near gi hh)
       (near gj hi)
       (near ha ib)
       (near hb ic)
       (near hc id)
       (near hd ie)
       (near he if)
       (near hf ig)
       (near hg ih)
       (near hh ii)
       (near hi ij)
       (near hb ia)
       (near hc ib)
       (near hd ic)
       (near he id)
       (near hf ie)
       (near hg if)
       (near hh ig)
       (near hi ih)
       (near hj ii)
       (near ia jb)
       (near ib jc)
       (near ic jd)
       (near id je)
       (near ie jf)
       (near if jg)
       (near ig jh)
       (near ih ji)
       (near ii jj)
       (near ib ja)
       (near ic jb)
       (near id jc)
       (near ie jd)
       (near if je)
       (near ig jf)
       (near ih jg)
       (near ii jh)
       (near ij ji))
(:goal (and (not (DATALOG_INCONSISTENT)) (not (DATALOG_QUERY1))))
)