#lang planet neil/sicp
(define (same-parity x . w)
  (define (iter x w)
    (let ((r (remainder x 2)))
      (if (null? w)
          nil
          (if (= r (remainder (car w) 2))
              (cons (car w) (iter x (cdr w)))
              (iter x (cdr w))))))
  (cons x (iter x w)))
(same-parity 1 2 3 4 5 6 7)
(same-parity 2 3 4 5 6 7)