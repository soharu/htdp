#lang racket

; Fahrenheit->Celsius: Number -> Number
;
; 예:
;
;  1. 212F => 100C
;  2. 32F => 0C
;

(define (Fahrenheit->Celsius f)
  (* (- f 32)
     (/ 5 9)))

