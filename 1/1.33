#lang planet neil/sicp

(define (square x)
  (* x x))
(define (divides? a b)
  (= (remainder b a) 0))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))
(define (smallest-divisor n)
  (find-divisor n 2))
(define (primer? n)
  (= n (smallest-divisor n)))

(define (accumlate combiner null-value term a next b filter?)
  (define (iter a result)
    (cond ((> a b) result)
          ((filter? a) (iter (next a) (combiner result (term a))))
          (else (iter (next a) result))))
  (iter a null-value))

;; a)
(define (sum-primer a b)
  (accumlate (lambda (x y) (+ x y)) 0 (lambda (x) x) a (lambda (x) (+ x 1)) b primer?))

;;(sum-primer 2 9) ;; 2 + 3 + 5 + 7 = 17

;; b)
(define (gcd x y)
  (if (= y 0)
      x
      (gcd y (remainder x y))))
(define (multi-elems n)
  (accumlate (lambda (x y) (* x y))
             1
             (lambda (x) x)
             2
             (lambda (x) (+ x 1))
             n
             (lambda (x) (= (gcd n x) 1))))

(multi-elems 2)
(multi-elems 8) ;; 3 * 5 * 7 = 105



