#lang racket

(require lang/htdp-advanced)
(require htdp/testing)

(define (how-many alox0)
  (local ((define (how-many-a alox accumulator)
            (cond
              [(empty? alox) accumulator]
              [else
                (how-many-a (rest alox) (add1 accumulator))])))
         (how-many-a alox0 0)))


(check-expect (how-many '()) 0)
(check-expect (how-many '(1)) 1)
(check-expect (how-many '(2 0)) 2)
(check-expect (how-many '(a b c)) 3)
(check-expect (how-many '(1 a 1/3 0.1)) 4)

(test)

