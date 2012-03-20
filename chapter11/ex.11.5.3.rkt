#lang racket

(require lang/htdp-beginner)
(require htdp/testing)

(define (add n x)
  (cond
    [(zero? x) n]
    [else (add (add1 n) (sub1 x))]))

(define (multiply n x)
  (cond
    [(zero? x) 0]
    [else (add n (multiply n (sub1 x)))]))

(define (exponent x n)
  (cond
    [(zero? n) 1]
    [else (multiply x (exponent x (sub1 n)))]))

(check-expect (exponent 0 1) 0)
(check-expect (exponent 3 0) 1)
(check-expect (exponent 3 2) 9)
(check-expect (exponent 2 10) 1024)

(test)

