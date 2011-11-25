#lang racket

;;; Section 2.1

;; Exercise 2.1.1

(sqr 12)  ; squaring a number
(sin 25)
(max 3 2)

;; Exercise 2.1.2

(tan 23)

;;; Section 2.2

;; Exercise 2.2.1

(define (Fahrenheit->Celsius f)
  (* (- f 32) 5/9))

;; Exercise 2.2.2

(define (dollar->euro d)
  (* d 0.72317))

;; Exercise 2.2.3

(define (triangle side height)
  (/ (* side height) 2))

;; Exercise 2.2.4

(define (convert3 a b c)
  (+ (* c 100) (* b 10) a))

;; Exercise 2.2.5

(define (f1 n)
  (+ (* n n) 10))

(define (f2 n)
  (+ (* n n 1/2) 10))

(define (f3 n)
  (- 2 (/ 1 n)))

;;; Section 2.3

(define (wage h)
  (* 12 h))

;; Exercise 2.3.1

(define (tax p)
  (* p 15/100))

(define (netpay h)
  (- (wage h) (tax (wage h))))

;; Exercise 2.3.2

(define (sum-coins p n d q)
  (+ (* p 0.01) (* n 0.05) (* d 0.1) (* q 0.25)))

;; Exercise 2.3.3

(define (total-profit c)
  (- (* 5 c) 20 (* 1/2 c)))
