#lang racket

(require htdp/testing)

;; Data Definition:
;; ----------------
;; File
(define-struct file (name size content))
;; (make-file n s x)
;;   n - name       symbol
;;   s - size       number
;;   x - content    some scheme value
;;
;; LOF (a list-of-files)
;;   1. empty
;;   2. (cons s lof) where s is a file and lof is a list of file
;;
;; Directory
(define-struct dir (name dirs files))
;; (make-dir n ds fs)
;;   n  - name                  symbol
;;   ds - a list of directories LOD
;;   fs - a list of files       LOF
;;
;; LOD (a list-of-directories)
;;   1. empty
;;   2. (cons s lod) where s is a dir and lod is a list of directories

;; exercise 16.3.1
;; ---------------
(define Docs (make-dir 'Docs
                       empty
                       (list (make-file 'read! 19 empty))))
(define Code (make-dir 'Code
                       empty
                       (list (make-file 'hang 8 empty)
                             (make-file 'draw 2 empty))))
(define Libs (make-dir 'Libs
                       (list Code Docs)
                       empty))
(define Text (make-dir 'Text
                       empty
                       (list (make-file 'part1 99 empty)
                             (make-file 'part2 52 empty)
                             (make-file 'part3 17 empty))))
(define TS (make-dir 'TS
                     (list Text Libs)
                     (list (make-file 'read! 10 empty))))


;; exercise 16.3.2
;; ---------------
(define (how-many-in-dirs a-lod)
  (cond
    [(empty? a-lod) 0]
    [else
      (+ (how-many (first a-lod))
         (how-many-in-dirs (rest a-lod)))]))

(define (how-many a-dir)
  (+ (length (dir-files a-dir))
     (how-many-in-dirs (dir-dirs a-dir))))

(check-expect (how-many TS) 7)
(check-expect (how-many Text) 3)
(check-expect (how-many Libs) 3)
(check-expect (how-many Code) 2)
(check-expect (how-many Docs) 1)

;; exercise 16.3.3
;; ---------------
;; du-flies: lof -> number
(define (du-files a-lof)
  (cond
    [(empty? a-lof) 0]
    [else
      (+ (file-size (first a-lof))
         (du-files (rest a-lof)))]))
;; du-dirs: lod -> number
(define (du-dirs a-lod)
  (cond
    [(empty? a-lod) 0]
    [else
      (+ (du-dir (first a-lod))
         (du-dirs (rest a-lod)))]))
;; du-dir: dir -> number
(define (du-dir a-dir)
  (+ (du-files (dir-files a-dir))
     (du-dirs (dir-dirs a-dir))))

(check-expect (du-dir TS) 207)
(check-expect (du-dir Text) 168)
(check-expect (du-dir Libs) 29)
(check-expect (du-dir Code) 10)
(check-expect (du-dir Docs) 19)

;; du-dirs: lod -> number
(define (du-dirs-improve a-lod)
  (cond
    [(empty? a-lod) 0]
    [else
      (+ (du-dir-improve (first a-lod))
         (du-dirs-improve (rest a-lod)))]))
;; du-dir-improve: dir -> number
(define (du-dir-improve a-dir)
  (cond
    [(empty? a-dir) 0]
    [else
      (+ 1
         (du-files (dir-files a-dir))
         (du-dirs-improve (dir-dirs a-dir)))]))

(check-expect (du-dir-improve TS) 212)
(check-expect (du-dir-improve Text) 169)
(check-expect (du-dir-improve Libs) 32)
(check-expect (du-dir-improve Code) 11)
(check-expect (du-dir-improve Docs) 20)

;; exercise 16.3.4
;; ---------------
;; find?: dir symbol -> boolean
(define (find-files? a-lof name)
  (cond
    [(empty? a-lof) false]
    [(symbol=? (file-name (first a-lof)) name) true]
    [else
      (find-files? (rest a-lof) name)]))

(define (find-dirs? a-lod name)
  (cond
    [(empty? a-lod) false]
    [else
      (or (find? (first a-lod) name)
          (find-dirs? (rest a-lod) name))]))
    
(define (find? a-dir name)
  (or (find-files? (dir-files a-dir) name)
      (find-dirs? (dir-dirs a-dir) name)))

(check-expect (find? TS 'read!) true)
(check-expect (find? TS 'part1) true)
(check-expect (find? TS 'draw) true)
(check-expect (find? Libs 'draw) true)
(check-expect (find? Libs 'part1) false)

(test)

