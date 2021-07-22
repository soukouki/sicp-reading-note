
(define (square x) (* x x))
(define (even? n) (= (remainder n 2) 0))

(define (fast-expt b n)
  (fe b 1 n))

(define (fe b a n)
  (cond ((= n 1) (* a b))
        ((even? n) (fe (square b) a (/ n 2)))
        (else (fe b (* a b) (- n 1)))))
; a*b^1 = ab
; a*b^2n = a*(b^2)^n
; a*b^n = ab*b^(n-1)
