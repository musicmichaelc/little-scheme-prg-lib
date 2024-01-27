(define (ang-hz ang sr)
  "Converts angular frequency `ang` to hertz (cycles per second) according to the sample rate `sr`"
  (/ (* ang sr) (* 2 pi)))

(define (hz-ang hz sr)
  "Converts frequency in hertz (cycles per second) `hz` to angular frequency according to the sample rate `sr`."
  (/ (* 2 pi hz) sr))