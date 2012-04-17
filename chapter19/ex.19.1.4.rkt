#lang racket

(require lang/htdp-intermediate)
(require htdp/testing)

(define (filter1 rel-op alon t)
  (cond
    [(empty? alon) empty]
    [else (cond
            [(rel-op (first alon) t) 
             (cons (first alon)
                   (filter1 rel-op (rest alon) t))]
            [else
              (filter1 rel-op (rest alon) t)])]))

;; below1 : lon number  ->  lon
(define (below1 alon t)
    (filter1 < alon t))

;; above1 : lon number  ->  lon
(define (above1 alon t) 
    (filter1 > alon t))

;; below : lon number -> lon
(define (below alon t)
  (local
    ((define (<t? n) (< n t)))
    (filter <t? alon)))

;; above : lon number -> lon
(define (above alon t)
  (local
    ((define (>t? n) (> n t)))
    (filter >t? alon)))
  
;; Test :
(check-expect
  (below1 '(1 2 3 4 5 6 7 8 9 10) 5)
  (below '(1 2 3 4 5 6 7 8 9 10) 5))

(check-expect
  (below '(1 2 3 4 5 6 7 8 9 10) 5)
  '(1 2 3 4))

(check-expect
  (above1 '(1 2 3 4 5 6 7 8 9 10) 5)
  (above '(1 2 3 4 5 6 7 8 9 10) 5))

(check-expect
  (above '(1 2 3 4 5 6 7 8 9 10) 5)
  '(6 7 8 9 10))

(test)

