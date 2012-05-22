#lang racket

(require lang/htdp-advanced)
(require htdp/testing)

;; vector-sum : (vectorof number)  ->  number
;; to compute the sum of the numbers in v
(define (vector-sum v) 
  (vector-sum-aux v (vector-length v)))
;; vector-sum-aux : (vectorof number) N  ->  number
;; to sum the numbers in v with index in [0, i)
(define (vector-sum-aux v i) 
  (cond
    [(zero? i) 0]
    [else (+ (vector-ref v (sub1 i)) 
             (vector-sum-aux v (sub1 i)))]))

;;   (vector-sum-aux (vector -1 3/4 1/4) 3)
;;
;; = (+ (vector-ref (vector -1 3/4 1/4) 2)
;;      (vector-sum-aux (vector -1 3/4 1/4) 2))
;; = (+ (vector-ref (vector -1 3/4 1/4) 2)
;;      (+ (vector-ref (vector -1 3/4 1/4) 1)
;;         (vector-sum-aux (vector -1 3/4 1/4) 1)))
;; = (+ (vector-ref (vector -1 3/4 1/4) 2)
;;      (+ (vector-ref (vector -1 3/4 1/4) 1)
;;         (+ (vector-ref (vector -1 3/4 1/4) 0)
;;            (vector-sum-aux (vector -1 3/4 1/4) 0))))
;; = (+ (vector-ref (vector -1 3/4 1/4) 2)
;;      (+ (vector-ref (vector -1 3/4 1/4) 1)
;;         (+ (vector-ref (vector -1 3/4 1/4) 0)
;;            0)))
;; = (+ (vector-ref (vector -1 3/4 1/4) 2)
;;      (+ (vector-ref (vector -1 3/4 1/4) 1)
;;         (+ -1 0)))
;; = (+ (vector-ref (vector -1 3/4 1/4) 2)
;;      (+ (vector-ref (vector -1 3/4 1/4) 1)
;;         -1))
;; = (+ (vector-ref (vector -1 3/4 1/4) 2)
;;      (+ 3/4 -1))
;; = (+ (vector-ref (vector -1 3/4 1/4) 2)
;;      -1/4)
;; = (+ 1/4 -1/4)
;; = 0

(check-expect (vector-sum-aux (vector -1 3/4 1/4) 3) 0)

;;
;; vector-sum2 : (vectorof number)  ->  number
;; to compute the sum of the numbers in v
;;
(define (vector-sum2 v)
  (local ((define (vector-sum-aux i) 
            (cond
              [(zero? i) 0]
              [else (+ (vector-ref v (sub1 i)) 
                       (vector-sum-aux (sub1 i)))])))
         (vector-sum-aux (vector-length v))))

(check-expect (vector-sum2 (vector -1 3/4 1/4)) 0)
(check-expect (vector-sum2 (vector 1 2 3 4 5)) 15)
(check-expect (vector-sum2 (vector)) 0)

(test)

