#lang planet neil/sicp
(define (square x)
  (* x x))
(define (fast-expt b n)
  (define (expt x c a)
    (cond ((= c 0) a)
          ((even? c) (expt (* x x) (/ c 2) a))
          (else (expt x (- c 1) (* x a)))))
  (expt b n 1))
(define (expmod2 base exp m)
  (remainder (fast-expt base exp) m))
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (Remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))
(define (fermat-test n)
  (define (try-it a)
    (= (expmod2 a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-primer? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-primer? n (- times 1)))
        (else false)))

(define (timed-prime-test n)
  ;; (newline)
  ;; (display n)
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (if (fast-primer? n 1)
      (report-prime n (- (runtime) start-time))
      false))

(define (report-prime n elapsed-time)
  (display n)
  (display " *** ")
  (display elapsed-time))


(define (search-for-primes min num)
  (define (auxfun n nu)
    (cond ((= nu 0))
          ((timed-prime-test n) (newline) (auxfun (+ n 1) (- nu 1)))
          (else (auxfun (+ n 1) nu))))
  (auxfun (+ min 1) num))

(search-for-primes 1000 3)
(search-for-primes 10000 3)
(search-for-primes 1000000 3)


;; 基本不能忍了，太慢了
;; 真的把a->[1, n-1]的n次方算出来已经是个很大的数了，花费很多时间
;; output 
;1009 *** 38
;1013 *** 30
;1019 *** 32
;#t
;10007 *** 1250
;10009 *** 782
;10037 *** 921
;#t
;1000003 *** 2746619
;1000033 *** 2152759
;1000037 *** 1960425
;#t
