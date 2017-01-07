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
;1009 *** 4
;1013 *** 4
;1019 *** 4
;#t
;10007 *** 12
;10009 *** 12
;10037 *** 12
;#t
;1000003 *** 116
;1000033 *** 116
;1000037 *** 117
;#t

        
