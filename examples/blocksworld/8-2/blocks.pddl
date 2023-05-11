(define (domain blocks)
  (:requirements :strips :equality :disjunctive-preconditions :derived-predicates :negative-preconditions :conditional-effects :existential-preconditions :typing)

  (:types
    robot block - object
  )

  (:predicates 
    (on ?block1 - block ?block2 - block)
    (ontable ?block - block)
    (clear ?block - block)
    (KBquery_fullHands ?robot - robot)
    (holding ?robot - robot ?block - block)
  )

  (:action pick-up
    :parameters (?robot - robot ?block - block)
    :precondition (and 
      (clear ?block) 
      (ontable ?block) 
      (not (KBquery_fullHands ?robot))
    )
    :effect
      (and 
        (not (ontable ?block))
        (not (clear ?block))
        (holding ?robot ?block)
      )
  )

  (:action put-down
    :parameters (?robot - robot ?block - block)
    :precondition (holding ?robot ?block)
    :effect
      (and 
        (not (holding ?robot ?block))
        (clear ?block)
        (ontable ?block)
      )
  )

  (:action stack
    :parameters (?robot - robot ?block1 - block ?block2 - block)
    :precondition (and 
      (holding ?robot ?block1) 
      (clear ?block2)
      )
    :effect
      (and 
        (not (holding ?robot ?block1))
        (not (clear ?block2))
        (clear ?block1)
        (on ?block1 ?block2)
      )
  )

  (:action unstack
    :parameters (?robot - robot ?block1 - block ?block2 - block)
    :precondition (and 
      (on ?block1 ?block2) 
      (clear ?block1) 
      (not (KBquery_fullHands ?robot))
    )
    :effect
      (and 
        (holding ?robot ?block1)
        (clear ?block2)
        (not (clear ?block1))
        (not (on ?block2 ?block1))
      )
  )
)