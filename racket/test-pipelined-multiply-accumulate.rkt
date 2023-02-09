;;; Manually testing mapping a pipelined multiply-accumulate to Xilinx UltraScale+ DSPs.
#lang errortrace racket/base

(module+ test
  (require racket/hash
           rosette
           "btor.rkt"
           "stateful-design-experiment.rkt"
           rackunit)

  (define-namespace-anchor anc)

  (when (not (getenv "LAKEROAD_DIR"))
    (raise "LAKEROAD_DIR not set"))

  (define btor
    (with-output-to-string
     (thunk
      (system
       (format
        "yosys -q -p 'read_verilog -sv ~a; hierarchy -simcheck -top ~a; prep; proc; flatten; clk2fflogic; write_btor;'"
        (build-path (getenv "LAKEROAD_DIR")
                    "integration_tests"
                    "lakeroad"
                    "pipelined_multiply_accumulate.sv")
        "pipelined_multiply_accumulate")))))

  (define ns (namespace-anchor->namespace anc))
  (define f (eval (first (btor->racket btor)) ns))

  (define-symbolic a b acc (bitvector 16))

  ;;; The define-bounded syntax rule helps us "finitize" in Rosette, described in here:
  ;;; https://docs.racket-lang.org/rosette-guide/ch_essentials.html
  ;;; See 2.4.3.
  ;;; fuel determines the maximum depth we will attempt.
  (define fuel (make-parameter 10))
  (define-syntax-rule (define-bounded (id param ...) body ...)
    (define (id param ...)
      (assert (> (fuel) 0) "Out of fuel.")
      (parameterize ([fuel (sub1 (fuel))])
        body ...)))

  ;;; Tick the counter n times. previous-value is the previous return value of the counter, which
  ;;; defaults to the initial result of a counter.
  (define-bounded (run-design n previous-value)
                  (if (bvzero? n)
                      ;;; If we've run all requested ticks, return the previous value.
                      previous-value
                      ;;; Else, recurse.
                      (let* ([out0 (hash-ref (f #:a (bv->signal a previous-value)
                                                #:b (bv->signal b)
                                                #:acc (bv->signal acc)
                                                #:clk (bv->signal (bv 0 1)))
                                             'out)]
                             [out1 (hash-ref (f #:a (bv->signal a out0)
                                                #:b (bv->signal b)
                                                #:acc (bv->signal acc)
                                                #:clk (bv->signal (bv 1 1)))
                                             'out)])
                        (run-design (bvsub1 n) out1))))

  (define bw 8)
  (define-symbolic clock-ticks (bitvector bw))

  (displayln (signal-value (run-design (bv 2 3) (signal (bv 0 16) (hash)))))

  ;;; To get the module to implement (a*b)+acc, we need to tick the clock twice.
  (check-equal?
   (evaluate
    clock-ticks
    ;;; This synthesis query basically asks Rosette: how many clock ticks do I need to implement
    ;;; (a*b)+acc?
    (synthesize #:forall (list a b acc)
                #:guarantee
                (assert (bveq (bvadd acc (bvmul a b))
                              ;;; We give a dummy value for the initial value of `previous-value`.
                              (signal-value (run-design clock-ticks (signal (bv 0 16) (hash))))))))
   (bv 2 bw)))
