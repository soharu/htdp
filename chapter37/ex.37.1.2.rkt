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

;; random-pick: -> color
(define (random-pick)
  (list-ref COLORS (random COL#)))

;; master :  ->  void
;; effect: set target1 and target2 to two randomly chosen items from COLORS
(define (master)
  (begin
    (set! target1 (random-pick))
    (set! target2 (random-pick))))

;; master-check : color color  ->  symbol
;; to determine how many colors at how many positions are guessed correctly
;; The function defers to check-color, the solution of exercise 5.1.5.
(define (master-check guess1 guess2)
  (check-color guess1 guess2 target1 target2))

(define (check-color g1 g2 t1 t2)
  (cond
    [(and (symbol=? g1 t1) (symbol=? g2 t2)) 'Perfect]
    [(or (symbol=? g1 t1) (symbol=? g2 t2)) 'OneColorAtCorrectPosition]
    [(or (symbol=? g1 t2) (symbol=? g2 t1)) 'OneColorOccurs]
    [else 'NothingCorrect]))

;; check-color
;;
(check-expect (check-color 'red 'blue 'red 'blue)
              'Perfect)
(check-expect (check-color 'red 'blue 'red 'orange)
              'OneColorAtCorrectPosition)
(check-expect (check-color 'red 'blue 'blue 'orange)
              'OneColorOccurs)
(check-expect (check-color 'red 'blue 'blue 'red)
              'OneColorOccurs)
(check-expect (check-color 'red 'blue 'black 'orange)
              'NothingCorrect)

(test)

;; master and master-check
;; 
(master)
(master-check 'red 'blue)

