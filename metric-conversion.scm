(define (in-cm inches)
  "Converts inches to centimetres"
  (* 2.54 inches))

(define (cm-in cm)
  "Converts centimetres to inches"
  (/ cm 2.54))

(define (ft-in feet)
  "Converts feet to inches."
  (* 12 feet))

(define (in-ft inches)
  "Convert inches to feet"
  (/ inches 12))

(define (m-cm m)
  "Convert m to cm"
  (* 100 m))

(define (cm-m cm)
  "Convert cm to m"
  (/ cm 100))

(define (ft-m feet)
  "Converts feet into metres"
  (cm-m (in-cm (ft-in feet))))

(define (m-ft m)
  "Converts metres into feet"
  (in-ft (cm-in (m-cm m))))

(define (ft-yd feet)
  "Convert feet to yards"
  (/ feet 3))

(define (yd-ft yards)
  "Converts yards to feet"
  (* yards 3))

(define (yd-m yards)
  "Converts yards to metres"
  (ft-m (yd-ft yards)))

(define (m-yd m)
  "Converts metres to yards"
  (ft-yd (m-ft m)))

(define (yd-mi yards)
  "Converts yards to miles"
  (/ yards 1760))

(define (mi-yd miles)
  "Converts miles to yards"
  (* miles 1760))

(define (m-km m)
  "Convert m to km"
  (/ m 1000))

(define (km-m km)
  "Convert kilometres to metres"
  (* km 1000))

(define (mi-km miles)
  "Converts miles to kilometres"
  (m-km (yd-m (mi-yd miles))))

(define (km-mi km)
  "Converts kilometres to miles"
  (yd-mi (m-yd (km-m km))))