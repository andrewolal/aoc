(load "~/code/advent/load.ss")
(advent-year 17)
(advent-day 22)

(define (turn-right dir) (* dir 0-i))
(define (turn-left dir) (* dir 0+i))

(define grid
  (parse-advent lines-raw))

(define m
  (make-eqv-hashtable))

(define (init)
  (define d (ash (length grid) -1))
  (do ((x (- d) (1+ x)))
      ((< d x))
    (do ((y (- d) (1+ y)))
        ((< d y))
      (when (eqv? #\# (string-ref (list-ref grid (+ d x))
                                  (+ d y)))
        (hashtable-set! m (make-rectangular y (- x)) 'infected)))))

(define (sim n)
  (define dir 0+i)
  (define loc 0)
  (define a 0)
  (set! m (make-eqv-hashtable))
  (init)
  (do ((i 0 (1+ i)))
      ((= i n) a)
    (when (zero? (mod i 100000))
      (format #t "~,2f% ~a~%" (/ i n 1/100) a))
    (case (hashtable-ref m loc 'clean)
      ((infected)
       (set! dir (turn-right dir))
       (hashtable-set! m loc 'flagged))
      ((flagged)
       (set! dir (- dir))
       (hashtable-delete! m loc))
      ((weakened)
       (inc! a)
       (hashtable-set! m loc 'infected))
      ((clean)
       (set! dir (turn-left dir))
       (hashtable-set! m loc 'weakened)))
    (set! loc (+ loc dir))))
