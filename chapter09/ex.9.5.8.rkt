#lang racket

(require lang/htdp-beginner)
(require htdp/draw)

;;
;; draw-circles
;;

;; Contract: a-posn a-list-of-nums -> true

;; Definition:
(define (draw-circles a-posn a-list-of-nums)
  (cond
    [(empty? a-list-of-nums) #t]
    [else (and (draw-circle a-posn (first a-list-of-nums))
               (draw-circles a-posn (rest a-list-of-nums)))]))

;; Test:
(start 300 300)

(draw-circles (make-posn 150 150)
              (cons 10 (cons 20 (cons 30 (cons 40 empty)))))

