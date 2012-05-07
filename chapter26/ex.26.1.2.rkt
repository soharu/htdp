#lang racket

(require lang/htdp-intermediate-lambda)
(require htdp/testing)

;; make-singles : (listof number) -> (listof (listof number))
;;
;;   example:
;;        (make-singles (list 2 5 9 3))
;;     => (list (list 2) (list 5) (list 9) (list 3))
(define (make-singles alon)
  (if (empty? alon)
    empty
    (cons (list (first alon))
          (make-singles (rest alon)))))

(check-expect (make-singles '(1)) '((1)))
(check-expect (make-singles '(1 2)) '((1) (2)))
(check-expect (make-singles '(2 5 9 3)) '((2) (5) (9) (3)))

;; merge-two-neighbors : (listof number) (listof number) -> (listof number)
(define (merge-two-neighbors alon1 alon2)
  (cond
    [(empty? alon1) alon2]
    [(empty? alon2) alon1]
    [(< (first alon1) (first alon2))
     (cons (first alon1) (merge-two-neighbors (rest alon1) alon2))]
    [else
     (cons (first alon2) (merge-two-neighbors alon1 (rest alon2)))]))

;; merge-all-neighbors : (listof (listof number)) -> (listof (listof number))
;;
;;   example:
;;        (merge-all-neighbors (list (list 2) (list 5) (list 9) (list 3)))
;;     => (list (list 2 5) (list 3 9))
;;        (merge-all-neighbors (list (list 2 5) (list 3 9)))
;;     => (list (list 2 3 5 9))
(define (merge-all-neighbors alons)
  (cond
    [(empty? alons) empty]
    [(empty? (rest alons)) alons]
    [else
      (local
        ((define f (car alons))
         (define s (cadr alons)))
        (cons (merge-two-neighbors f s)
              (merge-all-neighbors (cddr alons))))]))

(check-expect (merge-all-neighbors '()) '())
(check-expect (merge-all-neighbors '((1))) '((1)))
(check-expect (merge-all-neighbors '((1) (2))) '((1 2)))
(check-expect (merge-all-neighbors '((1) (2) (3))) '((1 2) (3)))
(check-expect (merge-all-neighbors '((2) (1) (3))) '((1 2) (3)))
(check-expect (merge-all-neighbors '((2) (5) (9) (3)))
              '((2 5) (3 9)))
(check-expect (merge-all-neighbors '((2 5) (3 9)))
              '((2 3 5 9)))

;; merge-sort : (listof number) -> (listof number)
(define (merge-sort alon)
  (local
    ((define (merge-items alons)
       (cond
         [(empty? alons) empty]
         [(= (length alons) 1) (first alons)]
         [else
           (merge-items (merge-all-neighbors alons))])))
    (merge-items (make-singles alon))))

(check-expect (merge-sort '()) '())
(check-expect (merge-sort '(2)) '(2))
(check-expect (merge-sort '(3 2)) '(2 3))
(check-expect (merge-sort '(2 5 9 3)) '(2 3 5 9))
(check-expect (merge-sort '(10 2 8 5 9 3)) '(2 3 5 8 9 10))

(test)

