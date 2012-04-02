#lang racket

(require lang/htdp-beginner-abbr)

;; employee
(define-struct employee (name ssn pay-rate))

;; work
(define-struct work (employee-name hours))

;; wage
(define-struct wage (employee-name amount))

;; Data Sample:
(define John (make-employee 'John 1000 10.0))
(define John-Work (make-work 'John 10))
(define Ann (make-employee 'Ann 1001 5.0))
(define Ann-Work (make-work 'Ann 8))
(define Tom (make-employee 'Tom 1002 12.0))
(define Tom-Work (make-work 'Tom 5))

;; hours->wages
(define (hours->wages aloe alow)
  (cond
    ((empty? aloe) empty)
    (else
      (cons (weekly-wage (first aloe) (first alow))
            (hours->wages (rest aloe) (rest alow))))))

;; weekly-wage : employee work  -> wage
(define (weekly-wage e w)
  (make-wage (employee-name e)
             (* (employee-pay-rate e)
                (work-hours w))))

(hours->wages (list John Ann Tom) (list John-Work Ann-Work Tom-Work))
;; => (list (wage 'Jonh 100.0) (wage 'Ann 40.0) (wage 'Tom 60.0))

