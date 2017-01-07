#lang planet neil/sicp
(car ''abracadabra)

(car (quote (quote abracadabra)))
; 上式相互等价，进一步写成

(car '(quote abracadabra))