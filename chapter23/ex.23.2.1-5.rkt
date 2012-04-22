#lang racket

(require lang/htdp-intermediate-lambda)
(require htdp/testing)

;; ex.23.2.1
;; =============================================================
(define (a-fives n)
  (cond
    [(= n 0) (+ 3 5)]
    [else
      (+ 5 (a-fives (- n 1)))]))

(check-expect (a-fives 0) 8)
(check-expect (a-fives 1) 13)
(check-expect (a-fives 2) 18)
(check-expect (a-fives 3) 23)

;; ex.23.2.2
;; =============================================================
(define (a-fives-closed n)
  (+ 3 (* 5 (+ n 1))))

(check-expect (a-fives-closed 0) 8)
(check-expect (a-fives-closed 1) 13)
(check-expect (a-fives-closed 2) 18)
(check-expect (a-fives-closed 3) 23)

;; ex.23.2.3
;; =============================================================
;; series : N (N  ->  number)  ->  number
;; to sum up the first n numbers in the sequence a-term,
(define (series n a-term)
  (cond
    [(= n 0) (a-term n)]
    [else (+ (a-term n)
             (series (- n 1) a-term))]))

(define (sum-a-fives n)
  (/ (* (+ n 1)
        (+ (a-fives 0) (a-fives n)))
     2))

(check-expect (series 3 a-fives) (sum-a-fives 3))
(check-expect (series 7 a-fives) (sum-a-fives 7))
(check-expect (series 88 a-fives) (sum-a-fives 88))

;; ex.23.2.4
;; =============================================================
(define (seq-a-fives n)
  (build-list (+ n 1) a-fives-closed))

(check-expect (seq-a-fives 3)
              (list 8 13 18 23))
(check-expect (seq-a-fives 5)
              (list 8 13 18 23 28 33))

;; ex.23.2.5
;; =============================================================
(define (arithmetic-series start s)
  (local ((define (a-term n)
            (+ start (* s (+ n 1)))))
         a-term))

(check-expect ((arithmetic-series 3 5) 0) 8)
(check-expect ((arithmetic-series 3 5) 1) 13)
(check-expect ((arithmetic-series 3 5) 2) 18)
(check-expect ((arithmetic-series 3 5) 3) 23)

(check-expect ((arithmetic-series 0 2) 0) 2)
(check-expect ((arithmetic-series 0 2) 1) 4)
(check-expect ((arithmetic-series 0 2) 2) 6)
(check-expect ((arithmetic-series 0 2) 3) 8)

(test)

