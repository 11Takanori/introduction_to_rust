(define (element-of-set? x set)
  (cond ((null? set) #f)
        ((= x (car set)) #t)
        ((< x (car set)) #f)
        (else (element-of-set? x (cdr set)))))

(define (adjoin-set x set)
  (cond ((null? set) (list x))
        ((= x (car set)) set)
        ((< x (car set)) (cons x set))
        (else (cons (car set) (adjoin-set x (cdr set))))))

(define (intersection-set set1 set2)
  (if (or (null? set1) (null? set2))
      ()
      (let ((x1 (car set1)) (x2 (car set2)))
        (cond ((= x1 x2)
               (cons x1
                     (intersection-set (cdr set1)
                                       (cdr set2))))
              ((< x1 x2)
               (intersection-set (cdr set1) set2))
              ((< x2 x1)
               (intersection-set set1 (cdr set2)))))))

(define (union-set set1 set2)
  (cond ((null? set1) set2)
        ((null? set2) set1)
        (else
              (let ((x1 (car set1)) (x2 (car set2)))
                   (cond ((= x1 x2)
                             (cons x1 (union-set (cdr set1)
                                                 (cdr set2))))
                         ((< x1 x2)
                             (cons x1 (union-set (cdr set1)
                                                 set2)))
                         ((> x1 x2)
                             (cons x2 (union-set set1
                                                 (cdr set2)))))))))



(union-set (list 1 3 4) (list 4 5 6)) ; => (1 3 4 5 6)
