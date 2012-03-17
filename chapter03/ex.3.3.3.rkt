#lang racket

(require lang/htdp-beginner)
(require htdp/testing)

(define PI 3.14159)

;; area-cylinder : number number -> number
;;
;; calculate the surface area of cylinder

;; Definition:
(define (area-cylinder radius height)
  (* 2 PI radius height))

;; Test:
(define delta 0.00000001)
(check-within (area-cylinder 5 10) 314.159 delta)
(test)

