#lang planet neil/sicp

(define tolerance .00001)
(define (fixed-point f first-guess next_f)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (display guess)
    (newline)
    (let ((next (next_f f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))
(define init 20)
(fixed-point (lambda (x) (/ (log 1000) (log x))) init (lambda (f guess) (f guess)))
(fixed-point (lambda (x) (/ (log 1000) (log x))) init (lambda (f guess) (/ (+ guess (f guess)) 2)))
;; 平均阻尼迭代次数更少