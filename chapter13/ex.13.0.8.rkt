#lang racket

(require htdp/testing)

;; 13.0.8-1
(check-expect
  (equal? '(1 a 2 b 3 c)
          (list 1 'a 2 'b 3 'c))
  true)

;; 13.0.8-2
(check-expect
  (equal? '((alan 1000) (barb 2000) (carl 1500) (dawn 2300))
          (list (list 'alan 1000)
                (list 'barb 2000)
                (list 'carl 1500)
                (list 'dawn 2300)))
  true)

;; 13.0.8-3
(check-expect
  (equal?
    '((My First Paper)
      (Sean Fisler)
      (Section 1
               (Subsection 1 Life is difficult)
               (Subsection 2 But learning things makes it interesting))
      (Section 2
               Conclusion? What conclusion?))
    (list (list 'My 'First 'Paper)
          (list 'Sean 'Fisler)
          (list 'Section
                1
                (list 'Subsection 1 'Life 'is 'difficult)
                (list 'Subsection 2
                      'But 'learning 'things 'makes 'it 'interesting))
          (list 'Section 2 'Conclusion? 'What 'conclusion?)))
  true)

(test)

