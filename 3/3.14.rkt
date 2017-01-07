#lang planet neil/sicp
(define (mystery x)
  (define (loop x y)
    (if (null? x)
        y
        (let ((tmp (cdr x)))
          (set-cdr! x y)
          (loop tmp x))))
  (loop x '()))
(define v (list 'a 'b 'c 'd))
(display v);(a b c d)
(newline)
(define w (mystery v))

(display v);(a)
(newline)
(display w);(d c b a)