#lang racket

(require lang/htdp-beginner)
(require htdp/testing)

; sqr - square a number
(check-expect (sqr 2) 4)
(check-expect (sqr 3) 9)

; sin - compute the sine of angle
(check-within (sin 0) 0 0.0000001)
(check-within (sin (/ pi 2)) 1 0.0000001)   ; 90 degree
(check-within (sin (/ pi 6)) 0.5 0.0000001) ; 30 degree

; max - determine the maximum of two numbers
(check-expect (max 3 5) 5)
(check-expect (max 3 0) 3)
(check-expect (max -3 0) 0)

(test)

