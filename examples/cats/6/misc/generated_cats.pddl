(define (domain BTcat)
  (:requirements :strips :equality :disjunctive-preconditions :derived-predicates :negative-preconditions :conditional-effects :existential-preconditions)

(:predicates 
    (false)
    (true)
    (inconsistent)
	(KBquery_Package ?x)
	(KBquery_Disarmed ?x)
	(KBquery_ContainsBomb ?x ?y)
	(KBquery_Contains ?x ?y)
	(disarmed ?x)
	(cat ?x)
	(bomb ?x)
	(contains ?x ?y)
	(package ?x)
	(object ?x)
)

    (:derived (true)
        (not (false))
    )

    (:derived (inconsistent) 
        (false)
    )

    (:derived (KBquery_Package ?x)
        (or
            (inconsistent) 
            (and (= ?x h) (contains h i))
            (and (= ?x j) (true))
            (and (= ?x d) (false))
            (and (= ?x k) (false))
            (and (= ?x c) (true))
            (and (= ?x e) (false))
            (and (= ?x i) (false))
            (and (= ?x b) (true))
            (and (= ?x l) (false))
            (and (= ?x a) (false))
            (and (= ?x g) (false))
            (and (= ?x f) (false))
        )
    )

(:action dunk
  :parameters (?x ?y)
        :precondition (and
            (not (inconsistent))
            (KBquery_Package ?x)
        )
  :effect (when (KBquery_ContainsBomb ?x ?y)
                  (and (disarmed ?x)))
            )

(:action let_the_cats_out
  :parameters (?x ?y)
        :precondition (and
            (not (inconsistent))
            (KBquery_Package ?x)
        )
  :effect (when (KBquery_Contains ?x ?y)
                  (and (not (contains ?x ?y)) (cat ?y)))
            )

)

