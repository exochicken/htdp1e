#lang racket

;;; Section 4.2

;; Exercise 4.2.1

(define (f1 n)
  (and (> n 3) (<= n 7)))

(define (f2 n)
  (and (>= n 3) (<= n 7)))

(define (f3 n)
  (and (>= n 3) (< n 9)))

(define (f4 n)
  (or
    (and (> n 1) (< n 3))
    (and (> n 9) (< n 11))))

(define (f5 n)
  (not
    (and (>= n 1) (<= n 3))))

;; Exercise 4.2.3

(define (f6 n)
  (= 62 (+ (* 4 n) 2)))

(define (f7 n)
  (= 102 (* 2 n n)))

(define (f8 n)
  (= 462 (+ (* 4 n n) (* 6 n) 2)))

;;; Section 4.4

;; Exercise 4.4.1

(define (interest-rate amount)
  (cond
    [(<= amount 1000) 4]
    [(<= amount 5000) 4.5]
    [else 5]))

(define (interest amount)
  (* (interest-rate amount) amount))

;; Exercise 4.4.2

(define (tax-rate pay)
  (cond
    [(and (>= pay 0) (<= pay 240)) 0]
    [(<= pay 480) 15]
    [else 28]))

(define (tax pay)
  (* (tax-rate pay) pay))

(define (pay hours)
  (* 12 hours))

(define (netpay hours)
  (- (pay hours) (tax (pay hours))))

;; Exercise 4.4.3

(define (pay-back amount)
  (cond
    [(and (>= amount 0) (<= amount 500))
      (* 0.25 1/100 amount)]
    [(<= amount 1500)
      (+
        (* 0.25 1/100 500)
        (* 0.5 1/100 (- amount 500)))]
    [(<= amount 2500)
      (+
        (* 0.25 1/100 500)
        (* 0.5 1/100 1500)
        (* 0.75 1/100 (- amount 1500)))]
    [else
      (+
        (* 0.25 1/100 500)
        (* 0.5 1/100 1500)
        (* 0.75 1/100 2500)
        (* 1/100 (- amount 2500)))]))

;; Exercise 4.4.4

(define (how-many a b c)
  (cond
    [(> (* b b) (* 4 a c)) 2]
    [(= (* b b) (* 4 a c)) 1]
    [else 0]))
