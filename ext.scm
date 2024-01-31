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
;;;
;;; `member?` definition from "The Little Schemer":
(define member?
  (lambda (a lat)
    (cond
      ((null? lat) #f)
      (else (or (eq? (car lat) a)
              (member? a (cdr lat)))))))
;;;
;;;
;;; `rember` from "The Little Schemer":
;;; (Removes the first occurrence of `a` in `lat`):
(define rember
  (lambda (a lat)
    (cond
      ((null? lat) (quote ()))
      ((eq? (car lat) a) (cdr lat))
      (else (cons (car lat)
              (rember a (cdr lat)))))))

(define (multirember a lat)
  "Removes all occurrences of `a` in `lat`"
  (cond
    ((null? lat)
     (quote ()))
    ((eq? (car lat) a)
     (multirember a (cdr lat)))
    (else (cons (car lat)
                (multirember a (cdr lat))))))

(define (firsts l)
  "Returns a list comprised of the first element of each list inside the list `l`"
  (cond
    ((null? l) (quote ()))
    (else (cons (car (car l)) 
            (firsts (cdr l))))))

(define (insertR new old lat)
  "Returns a new `lat` (list of atoms) in which `new` is inserted to the right of the first occurrence of `old` in `lat` (a list of atoms)." 
  (cond
    ((null? lat)
     (quote ()))
    ((eq? old (car lat))
     (cons (car lat) (cons new (cdr lat))))
    (else (cons (car lat) (insertR new old (cdr lat))))))

(define (insertL new old lat)
  "Returns a new `lat` (list of atoms) in which `new` is inserted to the left of the first occurrence of `old` in `lat` (a list of atoms)." 
  (cond
    ((null? lat)
     (quote ()))
    ((eq? old (car lat))
     (cons new lat))
    (else (cons (car lat) (insertL new old (cdr lat))))))

(define (subst new old lat)
  "Returns a new `lat` (list of atoms) in which the first occurrence of `old` in `lat` is replaced by `new`." 
  (cond
    ((null? lat)
     (quote ()))
    ((eq? old (car lat))
     (cons new (cdr lat)))
    (else (cons (car lat) (subst new old (cdr lat))))))

(define (subst2 new o1 o2 lat)
  "Returns a new `lat` (list of atoms) in which either the first occurrence of `o1` or of `o2` -- whichever one occurs first -- in `lat` is replaced by `new`." 
  (cond
    ((null? lat)
     (quote ()))
    ((or (eq? o1 (car lat)) (eq? o2 (car lat)))
     (cons new (cdr lat)))
    (else (cons (car lat) (subst2 new o1 o2 (cdr lat))))))

(define (multiinsertR new old lat)
  "Returns a new list of atoms in which `new` is inserted to the right of each occurrence of `old` in `lat` (a list of atoms)." 
  (cond
    ((null? lat)
     (quote ()))
    ((eq? old (car lat))
     (cons (car lat) (cons new (multiinsertR new old (cdr lat)))))
    (else (cons (car lat) (multiinsertR new old (cdr lat))))))

(define (multiinsertL new old lat)
  "Returns a new `lat` (list of atoms) in which `new` is inserted to the left of the first occurrence of `old` in `lat` (a list of atoms)." 
  (cond
    ((null? lat)
     (quote ()))
    ((eq? old (car lat))
     (cons new (cons old (multiinsertL new old (cdr lat)))))
    (else (cons (car lat) (multiinsertL new old (cdr lat))))))
