#lang racket

(require lang/htdp-beginner)
(require htdp/testing)

;; family-tree-node (ftn)
;; 1. empty
;; 2. (make-child f m na da ec):
;;      f   - father    (ftn)
;;      m   - mother    (ftn)
;;      na  - name      (symbol)
;;      da  - date      (number)
;;      ec  - eye color (symbol)

;; Definition
(define-struct child (father mother name date eyes))

;; Sample family tree
;; ------------------
;; Oldest Generation:
(define Carl (make-child empty empty 'Carl 1926 'green))
(define Bettina (make-child empty empty 'Bettina 1926 'green))
;; Middle Generation:
(define Adam (make-child Carl Bettina 'Adam 1950 'yellow))
(define Dave (make-child Carl Bettina 'Dave 1955 'black))
(define Eva (make-child Carl Bettina 'Eva 1965 'blue))
(define Fred (make-child empty empty 'Fred 1966 'pink))
;; Youngest Generation: 
(define Gustav (make-child Fred Eva 'Gustav 1988 'brown))

;; Template:
;; fun-for-ftn : ftn -> ??
;; 
;; (define (fun-for-ftn a-ftree)
;;  (cond
;;      [(empty? a-ftree) ...]
;;      [else 
;;          ... (fun-for-ftn (child-father a-ftree))
;;          ... (fun-for-ftn (child-mother a-ftree))
;;          ... (child-name a-ftree) ...
;;          ... (child-date a-ftree) ...
;;          ... (child-eyes a-ftree) ...]))

;; blue-eyed-ancestor? : ftn -> boolean
;; to determine whether a-ftree contains a child
;; structure with 'blue in the eyes field
;;
;; version 1: using a nested cond-expression
;; -----------------------------------------
;; (define (blue-eyed-ancestor? a-ftree)
;;   (cond
;;     [(empty? a-ftree) false]
;;     [else (cond
;;             [(symbol=? (child-eyes a-ftree) 'blue) true]
;;             [(blue-eyed-ancestor? (child-father a-ftree)) true]
;;             [(blue-eyed-ancestor? (child-mother a-ftree)) true]
;;             [else false])]))
;;
;; version 2: using an or-expression
;; ---------------------------------
(define (blue-eyed-ancestor? a-ftree)
  (cond
    [(empty? a-ftree) false]
    [else (or (symbol=? (child-eyes a-ftree) 'blue)
              (or (blue-eyed-ancestor? (child-father a-ftree))
                  (blue-eyed-ancestor? (child-mother a-ftree))))]))

(check-expect (blue-eyed-ancestor? Carl) false)
(check-expect (blue-eyed-ancestor? Gustav) true)

;; exercise 14.1.1
;; ---------------
;; 1. empty
;;   (blue-eyed-ancestor? empty)
;; = (cond
;;      [(empty? empty) false]
;;      [else (or (symbol=? (child-eyes empty) 'blue)
;;                (or (blue-eyed-ancestor? (child-father empty))
;;                    (blue-eyed-ancestor? (child-mother empty))))])
;; = (cond
;;      [true false]
;;      [else (or (symbol=? (child-eyes empty) 'blue)
;;                (or (blue-eyed-ancestor? (child-father empty))
;;                    (blue-eyed-ancestor? (child-mother empty))))])
;; = false
;;
;; 2. Carl
;;   (blue-eyed-ancestor? Carl)
;; = (cond
;;      [(empty? (make-child empty empty 'Carl 1926 'green)) false]
;;      [else
;;         (or (symbol=? (child-eyes (make-child empty empty 'Carl 1926 'green))
;;             'blue)
;;             (or
;;               (blue-eyed-ancestor?
;;                 (child-father (make-child empty empty 'Carl 1926 'green)))
;;               (blue-eyed-ancestor?
;;                 (child-mother (make-child empty empty 'Carl 1926 'green)))))])
;; = (cond
;;      [false false]
;;      [else (or (symbol=? 'green 'blue)
;;                (or (blue-eyed-ancestor? empty)
;;                    (blue-eyed-ancestor? empty)))])
;; = (or false
;;       (or false
;;           false))
;; = false

;; exercise 14.1.2
(check-expect (blue-eyed-ancestor? empty) false)
;; Gustav
;;   (blue-eyed-ancestor? Gustav)
;; = (cond
;;      [(empty? (make-child Fred Eva 'Gustav 1988 'brown)) false]
;;      [else
;;         (or (symbol=? (child-eyes (make-child Fred Eva 'Gustav 1926 'brown))
;;             'blue)
;;             (or
;;               (blue-eyed-ancestor?
;;                 (child-father (make-child Fred Eva 'Carl 1926 'brown)))
;;               (blue-eyed-ancestor?
;;                 (child-mother (make-child Fred Eva 'Carl 1926 'brown)))))])
;; = (or (symbol=? 'brown 'blue)
;;       (or (blue-eyed-ancestor?
;;             (make-child empty empty 'Fred 1966 'pink))
;;           (blue-eyed-ancestor?
;;             (make-child Carl Bettina 'Eva 1965 'blue))))
;; = (or false
;;       (blue-eyed-ancestor? (make-child Carl Bettina 'Eva 1965 'blue)))
;; = (or (symbol=? (child-eyes (make-child Carl Bettina 'Eva 1965 'blue)) 'blue)
;;       (or
;;         (blue-eyed-ancestor?
;;           (child-father (make-child Carl Bettina 'Eva 1965 'blue)))
;;         (blue-eyed-ancestor?
;;           (child-mother (make-child Carl Bettina 'Eva 1965 'blue)))))
;; = (or (symbol=? 'blue 'blue)
;;       (or ...))
;; = (or true
;;       (or ...))
;; = true
(check-expect (blue-eyed-ancestor? Gustav) true)

;; exercise 14.1.3
;; ---------------
;; count-persons : ftn -> number
;; to produce the number of people in the corresponding family tree
(define (count-persons a-ftree)
  (cond
    [(empty? a-ftree) 0]
    [else (+ 1
             (count-persons (child-father a-ftree))
             (count-persons (child-mother a-ftree)))]))

(check-expect (count-persons Carl) 1)
(check-expect (count-persons Adam) 3)
(check-expect (count-persons Gustav) 5)

;; exercise 14.1.4
;; ---------------
;; sum-sage : ftn number -> number
(define (sum-age a-ftree year)
  (cond
    [(empty? a-ftree) 0]
    [else (+ (- year (child-date a-ftree))
             (sum-age (child-father a-ftree) year)
             (sum-age (child-mother a-ftree) year))]))

(check-expect (sum-age Carl 1990) 64)
(check-expect (sum-age Adam 1990) 168)
(check-expect (sum-age Gustav 1990) 179)

;; average-age : ftn number -> number
(define (average-age a-ftree year)
  (cond
    [(empty? a-ftree) 0]
    [else (/ (sum-age a-ftree year)
             (count-persons a-ftree))]))

(check-expect (average-age Carl 1990) 64)
(check-expect (average-age Adam 1990) 56)
(check-expect (average-age Gustav 1990) 179/5)

;; exercise 14.1.5
;; eye-colors : ftn -> list
(define (eye-colors a-ftree)
  (cond
    [(empty? a-ftree) empty]
    [else (append (list (child-eyes a-ftree))
                  (eye-colors (child-father a-ftree))
                  (eye-colors (child-mother a-ftree)))]))

(check-expect (eye-colors Carl) (list 'green))
(check-expect (eye-colors Dave) (list 'black 'green 'green))
(check-expect (eye-colors Gustav) (list 'brown 'pink 'blue 'green 'green))

;; exercise 14.1.6
;; proper-blue-eyed-ancestor? : ftn -> boolean
(define (proper-blue-eyed-ancestor? a-ftree)
  (cond
    [(empty? a-ftree) false]
    [else (or (blue-eyed-ancestor? (child-father a-ftree))
              (blue-eyed-ancestor? (child-mother a-ftree)))]))

(check-expect (blue-eyed-ancestor? Eva) true)
(check-expect (proper-blue-eyed-ancestor? Eva) false)
(check-expect (proper-blue-eyed-ancestor? Gustav) true)

;;(define (proper-blue-eyed-ancestor1? a-ftree)
;;  (cond
;;    [(empty? a-ftree) false]
;;    [else (or (proper-blue-eyed-ancestor1? (child-father a-ftree))
;;              (proper-blue-eyed-ancestor1? (child-mother a-ftree)))]))
;;
;;(check-expect (proper-blue-eyed-ancestor1? Eva) false)
;;(check-expect (proper-blue-eyed-ancestor1? Gustav) true) ; => false

(test)

