#lang racket

(require lang/htdp-beginner-abbr)
(require htdp/testing)

;; Data Definition:
;; ----------------
;; File
;;   - symbol
;; Directory
;;   1. empty
;;   2. (cons f g) when f is a file and d is a directory
;;   3. (cons d1 d2) when d1 and d2 are directories

;; exercise 16.2.1
;; ---------------
(define Docs (list 'read!))
(define Code (list 'hang 'draw))
(define Libs (list Code Docs))
(define Text (list 'part1 'part2 'part3))
(define TS (list Text Libs 'read!))

;; exercise 16.2.2
;; ---------------
(define (how-many fs)
  (cond
    [(empty? fs) 0]
    [(symbol? (first fs)) (+ 1 (how-many (rest fs)))]
    [else (+ (how-many (first fs))
             (how-many (rest fs)))]))

(check-expect (how-many TS) 7)
(check-expect (how-many Text) 3)
(check-expect (how-many Libs) 3)
(check-expect (how-many Code) 2)
(check-expect (how-many Docs) 1)

(test)

