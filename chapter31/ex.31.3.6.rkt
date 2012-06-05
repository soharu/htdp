#lang racket

(require lang/htdp-advanced)
(require htdp/testing)

(define (make-palindrome aloc0)
  (local ((define (make-palindrome-a aloc accumulator)
            (cond
              [(= (length aloc) 1) (append aloc0 accumulator)]
              [else
                (make-palindrome-a (rest aloc)
                                   (cons (first aloc) accumulator))])))
         (make-palindrome-a aloc0 empty)))

(check-expect (make-palindrome '(a))  '(a))
(check-expect (make-palindrome '(a b))  '(a b a))
(check-expect (make-palindrome '(a b c))  '(a b c b a))

(test)

