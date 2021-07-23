

(use srfi-27)

(define (square x) (* x x))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m)) m))
        (else
         (remainder
          (* base (expmod base (- exp 1) m)) m))))

(define (fermat-test n a)
  (= (expmod a n n) a))

(define (fast-prime? n)
  (define (fp-i n i)
    (cond ((= i n) #t)
          ((fermat-test n i) (fp-i n (+ i 1)))
          (else #f)))
  (fp-i n 1))

(fast-prime? 561); 561は3で割り切れる
