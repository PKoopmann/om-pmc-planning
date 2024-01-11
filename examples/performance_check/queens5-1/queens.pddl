(define (domain queens)
	(:requirements :strips :equality :disjunctive-preconditions :derived-predicates :negative-preconditions :conditional-effects :existential-preconditions)

(:predicates 
	(Queen ?x)
  (Figure ?x)
	(rightdiagonal ?x ?y)
	(backdiagonal ?x ?y)
	(inline ?x ?y)
  (horinline ?x ?y)
  (verinline ?x ?y)
  (KBquery_Queen ?x)
  (KBquery_inline ?x ?y)
  (KBquery_Figure ?x)
)

(:action Move
  :parameters (?x ?y)
  :precondition (and    
    (KBquery_Queen ?x)
    (KBquery_inline ?x ?y)
    (not (KBquery_Figure ?y))
  )
  :effect (and
    (not (Queen ?x))
    (Queen ?y)
  )
)

)
