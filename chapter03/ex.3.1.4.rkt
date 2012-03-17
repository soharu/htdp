#lang racket

(require lang/htdp-beginner)
(require htdp/testing)

;; profit : number  ->  number
;; to compute the profit as the difference between revenue and costs
;; at some given ticket-price
(define (profit ticket-price)
  (- (revenue ticket-price)
     (cost ticket-price)))

;; revenue : number  ->  number
;; to compute the revenue, given ticket-price 
(define (revenue ticket-price)
  (* ticket-price
     (attendees ticket-price)))

;; cost : number  ->  number
;; to compute the costs, given ticket-price
(define (cost ticket-price)
  (* 1.50 (attendees ticket-price)))

;; attendees : number  ->  number
;; to compute the number of attendees, given ticket-price
(define (attendees ticket-price)
  (+ 120
     (* (/ 15 .10) (- 5.0 ticket-price))))

;; Test
(define delta 0.000000001)

(check-within (cost 5.0) 180.0 delta)
(check-within (cost 4.0) 405.0 delta)
(check-within (cost 3.0) 630.0  delta)

(check-within (profit 5.0) 420.0 delta)
(check-within (profit 4.0) 675.0 delta) ; max profit
(check-within (profit 3.0) 630.0 delta)

(test)

