#lang racket

; dollar->euro: number -> number
;
; 03/11/12 기준
;   1 달러 = 0.763009309 유로
;

(define (dollar->euro d)
  (* d 0.763009309))

