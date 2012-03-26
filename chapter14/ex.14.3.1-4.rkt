#lang racket

(require lang/htdp-intermediate)
(require htdp/testing)

;; web page (WP)
;; 1. empty
;; 2. (cons s wp)   : s - symbol, wp - web page
;; 3. (cons ewp wp) : ewp, wp - web page 

(define plain-web-page
  '(The TeachScheme! Project aims to improve the
        problem-solving and organization skills of high
        school students. It provides software and lecture 
        notes as well as exercises and solutions for teachers.))

(define nested-web-page
  '(The TeachScheme Web Page
        Here you can find:
        (LectureNotes for Teachers)
        (Guidance for (DrScheme: a Scheme programming environment))
        (Exercise Sets)
        (Solutions for Exercises)
        For further information: write to scheme@cs))


;; size : WP -> number
;; to count the number of symbols that occur in a-wp
(define (size a-wp)
  (cond
    [(empty? a-wp) 0]
    [(symbol? (first a-wp)) (+ 1 (size (rest a-wp)))]
    [else (+ (size (first a-wp))
             (size (rest a-wp)))]))

(check-expect (size empty) 0)
(check-expect (size (cons 'One empty)) 1)
(check-expect (size (cons (cons 'One empty) empty)) 1)

;; exercise 14.3.1
;; ---------------
;; Template: fun-for-wp : WP -> ??
;;
;; (define (fun-for-wp a-wp)
;;   (cond
;;     [(empty? a-wp) ...]
;;     [(symbol? (first a-wp)) ... (first a-wp) ... (fun-for-wp (rest a-wp)) ...]
;;     [else ... (fun-for-wp (first a-wp)) ... (fun-for-wp (rest a-wp)) ...]
;;       
(check-expect (size plain-web-page) 29)
(check-expect (size nested-web-page) 29)

;; exercise 14.3.2
;; ---------------
;; occur1 : WP symbol -> number
(define (occur1 a-wp s)
  (cond
    [(empty? a-wp) 0]
    [(and (symbol? (first a-wp)) (symbol=? (first a-wp) s))
     (+ 1 (occur1 (rest a-wp) s))]
    [else (occur1 (rest a-wp) s)]))

(check-expect (occur1 '(hello world scheme htdp hello) 'hello) 2)
(check-expect (occur1 '(hello world scheme (htdp hello)) 'hello) 1)

;; occur2 : WP symbol -> number
(define (occur2 a-wp s)
  (cond
    [(empty? a-wp) 0]
    [(list? (first a-wp))
     (+ (occur2 (first a-wp) s) (occur2 (rest a-wp) s))]
    [(symbol=? (first a-wp) s)
     (+ 1 (occur2 (rest a-wp) s))]
    [else (occur2 (rest a-wp) s)]))

(check-expect (occur2 '(hello world scheme htdp hello) 'hello) 2)
(check-expect (occur2 '(hello world scheme (htdp hello)) 'hello) 2)

;; exercise 14.3.3
;; ---------------
;; replace : WP symbol symbol -> WP
(define (replace a-wp new old)
  (cond
    [(empty? a-wp) empty]
    [(list? (first a-wp))
     (cons (replace (first a-wp) new old)
           (replace (rest a-wp) new old))]
    [(symbol=? (first a-wp) old)
     (cons new (replace (rest a-wp) new old))]
    [else (cons (first a-wp)
                (replace (rest a-wp) new old))]))

;;(check-expect
;;  (replace '(hello world scheme htdp hello) 'hi 'hello)
;;  '(hi world scheme htpd hi))
(replace '(hello world scheme htdp hello) 'hi 'hello)

;;(check-expect
;;  (replace '(hello world scheme (htdp hello)) 'hi 'hello)
;;  '(hi world scheme (htpd hi)))
(replace '(hello world scheme (htdp hello)) 'hi 'hello)

;; exercise 14.3.4
;; ---------------
;; depth : WP -> number
(define (depth a-wp)
  (cond
    [(empty? a-wp) 0]
    [(symbol? (first a-wp)) (depth (rest a-wp))]
    [else (max (+ 1 (depth (first a-wp)))
               (depth (rest a-wp)))]))

(check-expect (depth empty) 0)
(check-expect (depth '(a b c d)) 0)
(check-expect (depth '(a (b) c d)) 1)
(check-expect (depth '(a (b) (c (c1 c2 (c3))) (d e (g)))) 3)
(check-expect (depth '(a b (c) (d (e)) (f) (g) h)) 2) 
(check-expect (depth '((c))) 1)
(check-expect (depth '((d (e)))) 2) 
(check-expect (depth '((c) (d (e)))) 2) 
(check-expect (depth '((c (e)) (d))) 2) 
(check-expect (depth nested-web-page) 2)

(test)

