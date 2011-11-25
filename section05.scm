#lang racket

;;; Section 5.1

;; Exercise 5.1.2

(define (check-guess guess target)
  (cond
    [(< guess target) 'TooSmall]
    [(> guess target) 'TooLarge]
    [else 'Perfect]))

;; Exercise 5.1.3

; I cheat and reuse the previous function
(define (check-guess3 a b c target)
  (let ((guess (+ (* c 100) (* b 10) a)))
    (check-guess guess target)))

;; Exercise 5.1.4

; TODO: clean exercise 4.4.4 with delta and let
(define (what-kind a b c)
  (cond
    [(= a 0) 'degenerate]
    [else
     (let ((delta (- (* b b) (* 4 a c))))
       (cond
         [(> delta 0) 'two]
         [(= delta 0) 'one]
         [else 'none]))]))

;; Exercise 5.1.5

(define (check-color target1 target2 guess1 guess2)
  (cond
    [(and (symbol=? target1 guess1) (symbol=? target2 guess2)) 'Perfect]
    [(or (symbol=? target1 guess1) (symbol=? target2 guess2)) 'OneColorAtCorrectPosition]
    [(or (symbol=? target1 guess2) (symbol=? target2 guess1)) 'OneColorOccurs]
    [else 'NothingCorrect]))
