#lang planet neil/sicp
(define (f g)
  (g 2))
(f (lambda (x) (* x x)))
(f (lambda (x) (* x (+ x 1))))

(f f) ;;expected a procedure that can be applied to arguments
;; -> (f 2)
;; 2 不是过程