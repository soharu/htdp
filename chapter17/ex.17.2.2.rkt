#lang racket

(require lang/htdp-beginner-abbr)

;; phone-record
(define-struct phone-record (name number))

;; zip : list-of-symbols list-of-numbers -> list-of-phone-records
(define (zip alos alon)
  (cond
    [(empty? alos) empty]
    [else
      (cons (make-phone-record (first alos) (first alon))
            (zip (rest alos) (rest alon)))]))

(zip '(John Sam Ann Tom) '(1111 2222 3333 4444))
;; => (list (phone-record 'John 1111)
;;          (phone-record 'Sam 2222)
;;          (phone-record 'Ann 3333)
;;          (phone-record 'Tom 4444))

