#lang racket

(require lang/htdp-intermediate-lambda)
(require htdp/testing)

;; neighbors : node graph  ->  (listof node)
;; to lookup the node in graph
(define (neighbors node graph)
  (vector-ref graph node))

(define Graph-as-vector
  (vector (list 1 4)
          (list 4 5)
          (list 3)
          empty
          (list 2 5)
          (list 3 6)
          empty))

(check-expect (neighbors 0 Graph-as-vector) (list 1 4))
(check-expect (neighbors 1 Graph-as-vector) (list 4 5))
(check-expect (neighbors 3 Graph-as-vector) empty)

(test)

