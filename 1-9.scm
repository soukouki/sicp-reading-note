
(+ 4 5)
(if (= 4 0) 5 (inc (+ (dec 4) b)))
(inc (+ (dec 4) 5))
(inc (+ 3 5))
(inc (if (= 3 0) 5 (inc (+ (dec 3) b))))
(inc (inc (+ (dec 3) b)))
(inc (inc (+ 2 b)))
...
(inc (inc (inc (inc (if (= 0 0) 5 (inc (+ (dec 3) b)))))))
(inc (inc (inc (inc 5))))
(inc (inc (inc 6)))
(inc (inc 7))
(inc 8)
9

; これは線形再帰プロセス
