#lang racket

(require lang/htdp-intermediate-lambda)
(require htdp/testing)

;; partitions : (listof number) number -> (listof (listof number))
(define (partitions alon threshold)
  (cond
    [(empty? alon) (list '() '())]
    [else
      (local
        ((define n (first alon))
         (define next-parts (partitions (rest alon) threshold)))
        (if (< n threshold)
          (list (cons n (first next-parts))
                (second next-parts))
          (list (first next-parts)
                (cons n (second next-parts)))))]))

(check-expect (partitions '() 0) (list '() '()))
(check-expect (partitions '(1) 3) (list '(1) '()))
(check-expect (partitions '(3) 2) (list '() '(3)))
(check-expect (partitions '(11 8) 9) (list '(8) '(11)))
(check-expect (partitions '(11 8 14 7) 9) (list '(8 7) '(11 14)))
(check-expect (partitions '(11 8 14 7) 8) (list '(7) '(11 8 14)))

;; quick-sort : (listof number) -> (listof number)
(define (quick-sort alon)
  (cond
    [(empty? alon) empty]
    [(empty? (rest alon)) alon]
    [else
      (local
        ((define parts (partitions (rest alon) (first alon))))
        (append (quick-sort (first parts))
                (list (first alon))
                (quick-sort (second parts))))]))

(check-expect (quick-sort '(1)) '(1))
(check-expect (quick-sort '(1 2)) '(1 2))
(check-expect (quick-sort '(11 8 14 7)) '(7 8 11 14))
(check-expect (quick-sort '(11 8 8 14 7)) '(7 8 8 11 14))

; general-quick-sort : (X X -> bool) (list X) -> (list X)
(define (general-quick-sort a-predicate a-list)
  (local
    ((define (partitions alon threshold)
       (cond
         [(empty? alon) (list '() '())]
         [else
           (local ((define x (first alon))
                   (define next-parts (partitions (rest alon) threshold)))
                  (if (a-predicate x threshold)
                    (list (cons x (first next-parts))
                          (second next-parts))
                    (list (first next-parts)
                          (cons x (second next-parts)))))]))
     (define (quick-sort alon)
       (cond
         [(empty? alon) empty]
         [(empty? (rest alon)) alon]
         [else
           (local ((define parts (partitions (rest alon) (first alon))))
                  (append (quick-sort (first parts))
                          (list (first alon))
                          (quick-sort (second parts))))])))
    (quick-sort a-list)))

(check-expect (general-quick-sort < '(11 8 14 7)) '(7 8 11 14))
(check-expect (general-quick-sort > '(11 8 14 7)) '(14 11 8 7))
(check-expect (general-quick-sort string<? '("hello" "world" "tuestudy"))
              '("hello" "tuestudy" "world"))

(test)

