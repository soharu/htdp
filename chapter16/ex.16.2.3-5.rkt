#lang racket

(require lang/htdp-beginner-abbr)
(require htdp/testing)

;; Data Definition:
;; ----------------
(define-struct dir (name content))
;; Directory
;;   (make-dir n c): n - symbol, c - a list of files and directories
;;
;; LOFD (a list-of-files-and-directories)
;;   1. empty
;;   2. (cons f d) where f is a file and d is a LOFD
;;   3. (cons d1 d2) where d1 is a dir and d2 is a LOFD

;; excercise 16.2.3
;; ----------------
(define-struct dir-ex (name content size attribute))
;; (make-dir-ex (n c s a))
;;   n - symbol, c - list, s - number, a - symbol

;; exercise 16.2.4
;; ---------------
(define Docs (make-dir 'Docs (list 'read!)))
(define Code (make-dir 'Code (list 'hang 'draw)))
(define Libs (make-dir 'Libs (list Code Docs)))
(define Text (make-dir 'Text (list 'part1 'part2 'part3)))
(define TS (make-dir 'TS (list Text Libs 'read!)))

;; exercise 16.2.5
;; ---------------
;; how-many-lofd: list -> number
(define (how-many-lofd a-lofd)
  (cond
    [(empty? a-lofd) 0]
    [(symbol? (first a-lofd))
     (+ 1 (how-many-lofd (rest a-lofd)))]
    [else
      (+ (how-many (first a-lofd))
         (how-many-lofd (rest a-lofd)))]))

;; how-many: dir -> number
(define (how-many a-dir)
  (how-many-lofd (dir-content a-dir)))

(check-expect (how-many TS) 7)
(check-expect (how-many Text) 3)
(check-expect (how-many Libs) 3)
(check-expect (how-many Code) 2)
(check-expect (how-many Docs) 1)

(test)

