#lang racket

(require lang/htdp-beginner)
(require htdp/testing)
(require htdp/draw)

;; draw-polygon : polygon  ->  true
;; to draw the polygon specified by a-poly 
(define (draw-polygon a-poly)
  (connect-dots (add-at-end (first a-poly) a-poly)))

;; connect-dots : polygon  ->  true
;; to draw connections between the dots of a-poly
(define (connect-dots a-poly)
  (cond
    [(empty? (rest a-poly)) true]
    [else (and (draw-solid-line (first a-poly) (second a-poly) 'red)
               (connect-dots (rest a-poly)))]))

;; add-at-end : posn polygon -> polygon
;; to add a posn to the end of polygon
(define (add-at-end a-posn a-poly)
  (cond
    [(empty? a-poly) (cons a-posn empty)]
    [else (cons (first a-poly)
                (add-at-end a-posn (rest a-poly)))]))

(define polygon-1 (list (make-posn 10 10)
                        (make-posn 60 60)
                        (make-posn 10 60)))

(check-expect (add-at-end (first polygon-1) polygon-1)
              (list (make-posn 10 10)
                    (make-posn 60 60)
                    (make-posn 10 60)
                    (make-posn 10 10)))
(test)

(start 300 300)
(draw-polygon polygon-1)

