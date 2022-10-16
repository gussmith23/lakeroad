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
                                  #:internal-data lut-internal-data))
                          'O))))]
       [logical-outputs (physical-to-logical-mapping (choose* (ptol-bitwise) (ptol-bitwise-reverse))
                                                     physical-outputs)]
       [out-expr (lr:list-ref logical-outputs (lr:integer 0))])
    out-expr))

;;; Bitwise with carry sketch generator.
;;;
;;; Suitable for arithmetic operations like addition and subtraction.
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

;;; Comparison sketch generator.
;;;
;;; Very similar to bitwise with carry, but computes a function on *both* inputs to the carry. Returns
;;; a single bit. Given this name as it can be used to implement comparisions (especially because it
;;; just returns a single bit!)
;;;
;;; Note that we can adjust these sketches so that they return hashmaps, so both outputs are
;;; accessible.
(define (comparison-sketch-generator architecture-description
                                     logical-inputs
                                     num-logical-inputs
                                     bitwidth)
  (match-let* (;;; Generate a bitwise sketch over the inputs. We use this to generate the S signal.
               [bitwise-sketch-0 (bitwise-sketch-generator architecture-description
                                                           logical-inputs
                                                           num-logical-inputs
                                                           bitwidth)]
               [bitwise-sketch-1 (bitwise-sketch-generator architecture-description
                                                           logical-inputs
                                                           num-logical-inputs
                                                           bitwidth)]

               [(list carry-expr _) (construct-interface
                                     architecture-description
                                     (interface-identifier "carry" (hash "width" bitwidth))
                                     (list (cons "CI" (lr:bv (?? (bitvector 1))))
                                           (cons "DI" bitwise-sketch-0)
                                           (cons "S" bitwise-sketch-1)))]

               [out-expr (lr:hash-ref carry-expr 'CO)])
    out-expr))

;;; Logical inputs should be a lr:list of length 2, where both bitvectors are the same length.
;;;
;;; We implement multiplication as (using four bits as an example):
;;;
;;;     a3   a2   a1   a0
;;; x   b3   b2   b1   b0
;;; ---------------------
;;;   a3b0 a2b0 a1b0 a0b0
;;;   a2b1 a1b1 a0b1 1'b0
;;;   a1b2 a0b2 1'b0 1'b0
;;; + a0b3 1'b0 1'b0 1'b0
;;; ---------------------
;;;              <answer>
;;;
(define (multiplication-sketch-generator architecture-description
                                         logical-inputs
                                         num-logical-inputs
                                         bitwidth)
  (match-let*
      ([_ 0] ;;; Dummy line to prevent formatter from messing up my comments.

       [a-expr (lr:list-ref logical-inputs (lr:integer 0))]
       [b-expr (lr:list-ref logical-inputs (lr:integer 1))]

       ;;; Generate internal data to be shared across all AND luts.
       [(list _ and-lut-internal-data)
        (construct-interface architecture-description
                             (interface-identifier "LUT" (hash "num_inputs" 2))
                             (list (cons "I0" 'unused) (cons "I1" 'unused) (cons "I2" 'unused)))]

       ;;; List of ANDs.
       ;;;
       ;;; List of `bitwidth` expressions which have bitwidth `bitwidth`.
       [to-be-added-exprs
        (for/list ([j bitwidth])
          (lr:concat
           ;;; Note that we reverse the list; we produce ands in the order [a0b0, a1b0, a2b0, ...],
           ;;; which is LSB-first. So we reverse so that MSB is first when we concat. Note that it
           ;;; doesn't actually seem to matter---I suspect because bitwise-reverse can do the
           ;;; reversing during addition. But it's better to have it correct here.
           (lr:list
            (reverse
             (for/list ([i bitwidth])
               ;;; Only generate ANDs for the correct bits. Refer to our diagram above if you want to
               ;;; double check the condition on this if statement.
               (if (< i (- bitwidth j))
                   (lr:hash-ref
                    (first (construct-interface
                            architecture-description
                            (interface-identifier "LUT" (hash "num_inputs" 2))
                            (list (cons "I0" (lr:extract (lr:integer i) (lr:integer i) a-expr))
                                  (cons "I1" (lr:extract (lr:integer j) (lr:integer j) b-expr)))
                            #:internal-data and-lut-internal-data))
                    'O)
                   (lr:bv (bv 0 1))))))))]

       ;;; TODO(@gussmith23): support more than 2 inputs on bitwise/bitwise-with-carry.
       [fold-fn (lambda (next-to-add-expr acc-expr)
                  (bitwise-with-carry-sketch-generator architecture-description
                                                       (lr:list (list next-to-add-expr acc-expr))
                                                       2
                                                       bitwidth))]

       [out-expr (foldl fold-fn (lr:bv (bv 0 bitwidth)) to-be-added-exprs)])

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
                            (apply max (bvlen bv-expr) (map bvlen (symbolics bv-expr)))))

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
   #:name "comparison sketch generator on ultrascale"
   #:defines (define-symbolic a b (bitvector 8))
   #:bv-expr (bool->bitvector (bveq a b))
   #:architecture-description (xilinx-ultrascale-plus-architecture-description)
   #:sketch-generator comparison-sketch-generator
   #:module-semantics
   (list (cons (cons "LUT6" "../verilator_xilinx/LUT6.v") xilinx-ultrascale-plus-lut6)
         (cons (cons "CARRY8" "../verilator_xilinx/CARRY8.v") xilinx-ultrascale-plus-carry8))
   #:include-dirs (list (build-path (get-lakeroad-directory) "verilator_xilinx"))
   #:extra-verilator-args "-Wno-UNUSED -Wno-PINMISSING -Wno-WIDTH -Wno-TIMESCALEMOD")

  ;;; (sketch-test
  ;;;  #:name "multiplication sketch generator on ultrascale"
  ;;;  #:defines (define-symbolic a b (bitvector 8))
  ;;;  #:bv-expr (bvmul a b)
  ;;;  #:architecture-description (xilinx-ultrascale-plus-architecture-description)
  ;;;  #:sketch-generator multiplication-sketch-generator
  ;;;  #:module-semantics
  ;;;  (list (cons (cons "LUT6" "../verilator_xilinx/LUT6.v") xilinx-ultrascale-plus-lut6)
  ;;;        (cons (cons "CARRY8" "../verilator_xilinx/CARRY8.v") xilinx-ultrascale-plus-carry8))
  ;;;  #:include-dirs (list (build-path (get-lakeroad-directory) "verilator_xilinx"))
  ;;;  #:extra-verilator-args "-Wno-UNUSED -Wno-PINMISSING -Wno-WIDTH -Wno-TIMESCALEMOD")

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
   #:name "comparison sketch generator on lattice"
   #:defines (define-symbolic a b (bitvector 2))
   #:bv-expr (bool->bitvector (bveq a b))
   #:architecture-description (lattice-ecp5-architecture-description)
   #:sketch-generator comparison-sketch-generator
   #:module-semantics
   (list (cons (cons "LUT4" "../f4pga-arch-defs/ecp5/primitives/slice/LUT4.v") lattice-ecp5-lut4)
         (cons (cons "CCU2C" "../f4pga-arch-defs/ecp5/primitives/slice/CCU2C.v") lattice-ecp5-ccu2c))
   #:include-dirs (list (build-path (get-lakeroad-directory) "f4pga-arch-defs/ecp5/primitives/slice"))
   #:extra-verilator-args "-Wno-UNUSED -Wno-PINMISSING")

  (sketch-test
   #:name "multiplication sketch generator on lattice"
   #:defines (define-symbolic a b (bitvector 2))
   #:bv-expr (bvmul a b)
   #:architecture-description (lattice-ecp5-architecture-description)
   #:sketch-generator multiplication-sketch-generator
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
   "-Wno-LITENDIAN -Wno-EOFNEWLINE -Wno-UNUSED -Wno-PINMISSING -Wno-TIMESCALEMOD -DSKY130_FD_SC_HD__UDP_MUX_2TO1_LAKEROAD_HACK -DNO_PRIMITIVES")

  (sketch-test
   #:name "comparison sketch on SOFA"
   #:defines (define-symbolic a b (bitvector 8))
   #:bv-expr (bool->bitvector (bveq a b))
   #:architecture-description (sofa-architecture-description)
   #:sketch-generator comparison-sketch-generator
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
