#lang racket

(require lang/htdp-beginner)
(require htdp/testing)

(sqrt 4)    ; => 2
(sqrt 2)    ; => 1.4142135623730951
(sqrt -1)   ; => 0+1i


(check-within (tan 0) 0 0.0000001)
(check-within (tan (/ pi 4)) 1 0.0000001)

(test)

