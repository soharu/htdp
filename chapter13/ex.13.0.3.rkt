#lang racket

(require htdp/testing)

;; 13.0.3-1
(check-expect
  (equal? (list 0 1 2 3 4 5)
          (cons 0 (cons 1 (cons 2 (cons 3 (cons 4 (cons 5 empty)))))))
  true)

;; 13.0.3-2
(check-expect
  (equal? (list (list 'adam 0) (list 'eve 1) (list 'louisXIV 2))
          (cons (cons 'adam (cons 0 empty))
                (cons (cons 'eve (cons 1 empty))
                      (cons (cons 'louisXIV (cons 2 empty))
                            empty))))
  true)

;; 13.0.3-3
(check-expect
  (equal? (list 1 (list 1 2) (list 1 2 3))
          (cons 1
                (cons (cons 1 (cons 2 empty))
                      (cons (cons 1 (cons 2 (cons 3 empty)))
                            empty))))
  true)

(test)

