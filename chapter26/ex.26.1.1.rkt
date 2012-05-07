#lang racket

(require lang/htdp-intermediate-lambda)
(require htdp/testing)

;; tablulate-div : number -> (listof number)
(define (tabulate-div n)
  (local
    ((define (divide? d) (= (remainder n d) 0))
     (define (divisors d)
       (cond
         [(< n d) empty]
         [(divide? d)
          (cons d (divisors (+ d 1)))]
         [else
           (divisors (+ d 1))])))
    (divisors 1)))

(check-expect (tabulate-div 0) empty) 
(check-expect (tabulate-div 1) '(1)) 
(check-expect (tabulate-div 2) '(1 2)) 
(check-expect (tabulate-div 6) '(1 2 3 6)) 
(check-expect (tabulate-div 25) '(1 5 25)) 


(test)

