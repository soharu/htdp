#lang racket

(require lang/htdp-intermediate-lambda)
(require htdp/testing)

;; contains? : symbol los  ->  boolean
;; to determine whether alos contains the symbol s
(define (contains? s alos)
  (cond
    [(empty? alos) false]
    [(symbol=? (first alos) s) true]
    [else 
      (contains? s (rest alos))]))

;; neighbors : symbol graph -> (listof node)
(define (neighbors s g)
  (cond
    [(empty? g) empty]
    [(symbol=? s (caar g)) (cadar g)]
    [else
      (neighbors s (rest g))]))

;; find-route : node node graph  ->  (listof node) or false
;; to create a path from origination to destination in G
;; if there is no path, the function produces false
(define (find-route origination destination G)
  (local ((define (find-route-acc orig acc-seen)
            (cond
              [(symbol=? orig destination) (list destination)]
              [else (local ((define possible-route 
                              (find-route/list (neighbors orig G) (cons orig acc-seen))))
                           (cond
                             [(boolean? possible-route) false]
                             [else (cons orig possible-route)]))]))
          (define (find-route/list lo-Os acc-seen)
            (cond
              [(empty? lo-Os) false]
              [(contains? (first lo-Os) acc-seen) false]
              [else (local ((define possible-route (find-route-acc (first lo-Os) acc-seen)))
                           (cond
                             [(boolean? possible-route)
                              (find-route/list (rest lo-Os) acc-seen)]
                             [else possible-route]))])))
         (find-route-acc origination empty)))

(define Cyclic-graph 
  '((A (B E))
    (B (E F))
    (C (B D))
    (D ())
    (E (C F))
    (F (D G))
    (G ())))

(check-expect (find-route 'B 'D Cyclic-graph) (list 'B 'E 'F 'D))
(check-expect (find-route 'C 'C Cyclic-graph) (list 'C))
(check-expect (find-route 'C 'D Cyclic-graph) (list 'C 'B 'F 'D))
(check-expect (find-route 'E 'D Cyclic-graph) (list 'E 'C 'D))
(check-expect (find-route 'D 'G Cyclic-graph) false)

(test)

