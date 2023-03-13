(:derived (inconsistent) (false))

(:derived (KBquery_canTakePicture ?x)
	(or (inconsistent) 
	    (and (= ?x remaroAUV) (true))
	)
)

(:derived (KBquery_canDrive ?x)
	(or (inconsistent) 
	    (and (= ?x remaroAUV) (canDrive backThruster))
	)
)
