#lang racket

(require lang/htdp-intermediate-lambda)
;;(require core)

;; gcd-structural : N[>= 1] N[>= 1]  ->  N
;; to find the greatest common divisior of n and m
;; structural recursion using data definition of N[>= 1] 
(define (gcd-structural n m)
  (local ((define (first-divisior-<= i)
            (cond
              [(= i 1) 1]
              [else (cond
                      [(and (= (remainder n i) 0) 
                            (= (remainder m i) 0))
                       i]
                      [else (first-divisior-<= (- i 1))])])))
         (first-divisior-<= (min m n))))

(time (gcd-structural 101135853 45014640))
;; Result:
;;  cpu time: 2944 real time: 2942 gc time: 0
;;  177

