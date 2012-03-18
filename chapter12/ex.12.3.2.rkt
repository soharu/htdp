#lang racket

(require lang/htdp-beginner)
(require htdp/draw)

;; draw-polygon : polygon  ->  true
;; to draw the polygon specified by a-poly 
(define (draw-polygon a-poly)
  (connect-dots (first a-poly) a-poly))

;; connect-dots : posn polygon  ->  true
;; to draw connections between the dots of a-poly
;; a-posn is connected with the last posn
(define (connect-dots a-posn a-poly)
  (cond
    [(empty? (rest a-poly))
     (draw-solid-line (first a-poly) a-posn 'red)]
    [else (and (draw-solid-line (first a-poly) (second a-poly) 'red)
               (connect-dots a-posn (rest a-poly)))]))

(start 300 300)
(draw-polygon (list (make-posn 10 10)
                    (make-posn 60 60)
                    (make-posn 10 60)))

