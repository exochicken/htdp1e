#lang racket

;;; Section 3.1

;; Exercise 3.1.1

; TODO: link to ex_3_1_1.png

;; Exercise 3.1.4

(define (attendees ticket-price)
  (+ 120
     (* (/ 15 .10) (- 5.00 ticket-price))))

(define (cost ticket-price)
  (* 1.5 (attendees ticket-price)))

;;; Section 3.2

;; Exercise 3.2.1

(define FIXED-COST 180)
(define COST-PER-ATTENDEE 0.04)

(define (cost2 ticket-price)
  (+ FIXED-COST
     (* COST-PER-ATTENDEE (attendees ticket-price))))

;;; Section 3.3

;; Exercise 3.3.1

(define (inches->cm in)
  (* 2.54 in))

(define (feet->inches fe)
  (* 12 fe))

(define (yards->feet ya)
  (* 3 ya))

(define (rods->yards ro)
  (* 5.5 ro))

(define (furlongs->rods fu)
  (* 40 fu))

(define (miles->furlongs mi)
  (* 8 mi))

(define (feet->cm fe)
  (inches->cm
    (feet->inches fe)))

(define (yards->cm ya)
  (feet->cm
    (yards->feet ya)))

(define (rods->inches ro)
  (feet->inches
    (yards->feet
      (rods->yards ro))))

(define (miles->feet mi)
  (yards->feet
    (rods->yards
      (furlongs->rods
        (miles->furlongs mi)))))

;; Exercise 3.3.2

(define (volume-cylinder radius height)
  (* pi radius radius height))

;; Exercise 3.3.3

(define (area-cylinder radius height)
  (* 2 pi radius height))

;; Exercise 3.3.4

(define (circle-area radius)
  (* pi radius radius))

(define (area-pipe inner-radius length thickness)
  (+
    (area-cylinder (+ inner-radius thickness) length)
    (area-cylinder inner-radius length)
    (* -4 (circle-area inner-radius))))

;; Exercise 3.3.5

; TODO

;; Exercise 3.3.6

; TODO
