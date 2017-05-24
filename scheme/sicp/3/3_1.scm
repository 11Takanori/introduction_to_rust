(define (make-accumulator x)
  (lambda (y)
    (set! x (+ x y))
    x))

(define A (make-accumulator 5))

(A 10)

(A 10)
