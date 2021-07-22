
(define (double x) (* x 2))
(define (halve x) (/ x 2))
(define (even? n) (= (remainder n 2) 0))

(define (mul b n) (muli 0 b n))
(define (muli a b n)
  (cond ((= n 1) (+ a b))
        ((even? n) (muli a (double b) (halve n)))
        (else (muli (+ a b) b (- n 1)))))
