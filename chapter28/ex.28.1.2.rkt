#lang racket

(require lang/htdp-intermediate-lambda)
(require htdp/testing)

;; neighbors : node graph -> (listof node)
(define (neighbors n g)
  (cond
    [(empty? g) empty]
    [(symbol=? n (caar g))
     (cadar g)]
    [else
      (neighbors n (rest g))]))

(define Graph 
  '((A (B E))
    (B (E F))
    (C (D))
    (D ())
    (E (C F))
    (F (D G))
    (G ())))

(check-expect (neighbors 'A Graph) '(B E))
(check-expect (neighbors 'C Graph) '(D))
(check-expect (neighbors 'G Graph) '())
(check-expect (neighbors 'X Graph) '())

(test)

