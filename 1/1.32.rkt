#lang planet neil/sicp
(define (accumlate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
         (accumlate combiner null-value term (next a) next b))))

(define (accumlate1 combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (combiner result (term a)))))
  (iter a null-value))

(define (sum term a next b)
  (define (com a b) (+ a b))
  (accumlate1 com 0 term a next b))

(define (product term a next b)
  (define (com a b) (* a b))
  (accumlate1 com 1 term a next b))

(sum (lambda (x) (* x x)) 1 (lambda (x) (+ x 1)) 2)
(product (lambda (x) (* x x)) 2 (lambda (x) (+ x 1)) 3)