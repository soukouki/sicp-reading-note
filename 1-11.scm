
; 再帰プロセスでの例
(define (f n)
  (if (< n 3)
    n
    (+ (f (- n 1)) (* 2 (f (- n 2))) (* 3 (f (- n 3))))))
; n=30で1秒かかり、n=32で4秒かかるように

; 反復プロセスでの例
(define (new-f n)
  (if (< n 3)
    n
    (fi 0 1 2 n)))
(define (fi a b c n)
  (if (= n 0)
    a
    (fi b c (+ c (* 2 b) (* 3 a)) (- n 1))))
