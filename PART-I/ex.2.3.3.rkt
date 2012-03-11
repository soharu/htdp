#lang racket

;;
;; total-profit
;;

;; Contract: number -> number

;; Example:
;; (total-profit 100) => 430.0

;; Definition:
(define (total-profit attendees)
; (- (* (- 5 .50) attendees)
;    20))
; or
  (- (* 5 attendees)
     (+ 20 (* .50 attendees))))

;; Tests:
(equal? 430.0 (total-profit 100))

