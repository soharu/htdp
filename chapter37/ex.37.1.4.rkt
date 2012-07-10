#lang racket

(require lang/htdp-advanced)
(require htdp/testing)

;; Constants:

;; the legitimate colors 
(define COLORS
  (list 'black 'white 'red 'blue 'green 'gold 'pink 'orange 'purple 'navy))

;; the number of colors
(define COL# (length COLORS))

;; Data Definition:
;; A color is a symbol on COLORS. 

;; target1, target2 : color 
;; the two variables represent the two colors that the first player chose
(define target1 (first COLORS))
(define target2 (first COLORS))
(define guess-count 0)

;; random-pick: -> color
(define (random-pick)
  (list-ref COLORS (random COL#)))

;; master :  ->  void
;; effect: set target1 and target2 to two randomly chosen items from COLORS
(define (master)
  (begin
    (set! target1 (random-pick))
    (set! target2 (random-pick))
    (set! guess-count 0)))

;; master-check : color color  ->  symbol
;; to determine how many colors at how many positions are guessed correctly
;; The function defers to check-color, the solution of exercise 5.1.5.
(define (master-check guess1 guess2)
  (begin
    (set! guess-count (+ guess-count 1))
    (local
      ((define result (check-color guess1 guess2 target1 target2))
       (define gc guess-count))
      (if (symbol=? result 'Perfect)
        (begin
          (master)
          (list result gc))
        result))))

(define (check-color g1 g2 t1 t2)
    (cond
      [(and (symbol=? g1 t1) (symbol=? g2 t2)) 'Perfect]
      [(or (symbol=? g1 t1) (symbol=? g2 t2)) 'OneColorAtCorrectPosition]
      [(or (symbol=? g1 t2) (symbol=? g2 t1)) 'OneColorOccurs]
      [else 'NothingCorrect]))

;; forcely set specific colors for test
;;
(begin (set! target1 'green)
       (set! target2 'navy)
       (void))

(check-expect (master-check 'red 'blue) 'NothingCorrect)
(check-expect (master-check 'red 'green) 'OneColorOccurs)
(check-expect (master-check 'green 'orange) 'OneColorAtCorrectPosition)
(check-expect (master-check 'green 'purple) 'OneColorAtCorrectPosition)
(check-expect (master-check 'green 'navy) (list 'Perfect 5))

;; maybe generated new game 
(check-expect guess-count 0)
(check-expect (symbol=? (master-check 'green 'navy) 'Perfect) false)

(test)

