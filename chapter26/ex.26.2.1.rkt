#lang racket

(require lang/htdp-intermediate-lambda)
(require htdp/testing)

(define (determine-solution a-list) 0)
(define (combine-solutions x n) (+ 1 n))

(define (generative-recursive-fun problem)
  (cond
    [(empty? problem) (determine-solution problem)]
    [else
      (combine-solutions
        problem
        (generative-recursive-fun (rest problem)))]))

(check-expect (generative-recursive-fun '()) 0)
(check-expect (generative-recursive-fun '(1)) 1)
(check-expect (generative-recursive-fun '(1 2)) 2)
(check-expect (generative-recursive-fun '(hello world abcd htdp)) 4)

(test)

