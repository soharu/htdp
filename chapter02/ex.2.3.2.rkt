#lang racket

;;
;; sum-coins
;;

;; Contract: sum-coins : number number number number -> number

;; Purpose:
;; Calculate the amount of money in the bag

;; Example:
;; (sum-coins 1 2 1 1) => 0.46
;; (sum-coins 1 2 1 4) => 1.21

;; Definition:
(define (sum-coins n-penny n-nickle n-dime n-quarter)
  (/ (+ (* 1 n-penny)
        (* 5 n-nickle)
        (* 10 n-dime)
        (* 25 n-quarter))
     100.0))

;; Test:
(equal? 0.46 (sum-coins 1 2 1 1))
(equal? 1.21 (sum-coins 1 2 1 4))

