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

;;   (filter1 > (cons 8 (cons 6 (cons 4 empty))) 5)
;; = (cond [(> 8 5)
;;          (cons (first (cons 8 (cons 6 (cons 4 empty))))
;;                (filter1 > (rest (cons 8 (cons 6 (cons 4 empty)))) 5))]
;;         [else (filter1 > (rest (cons 8 (cons 6 (cons 4 empty)))) 5)])
;; = (cond [true
;;          (cons (first (cons 8 (cons 6 (cons 4 empty))))
;;                (filter1 > (rest (cons 8 (cons 6 (cons 4 empty)))) 5))]
;;         [else (filter1 > (rest (cons 8 (cons 6 (cons 4 empty)))) 5)])
;; = (cons 8 (filter1 > (cons 6 (cons 4 empty)) 5))
;; = (cons 8 (cond [(> 6 5)
;;                  (cons (first (cons 6 (cons 4 empty)))
;;                        (filter1 > (rest (cons 6 (cons 4 empty))) 5))]
;;                 [else (filter1 > (rest (cons 6 (cons 4 empty))) 5)]))
;; = (cons 8 (cond [true
;;                  (cons (first (cons 6 (cons 4 empty)))
;;                        (filter1 > (rest (cons 6 (cons 4 empty))) 5))]
;;                 [else (filter1 > (rest (cons 6 (cons 4 empty))) 5)]))
;; = (cons 8 (cons 6 (filter1 > (cons 4 empty) 5)))
;; = (cons 8 (cons 6 (cond
;;                    [(> 4 5)
;;                     (cons (first (cons 4 empty))
;;                           (filter1 > (rest (cons 4 empty)) 5))]
;;                    [else (filter1 > (rest (cons 4 empty)) 5)])))
;; = (cons 8 (cons 6 (cond
;;                    [false
;;                     (cons (first (cons 4 empty))
;;                           (filter1 > (rest (cons 4 empty)) 5))]
;;                    [else (filter1 > (rest (cons 4 empty)) 5)])))
;; = (cons 8 (cons 6 (filter1 > empty 5)))
;; = (cons 8 (cons 6 empty)

(check-expect
  (filter1 > (cons 8 (cons 6 (cons 4 empty))) 5)
  (cons 8 (cons 6 empty)))

(test)

