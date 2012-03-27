#lang racket

(require lang/htdp-beginner)
(require htdp/testing)

;; parent
(define-struct parent (children name date eyes))

;; list-of-children
;; 1. empty
;; 2. (cons p loc)
;;      p   - parent
;;      loc - a list of children 

;; Sample Data
;; -----------
;; Youngest Generation:
(define Gustav (make-parent empty 'Gustav 1988 'brown))

(define Fred&Eva (list Gustav))

;; Middle Generation:
(define Adam (make-parent empty 'Adam 1950 'yellow))
(define Dave (make-parent empty 'Dave 1955 'black))
(define Eva (make-parent Fred&Eva 'Eva 1965 'blue))
(define Fred (make-parent Fred&Eva 'Fred 1966 'pink))

(define Carl&Bettina (list Adam Dave Eva))

;; Oldest Generation:
(define Carl (make-parent Carl&Bettina 'Carl 1926 'green))
(define Bettina (make-parent Carl&Bettina 'Bettina 1926 'green))

;; blue-eyed-descendant? : parent  ->  boolean
;; to determine whether a-parent any of the descendants (children, 
;; grandchildren, and so on) have 'blue in the eyes field
(define (blue-eyed-descendant? a-parent)
  (or (symbol=? (parent-eyes a-parent) 'blue)
      (blue-eyed-children? (parent-children a-parent))))

;; blue-eyed-children? : list-of-children  ->  boolean
;; to determine whether any of the structures in aloc is blue-eyed
;; or has any blue-eyed descendant
(define (blue-eyed-children? aloc)
  (cond
    [(empty? aloc) false]
    [else (or (blue-eyed-descendant? (first aloc))
              (blue-eyed-children? (rest aloc)))]))


(check-expect (blue-eyed-descendant? Gustav) false)
(check-expect (blue-eyed-descendant? Eva) true)
(check-expect (blue-eyed-descendant? Bettina) true)

;; exercise 15.1.3
;; ---------------
;; count-descendants : parent -> number
(define (count-descendants a-parent)
  (+ 1 (count-children (parent-children a-parent))))

;; count-children : loc -> number
(define (count-children aloc)
  (cond
    [(empty? aloc) 0]
    [else
      (+ (count-descendants (first aloc))
         (count-children (rest aloc)))]))

(check-expect (count-descendants Gustav) 1)
(check-expect (count-descendants Carl) 5)
(check-expect (count-descendants Bettina) 5)
(check-expect (count-descendants Eva) 2)
(check-expect (count-descendants Dave) 1)

;; count-proper-descendants : parent -> number
(define (count-proper-descendants a-parent)
  (count-children (parent-children a-parent)))

(check-expect (count-proper-descendants Gustav) 0)
(check-expect (count-proper-descendants Carl) 4)
(check-expect (count-proper-descendants Bettina) 4)
(check-expect (count-proper-descendants Eva) 1)
(check-expect (count-proper-descendants Dave) 0)

(test)

