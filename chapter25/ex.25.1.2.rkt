#lang racket

(require lang/htdp-intermediate-lambda)
(require htdp/draw)

(define-struct ball (x y delta-x delta-y))
;; A ball is a structure: 
;;   (make-ball number number number number)

;; draw-and-clear : a-ball  ->  true
;; draw, sleep, clear a disk from the canvas 
;; structural design, Scheme knowledge
(define (draw-and-clear a-ball)
  (and
    (draw-solid-disk (make-posn (ball-x a-ball) (ball-y a-ball)) 5 'red)
    (sleep-for-a-while DELAY)
    (clear-solid-disk (make-posn (ball-x a-ball) (ball-y a-ball)) 5 'red)))

;; move-ball : ball  ->  ball
;; to create a new ball, modeling a move by a-ball
;; structural design, physics knowledge
(define (move-ball a-ball) 
  (make-ball (+ (ball-x a-ball) (ball-delta-x a-ball))
             (+ (ball-y a-ball) (ball-delta-y a-ball))
             (ball-delta-x a-ball)
             (ball-delta-y a-ball)))

;; Dimension of canvas 
(define WIDTH 100)
(define HEIGHT 100)
(define DELAY .1)

;; out-of-bounds? : a-ball  ->  boolean
;; to determine whether a-ball is outside of the bounds
;; domain knowledge, geometry
(define (out-of-bounds? a-ball)
  (not
    (and
      (<= 0 (ball-x a-ball) WIDTH)
      (<= 0 (ball-y a-ball) HEIGHT))))

;; draw-ball : a-ball -> true
(define (draw-ball a-ball)
  (draw-solid-disk (make-posn (ball-x a-ball) (ball-y a-ball)) 5 'red))

;; clear-ball : a-ball -> true
(define (clear-ball a-ball)
  (clear-solid-disk (make-posn (ball-x a-ball) (ball-y a-ball)) 5 'red))

;; draw-and-clear-balls : a-list-of-balls  ->  true
(define (draw-and-clear-balls alob)
  (and (andmap draw-ball alob)
       (sleep-for-a-while DELAY)
       (andmap clear-ball alob)))

;; move-balls : a-list-of-balls -> true
(define (move-balls alob)
  (cond 
    [(empty? alob) true]
    [else (and (draw-and-clear-balls alob)
               (move-balls (filter
                             (lambda (x) (not (out-of-bounds? x)))
                             (map move-ball alob))))]))

(define a-list-of-balls
  (list
    (make-ball 10 10 3 3)
    (make-ball 90 10 -3 3)
    (make-ball 10 90 3 -3)
    (make-ball 90 90 -3 -3)))

(start WIDTH HEIGHT)
(move-balls a-list-of-balls)
(stop)

