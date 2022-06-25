#lang racket

(provide main)

(require rosette
         rosette/lib/synthax
         "interpreter.rkt")

(define-namespace-anchor anc)
(define ns (namespace-anchor->namespace anc))

(define (main)

  ; Get file contents.
  (define file-contents (port->string (current-input-port) #:close? #t))

  (define prog (eval (read (open-input-string file-contents)) ns))

  (define-symbolic logical-input-0 (bitvector 8))
  (define-symbolic logical-input-1 (bitvector 8))
  (define-symbolic logical-input-2 (bitvector 8))
  (define-symbolic logical-input-3 (bitvector 8))
  (define-symbolic logical-input-4 (bitvector 8))
  (define-symbolic logical-input-5 (bitvector 8))
  (define logical-inputs
    (list logical-input-0
          logical-input-1
          logical-input-2
          logical-input-3
          logical-input-4
          logical-input-5))
  (define expr
    `(first (physical-to-logical-mapping
             (bitwise)
             (ultrascale-plus-clb ,(?? (bitvector 1))
                                  ,(?? (bitvector 64))
                                  ,(?? (bitvector 64))
                                  ,(?? (bitvector 64))
                                  ,(?? (bitvector 64))
                                  ,(?? (bitvector 64))
                                  ,(?? (bitvector 64))
                                  ,(?? (bitvector 64))
                                  ,(?? (bitvector 64))
                                  ,(?? (bitvector 2))
                                  ,(?? (bitvector 2))
                                  ,(?? (bitvector 2))
                                  ,(?? (bitvector 2))
                                  ,(?? (bitvector 2))
                                  ,(?? (bitvector 2))
                                  ,(?? (bitvector 2))
                                  ,(?? (bitvector 2))
                                  (logical-to-physical-mapping (bitwise) ,logical-inputs)))))

  ; Unused logical inputs which we will assume are zero.
  (define assume-zero
    (match (procedure-arity prog)
      [1 (list logical-input-1 logical-input-2 logical-input-3 logical-input-4 logical-input-5)]
      [2 (list logical-input-2 logical-input-3 logical-input-4 logical-input-5)]
      [3 (list logical-input-3 logical-input-4 logical-input-5)]
      [4 (list logical-input-4 logical-input-5)]
      [5 (list logical-input-5)]
      [6 (list)]))

  ; Used logical inputs.
  (define inputs
    (match (procedure-arity prog)
      [1 (list logical-input-0)]
      [2 (list logical-input-0 logical-input-1)]
      [3 (list logical-input-0 logical-input-1 logical-input-2)]
      [4 (list logical-input-0 logical-input-1 logical-input-2 logical-input-3)]
      [5 (list logical-input-0 logical-input-1 logical-input-2 logical-input-3 logical-input-4)]
      [6
       (list logical-input-0
             logical-input-1
             logical-input-2
             logical-input-3
             logical-input-4
             logical-input-5)]))

  (define model
    (synthesize #:forall (list logical-input-0
                               logical-input-1
                               logical-input-2
                               logical-input-3
                               logical-input-4
                               logical-input-5)
                #:guarantee (begin
                              ; Assume unused logical inputs are zero.
                              (for-each (lambda (v) (assume (bvzero? v))) assume-zero)
                              ; Assert that the function applied over the inputs equals the expected
                              ; output.
                              (assert (bveq (apply prog inputs) (interpret expr))))))

  ; For now just return whether or not we could synthesize anything.
  (exit (if (unsat? model) 1 0)))
