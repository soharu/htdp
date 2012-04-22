#lang racket

(require lang/htdp-intermediate-lambda)
(require htdp/testing)

;; 1. 
;; ((lambda (x y)
;;    (+ x (* x y)))
;;  1 2)
(check-expect ((lambda (x y)
                 (+ x (* x y)))
               1 2)
              3)

;; 2.
;;((lambda (x y)
;;   (+ x
;;      (local ((define x (* y y)))
;;             (+ (* 3 x)
;;                (/ 1 x)))))
;; 1 2)
(check-expect ((lambda (x y)
                 (+ x
                    (local ((define x (* y y)))
                           (+ (* 3 x)
                              (/ 1 x)))))
               1 2)
              53/4)

;; 3.
;;((lambda (x y)
;;   (+ x
;;      ((lambda (x)
;;         (+ (* 3 x)
;;            (/ 1 x)))
;;       (* y y))))
;; 1 2)
(check-expect ((lambda (x y)
                 (+ x
                    ((lambda (x)
                       (+ (* 3 x)
                          (/ 1 x)))
                     (* y y))))
               1 2)
              53/4)

(test)

