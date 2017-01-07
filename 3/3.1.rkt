#lang planet neil/sicp
(define (make-accumulator x)
  (lambda (v) (begin (set! x (+ x v)) x)))
(define A (make-accumulator 5))
(A 10)
(A 10)