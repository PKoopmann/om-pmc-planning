(define (domain BTcat)

(:predicates 
	(cat ?x)
	(bomb ?x)
	(contains ?x ?y)
	(package ?x)
	(disarmed ?x)
	(object ?x)
)

(:action dunk
  :parameters (?x ?y)
  :precondition (and (mko (package ?x)))
  :effect (when (mko (and (contains ?x ?y) (bomb ?y)))
                  (and (disarmed ?x)))
            )

(:action let_the_cats_out
  :parameters (?x ?y)
  :precondition (mko (package ?x))
  :effect (when (mko (contains ?x ?y))
                  (and (not (contains ?x ?y)) (cat ?y)))
            )

)

