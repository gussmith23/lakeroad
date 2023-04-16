#lang errortrace racket/base
;;; Lakeroad testing utilities.

(provide verify-lakeroad-expression)

(require rackunit
         "interpreter.rkt"
         rosette
         "signal.rkt"
         "verilator.rkt")

;;; Verify lr-expr against bv-expr, and optionally add both to the list of expressions to simulate.
;;;
;;; When testing Lakeroad, we want everything to be both *verified* at the level of Rosette
;;; expressions, but also *simulated* at the level of Verilator simulation. This helper macro does the
;;; verification component, with its main contribution being that it keeps the Rosette symbolic state
;;; clean by wrapping everything in `with-vc` and `with-terms`. It also optionally builds a list of
;;; simulation tasks. Note: this macro does not actually run simulation. Simulation should be run in a
;;; batch after verification using `simulate-with-verilator`. Simulating in a batch is much faster
;;; than simulating each test individually, as we can parallelize Verilation/C++ compilation.
;;;
;;; Args:
;;; - name: Name of the test. A string.
;;; - symbolic-define-etc-block: (begin (define-symbolic ...)) statement (or whatever you want.)
;;;     Whatever statements are needed to prepare the verification environment (could also contain e.g. any assert or
;;;     assume statements you might need).
;;; - lr-expr: Lakeroad expression to verify.
;;; - bv-expr: Bitvector expression to verify against. We will assert that `(bveq lr-expr bv-expr)`.
;;; - add-f: Optional function which takes to-simulate structs. In the common case, this function
;;;   should add the to-simulate structs to a list, which can then be passed to an invocation of
;;;   simulate-with-verilator.
(define-syntax verify-lakeroad-expression
  (syntax-rules ()
    ;;; Main macro implementation.
    [(_ name symbolic-define-etc-block lr-expr bv-expr add-f)
     (test-true
      (string-append name ": check that test state is normal")
      (normal?
       (let ([result (with-vc (with-terms
                               (begin
                                 symbolic-define-etc-block
                                 (add-f (to-simulate lr-expr bv-expr))
                                 ;;;  (displayln "\n\n")
                                 ;;;  (displayln (interpret lr-expr))
                                 ;;;  (displayln "\n\n")
                                 ;;;  (displayln bv-expr)
                                 (test-true
                                  (string-append name ": verify lr-expr against bv-expr")
                                  (unsat? (let ([result (verify (assert (bveq (signal-value
                                                                               (interpret lr-expr))
                                                                              bv-expr)))])
                                            (when (not (unsat? result))
                                              (displayln (model result)))
                                            result))))))])
         (when (failed? result)
           (raise (result-value result)))
         result)))]
    ;;; Allows add-f to be optional.
    [(_ name symbolic-define-etc-block lr-expr bv-expr)
     (verify-lakeroad-expression name symbolic-define-etc-block lr-expr bv-expr identity)]))
