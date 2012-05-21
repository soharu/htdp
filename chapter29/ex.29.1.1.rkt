#lang racket

(require lang/htdp-intermediate-lambda)
(require htdp/testing)

;; Data Definition: number-tree
;;   1. a number
;;   2. a pair of number-tree

;; sum-tree : a-number-tree -> number
;; to determine the sum of the numbers in a tree
(define (sum-tree n-tree)
  (cond
    [(number? n-tree) n-tree]
    [else (+ (sum-tree (first n-tree))
             (sum-tree (second n-tree)))]))

;; test
(check-expect (sum-tree 1) 1)
(check-expect (sum-tree (list 1 2)) 3)
(check-expect (sum-tree (list (list 1 2)
                              (list 3 (list 4 5))))
              15)

(test)

