(define (problem drone_problem)
(:domain drone)
(:init
       (wetdrone fd)
       (drone dd)
       (drone ed)
       (drone dc)
       (drone de)
       (drone ee)
       (drone cd)
       (human ea)
       (human ba)
       (human aa)
       (human ad)
       (tree df)
       (tree fe)
       (tree ff)
       (tree ec)
       (tree ce)
       (lowvisibility env)
       (environment ca env)
       (environment af env)
       (environment bd env)
       (environment db env)
       (environment ae env)
       (environment cc env)
       (environment df env)
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
       (near aa bb)
       (near ab bc)
       (near ac bd)
       (near ad be)
       (near ae bf)
       (near ab ba)
       (near ac bb)
       (near ad bc)
       (near ae bd)
       (near af be)
       (near ba cb)
       (near bb cc)
       (near bc cd)
       (near bd ce)
       (near be cf)
       (near bb ca)
       (near bc cb)
       (near bd cc)
       (near be cd)
       (near bf ce)
       (near ca db)
       (near cb dc)
       (near cc dd)
       (near cd de)
       (near ce df)
       (near cb da)
       (near cc db)
       (near cd dc)
       (near ce dd)
       (near cf de)
       (near da eb)
       (near db ec)
       (near dc ed)
       (near dd ee)
       (near de ef)
       (near db ea)
       (near dc eb)
       (near dd ec)
       (near de ed)
       (near df ee)
       (near ea fb)
       (near eb fc)
       (near ec fd)
       (near ed fe)
       (near ee ff)
       (near eb fa)
       (near ec fb)
       (near ed fc)
       (near ee fd)
       (near ef fe))
(:goal (and (not (DATALOG_INCONSISTENT)) (not (DATALOG_QUERY1))))
)