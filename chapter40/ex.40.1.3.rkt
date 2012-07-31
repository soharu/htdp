#lang racket

(require lang/htdp-advanced)
(require htdp/testing)

;; 1.  (define-struct movie (title producer)
(define (f-make-movie title0 producer0)
  (local ((define title title0)
          (define producer producer0)
          (define (service-manager msg)
            (cond
              [(symbol=? msg 'title) title]
              [(symbol=? msg 'producer) producer]
              [else (error 'movie "...")])))
         service-manager))

(define best-movie (f-make-movie 'DarkNightRise 'ChristopherNolan))
(check-expect (best-movie 'title) 'DarkNightRise)
(check-expect (best-movie 'producer) 'ChristopherNolan)

;; ...

(test)
