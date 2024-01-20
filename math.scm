(define (mixed-fraction r)
  "Converts ratio `r` to a mixed fraction -- returns a pair with an integer (in the `car`) and the leftover fraction (in the `cdr`)"
  (cons (floor r) (- r (floor r))))

(define (hr-ratio r)
  "Gives a human readable form of the ratio `r` -- that is, converts it to a mixed fraction and returns it in string form"
  (let ((cfr (mixed-fraction r)))
    (if (zero? (cdr cfr))
        (number->string (car cfr))
        (string-append 
          (number->string (car cfr)) 
          " " 
          (number->string (cdr cfr))))))

(define (factorial n)                                                                
  "Computes the factorial n! of n"
  (if (zero? n)
      1
      (* n (apply * (cdr (iota n))))))	
(define (factorial-2 n)
  "Computes the factorial of n (using tail recursive function)"
  (if (zero? n)
      1
      ; n! = n * (n - 1)!
      (* n (factorial (- n 1)))))