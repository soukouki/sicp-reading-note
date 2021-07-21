
(define (new-if predicute then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (sqrt x)

  (define (sqrt-iter guess x)
    (new-if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

  (define (improve guess x)
    (average guess (/ x guess)))

  (define (average x y)
    (/ (+ x y) 2))

  (define (good-enough? guess x)
    (< (abs (- (square guess) x)) 0.001))
    
  (sqrt-iter 1.0 x))

; 思っていたとおり無限ループが発生している

; new-ifを適用する前にsqrt-iterを評価しようとするため、無限ループが発生してしまう

; これは正規順序評価の仕様に近いものを感じる
; つまりifは適用順序評価されない、特別なものであるということ？
