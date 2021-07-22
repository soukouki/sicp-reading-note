
(define (double x) (* x 2))
(define (halve x) (/ x 2))
(define (even? n) (= (remainder n 2) 0))

(define (mul b n) (muli 0 b n))
(define (muli a b n)
  (cond ((= n 1) (+ a b))
        ((even? n) (muli a (double b) (halve n)))
        (else (muli (+ a b) b (- n 1)))))

(define (square x) (mul x x))

(define (fast-expt b n)
  (fe b 1 n))

(define (fe b a n)
  (cond ((= n 1) (mul a b))
        ((even? n) (fe (square b) a (/ n 2)))
        (else (fe b (mul a b) (- n 1)))))
