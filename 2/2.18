#lang planet neil/sicp
(define (reverse l)
  (define (iter l1 l2)
    (if (null? l1)
        l2
        (iter (cdr l1) (cons (car l1) l2))))
  (iter l nil))
(list 1 2 3 4 5)
(reverse (list 1 2 3 4 5))