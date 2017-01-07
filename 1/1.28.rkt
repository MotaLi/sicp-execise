#lang planet neil/sicp
(define (square x)
  (* x x))
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((nontrivial-square-root? base m)
         0)
        ((even? exp)
         (Remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (nontrivial-square-root? base m)
  (and (not (= base 1))
       (not (= base (- m 1)))
       (= 1 (remainder (square base) m))))
(define (non-zero-random n)
  (+ 1 (random (- n 1))))

  
(define (miller-rabin-test n)
  (define (test-iter n times)
    (cond ((= times 0) true)
          ((= (expmod (non-zero-random n) (- n 1) n)
              1)
           (test-iter n (- times 1)))
          (else false)))
  (test-iter n (ceiling (/ n 2))))

(miller-rabin-test 1385203)

(miller-rabin-test 561)
(miller-rabin-test 1105)
(miller-rabin-test 1729)
(miller-rabin-test 2465)
(miller-rabin-test 2821)
(miller-rabin-test 6601)


  