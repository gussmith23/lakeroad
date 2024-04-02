#lang rosette

(require rosette
         "json-to-gator.rkt"
         "gator-interpreter.rkt"
         (prefix-in gator: "gator-language.rkt"))

(define-symbolic a (~> integer? (bitvector 8)))
(define-symbolic b (~> integer? (bitvector 8)))
(define-symbolic op (~> integer? (bitvector 1)))

(define sketch (gen-gator-prog (read-json-file "ALU.json")))

(define env
  (lambda (symbol)
    (match symbol
      ["a" a]
      ["b" b]
      ["op" op]
      [else (error 'env (format "unbound variable ~a" symbol))])))

(define spec
  (list (gator:op 1 (list 2 3))
        (gator:func 'And)
        (gator:var 4 6)
        (gator:var 5 6)
        (gator:string "a")
        (gator:string "b")
        (gator:int 1)))

(define-symbolic t integer?)

(define model
  (synthesize #:forall (list a b t)
              #:guarantee (begin
                            (assume (> t 0))
                            (assert (bveq (gator-interpret sketch env 10 t '())
                                          (gator-interpret spec env 0 t '()))))))

(evaluate (gator-interpret elements env 10 t '()) model)
