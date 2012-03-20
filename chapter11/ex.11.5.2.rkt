#lang racket

(require lang/htdp-beginner)
(require htdp/testing)

(define (add n x)
  (cond
    [(zero? x) n]
    [else (add (add1 n) (sub1 x))]))

;; multiply-by-pi: N -> number
(define (multiply-by-pi n)
  (cond
    [(zero? n) 0]
    [else (+ 3.14 (multiply-by-pi (sub1 n)))]))

;; multiply: N N -> N
(define (multiply n x)
  (cond
    [(zero? x) 0]
    [else (add n (multiply n (sub1 x)))]))

;; Test:
(check-expect (multiply 0 3) 0)
(check-expect (multiply 3 0) 0)
(check-expect (multiply 2 3) 6)

(define delta 0.00000001)
(check-within (multiply-by-pi 0) 0 delta)
(check-within (multiply-by-pi 2) 6.28 delta)
(check-within (multiply-by-pi 3) 9.42 delta)

(test)

