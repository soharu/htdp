#lang racket

(require lang/htdp-advanced)
(require htdp/testing)

(define (product alon0)
  (local ((define (product-a alon accumulator)
            (cond
              [(empty? alon) accumulator]
              [else
                (product-a (rest alon)
                           (* (first alon) accumulator))])))
         (product-a alon0 1)))

(check-expect 1 (product empty))
(check-expect 100 (product '(100)))
(check-expect 6 (product '(1 2 3)))
(check-expect 945 (product '(1 3 5 7 9)))
(check-expect 0 (product '(1 3 5 7 0)))

(test)

