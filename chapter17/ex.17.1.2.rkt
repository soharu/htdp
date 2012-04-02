#lang racket

(require lang/htdp-beginner-abbr)
(require htdp/testing)

;; cross-sym-nums : symbol list-of-numbers -> list of (symbol number)
(define (cross-sym-nums s alon)
  (cond
    [(empty? alon) empty]
    [else
      (cons (list s (first alon)) (cross-sym-nums s (rest alon)))]))

(check-expect (cross-sym-nums 'a '(1 2))
              '((a 1) (a 2)))

;; cross : list-of-symbols list-of-numbers -> list of (symbol number)
(define (cross alos alon)
  (cond
    [(empty? alos) empty]
    [else
      (append (cross-sym-nums (first alos) alon)
              (cross (rest alos) alon))]))

(check-expect (cross '(a b c) '(1 2))
              '((a 1) (a 2) (b 1) (b 2) (c 1) (c 2)))

(check-expect (cross '(a b) '(1 2 3))
              '((a 1) (a 2) (a 3) (b 1) (b 2) (b 3))) 

(test)

