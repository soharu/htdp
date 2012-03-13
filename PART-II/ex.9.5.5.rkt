#lang racket

;;
;; convert
;;

;; Contract: a-list-of-nums -> number

;; Example:
;; (convert (cons 1 (cons 2 (cons 3 empty)))) => 321

;; Definition:
(define (convert a-list-of-nums)
  (cond
    [(empty? a-list-of-nums) 0]
    [else (+ (first a-list-of-nums)
             (* (convert (rest a-list-of-nums)) 10))]))

;; Test:
(eq? 321 (convert (cons 1 (cons 2 (cons 3 empty)))))
(eq? 4567 (convert (cons 7 (cons 6 (cons 5 (cons 4 empty))))))

;;
;; check-guess-for-list
;;

;; Contract: a-list-of-nums number -> symbol

;; Example:
;; (check-guess-for-list (cons 1 (cons 2 (cons 3 empty))) 500) => 'TooSmall
;; (check-guess-for-list (cons 1 (cons 2 (cons 3 empty))) 321) => 'Perfect
;; (check-guess-for-list (cons 1 (cons 2 (cons 3 empty))) 10) => 'TooLarge

;; Definition:
(define (check-guess-for-list a-list-of-nums number)
  (cond
    [(< (convert a-list-of-nums) number) 'TooSmall]
    [(> (convert a-list-of-nums) number) 'TooLarge]
    [else 'Perfect]))

;; Test:
(eq? (check-guess-for-list (cons 1 (cons 2 (cons 3 empty))) 500) 'TooSmall)
(eq? (check-guess-for-list (cons 1 (cons 2 (cons 3 empty))) 321) 'Perfect)
(eq? (check-guess-for-list (cons 1 (cons 2 (cons 3 empty))) 10)  'TooLarge)

