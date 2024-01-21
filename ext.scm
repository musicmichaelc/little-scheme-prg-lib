;;; `atom?` definition is taken
;;; from "The Little Schemer" 
(define atom?
  (lambda (x)
    (and (not (pair? x)) (not (null? x)))))
;;;

(define (add1 x)
  (+ x 1))

(define (sub1 x)
  (- x 1))

(define (lat? l)
  "Returns whether `l` is a list comprised of atoms"
  (cond ((null? l)
         #t)
        ((and (atom? (car l)) (list? (cdr l)))
         (lat? (cdr l)))
        (else #f)))

;;; c.f. `lat?` as defined in "The Little Schemer":
(define lat-ls?
  (lambda (l)
    (cond
      ((null? l) #t)
      ((atom? (car l)) (lat? (cdr l)))
      (else #f))))
;;;

