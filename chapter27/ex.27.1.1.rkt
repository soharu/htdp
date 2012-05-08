#lang racket

(require lang/htdp-intermediate-lambda)
(require htdp/draw)

;; sierpinski : posn posn posn  ->  true
;; to draw a Sierpinski triangle down at a, b, and c,
;; assuming it is large enough
(define (sierpinski a b c)
  (cond
    [(too-small? a b c) true]
    [else 
      (local ((define a-b (mid-point a b))
              (define b-c (mid-point b c))
              (define c-a (mid-point a c)))
             (and
               (draw-triangle a b c)     
               (sierpinski a a-b c-a)
               (sierpinski b a-b b-c)
               (sierpinski c c-a b-c)))]))

;; mid-point : posn posn  ->  posn
;; to compute the mid-point between a-posn and b-posn
(define (mid-point a-posn b-posn)
  (make-posn
    (mid (posn-x a-posn) (posn-x b-posn))
    (mid (posn-y a-posn) (posn-y b-posn))))

;; mid : number number  ->  number
;; to compute the average of x and y
(define (mid x y)
  (/ (+ x y) 2))

;; draw-triangle : posn posn posn  ->  true
(define (draw-triangle a b c)
  (and (draw-solid-line a b 'red)
       (draw-solid-line b c 'red)
       (draw-solid-line c a 'red)))

;; too-small? : posn posn posn  ->  bool
(define (too-small? a b c)
  (local
    ((define THRESHOLD 5)
     (define (distance p1 p2)
       (sqrt (+ (sqr (- (posn-x p1) (posn-x p2)))
                (sqr (- (posn-y p1) (posn-y p2)))))))
    (or (< (distance a b) THRESHOLD)
        (< (distance b c) THRESHOLD)
        (< (distance c a) THRESHOLD))))

(define A (make-posn 200 50))
(define B (make-posn 27 350))
(define C (make-posn 373 350))
(define DELAY 2)    ;; 2 secs

(start 400 400)
(sierpinski A B C)
(sleep-for-a-while DELAY)
(stop)

