#lang planet neil/sicp
(define dx 0.001)
(define (smooth f)
  (lambda (x) (/ (+ (f x) (f (+ x dx)) (f (- x dx))) 3)))
(define (repeated f n)
  (lambda (x) (if (= n 1) (f x) (f ((repeated f (- n 1)) x)))))

