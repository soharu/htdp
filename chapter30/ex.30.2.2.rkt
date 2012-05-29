#lang racket

(require lang/htdp-advanced)
(require htdp/testing)

;; contains? : symbol los  ->  boolean
;; to determine whether alos contains the symbol s
(define (contains? s alos)
  (cond
    [(empty? alos) false]
    [else (cond
            [(symbol=? (first alos) s)
             true]
            [else 
              (contains? s (rest alos))])]))

;; neighbor : node simple-graph  ->  node
;; to determine the node that is connected to a-node in sg
(define (neighbor a-node sg)
  (cond
    [(empty? sg) (error "neighbor: impossible")]
    [else (cond
            [(symbol=? (first (first sg)) a-node)
             (second (first sg))]
            [else (neighbor a-node (rest sg))])]))

;; route-exists2? : node node simple-graph  ->  boolean
;; to determine whether there is a route from orig to dest in sg
(define (route-exists2? orig dest sg)
  (local ((define (re-accu? orig accu-seen)
            (cond
              [(symbol=? orig dest) true]
              [(contains? orig accu-seen) false]
              [else (re-accu? (neighbor orig sg) (cons orig accu-seen))]))) 
         (re-accu? orig empty)))

(define SimpleG 
  '((A B)
    (B C)
    (C E)
    (D E)
    (E B)
    (F F))) 

(check-expect (route-exists2? 'A 'C SimpleG)
              true)
(check-expect (route-exists2? 'C 'D SimpleG)
              false)

(test)

