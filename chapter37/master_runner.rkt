#lang racket

(require lang/htdp-advanced)
(require htdp/master)

(define (check-color g1 g2 t1 t2)
  (cond
    [(and (symbol=? g1 t1) (symbol=? g2 t2)) 'Perfect]
    [(or (symbol=? g1 t1) (symbol=? g2 t2)) 'OneColorAtCorrectPosition]
    [(or (symbol=? g1 t2) (symbol=? g2 t1)) 'OneColorOccurs]
    [else 'NothingCorrect]))

(master check-color)

