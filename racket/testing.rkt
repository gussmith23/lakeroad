#lang racket/base
;;; Lakeroad testing utilities.

(provide verify-lakeroad-expression)

(require rackunit
         "interpreter.rkt"
         rosette
         "signal.rkt")

;;; Verify lr-expr against bv-expr, and optionally add both to the list of expressions to simulate.
;;;
;;; When testing Lakeroad, we want everything to be both *verified* at the level of Rosette
;;; expressions, but also *simulated* at the level of Verilator simulation. This helper macro does the
;;; verification component, with its main contribution being that it keeps the Rosette symbolic state
;;; clean by wrapping everything in `with-vc` and `with-terms`. Note: this macro does not actually run
;;; simulation. Simulation used to be handled using some Racket utilities, but we opted to get rid of
;;; them and instead simulate via the Python script in bin/, in our integration tests
;;; (integration_tests/lakeroad/).
;;;
;;; Args:
;;; - name: Name of the test. A string.
;;; - symbolic-define-etc-block: (begin (define-symbolic ...)) statement (or whatever you want.)
;;;     Whatever statements are needed to prepare the verification environment (could also contain
;;;     e.g. any assert or assume statements you might need).
;;; - lr-expr: Lakeroad expression to verify.
;;; - bv-expr: Bitvector expression to verify against. We will assert that `(bveq lr-expr bv-expr)`.
(define-syntax verify-lakeroad-expression
  (syntax-rules ()
    ;;; Main macro implementation.
    [(_ name symbolic-define-etc-block lr-expr bv-expr)
     (test-true
      (string-append name ": check that test state is normal")
      (normal?
       (let ([result (with-vc (with-terms
                               (begin
                                 symbolic-define-etc-block
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
         result)))]))
