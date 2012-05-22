#lang racket

(require lang/htdp-advanced)
(require htdp/testing)

;;
;; exercise 29.3.2
;;

;; neighbors : node graph  ->  (listof node)
;; to lookup the node in graph
(define (neighbors node graph)
  (vector-ref graph node))

;; find-route : node node graph  ->  (listof node) or false
;; to create a path from origination to destination in G
;; if there is no path, the function produces false
(define (find-route origination destination G)
  (cond
    [(= origination destination) (list destination)]
    [else (local ((define possible-route 
                    (find-route/vector (neighbors origination G) destination G)))
                 (cond
                   [(boolean? possible-route) false]
                   [else (cons origination possible-route)]))]))

;; find-route/list : (listof node) node graph  ->  (listof node) or false
;; to create a path from some node on lo-Os to D
;; if there is no path, the function produces false
(define (find-route/vector lo-Os D G)
  (cond
    [(empty? lo-Os) false]
    [else (local ((define possible-route (find-route (first lo-Os) D G)))
                 (cond
                   [(boolean? possible-route) (find-route/vector (rest lo-Os) D G)]
                   [else possible-route]))]))

;;
;;   A   B   C   D   E   F   G
;;  --- --- --- --- --- --- ---
;;   0   1   2   3   4   5   6
;;

(define Graph 
  '((A (B E))
    (B (E F))
    (C (D))
    (D ())
    (E (C F))
    (F (D G))
    (G ())))

(define Graph-as-vector
  (vector (list 1 4)
          (list 4 5)
          (list 3)
          empty
          (list 2 5)
          (list 3 6)
          empty))

(check-expect (find-route 2 3 Graph-as-vector) (list 2 3))
(check-expect (find-route 2 6 Graph-as-vector) false)
(check-expect (find-route 4 3 Graph-as-vector) (list 4 2 3))
(check-expect (find-route 0 4 Graph-as-vector) (list 0 1 4))

(time (find-route 0 4 Graph-as-vector))

;;
;; exercise 29.3.3
;; 

(define Graph-with-cycle
  '((A (B E))
    (B (E F))
    (C (B D))
    (D ())
    (E (C F))
    (F (D G))
    (G ())))

(define Graph-with-cycle-as-vetor
  (vector (list 1 4)
          (list 4 5)
          (list 1 3)
          empty
          (list 2 5)
          (list 3 6)
          empty))

(check-expect (find-route 1 2 Graph-with-cycle-as-vetor) (list 1 4 2))
;; (check-expect (find-route 1 3 Graph-with-cycle-as-vetor) (list 1 4 2 3))
;;   -- infinite loop by cycle

(test)

