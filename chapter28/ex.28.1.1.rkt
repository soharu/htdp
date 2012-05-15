#lang racket

(require lang/htdp-intermediate-lambda)

(define Graph 
  '((A (B E))
    (B (E F))
    (C (D))
    (D ())
    (E (C F))
    (F (D G))
    (G ())))

;; => (list (list 'A (list 'B 'E))
;;          (list 'B (list 'E 'F))
;;          (list 'C (list 'D))
;;          (list 'D empty)
;;          (list 'E (list 'C 'F))
;;          (list 'F (list 'D 'G))
;;          (list 'G empty))

;; node  - symbol
;; graph - listof (node (listof node))

Graph

