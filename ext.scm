;;; `atom?` definition is taken
;;; from "The Little Schemer" 

(define atom?
  (lambda (x)
    (and (not (pair? x)) (not (null? x))))) 

(define (add1 x)
  (+ x 1))

(define (sub1 x)
  (- x 1))