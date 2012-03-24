#lang racket

(require lang/htdp-beginner)
(require htdp/testing)

(define performance-cost 180.0)
(define each-attendee-cost .04)
(define default-attendees 120)
(define default-ticket-price 5.0)
(define attendees-increment-per-dime 15)
(define dime .10)

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
  (+ performance-cost
     (* each-attendee-cost (attendees ticket-price))))

;; attendees : number  ->  number
;; to compute the number of attendees, given ticket-price
(define (attendees ticket-price)
  (+ default-attendees
     (* (/ attendees-increment-per-dime dime)
        (- default-ticket-price ticket-price))))

;; Test
(define delta 0.000000001)

;; exercise 3.1.1
(check-within (attendees 5.0) 120 delta)
(check-within (attendees 4.0) 270 delta)
(check-within (attendees 3.0) 420 delta)

;; exercise 3.1.2
(check-within (cost 5.0) 184.8 delta)
(check-within (cost 4.0) 190.8 delta)
(check-within (cost 3.0) 196.8 delta)

(check-within (revenue 5.0) 600.0 delta)
(check-within (revenue 4.0) 1080.0 delta)
(check-within (revenue 3.0) 1260.0 delta)

;; exercise 3.1.3
(check-within (profit 5.0) 415.2 delta)
(check-within (profit 4.0) 889.2 delta)
(check-within (profit 3.0) 1063.2 delta) ; max profit

(test)
