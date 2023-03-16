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
        (or (contains b b) (and (contains d b) (contains b d)) (and (contains b a) (contains d b)) (and (contains b d) (contains d a)) (and (contains b a) (contains b d)) (contains a d) (contains c a) (contains d d) (contains b c) (contains c b) (contains c c) (contains a a) (contains a b) (and (contains d b) (contains d a)) (contains d c) (contains c d) (contains a c))
    )

    (:derived (KBquery_Package ?x)
        (or
            (inconsistent) 
            (and (= ?x h) (true))
            (and (= ?x d) (or (contains d b) (contains d a)))
            (and (= ?x j) (true))
            (and (= ?x k) (false))
            (and (= ?x c) (true))
            (and (= ?x e) (false))
            (and (= ?x i) (false))
            (and (= ?x b) (or (contains b d) (contains b a)))
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

