;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader (lib "htdp-beginner-reader.ss" "lang")
        ((modname ex.9.5.8)
         (read-case-sensitive #t)
         (teachpacks ((lib "draw.ss" "teachpack" "htdp"))))

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

