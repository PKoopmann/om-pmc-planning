(define (problem BLOCKS-7-1)
(:domain BLOCKS)
(:objects B E A C D F G - block pr2 - robot)
(:INIT (CLEAR A) (CLEAR C) (ONTABLE G) (ONTABLE F) (ON A G) (ON C D) (ON D B)
 (ON B E) (ON E F))
(:goal (AND (ON A E) (ON E B) (ON B F) (ON F G) (ON G C) (ON C D)))
)
