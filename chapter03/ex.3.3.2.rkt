#lang racket

(require lang/htdp-beginner)
(require htdp/testing)

(define PI 3.14159)

(define (area-disk radius)
  (* PI (* radius radius)))

(define (volume-cylinder radius height)
  (* (area-disk radius) height))

;; Test
(define delta 0.00000001)
(check-within (volume-cylinder 5 10) 785.3975 delta)
(test)

