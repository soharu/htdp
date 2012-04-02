#lang racket

(require lang/htdp-beginner-abbr)
(require htdp/testing)

;; replace-eol-with : list-of-numbers list-of-numbers -> list-of-numbers
;; to construct a new list by replacing empty in alon1 with alon2
(define (replace-eol-with alon1 alon2)
  (cond
    ((empty? alon1) alon2)
    (else (cons (first alon1) (replace-eol-with (rest alon1) alon2)))))

;; exercise 17.1.1
;; ---------------
;; our-append
(define (our-append alon1 alon2 alon3)
  (replace-eol-with alon1 (replace-eol-with alon2 alon3)))

;; test
(check-expect (our-append (list 'a) (list 'b 'c) (list 'd 'e 'f))
              '(a b c d e f))

(check-expect (our-append (list 1 2) (list 3) (list 4 5 6 7))
              (list 1 2 3 4 5 6 7))

(test)

