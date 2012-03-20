#lang racket

(require lang/htdp-beginner)
(require htdp/testing)

(define (add n x)
  (cond
    [(zero? x) n]
    [else (add (add1 n) (sub1 x))]))

(check-expect (add 3 0) 3)
(check-expect (add 0 2) 2)
(check-expect (add 3 2) 5)

(test)

