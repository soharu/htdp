#lang racket

(require lang/htdp-advanced)
(require htdp/testing)

(define address-book empty)

;; add-to-address-book : symbol number  ->  void
(define (add-to-address-book name phone)
  (set! address-book (cons (list name phone) address-book)))

;; lookup : symbol (listof (list symbol number))  ->  number or false
;; to lookup the phone number for name in ab
(define (lookup name ab)
  (cond
    [(empty? ab) false]
    [else (cond
            [(symbol=? (first (first ab)) name)
             (second (first ab))]
            [else (lookup name (rest ab))])]))

;; remove : symbol -> void
(define (remove-from-address-book name)
  (local ((define (remove-from db acc)
            (cond
              [(empty? db) acc]
              [(symbol=? name (first (first db)))
               (append acc (rest db))]
              [else
                (remove-from (rest db) (append acc (list (first db))))])))
         (set! address-book (remove-from address-book empty))))

(begin (add-to-address-book 'Adam 1)
       (add-to-address-book 'Eve 2)
       (add-to-address-book 'Chris 6145384))

;; lookup test
(check-expect (lookup 'Eve address-book) 2)
(check-expect (lookup 'Sam address-book) false)
(check-expect (lookup 'Chirs address-book) 6145384)

;; remove test
(remove-from-address-book 'Same)
address-book
(remove-from-address-book 'Chris)
address-book
(check-expect (lookup 'Chirs address-book) false)

