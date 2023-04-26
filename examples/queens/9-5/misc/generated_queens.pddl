(define (domain queens)
	(:requirements :strips :equality :disjunctive-preconditions :derived-predicates :negative-preconditions :conditional-effects :existential-preconditions)

(:predicates 
    (false)
    (true)
    (inconsistent)
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

    (:derived (true)
        (not (false))
    )

(:action Move
  :parameters (?x ?y)
        :precondition (and
            (not (inconsistent))
            (and 
    (KBquery_Queen ?x)
    (KBquery_inline ?x ?y)
    (not (KBquery_Figure ?y))
  )
        )
  :effect (and
    (not (Queen ?x))
    (Queen ?y)
  )
)

)
