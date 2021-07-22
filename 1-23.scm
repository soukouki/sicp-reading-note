
(define (square x) (* x x))
(define (even? n) (= (remainder n 2) 0))
(define (smallest-divisor n) (find-divisor n 2))
(define (next n) ; nextを追加
  (if (= n 2) 3
      (+ n 2)))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor))))) ; nextを使うように変更
(define (divides? a b) (= (remainder b a) 0))
(define (prime? n)
  (= n (smallest-divisor n)))

(define (runtime)
  (use srfi-11)
  (let-values (((a b) (sys-gettimeofday)))
              (+ (* a 1000000) b)))

(define (timed-prime-test n)
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime n (- (runtime) start-time))))
(define (report-prime n elapsed-time)
  (display n)
  (display " *** ")
  (display elapsed-time)
  (newline))

(define (search-for-primes n max)
  (if (< n max)
      (search-for-primes-i n max)))
(define (search-for-primes-i n max)
  (timed-prime-test n)
  (search-for-primes (+ n 1) max))

(search-for-primes 1000 1050)
(search-for-primes 10000 10100)
(search-for-primes 100000 100100)
(search-for-primes 1000000 1000100)
(search-for-primes 10000000 10000200)
; それぞれ 3-4, 6-10, 17-25, 60-80, 160-170 となっていて、確かに半分に近い値になっている。
; 半分になってないのは、数で割っていく部分以外の処理の影響があるのではないか
