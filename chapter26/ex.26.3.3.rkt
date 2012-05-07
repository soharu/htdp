#lang racket

(require lang/htdp-intermediate-lambda)

;; gcd-generative : N[>= 1] N[>=1]  ->  N
;; to find the greatest common divisior of n and m
;; generative recursion: (gcd n m) = (gcd n (remainder m n)) if (<= m n)
(define (gcd-generative n m)
  (local ((define (clever-gcd larger smaller)
            (cond
              [(= smaller 0) larger]
              [else (clever-gcd smaller (remainder larger smaller))])))
         (clever-gcd (max m n) (min m n))))

(time (gcd-generative 101135853 45014640))

;;    (clever-gcd 101135853 45014640)
;; => (clever-gcd 45014640 11106573)
;; => (clever-gcd 11106573 588348)
;; => (clever-gcd 588348 516309)
;; => (clever-gcd 516309 72039)
;; => (clever-gcd 72039 12036)
;; => (clever-gcd 12036 11859)
;; => (clever-gcd 11859 177)
;; => (clever-gcd 177 0)
;; => 177

