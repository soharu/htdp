#lang racket

;; Contract: convert3 : number number number -> number

;; Example: (convert3 1 2 3) should produce 321

;; Definition:
(define (convert3 a b c)
  (+ (* c 100) (* b 10) a))

;; Tests:
(convert3 1 2 3)

