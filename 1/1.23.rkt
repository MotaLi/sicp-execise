#lang planet neil/sicp
(define (square x)
  (* x x))
(define (divides? a b)
  (= (remainder b a) 0))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))
(define (next n)
  (if (= n 2) 3 (+ n 2)))
(define (smallest-divisor n)
  (find-divisor n 2))
(define (primer? n)
  (= n (smallest-divisor n)))

(define (timed-prime-test n)
  ;; (newline)
  ;; (display n)
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (if (primer? n)
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

;output
;1009 *** 3
;1013 *** 3
;1019 *** 3
;#t
;10007 *** 6
;10009 *** 7
;10037 *** 6
;#t
;1000003 *** 68
;1000033 *** 68
;1000037 *** 68
;#t
;会比1.22小，将近一半，尤其是在数越大的情况下越明显
;试除的数量减小为一半，但因为不完全是试除占用的时间，
;还有程序运行的其他开销,数越大需要的试除量就越大，这部分开销占比就高
;就更能看出是一半的关系