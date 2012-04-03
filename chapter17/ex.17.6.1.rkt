#lang racket

(require lang/htdp-beginner-abbr)
(require htdp/testing)

;; merge: list-of-numbers(sorted) list-of-number(sorted)
;;          -> list-of-numbers (sorted) 
(define (merge alon1 alon2)
  (cond
    [(empty? alon1) alon2]
    [(empty? alon2) alon1]
    [(< (first alon1) (first alon2))
     (cons (first alon1) (merge (rest alon1) alon2))]
    [else
      (cons (first alon2) (merge alon1 (rest alon2)))]))

;; Tests
(check-expect
  (merge (list 1 3 5 7 9) (list 0 2 4 6 8))
  (list 0 1 2 3 4 5 6 7 8 9))
(check-expect
  (merge (list 1 8 8 11 12) (list 2 3 4 8 13 14))
  (list 1 2 3 4 8 8 8 11 12 13 14))

(check-expect
  (merge (list 1 8 8 11 12) (list 2 3 4 8))
  (list 1 2 3 4 8 8 8 11 12))

(test)

