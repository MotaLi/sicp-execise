#lang planet neil/sicp
(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))
(define (fold-right op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (fold-right op initial (cdr sequence)))))

(fold-right / 1 (list 1 2 3)) ;; 1 / (2 / (3 / 1)) => 3/2
(fold-left / 1 (list 1 2 3)) ;; 1 / 1 / 2 / 3 => 1/6

(fold-right list nil (list 1 2 3))
(mcons 1 (mcons (mcons 2 (mcons (mcons 3 (mcons '() '())) '())) '()))

(fold-left list nil (list 1 2 3))
(mcons (mcons (mcons '() (mcons 1 '())) (mcons 2 '())) (mcons 3 '()))