#lang racket

(require lang/htdp-beginner)
(require htdp/testing)

;; node
(define-struct node (ssn name left right))

;; binary-tree (BT)
;; 1. false
;; 2. (make-node soc pn lft rgt)
;;      soc - number
;;      pn  - symbol
;;      lft - BT 
;;      rgt - BT

(define tree-A
  (make-node
    63 'a
    (make-node 29 'b
               (make-node 15 'e
                          (make-node 10 'f false false)
                          (make-node 24 'g false false))
               false)
    (make-node 89 'c
               (make-node 77 'h false false)
               (make-node 95 'i
                          false
                          (make-node 99 'j false false)))))

(define tree-B
  (make-node
    63 'a
    (make-node 29 'b
               (make-node 15 'e
                          (make-node 87 'f false false)
                          (make-node 24 'g false false))
               false)
    (make-node 89 'c
               (make-node 33 'h false false)
               (make-node 95 'i
                          false
                          (make-node 99 'j false false)))))


;; exercise 14.2.1
;; ---------------
;; contains-bt : number BT -> boolean
(define (contains-bt n a-btree)
  (cond
    [(false? a-btree) false]
    [(= n (node-ssn a-btree)) true]
    [else (or (contains-bt n (node-left a-btree))
              (contains-bt n (node-right a-btree)))]))

(check-expect (contains-bt 33 false) false)
(check-expect (contains-bt 63 tree-A) true)
(check-expect (contains-bt 99 tree-A) true)
(check-expect (contains-bt 100 tree-B) false)

(test)

