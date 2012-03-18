#lang racket

(require htdp/testing)

(check-expect (first (list 1 2 3)) 1)
(check-expect (rest (list 1 2 3)) (list 2 3))

(test)

