#lang racket

(require lang/htdp-advanced)

(define (ff-make-posn x y)
  (lambda (select) (select x y)))

(define (ff-posn-x a-ff-posn)
  (a-ff-posn (lambda (x y) x)))

(define (ff-posn-y a-ff-posn)
  (a-ff-posn (lambda (x y) y)))


(define V1 10)
(define V2 2)

(ff-posn-x (ff-make-posn V1 V2))
;;   (ff-posn-x (ff-make-posn 10 2))
;; = (ff-posn-x (lambda (select) (select 10 2)))
;; = ((lambda (select) (select 10 2)) (lambda (x y) x))
;; = ((lambda (x y) x) 10 2)
;; = 10

