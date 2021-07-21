
(define (cubed-root x)

  (define (sqrt-iter guess x)
    (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))
  
  (define (improve guess x)
    (/ (+ (/ x (square guess)) (* 2 guess)) 3))
  
  (define (square x)
    (* x x))

  (define (cube x)
    (* x x x))
  
  (define (good-enough? guess x)
    (< (abs (- (cube guess) x)) (* guess 0.00001)))
    
  (sqrt-iter 1.0 x))
