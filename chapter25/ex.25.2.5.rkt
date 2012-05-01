#lang racket

(require lang/htdp-intermediate-lambda)
(require htdp/testing)

;; quick-sort : (listof number)  ->  (listof number)
;; to create a list of numbers with the same numbers as
;; alon sorted in ascending order
;; assume that the numbers are all distinct 
(define (quick-sort alon)
  (cond
    [(empty? alon) empty]
    [(empty? (rest alon)) alon]
    [else (append (quick-sort (smaller-items alon (first alon))) 
                  (same-items alon (first alon))
                  (quick-sort (larger-items alon (first alon))))]))

;; larger-items : (listof number) number  ->  (listof number)
;; to create a list with all those numbers on alon  
;; that are larger than threshold
(define (larger-items alon threshold)
  (filter (lambda (x) (> x threshold)) alon))

;; smaller-items : (listof number) number  ->  (listof number)
;; to create a list with all those numbers on alon  
;; that are smaller than threshold
(define (smaller-items alon threshold)
  (filter (lambda (x) (< x threshold)) alon))

;; same-items : (listof number) number -> (listof number)
(define (same-items alon threshold)
  (filter (lambda (x) (= x threshold)) alon))

;; Tests
(check-expect (larger-items '(11 8 14 7 11 8) 11)
              '(14))

(check-expect (smaller-items '(11 8 14 7 11 8) 11)
              '(8 7 8))

(check-expect (same-items '(11 8 14 7 11 8) 11)
              '(11 11))

(check-expect (quick-sort '(11 8 14 7 11 8))
              '(7 8 8 11 11 14))

(test)

