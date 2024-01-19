(load "math.scm")

(define (f-to-c f)                                                                   
  "Converts Fahrenheit `f` to Celsius. Returns number as a fraction if possible (unless it is an integer)."
  (* (- f 32) 5/9))

(define (c-to-f c)                                                                   
	"Converts Celsius `c` to Fahrenheit. Returns number as a fraction if possible (unless it is an integer)."
  (+ 32 (* c 9/5)))

(define (fc f)
  "Converts Fahrenheit `f` to Celsius. Returns result as a human readable string, i.e. as a mixed fraction if it is not a whole number."
	(hr-ratio (f-to-c (exact f))))

(define (cf c)
  "Converts Celsius `c` to Fahrenheit. Returns result as a human readable string (i.e. as a mixed fraction."
	(hr-ratio (c-to-f (exact c))))
