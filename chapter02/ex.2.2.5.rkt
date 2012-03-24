#lang racket

(require lang/htdp-beginner)
(require htdp/testing)

(define (f n)
  (+ (/ n 3) 2))

(check-expect (f 2) 8/3)
(check-expect (f 5) 11/3)
(check-expect (f 9) 15/3)

(define (f1 n)
  (+ (sqr n) 10))

(check-expect (f1 2) 14)
(check-expect (f1 5) 35)
(check-expect (f1 9) 91)

(define (f2 n)
  (+ (* (/ 1 2) (sqr n))
     20))

(check-expect (f2 2) 22)
(check-expect (f2 5) 65/2)
(check-expect (f2 9) 121/2)

(define (f3 n)
  (- 2 (/ 1 n)))

(check-expect (f3 2) 3/2)
(check-expect (f3 5) 9/5)
(check-expect (f3 9) 17/9)

(test)

