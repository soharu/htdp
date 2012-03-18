#lang racket

(require htdp/testing)

;; Data Analysis & Definitions:
(define-struct mail (from date message))
;; A mail-message is a structure: (make-mail name n s) where name is a string,
;; n is a number, and s is a string

;; insert-by-date : mail a-list-of-mail (sorted) -> a-list-of-mail (sorted)
(define (insert-by-date mail a-list-of-mail)
  (cond
    [(empty? a-list-of-mail) (cons mail empty)]
    [else (cond
            [(< (mail-date mail) (mail-date (first a-list-of-mail)))
             (cons mail a-list-of-mail)]
            [else (cons (first a-list-of-mail)
                        (insert-by-date mail (rest a-list-of-mail)))])]))

;; sort-by-date : a-list-of-mail -> a-list-of-mail (sorted)
;; to sort mail message by date
(define (sort-by-date a-list-of-mail)
  (cond
    [(empty? a-list-of-mail) empty]
    [(cons? a-list-of-mail)
     (insert-by-date (first a-list-of-mail)
                     (sort-by-date (rest a-list-of-mail)))]))

;; insert-by-name : mail a-list-of-mail (sorted) -> a-list-of-mail (sorted)
(define (insert-by-name mail a-list-of-mail)
  (cond
    [(empty? a-list-of-mail) (cons mail empty)]
    [else (cond
            [(string<? (mail-from mail) (mail-from (first a-list-of-mail)))
             (cons mail a-list-of-mail)]
            [else (cons (first a-list-of-mail)
                        (insert-by-name mail (rest a-list-of-mail)))])]))

;; sort-by-name : a-list-of-mail -> a-list-of-mail (sorted)
;; to sort mail messages by name
(define (sort-by-name a-list-of-mail)
  (cond
    [(empty? a-list-of-mail) empty]
    [(cons? a-list-of-mail)
     (insert-by-name (first a-list-of-mail)
                     (sort-by-name (rest a-list-of-mail)))]))

;; Tests:
(define mail-1 (make-mail "john" 20120101 "hello"))
(define mail-2 (make-mail "alice" 20120115 "thank you"))
(define mail-3 (make-mail "sam" 20110115 "how are you?"))
(define mail-4 (make-mail "grace" 20120315 "help me"))
(define mail-5 (make-mail "robert" 20120219 "htdp"))

(check-expect (sort-by-date empty) empty)
(check-expect (sort-by-date (cons mail-1 empty))
              (cons mail-1 empty))
(check-expect (sort-by-date (cons mail-2 (cons mail-1 empty)))
              (cons mail-1 (cons mail-2 empty)))
(check-expect (sort-by-date (list mail-1 mail-2 mail-3 mail-4 mail-5))
              (list mail-3 mail-1 mail-2 mail-5 mail-4))

(check-expect (sort-by-name empty) empty)
(check-expect (sort-by-name (cons mail-1 empty))
              (cons mail-1 empty))
(check-expect (sort-by-name (cons mail-1 (cons mail-2 empty)))
              (cons mail-2 (cons mail-1 empty)))
(check-expect (sort-by-name (list mail-1 mail-2 mail-3 mail-4 mail-5))
              (list mail-2 mail-4 mail-1 mail-5 mail-3))

(test)

