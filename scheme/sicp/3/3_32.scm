(define the-agenda (make-agenda))
(define and-gate-delay 3)
(define a (make-wire))
(define b (make-wire))
(define c (make-wire))
(probe 'c c)
(and-gate a b c)
(set-signal! b 1)
(propagate) 
