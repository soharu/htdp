#lang racket

(require lang/htdp-intermediate)
(require htdp/testing)

(define (filter1 rel-op alon t)
  (cond
    [(empty? alon) empty]
    [else (cond
            [(rel-op (first alon) t)
             (cons (first alon)
                   (filter1 rel-op (rest alon) t))]
            [else
              (filter1 rel-op (rest alon) t)])]))

;;   (filter1 < (cons 6 (cons 4 empty)) 5)
;; = (cond [(< (first (cons 6 (cons 4 empty))) 5)
;;          (cons (first (cons 6 (cons 4 empty)))
;;                (filter1 < (rest (cons 6 (cons 4 empty))) 5))]
;;         [else (filter 1 < (rest (cons 6 (cons 4 empty))) 5)])
;; = (cond [(< 6 5) 
;;          (cons (first (cons 6 (cons 4 empty)))
;;                (filter1 < (rest (cons 6 (cons 4 empty))) 5))]
;;         [else (filter 1 < (rest (cons 6 (cons 4 empty))) 5)])
;; = (cond [false 
;;          (cons (first (cons 6 (cons 4 empty)))
;;                (filter1 < (rest (cons 6 (cons 4 empty))) 5))]
;;         [else (filter 1 < (rest (cons 6 (cons 4 empty))) 5)])
;; = (filter 1 < (rest (cons 6 (cons 4 empty))) 5)
;; = (filter 1 < (cons 4 empty) 5)

(check-expect
  (filter1 < (cons 6 (cons 4 empty)) 5)
  (filter1 < (cons 4 empty) 5))

(test)

