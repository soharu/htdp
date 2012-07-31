#lang racket

(require lang/htdp-advanced)

;; (define-struct boyfriend (name hair eyes phone))
(define (fm-make-boyfriend name0 hair0 eyes0 phone0)
  (local ((define name name0)
          (define hair hair0)
          (define eyes eyes0)
          (define phone phone0)
          (define (service-manager msg)
            (cond
              [(symbol=? msg 'name) name]
              [(symbol=? msg 'hair) hair]
              [(symbol=? msg 'eyes) eyes]
              [(symbol=? msg 'phone) phone]
              [(symbol=? msg 'set-name)
               (lambda (name-new) (set! name name-new))]
              [(symbol=? msg 'set-hair)
               (lambda (hair-new) (set! hair hair-new))]
              [(symbol=? msg 'set-eyes)
               (lambda (eyes-new) (set! eyes eyes-new))]
              [(symbol=? msg 'set-phone)
               (lambda (phone-new) (set! phone phone-new))]
              [else (error 'boyfriend "...")])))
         service-manager))

(define bf (fm-make-boyfriend 'Collin 'Brown 'Blue 'a11111111))

(symbol=? (bf 'name) 'Collin)
(symbol=? (bf 'hair) 'Brown)
(symbol=? (bf 'eyes) 'Blue)
(symbol=? (bf 'phone) 'a11111111)

((bf 'set-name) 'Bale)
((bf 'set-hair) 'Black)
((bf 'set-eyes) 'gray)
((bf 'set-phone) 'b12341234)

(symbol=? (bf 'name) 'Bale)
(symbol=? (bf 'hair) 'Black)
(symbol=? (bf 'eyes) 'gray)
(symbol=? (bf 'phone) 'b12341234)

