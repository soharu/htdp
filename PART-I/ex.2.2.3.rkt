#lang racket

; triangle
;
; http://en.wikipedia.org/wiki/Triangle#Computing_the_area_of_a_triangle
;
;    T = (b * h) / 2
;
; T: the area T of a triangle
; b: the length of the base of the triangle
; h: the perpendicular height
;

(define (triangle b h)
  (/ (* b h) 2))

