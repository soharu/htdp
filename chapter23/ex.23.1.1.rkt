#lang racket

(require lang/htdp-intermediate-lambda)
(require htdp/testing)

;; make-even : N  ->  N[even]
;; to compute the i-th even number
(define (make-even i)
  (* 2 i))

;; make-odd : N  ->  N[odd]
;; to compute the i-th odd number
(define (make-odd i)
  (+ (* 2 i) 1))

;; series-even : N  ->  number
;; to sum up the first
;; n even numbers
(define (series-even n)
  ((series-local make-even) n))

;; series-odd : N  ->  number
;; to sum up the first
;; n odd numbers
(define (series-odd n)
  ((series-local make-odd) n))

;; series-local : (N -> N) -> (N -> number) 
(define (series-local f)
  (local ((define (series-f n)
            (cond
              [(= n 0) (f n)]
              [else (+ (f n)
                       (series-f (- n 1)))])))
         series-f))

(check-expect (series-even 5) (+ 2 4 6 8 10))
(check-expect (series-odd 5) (+ 1 3 5 7 9 11))

(test)

