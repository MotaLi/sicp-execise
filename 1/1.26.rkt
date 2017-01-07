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
  (cond ((= exp 0) 1)
        ((even? exp)
         (Remainder (* (expmod base (/ exp 2) m)
                       (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod2 base (- exp 1) m))
                    m))))
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

;;慢了，原本expmod函数基本（规模为偶数是）规模就减小一般
;;但显示的乘法把减小的规模重新计算了一边，相当于把计算量补回来了，2333