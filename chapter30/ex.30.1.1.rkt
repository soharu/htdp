#lang racket

(require lang/htdp-advanced)
(require htdp/testing)

;; add-to-each : number (listof number)  ->  (listof number)
;; to add n to each number on alon
(define (add-to-each n alon)
  (map (lambda (x) (+ n x)) alon))

(check-expect (add-to-each 10 (list 1 2 3 4 5))
              (list 11 12 13 14 15))
(check-expect (add-to-each 2 (list 1 2 3 4 5))
              (list 3 4 5 6 7))

(test)

