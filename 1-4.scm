
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

; if式は演算子+または-を返し、それを使って計算する