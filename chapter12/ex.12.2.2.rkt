#lang racket

(require htdp/testing)

;; search-sorted : number list-of-numbers (sorted/ascending) -> boolean
(define (search-sorted n alon)
  (cond
    [(empty? alon) false]
    [(= n (first alon)) true]
    [(< n (first alon)) false]
    [else (search-sorted n (rest alon))]))

(check-expect (search-sorted 5 empty) false)
(check-expect (search-sorted 5 '(3 4)) false)
(check-expect (search-sorted 5 '(1 2 3 4 6 7)) false)
(check-expect (search-sorted 5 '(1 2 3 4 5 6 7)) true)

(test)

