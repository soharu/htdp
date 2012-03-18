#lang racket

(require htdp/testing)

;;
;; formulate by cons
;;

;; 13.0.5-1
(check-expect
  (equal? (cons 'a (list 0 false))
          (cons 'a (cons 0 (cons false empty))))
  true)

;; 13.0.5-2
(check-expect
  (equal? (list (cons 1 (cons 13 empty)))
          (cons (cons 1 (cons 13 empty)) empty))
  true)

;; 13.0.5-3 
(check-expect
  (equal? (list empty empty (cons 1 empty))
          (cons empty
                (cons empty
                      (cons (cons 1 empty)
                            empty))))
  true)

;; 13.0.5-4
(check-expect
  (equal? (cons 'a (cons (list 1) (list false empty)))
          (cons 'a
                (cons (cons 1 empty)
                      (cons false (cons empty empty)))))
  true)


;;
;; formulate by list
;;

;; 13.0.5-1
(check-expect
  (equal? (cons 'a (list 0 false))
          (list 'a 0 false))
  true)

;; 13.0.5-2
(check-expect
  (equal? (list (cons 1 (cons 13 empty)))
          (list (list 1 13)))
  true)

;; 13.0.5-3 
(check-expect
  (equal? (list empty empty (cons 1 empty))
          (list empty empty (list 1)))
  true)

;; 13.0.5-4
(check-expect
  (equal? (cons 'a (cons (list 1) (list false empty)))
          (list 'a (list 1) false empty))
  true)

(test)
