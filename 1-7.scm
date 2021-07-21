
; 今思ったが、全体をコピーするのはなんだかバカバカしいので、次からは関数内関数の使用を控えたほうが良さそう
(define (sqrt x)

  (define (sqrt-iter guess x)
    (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

  (define (improve guess x)
    (average guess (/ x guess)))

  (define (average x y)
    (/ (+ x y) 2))

  (define (good-enough? guess x)
    (< (abs (- (square guess) x)) (* guess 0.00001)))
    
  (sqrt-iter 1.0 x))