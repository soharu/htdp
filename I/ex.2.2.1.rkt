;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex.2.2.1) (read-case-sensitive #t) (teachpacks ((lib "convert.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor mixed-fraction #f #t none #f ((lib "convert.ss" "teachpack" "htdp") (lib "draw.ss" "teachpack" "htdp")))))
; 예:
;
;  1. 212F => 100C
;  2. 32F => 0C
;

(define (Fahrenheit->Celsius f)
  (* (- f 32)
     (/ 5 9)))


