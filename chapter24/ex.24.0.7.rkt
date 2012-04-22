#lang racket

(require lang/htdp-intermediate-lambda)
(require htdp/testing)

;; 1. (lambda (x y) (x y y))
(check-expect ((lambda (x y) (x y y)) + 2) 4)

;; 2. (lambda () 10)
;; lambda: expected at least one variable (in parentheses) after lambda

;; 3. (lambda (x) x)
(check-expect ((lambda (x) x) 1234) 1234)

;; 4. (lambda (x y) x)
(check-expect ((lambda (x y) x) 1 2) 1)

;; 5. (lambda x 10)
;; lambda: expected at least one variable (in parentheses) after lambda

(test)

