#lang planet neil/sicp

(define (fast-expt b n)
  (define (expt x c a)
    (cond ((= c 0) a)
          ((even? c) (expt (* x x) (/ c 2) a))
          (else (expt x (- c 1) (* x a)))))
  (expt b n 1))
(fast-expt 2 4)
(fast-expt 2 6)
;; (expt 2 6 1)
;; -> (expt 4 3 1)
;; -> (expt 4 2 4)
;; -> (expt 16 1 4)
;; -> (expt 16 0 64)
;; -> 64
(fast-expt 3 3)