#lang racket

(require htdp/testing)

;; 13.0.6-1
(check-expect
  (list (symbol=? 'a 'b) (symbol=? 'c 'c) false)
  (list false true false))

;; 13.0.6-2
(check-expect
  (list (+ 10 20) (* 10 20) (/ 10 20))
  (list 30 200 1/2))

;; 13.0.6-3
(check-expect
  (list 'dana 'jane 'mary 'laura)
  '(dana jane mary laura))

(
 test)
