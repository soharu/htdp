#lang racket

;; phone-record
(define-struct pr (name phone-numbers))

;; phone-directory
;; 1. empty
;; 2. (cons pr pd)

;; whose-number
;;
;; Contract: phone-numbers pd -> name
;;
;; Definition:
(define (whose-number phone-numbers pd)
  (cond
    [(empty? pd) 'None]
    [(equal? phone-numbers (pr-phone-numbers (first pd))) (pr-name (first pd))]
    [else (whose-number phone-numbers (rest pd))]))

;; Test:
(whose-number "45678"
              (cons (make-pr "master" "12345678")
                    (cons (make-pr "tuestudy" "45678") empty)))

(whose-number "945678"
              (cons (make-pr "master" "12345678")
                    (cons (make-pr "tuestudy" "45678") empty)))



