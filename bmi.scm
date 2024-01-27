(define (bmi height weight)
  "Calculates the BMI using height (in metres) and weight (in kilograms)"
  (/ weight (expt height 2)))

(define (bmi-weight bmi height)
  "Calculates the corresponding weight from the inputted bmi and height (in metres; returns kilograms)"
  (* bmi (expt height 2)))