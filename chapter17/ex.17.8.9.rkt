#lang racket

(require lang/htdp-beginner-abbr)
(require htdp/testing)

;; Slist
;;   1. empty
;;   2. (cons s sl) where s is a Sexpr and sl is a Slist
(define (Slist=? slist1 slist2)
  (cond
    [(empty? slist1) (empty? slist2)]
    [(empty? slist2) (empty? slist1)]
    [else
      (and (Sexpr=? (first slist1) (first slist2))
           (Slist=? (rest slist1) (rest slist2)))]))

;; Sexpr
;;   1. a number
;;   2. a boolean
;;   3. a symbol
;;   4. a Slist
(define (Sexpr=? se1 se2)
  (cond
    [(number? se1)
     (and (number? se2) (= se1 se2))]
    [(boolean? se1)
     (and (boolean? se2) (boolean=? se1 se2))]
    [(symbol? se1)
     (and (symbol? se2) (symbol=? se1 se2))]
    [else
      (Slist=? se1 se2)]))

;; Test
;; ----
(check-expect
  (Slist=? (list 1 true 'hello (list false 'world 4))
           (list 1 true 'hello (list false 'world 4)))
  true)

(check-expect
  (Slist=? (list (list false 'world 4) 'ok)
           (list (list false 'world 4) 'ok))
  true)

(check-expect
  (Slist=? (list (list false 'world 4) 1 3 'ok)
           (list (list false 'world 4) 3 1 'ok))
  false)

(test)

