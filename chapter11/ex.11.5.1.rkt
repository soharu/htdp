#lang racket

(require lang/htdp-beginner)
(require htdp/testing)

(define (add n x)
  (cond
    [(= x 0) n]
    [else (add (add1 n) (sub1 x))]))

(check-expect 3 (add 3 0))
(check-expect 2 (add 0 2))
(check-expect 5 (add 3 2))

(test)

