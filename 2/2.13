#lang planet neil/sicp
(define (make-interval a b)
  (cons a b))

(define (upper-bound x) (cdr x))
(define (lower-bound x) (car x))
(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))
(define (make-center-percent c p)
  (make-center-width c (* c p)))
(make-center-percent 100 .1)
;; ((c + w1)(d + w2) - (c - w1)(d - w2)) / cd
;; -> x2y2 - x1y1
(define (diff-mul x y)
  (- (* (upper-bound x) (upper-bound y))
     (* (lower-bound x) (lower-bound y))))