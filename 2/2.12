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