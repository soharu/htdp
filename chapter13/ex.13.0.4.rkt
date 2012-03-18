#lang racket

(require htdp/testing)

;; 13.0.4-1
(check-expect
  (equal? (cons 'a (cons 'b (cons 'c (cons 'd (cons 'e empty)))))
          (list 'a 'b 'c 'd 'e))
  #t)

;; 13.0.4-2
(check-expect
  (equal? (cons (cons 1 (cons 2 empty)) empty)
          (list (list 1 2)))
  #t)

;; 13.0.4-3
(check-expect
  (equal? (cons 'a (cons (cons 1 empty) (cons false empty)))
          (list 'a (list 1) false))
  #t)

;; 13.0.4-4
(check-expect
  (equal? (cons (cons 1 (cons 2 empty)) (cons (cons 2 (cons 3 empty)) empty))
          (list (list 1 2) (list 2 3)))
  #t)

(test)
