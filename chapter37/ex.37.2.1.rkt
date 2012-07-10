#lang racket

(require lang/htdp-advanced)
(require htdp/testing)

;; Data Analysis and Definitions:

;; A letter is a symbol in: 'a ... 'z plus '_

;; A word is a (listof letter).

;; A body-part is one of the following symbols:
(define PARTS '(head body right-arm left-arm right-leg left-leg))

;; Constants:
;; some guessing words: 
(define WORDS 
  '((h e l l o)
    (w o r l d)
    (i s)
    (a)
    (s t u p i d)
    (p r o g r a m)
    (a n d)
    (s h o u l d)
    (n e v e r)
    (b e)
    (u s e d)
    (o k a y)
    ))

;; the number of words we can choose from 
(define WORDS# (length WORDS))

;; chosen-word : word
;; the word that the player is to guess
(define chosen-word (first WORDS))

;; status-word : word
;; represents which letters the player has and hasn't guessed
(define status-word (first WORDS))

;; body-parts-left : (listof body-part)
;; represents the list of body parts that are still "available"
(define body-parts-left PARTS)

(define (make-status-word a-word)
  (make-list (length a-word) '_))

;; hangman :  ->  void
;; effect: initialize chosen-word, status-word, and body-parts-left
(define (hangman)
  (begin
    (set! chosen-word (list-ref WORDS (random (length WORDS))))
    (set! status-word (make-status-word chosen-word))
    (set! body-parts-left PARTS)))

(hangman)

chosen-word
status-word

