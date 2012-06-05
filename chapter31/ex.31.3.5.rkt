#lang racket

(require lang/htdp-advanced)
(require htdp/testing)

(define (add-to-pi n0)
  (local ((define (add-to-pi-a n accumulator)
            (cond
              [(zero? n) accumulator]
              [else
                (add-to-pi-a (sub1 n) (add1 accumulator))])))
         (add-to-pi-a n0 pi)))

;; Test
(define DELTA 0.0000001)
(check-within (add-to-pi 0) pi DELTA)
(check-within (add-to-pi 5) (+ 5 pi) DELTA)
(check-within (add-to-pi 100) (+ 100 pi) DELTA)

(test)

