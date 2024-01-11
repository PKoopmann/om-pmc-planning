(define (domain BTcat)
  (:requirements :strips :equality :disjunctive-preconditions :derived-predicates :negative-preconditions :conditional-effects :existential-preconditions)

(:predicates 
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

(:action dunk
  :parameters (?x ?y)
  :precondition (KBquery_Package ?x)
  :effect (when (KBquery_ContainsBomb ?x ?y)
                  (and (disarmed ?x)))
            )

(:action let_the_cats_out
  :parameters (?x ?y)
  :precondition (KBquery_Package ?x)
  :effect (when (KBquery_Contains ?x ?y)
                  (and (not (contains ?x ?y)) (cat ?y)))
            )

)

