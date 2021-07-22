
; (use text.tree)
(use srfi-27)


(define (square x) (* x x))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m)) m))
        (else
         (remainder
          (* base (expmod base (- exp 1) m)) m))))

(define (fermat-test n)
  (define (try-it a)
    ; (display (tree->string (list "a:" a ",n:" n)))
    ; (newline)
    (= (expmod a n n) a))
  (try-it (+ 1 (random-integer (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) #t)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else #f)))

(define (runtime)
  (use srfi-11)
  (let-values (((a b) (sys-gettimeofday)))
              (+ (* a 1000000) b)))

(define (timed-prime-test n)
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (if (fast-prime? n 4) ; ここの12は調整する必要があるかもしれない
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
(search-for-primes 1000000 1000100)
(search-for-primes 1000000000 1000000200)

; すごい。めっちゃ速い。しかも試行回数は小さくてもうまく行ってる・・・

; 1000付近と1,000,000付近の計算時間の差は3-4倍程度で、log nともあってる気がする
; だけれど、1,000,000,000の計算時間は1,000,000と同じ程度だったので、なぞ
