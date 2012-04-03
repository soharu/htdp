#lang racket

(require lang/htdp-beginner-abbr)
(require htdp/testing)

;; contains-same-numbers : list-of-numbers list-of-numbers -> boolean
(define (contains-same-numbers alon1 alon2)
  (cond
    [(empty? alon1) true]
    [else
      (and (member (first alon1) alon2)
           (contains-same-numbers (rest alon1) alon2))]))

(check-expect
  (contains-same-numbers (list 1 2 3) (list 3 2 1))
  true)

(check-expect
  (contains-same-numbers (list 1 2 3) (list 3 2 2 1))
  true)

(check-expect
  (contains-same-numbers (list 1 2 3 4) (list 3 2 2 1))
  false)


(test)

