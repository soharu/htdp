#lang racket

(define (wage h)
  (* 12 h))

;;
;; tax
;;

;; Contract: tax : number number -> number

;; Purpose: calculate tax of total income

;; Example:
;; (tax 1000 0.15) => 150.0

;; Definition:
(define (tax income tax-rate)
  (* income tax-rate))

;; Tests:
(equal? 150.0 (tax 1000 0.15))

;;
;; netpay
;;

;; Contract: netpay : number number -> number

;; Purpose: calculate net pay of working hours

;; Example:
;; (netpay 10 0.15) => 102.0

;; Definition:
(define (netpay hours tax-rate)
; (- (wage hours)
;    (tax (wage hours) tax-rate)))
; or
  (* (wage hours)
     (- 1 tax-rate)))

;; Tests:
(equal? 102.0 (netpay 10 0.15))

