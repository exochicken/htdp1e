#lang racket/base

(require lang/posn)

(require racket/math)

(require htdp/draw)

;;; Section 6.2

(define RED-POSN (make-posn X-BULBS Y-RED))
(define YELLOW-POSN (make-posn X-BULBS Y-YELLOW))
(define GREEN-POSN (make-posn X-BULBS Y-GREEN))

;; Exercise 6.2.1

(define (clear-bulb s)
  (cond
    [(equal? s 'red)
     (and
      (clear-solid-disk RED-POSN BULB-RADIUS 'red)
      (draw-circle RED-POSN BULB-RADIUS 'red))]
    [(equal? s 'yellow)
     (and
      (clear-solid-disk YELLOW-POSN BULB-RADIUS 'yellow)
      (draw-circle YELLOW-POSN BULB-RADIUS 'yellow))]
    [(equal? s 'green)
     (and
      (clear-solid-disk GREEN-POSN BULB-RADIUS 'green)
      (draw-circle GREEN-POSN BULB-RADIUS 'green))]
    [else #f]))

;; Exercise 6.2.3

(define (draw-bulb s)
  (cond
    [(equal? s 'red)
     (draw-solid-disk RED-POSN BULB-RADIUS 'red)]
    [(equal? s 'yellow)
     (draw-solid-disk YELLOW-POSN BULB-RADIUS 'yellow)]
    [(equal? s 'green)
     (draw-solid-disk GREEN-POSN BULB-RADIUS 'green)]
    [else #f]))

;; Exercise 6.2.4

(define (switch a b)
  (and
   (clear-bulb a)
   (draw-bulb b)))

;;; Section 6.3

;; Exercise 6.3.3

(define-struct fighter (acceleration top-speed range))

(define (within-range fighter distance)
  (<= distance (fighter-range fighter)))

(define (reduce-range fighter)
  (make-fighter (fighter-acceleration fighter)
                (fighter-top-speed fighter)
                (* 80/100 (fighter-range fighter))))

;;; Section 6.4

;; Exercise 6.4.2

(define-struct time (hours minutes seconds))

;;; Section 6.5

(define (time->seconds t)
  (+ (time-seconds t)
     (* 60 (time-minutes t))
     (* 3600 (time-hours t))))

;;; Section 6.6

;; Exercise 6.6.1

(define-struct circle (center radius color))

;; Exercise 6.6.2

; XXX: remove

(define (draw-a-circle circle)
  (draw-circle (circle-center circle)
               (circle-radius circle)
               (circle-color circle)))

;; Exercise 6.6.3

(define (in-circle? circle point)
  (>= (circle-radius circle)
      (sqrt
       (+ (sqr (- (posn-x point) (posn-x (circle-center circle))))
          (sqr (- (posn-y point) (posn-y (circle-center circle))))))))

;; Exercise 6.6.4

(define (translate-circle circle delta)
  (let ((new-center
         (make-posn (+ delta (posn-x (circle-center circle)))
                    (posn-y (circle-center circle)))))
    (make-circle new-center
                 (circle-radius circle)
                 (circle-color circle))))

;; Exercise 6.6.5

(define (clear-a-circle circle)
  (clear-circle (circle-center circle)
                (circle-radius circle)
                (circle-color circle)))

;; Exercise 6.6.6

(define (draw-and-clear-circle circle)
  (draw-a-circle circle)
  (sleep-for-a-while 1)
  (clear-a-circle circle))

;; Exercise 6.6.7

(define-struct rectangle (upper-left-corner width height color))

;; Exercise 6.6.8

(define (draw-a-rectangle rectangle)
  (draw-solid-rect (rectangle-upper-left-corner rectangle)
                   (rectangle-width rectangle)
                   (rectangle-height rectangle)
                   (rectangle-color rectangle)))

;; Exercise 6.6.9

(define (in-rectangle? rectangle point)
  (let* ([corner (rectangle-upper-left-corner rectangle)]
         [dx (- (posn-x point) (posn-x corner))]
         [dy (- (posn-y point) (posn-y corner))])
    (and (>= dx 0)
         (< dx (rectangle-width rectangle))
         (>= dy 0)
         (< dy (rectangle-height rectangle)))))

;; Exercise 6.6.10

(define (translate-rectangle rectangle delta)
  (let* ([corner (rectangle-upper-left-corner rectangle)]
         [new-x (+ (posn-x corner) delta)])
    (make-rectangle (make-posn new-x (posn-y corner))
                    (rectangle-width rectangle)
                    (rectangle-height rectangle)
                    (rectangle-color rectangle))))

;; Exercise 6.6.11

(define (clear-a-rectangle rectangle)
  (clear-solid-rect (rectangle-upper-left-corner rectangle)
                    (rectangle-width rectangle)
                    (rectangle-height rectangle)
                    (rectangle-color rectangle)))

;; Exercise 6.6.12

(define (draw-and-clear-rectangle rectangle)
  (draw-a-rectangle rectangle)
  (sleep-for-a-while 1)
  (clear-a-rectangle rectangle))

;;; Section 6.7

(require htdp/hangman)

;; Exercise 6.7.1

; TODO

;; Exercise 6.7.2

(define-struct word (first-letter second-letter third-lettter))

;; Exercise 6.7.3

; TODO
