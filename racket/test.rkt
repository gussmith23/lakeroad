#lang racket

(provide main)

(require rosette
         "ultrascale.rkt")

(define-namespace-anchor anc)
(define ns (namespace-anchor->namespace anc))

(define (main)

  ; Get file contents.
  (define file-contents (port->string (current-input-port) #:close? #t))

  (define prog (eval (read (open-input-string file-contents)) ns))

  (define-symbolic cin (bitvector 1))
  (define-symbolic lut-memory-a (bitvector 128))
  (define-symbolic lut-memory-b (bitvector 128))
  (define-symbolic lut-memory-c (bitvector 128))
  (define-symbolic lut-memory-d (bitvector 128))
  (define-symbolic lut-memory-e (bitvector 128))
  (define-symbolic lut-memory-f (bitvector 128))
  (define-symbolic lut-memory-g (bitvector 128))
  (define-symbolic lut-memory-h (bitvector 128))

  (define-symbolic logical-input-0 (bitvector 8))
  (define-symbolic logical-input-1 (bitvector 8))
  (define-symbolic logical-input-2 (bitvector 8))
  (define-symbolic logical-input-3 (bitvector 8))
  (define-symbolic logical-input-4 (bitvector 8))
  (define-symbolic logical-input-5 (bitvector 8))

  (define out
    (apply interpret-ultrascale-plus-clb
           (ultrascale-plus-clb (ultrascale-plus-lut6-2 lut-memory-a)
                                (ultrascale-plus-lut6-2 lut-memory-b)
                                (ultrascale-plus-lut6-2 lut-memory-c)
                                (ultrascale-plus-lut6-2 lut-memory-d)
                                (ultrascale-plus-lut6-2 lut-memory-e)
                                (ultrascale-plus-lut6-2 lut-memory-f)
                                (ultrascale-plus-lut6-2 lut-memory-g)
                                (ultrascale-plus-lut6-2 lut-memory-h))
           cin
           (ultrascale-logical-to-physical-inputs logical-input-0
                                                  logical-input-1
                                                  logical-input-2
                                                  logical-input-3
                                                  logical-input-4
                                                  logical-input-5)))

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
                              (assert (bveq (apply prog inputs) out)))))

  ; For now just return whether or not we could synthesize anything.
  (exit (if (unsat? model) 1 0)))
