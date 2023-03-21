(define (domain queens)

(:predicates 
	(Queen ?x)
         (Figure ?x)
	(rightdiagonal ?x ?y)
	(backdiagonal ?x ?y)
	(inline ?x ?y)
         (horinline ?x ?y)
         (verinline ?x ?y)
)

(:action Move
  :parameters (?x ?y)
  :precondition (and    
    (mko (and (Queen ?x) (inline ?x ?y)))
    (not (mko (Figure ?y)))
  )
  :effect (and
    (not (Queen ?x))
    (Queen ?y)
  )
)
