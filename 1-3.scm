
; ちょっと汚い感じですね・・・
(define (f a b c)
	(cond
		((or (> a b c) (> b a c)) (+ (* a a) (* b b)))
		((or (> a c b) (> c a b)) (+ (* a a) (* c c)))
		(else (+ (* b b) (* c c)))))
