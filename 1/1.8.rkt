#lang racket
(define (threetime x)
  (* x x x))

(define (average x y) (/ (+ x y) 2))

(define (improve guess x)
  (/ (+ (/ x (* guess guess)) (* 2 guess)) 3))

(define (good-enough? guess x)
  (< (abs (- (threetime guess) x)) 0.0001))

(define (tri-iter guess x)
  (if (good-enough? guess x)
      guess
      (tri-iter (improve guess x)
                 x)))
(define (tri x)
  (tri-iter 1.0 x))