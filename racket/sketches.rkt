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
           "xilinx-ultrascale-plus-carry8.rkt"
           "sofa-frac-lut4.rkt")

  (define-syntax-rule (sketch-test #:name name
                                   #:defines defines
                                   ...
                                   #:bv-expr bv-expr
                                   #:architecture-description architecture-description
                                   #:sketch-generator sketch-generator
                                   #:module-semantics module-semantics
                                   #:include-dirs include-dirs
                                   #:extra-verilator-args extra-verilator-args)
    (test-case
     name
     (with-terms
      (begin
        defines ...

        (define sketch
          (sketch-generator architecture-description
                            (lr:list (map lr:bv (symbolics bv-expr)))
                            (length (symbolics bv-expr))
                            (bvlen bv-expr)))

        (define result
          (with-vc (with-terms (synthesize #:forall (symbolics bv-expr)
                                           #:guarantee
                                           (assert (bveq bv-expr
                                                         (interpret sketch
                                                                    #:module-semantics
                                                                    module-semantics)))))))

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
        (check-true (simulate-with-verilator #:include-dirs include-dirs
                                             #:extra-verilator-args extra-verilator-args
                                             (list (to-simulate lr-expr bv-expr))
                                             (getenv "VERILATOR_INCLUDE_DIR")))))))

  (sketch-test
   #:name "bitwise sketch generator on ultrascale"
   #:defines (define-symbolic a b (bitvector 2))
   #:bv-expr (bvand a b)
   #:architecture-description (lattice-ecp5-architecture-description)
   #:sketch-generator bitwise-sketch-generator
   #:module-semantics (list (cons (cons "LUT4" "../f4pga-arch-defs/ecp5/primitives/slice/LUT4.v")
                                  lattice-ecp5-lut4))
   #:include-dirs (list (build-path (get-lakeroad-directory) "f4pga-arch-defs/ecp5/primitives/slice"))
   #:extra-verilator-args "-Wno-UNUSED")

  (sketch-test
   #:name "bitwise with carry sketch generator on ultrascale"
   #:defines (define-symbolic a b (bitvector 8))
   #:bv-expr (bvadd a b)
   #:architecture-description (xilinx-ultrascale-plus-architecture-description)
   #:sketch-generator bitwise-with-carry-sketch-generator
   #:module-semantics
   (list (cons (cons "LUT6" "../verilator_xilinx/LUT6.v") xilinx-ultrascale-plus-lut6)
         (cons (cons "CARRY8" "../verilator_xilinx/CARRY8.v") xilinx-ultrascale-plus-carry8))
   #:include-dirs (list (build-path (get-lakeroad-directory) "verilator_xilinx"))
   #:extra-verilator-args "-Wno-UNUSED -Wno-PINMISSING -Wno-WIDTH -Wno-TIMESCALEMOD")

  (sketch-test
   #:name "bitwise sketch generator on lattice"
   #:defines (define-symbolic a b (bitvector 8))
   #:bv-expr (bvand a b)
   #:architecture-description (lattice-ecp5-architecture-description)
   #:sketch-generator bitwise-sketch-generator
   #:module-semantics
   (list (cons (cons "LUT4" "../f4pga-arch-defs/ecp5/primitives/slice/LUT4.v") lattice-ecp5-lut4)
         (cons (cons "CCU2C" "../f4pga-arch-defs/ecp5/primitives/slice/CCU2C.v") lattice-ecp5-ccu2c))
   #:include-dirs (list (build-path (get-lakeroad-directory) "f4pga-arch-defs/ecp5/primitives/slice"))
   #:extra-verilator-args "-Wno-UNUSED -Wno-PINMISSING")

  (sketch-test
   #:name "bitwise with carry sketch generator on lattice"
   #:defines (define-symbolic a b (bitvector 2))
   #:bv-expr (bvadd a b)
   #:architecture-description (lattice-ecp5-architecture-description)
   #:sketch-generator bitwise-with-carry-sketch-generator
   #:module-semantics
   (list (cons (cons "LUT4" "../f4pga-arch-defs/ecp5/primitives/slice/LUT4.v") lattice-ecp5-lut4)
         (cons (cons "CCU2C" "../f4pga-arch-defs/ecp5/primitives/slice/CCU2C.v") lattice-ecp5-ccu2c))
   #:include-dirs (list (build-path (get-lakeroad-directory) "f4pga-arch-defs/ecp5/primitives/slice"))
   #:extra-verilator-args "-Wno-UNUSED -Wno-PINMISSING")

  (sketch-test
   #:name "bitwise on SOFA"
   #:defines (define-symbolic a b (bitvector 2))
   #:bv-expr (bvand a b)
   #:architecture-description (sofa-architecture-description)
   #:sketch-generator bitwise-sketch-generator
   #:module-semantics
   (list (cons (cons "frac_lut4" "../modules_for_importing/SOFA/frac_lut4.v") sofa-frac-lut4))
   #:include-dirs
   (list
    (build-path (get-lakeroad-directory) "modules_for_importing" "SOFA")
    (build-path (get-lakeroad-directory) "skywater-pdk-libs-sky130_fd_sc_hd/cells/or2/")
    (build-path (get-lakeroad-directory) "skywater-pdk-libs-sky130_fd_sc_hd/cells/inv/")
    (build-path (get-lakeroad-directory) "skywater-pdk-libs-sky130_fd_sc_hd/cells/buf/")
    (build-path (get-lakeroad-directory) "skywater-pdk-libs-sky130_fd_sc_hd/cells/mux2/")
    (build-path (get-lakeroad-directory) "skywater-pdk-libs-sky130_fd_sc_hd" "models" "udp_mux_2to1"))
   #:extra-verilator-args
   "-Wno-LITENDIAN -Wno-EOFNEWLINE -Wno-UNUSED -Wno-PINMISSING -Wno-TIMESCALEMOD -DSKY130_FD_SC_HD__UDP_MUX_2TO1_LAKEROAD_HACK -DNO_PRIMITIVES")

  (sketch-test
   #:name "bitwise with carry on SOFA"
   #:defines (define-symbolic a b (bitvector 8))
   #:bv-expr (bvadd a b)
   #:architecture-description (sofa-architecture-description)
   #:sketch-generator bitwise-with-carry-sketch-generator
   #:module-semantics
   (list (cons (cons "frac_lut4" "../modules_for_importing/SOFA/frac_lut4.v") sofa-frac-lut4))
   #:include-dirs
   (list
    (build-path (get-lakeroad-directory) "modules_for_importing" "SOFA")
    (build-path (get-lakeroad-directory) "skywater-pdk-libs-sky130_fd_sc_hd/cells/or2/")
    (build-path (get-lakeroad-directory) "skywater-pdk-libs-sky130_fd_sc_hd/cells/inv/")
    (build-path (get-lakeroad-directory) "skywater-pdk-libs-sky130_fd_sc_hd/cells/buf/")
    (build-path (get-lakeroad-directory) "skywater-pdk-libs-sky130_fd_sc_hd/cells/mux2/")
    (build-path (get-lakeroad-directory) "skywater-pdk-libs-sky130_fd_sc_hd" "models" "udp_mux_2to1"))
   #:extra-verilator-args
   "-Wno-LITENDIAN -Wno-EOFNEWLINE -Wno-UNUSED -Wno-PINMISSING -Wno-TIMESCALEMOD -DSKY130_FD_SC_HD__UDP_MUX_2TO1_LAKEROAD_HACK -DNO_PRIMITIVES"))
