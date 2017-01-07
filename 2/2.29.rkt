#lang planet neil/sicp
(define (make-mobile left right)
  (list left right))
(define (make-branch length structure)
  (list length structure))
;; a)
(define (left-branch mobile)
  (car mobile))
(define (right-branch mobile)
  (car (cdr mobile)))
(define (branch-length structure)
  (car structure))
(define (branch-structure structure)
  (car (cdr structure)))
;; b)
(define (total-weight x)
  (define (add branch sum)
    (if (not (pair? (branch-structure branch)))
        (+ sum (branch-structure branch))
        (total-weight (branch-structure branch))))
  (+ (add (left-branch x) 0) (add (right-branch x) 0)))
(define s1 (make-branch 3 4))
(define s2 (make-branch 4 3))
(define m1 (make-mobile s1 s2))
(define s3 (make-branch 1 m1))
(define s4 (make-branch 6 4))
(define m (make-mobile s4 s3))
(total-weight m)
;; c)
(define (balance? m)
  (define (weight branch)
    (if (not (pair? (branch-structure branch)))
        (* (branch-length branch) (branch-structure branch))
        (let ((a (weight (left-branch (branch-structure branch))))
              (b (weight (right-branch (branch-structure branch)))))
              (cond ((= -1 a) -1)
                    ((= -1 b) -1)
                    ((= a b) (+ a b))
                    (else -1)))))
  (let ((a (weight (left-branch m)))
        (b (weight (right-branch m))))
    (and (not (= -1 a)) (= a b))))
(balance? m)
;; d
;; 只需修改 a) 的方法
                  
  
  