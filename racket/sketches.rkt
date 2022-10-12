;;; Lakeroad sketches.
;;;
;;; Lakeroad provides a number of synthesis sketches that should work across a wide range of
;;; platforms. Once a sketch is generated, it is architecture-dependent; to support users who would
;;; like to use new architectures with Lakeroad, we generate sketches using architecture-independent
;;; sketch generators. A sketch generator is a function which takes an architecture description, and
;;; uses that architecture description to generate an architecture-specific sketch. From the
;;; architecture description, the sketch generator is able to instantiate common interfaces like LUTs,
;;; MUXes, and DSPs, and the architecture description utilities (see architecture-description.rkt)
;;; will generate the architecture-specific instantiations of these interfaces.
#lang errortrace racket/base

(require "architecture-description.rkt"
         "logical-to-physical.rkt"
         (prefix-in lr: "language.rkt")
         rosette
         rosette/lib/angelic
         rosette/lib/synthax
         "verilator.rkt"
         "utils.rkt")

;;; Generates a "bitwise" sketch, for operations like AND and OR.
;;;
;;; Bitwise operations are very simple: for n-bit inputs i0 and i1, bit 0 of i0 and bit 0 of i1 are
;;; paired together and put into a LUT, bit 1 of i0 and bit 1 of i1 are paired together and put into a
;;; LUT, and so on. This simple pattern is able to implement many useful operations.
;;;
;;; - logical-inputs: A Lakeroad list expression, representing a list of logical inputs. Each logical
;;;   input should have the same bitwidth.
;;; - num-logical-inputs: The number of logical inputs. This is used to determine the size of the LUTs
;;;   to be used.
;;; - bitwidth: The bitwidth of the inputs, which will also be the bitwidth of the output.
(define (bitwise-sketch-generator architecture-description logical-inputs num-logical-inputs bitwidth)
  ;;; First, we construct a LUT just to get the `internal-data`. We will reuse this internal data to
  ;;; create more LUTs which use the same LUT memory.
  (match-let*
      ([(list _ internal-data)
        (construct-interface
         architecture-description
         (interface-identifier "LUT" (hash "num_inputs" num-logical-inputs))
         ;;; Note that we don't care what the inputs are hooked up to here, because we are
         ;;; just trying to get the internal data.
         (for/list ([i num-logical-inputs])
           (cons (format "I~a" i) (bv 0 1))))]
       [physical-inputs (logical-to-physical-mapping (choose* (ltop-bitwise) (ltop-bitwise-reverse))
                                                     logical-inputs)]
       [physical-outputs
        (lr:list
         (for/list ([i bitwidth])
           (let* ([physical-inputs-this-lut (lr:list-ref physical-inputs (lr:integer i))]
                  [port-map
                   (for/list ([i num-logical-inputs])
                     (cons (format "I~a" i)
                           (lr:extract (lr:integer i) (lr:integer i) physical-inputs-this-lut)))])
             (lr:hash-ref (first (construct-interface
                                  architecture-description
                                  (interface-identifier "LUT" (hash "num_inputs" num-logical-inputs))
                                  port-map
                                  #:internal-data internal-data))
                          'O))))]
       [logical-outputs (physical-to-logical-mapping (choose* (ptol-bitwise) (ptol-bitwise-reverse))
                                                     physical-outputs)]
       [out-expr (lr:list-ref logical-outputs (lr:integer 0))])
    out-expr))

;;; Bitwise with carry sketch generator.
(define (bitwise-with-carry-sketch-generator architecture-description
                                             logical-inputs
                                             num-logical-inputs
                                             bitwidth)
  (match-let*
      (;;; Generate a bitwise sketch over the inputs. We use this to generate the S signal.
       [bitwise-sketch (bitwise-sketch-generator architecture-description
                                                 logical-inputs
                                                 num-logical-inputs
                                                 bitwidth)]

       ;;; Pass the results into a carry. We populate the DI signal with one of the logical inputs.
       [(list carry-expr _) (construct-interface
                             architecture-description
                             (interface-identifier "carry" (hash "width" bitwidth))
                             (list (cons "CI" (lr:bv (?? (bitvector 1))))
                                   (cons "DI" (lr:list-ref logical-inputs (lr:integer 0)))
                                   (cons "S" bitwise-sketch)))]
       [out-expr (lr:hash-ref carry-expr 'O)])
    out-expr))

(module+ test
  (require rackunit
           "interpreter.rkt"
           "lattice-ecp5-lut4.rkt"
           "lattice-ecp5-ccu2c.rkt"
           "xilinx-ultrascale-plus-lut6.rkt"
           "xilinx-ultrascale-plus-carry8.rkt")

  (test-case
   "bitwise sketch generator"
   (with-terms
    (begin

      (define-symbolic a b (bitvector 2))
      (define bv-expr (bvand a b))
      (define sketch
        (bitwise-sketch-generator (lattice-ecp5-architecture-description)
                                  (lr:list (list (lr:bv a) (lr:bv b)))
                                  2
                                  2))

      (define result
        (with-vc
         (with-terms
          (synthesize
           #:forall (list a b)
           #:guarantee
           (assert (bveq bv-expr
                         (interpret
                          sketch
                          #:module-semantics
                          (list (cons (cons "LUT4" "../f4pga-arch-defs/ecp5/primitives/slice/LUT4.v")
                                      lattice-ecp5-lut4)))))))))

      (check-true (normal? result))
      (define soln (result-value result))

      (define lr-expr
        (evaluate
         sketch
         ;;; Complete the solution: fill in any symbolic values that *aren't* the logical inputs.
         (complete-solution soln
                            (set->list (set-subtract (list->set (symbolics sketch))
                                                     (list->set (symbolics bv-expr)))))))

      (when (not (getenv "VERILATOR_INCLUDE_DIR"))
        (raise "VERILATOR_INCLUDE_DIR not set"))
      (define include-dir
        (build-path (get-lakeroad-directory) "f4pga-arch-defs/ecp5/primitives/slice"))
      (check-true (simulate-with-verilator #:include-dirs (list include-dir)
                                           #:extra-verilator-args "-Wno-UNUSED"
                                           (list (to-simulate lr-expr bv-expr))
                                           (getenv "VERILATOR_INCLUDE_DIR"))))))

  (test-case
   "bitwise with carry sketch generator"
   (with-terms
    (begin

      (define-symbolic a b (bitvector 8))
      (define bv-expr (bvadd a b))
      (define sketch
        (bitwise-with-carry-sketch-generator (xilinx-ultrascale-plus-architecture-description)
                                             (lr:list (list (lr:bv a) (lr:bv b)))
                                             2
                                             8))

      (define result
        (with-vc (with-terms
                  (synthesize
                   #:forall (list a b)
                   #:guarantee
                   (assert (bveq bv-expr
                                 (interpret sketch
                                            #:module-semantics
                                            (list (cons (cons "LUT6" "../verilator_xilinx/LUT6.v")
                                                        xilinx-ultrascale-plus-lut6)
                                                  (cons (cons "CARRY8" "../verilator_xilinx/CARRY8.v")
                                                        xilinx-ultrascale-plus-carry8)))))))))

      (check-true (normal? result))
      (define soln (result-value result))

      (define lr-expr
        (evaluate
         sketch
         ;;; Complete the solution: fill in any symbolic values that *aren't* the logical inputs.
         (complete-solution soln
                            (set->list (set-subtract (list->set (symbolics sketch))
                                                     (list->set (symbolics bv-expr)))))))

      (when (not (getenv "VERILATOR_INCLUDE_DIR"))
        (raise "VERILATOR_INCLUDE_DIR not set"))
      (define include-dir (build-path (get-lakeroad-directory) "verilator_xilinx"))
      (check-true (simulate-with-verilator
                   #:include-dirs (list include-dir)
                   #:extra-verilator-args "-Wno-UNUSED -Wno-PINMISSING -Wno-WIDTH -Wno-TIMESCALEMOD"
                   (list (to-simulate lr-expr bv-expr))
                   (getenv "VERILATOR_INCLUDE_DIR"))))))

  (test-case
   "bitwise with carry sketch generator on lattice"
   (with-terms
    (begin

      (define-symbolic a b (bitvector 2))
      (define bv-expr (bvadd a b))
      (define sketch
        (bitwise-with-carry-sketch-generator (lattice-ecp5-architecture-description)
                                             (lr:list (list (lr:bv a) (lr:bv b)))
                                             2
                                             2))

      (define result
        (with-vc
         (with-terms
          (synthesize
           #:forall (list a b)
           #:guarantee
           (assert
            (bveq bv-expr
                  (interpret
                   sketch
                   #:module-semantics
                   (list (cons (cons "LUT4" "../f4pga-arch-defs/ecp5/primitives/slice/LUT4.v")
                               lattice-ecp5-lut4)
                         (cons (cons "CCU2C" "../f4pga-arch-defs/ecp5/primitives/slice/CCU2C.v")
                               lattice-ecp5-ccu2c)))))))))

      (check-true (normal? result))
      (define soln (result-value result))

      (define lr-expr
        (evaluate
         sketch
         ;;; Complete the solution: fill in any symbolic values that *aren't* the logical inputs.
         (complete-solution soln
                            (set->list (set-subtract (list->set (symbolics sketch))
                                                     (list->set (symbolics bv-expr)))))))

      (when (not (getenv "VERILATOR_INCLUDE_DIR"))
        (raise "VERILATOR_INCLUDE_DIR not set"))
      (define include-dir
        (build-path (get-lakeroad-directory) "f4pga-arch-defs/ecp5/primitives/slice"))
      (check-true (simulate-with-verilator #:include-dirs (list include-dir)
                                           #:extra-verilator-args "-Wno-UNUSED -Wno-PINMISSING"
                                           (list (to-simulate lr-expr bv-expr))
                                           (getenv "VERILATOR_INCLUDE_DIR")))))))
