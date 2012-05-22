#lang racket

(require lang/htdp-advanced)
(require htdp/testing)

;; vector-squared-sum : (vectorof number) -> number
(define (vector-squared-sum v)
  (local ((define (vector-squared-sum-aux i)
            (cond
              [(zero? i) 0]
              [else (+ (sqr (vector-ref v (sub1 i)))
                       (vector-squared-sum-aux (sub1 i)))])))
         (vector-squared-sum-aux (vector-length v))))

(check-expect (vector-squared-sum (vector 3 4)) 25)

;; norm : (vectorof number) -> number
(define (norm v)
  (sqrt (vector-squared-sum v)))

(define delta 0.00000001)
(check-within (norm (vector 3 4)) 5 delta)
(check-within (norm (vector 1 1 1)) (sqrt 3) delta)

(test)

