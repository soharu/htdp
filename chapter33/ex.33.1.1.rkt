#lang racket

(require lang/htdp-advanced)
(require htdp/testing)

;; Fixed-size number
(define-struct inex (mantissa sign exponent))

;; create-inex : N N N  ->  inex
;; to make an instance of inex after checking the appropriateness
;; of the arguments
(define (create-inex m s e)
  (cond
    [(and (<= 0 m 99) (<= 0 e 99) (or (= s +1) (= s -1)))
     (make-inex m s e)]
    [else
      (error 'make-inex "(<= 0 m 99), +1 or -1, (<= 0 e 99) expected")]))

;; inex->number : inex  ->  number
;; to convert an inex into its numeric equivalent 
(define (inex->number an-inex)
  (* (inex-mantissa an-inex) 
     (expt 10 (* (inex-sign an-inex) (inex-exponent an-inex)))))

;; The range of inex numbers is vast:
(define MAX-POSITIVE (make-inex 99 +1 99))
(define MIN-POSITIVE (make-inex 1 -1 99))

;; inex+
;; adds inex representations that have the same exponent.
(define (inex+ a b)
  (local ((define d (+ (inex-mantissa a) (inex-mantissa b)))
          (define s (inex-sign a))
          (define e (inex-exponent a)))
         (cond
           [(<= d 99) (create-inex d s e)]
           [else (create-inex (quotient d 10)
                              s
                              (+ e 1))])))

;; Test

;; create-inex
(check-expect (inex->number (create-inex 12 +1 1)) 120)
(check-expect (inex->number (create-inex 12 -1 1)) 12/10)

;; inex+
(check-expect (inex+ (create-inex 1 +1 0)
                     (create-inex 2 +1 0))
              (create-inex 3 +1 0))

(check-expect (inex+ (create-inex 55 +1 0)
                     (create-inex 55 +1 0))
              (create-inex 11 +1 1))

(check-expect (inex+ (create-inex 98 +1 1)
                     (create-inex  1 +1 1))
              (create-inex 99 +1 1))

(check-expect (inex+ (create-inex 99 +1 1)
                     (create-inex 99 +1 1))
              (create-inex 19 +1 2))

(check-error (inex+ (create-inex 99 +1 99)
                    (create-inex  1 +1 99)))

(test)

