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

;; find-route : node node graph  ->  (listof node) or false
;; to create a path from origination to destination in G
;; if there is no path, the function produces false
(define (find-route origination destination G)
  (cond
    [(symbol=? origination destination) (list destination)]
    [else (local ((define possible-route 
                    (find-route/list (neighbors origination G) destination G)))
                 (cond
                   [(boolean? possible-route) false]
                   [else (cons origination possible-route)]))]))

;; find-route/list : (listof node) node graph  ->  (listof node) or false
;; to create a path from some node on lo-Os to D
;; if there is no path, the function produces false
(define (find-route/list lo-Os D G)
  (cond
    [(empty? lo-Os) false]
    [else (local ((define possible-route (find-route (first lo-Os) D G)))
                 (cond
                   [(boolean? possible-route) (find-route/list (rest lo-Os) D G)]
                   [else possible-route]))]))

;; find-all-route-from : node (listof node) graph -> (listof ??)
(define (find-all-route-from origination destinations G)
  (cond
    [(empty? destinations) empty]
    [(symbol=? origination (first destinations))
     (find-all-route-from origination (rest destinations) G)]
    [else
      (local ((define destination (first destinations)))
             (cons (list origination destination (find-route origination destination G))
                   (find-all-route-from origination (rest destinations) G)))]))

;; test-on-all-nodes : graph -> listof ((node node (listof node)) or (node node false))
(define (test-on-all-nodes/list lo-Os lo-Ds G)
  (cond 
    [(empty? lo-Os) empty]
    [else
      (append (find-all-route-from (first lo-Os) lo-Ds G)
              (test-on-all-nodes/list (rest lo-Os) lo-Ds G))]))

(define (test-on-all-nodes G)
  (local ((define nodes (map first G)))
         (test-on-all-nodes/list nodes nodes G)))

(define Graph 
  '((A (B E))
    (B (E F))
    (C (D))
    (D ())
    (E (C F))
    (F (D G))
    (G ())))

(check-expect (find-all-route-from 'C '(D G) Graph)
              (list (list 'C 'D '(C D))
                    (list 'C 'G false)))

(check-expect (find-all-route-from 'A '(B C D E F G) Graph)
              (list (list 'A 'B '(A B))
                    (list 'A 'C '(A B E C))
                    (list 'A 'D '(A B E C D))
                    (list 'A 'E '(A B E))
                    (list 'A 'F '(A B E F))
                    (list 'A 'G '(A B E F G))))

(define Simple-Graph
  '((A (B C))
    (B (C))
    (C ())))

(check-expect (test-on-all-nodes Simple-Graph)
              (list (list 'A 'B '(A B))
                    (list 'A 'C '(A B C))
                    (list 'B 'A false)
                    (list 'B 'C '(B C))
                    (list 'C 'A false)
                    (list 'C 'B false)))

(check-expect (test-on-all-nodes Graph)
              (list
                ;; A -> ??
                (list 'A 'B '(A B))
                (list 'A 'C '(A B E C))
                (list 'A 'D '(A B E C D))
                (list 'A 'E '(A B E))
                (list 'A 'F '(A B E F))
                (list 'A 'G '(A B E F G))
                ;; B -> ??
                (list 'B 'A false)
                (list 'B 'C '(B E C))
                (list 'B 'D '(B E C D))
                (list 'B 'E '(B E))
                (list 'B 'F '(B E F))
                (list 'B 'G '(B E F G))
                ;; C -> ??
                (list 'C 'A false)
                (list 'C 'B false)
                (list 'C 'D '(C D))
                (list 'C 'E false)
                (list 'C 'F false)
                (list 'C 'G false)
                ;; D -> ??
                (list 'D 'A false)
                (list 'D 'B false)
                (list 'D 'C false)
                (list 'D 'E false)
                (list 'D 'F false)
                (list 'D 'G false)
                ;; E -> ??
                (list 'E 'A false)
                (list 'E 'B false)
                (list 'E 'C '(E C))
                (list 'E 'D '(E C D))
                (list 'E 'F '(E F))
                (list 'E 'G '(E F G))
                ;; F -> ??
                (list 'F 'A false)
                (list 'F 'B false)
                (list 'F 'C false)
                (list 'F 'D '(F D))
                (list 'F 'E false)
                (list 'F 'G '(F G))
                ;; G -> ??
                (list 'G 'A false)
                (list 'G 'B false)
                (list 'G 'C false)
                (list 'G 'D false)
                (list 'G 'E false)
                (list 'G 'F false)))

(test)

