 ;; left to righ
(define (list-of-values exps env)
  (if (no-operands? exps)
      '()
      (let ((first-eval (eval (first-operand exps) env)))
           (cons first-eval
                 (list-of-values (rest-operands exps) env)))))


 ;; right to left 
(define (list-of-values exps env)
 (if (no-operands? exps)
     '()
     (let ((first-eval (list-of-values (rest-operands exps) env)))
          (cons (eval (first-operand exps) env)
                first-eval))))
