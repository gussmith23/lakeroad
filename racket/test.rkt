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
    (apply ultrascale-clb
           cin
           lut-memory-a
           lut-memory-b
           lut-memory-c
           lut-memory-d
           lut-memory-e
           lut-memory-f
           lut-memory-g
           lut-memory-h
           (ultrascale-logical-to-physical-inputs logical-input-0
                                                  logical-input-1
                                                  logical-input-2
                                                  logical-input-3
                                                  logical-input-4
                                                  logical-input-5)))
  (define model
    (synthesize #:forall (list logical-input-0
                               logical-input-1
                               logical-input-2
                               logical-input-3
                               logical-input-4
                               logical-input-5)
                #:guarantee (begin
                              (assume (bvzero? logical-input-2))
                              (assume (bvzero? logical-input-3))
                              (assume (bvzero? logical-input-4))
                              (assume (bvzero? logical-input-5))
                              (assert (bveq (prog logical-input-0 logical-input-1) out)))))

  ; For now just return whether or not we could synthesize anything.
  (exit (if (unsat? model) 1 0)))
