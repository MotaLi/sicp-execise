#lang racket
(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))
(define (product1 term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (* result (term a)))))
  (iter a 1))

(define (pi)
  (define (next x) (+ x 2))
  (define (term x) (/ (* (- x 1) (+ x 1)) (* x x)))
  (* 4 (product1 term 3 next 10000)))
(exact->inexact (pi))