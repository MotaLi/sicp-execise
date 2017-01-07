#lang planet neil/sicp
(define (square x) (* x x))
(define (square-list1 items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons (square (car things))
                    answer))))
  (iter items nil))

;; version 2
(define (square-list2 items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (square (car things))))))
  (iter items nil))

(square-list1 (list 1 2 3 4))
;; (mcons 16 (mcons 9 (mcons 4 (mcons 1 '()))))

(square-list2 (list 1 2 3 4))
;; (mcons (mcons (mcons (mcons '() 1) 4) 9) 16)