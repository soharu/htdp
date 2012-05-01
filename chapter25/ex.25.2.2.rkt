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
                  (list (first alon)) 
                  (quick-sort (larger-items alon (first alon))))]))

;; larger-items : (listof number) number  ->  (listof number)
;; to create a list with all those numbers on alon  
;; that are larger than threshold
(define (larger-items alon threshold)
  (cond
    [(empty? alon) empty]
    [else (if (> (first alon) threshold) 
            (cons (first alon) (larger-items (rest alon) threshold))
            (larger-items (rest alon) threshold))]))

;; smaller-items : (listof number) number  ->  (listof number)
;; to create a list with all those numbers on alon  
;; that are smaller than threshold
(define (smaller-items alon threshold)
  (cond
    [(empty? alon) empty]
    [else (if (< (first alon) threshold) 
            (cons (first alon) (smaller-items (rest alon) threshold))
            (smaller-items (rest alon) threshold))]))

;; Hand-evaluation of modified quick-sort
;; ======================================
;;   (quick-sort '(11 8 14 7)
;; = (append (quick-sort (list 8 7))
;;           (list 11)
;;           (quick-sort (list 14)))
;; = (append (append (quick-sort (list 7))
;;                   (list 8)
;;                   (quick-sort empty))
;;           (list 11)
;;           (quick-sort (list 14)))
;; = (append (append (list 7)
;;                   (list 8)
;;                   empty)
;;           (list 11)
;;           (quick-sort (list 14)))
;; = (append (list 7 8)
;;           (list 11)
;;           (quick-sort (list 14)))
;; = (append (list 7 8)
;;           (list 11)
;;           (list 14))
;; = (list 7 8 11 14)

(check-expect (quick-sort '(11 8 14 7))
              '(7 8 11 14))

(test)

