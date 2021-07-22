
(define (cube x) (* x x x))
(define (p x) (- (* 3 x) (* 4 (cube x))))
(define (small-enough? angle) (< (abs angle) 0.001))
(define (sine angle)
  (if (small-enough? angle)
    angle
    (p (sine (/ angle 3.0)))))

; 2^5 = 32回

; 2^(aを3で割るとき0.1よりも小さくなるまでの割る回数)
; 2^(log3 10a)
