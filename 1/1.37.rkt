#lang planet neil/sicp
(define (cont-frac n d k)
  (if (= k 1)
      (/ (n k) (d k))
      (/ (n k) (+ (d k) (cont-frac n d (- k 1))))))
(define (cont-frac1 n d k)
  (define (iter t result)
    (if (= t 0)
        result
        (iter (- t 1) (/ (n t) (+ (d n) result)))))
  (iter k 0))
(define (golden-num k)
  (cont-frac1 (lambda (i) 1.0)
           (lambda (i) 1.0)
           k))
(define (aux n)
  (let ((v1 (golden-num (- n 1))) (v2 (golden-num n)))
    (if (< (abs (- v1 v2)) 0.00001) n (aux (+ n 1)))))
(aux 2) ;; 14