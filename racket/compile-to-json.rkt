#lang errortrace racket

(provide lakeroad->jsexpr)

(require "comp-json.rkt"
         "ultrascale.rkt"
         "lattice-ecp5.rkt"
         "sofa.rkt"
         "logical-to-physical.rkt"
         "utils.rkt"
         "interpreter.rkt"
         racket/pretty
         rosette
         (prefix-in lr: "language.rkt")
         "architecture-description.rkt")

;;; Compile Lakeroad expr to a JSON jsexpr, which can then be used by Yosys.
;;;
;;; TODO Write helper function to convert Yosys JSON to Verilog.
(define (lakeroad->jsexpr expr #:module-name [module-name "top"])

  ;;; The next available bit id. Starts at 2, as Yosys reserves 0 and 1 for the literals 0 and 1.
  (define next-bit-id 2)

  ;;; Reserve requested number of bits. Returns a list of bit ids.
  (define (get-bits num-bits)
    (define out (range next-bit-id (+ next-bit-id num-bits)))
    (set! next-bit-id (+ next-bit-id num-bits))
    out)

  (define ports (hasheq-helper))
  (define (add-port k v)
    (hasheq-helper #:base ports k v))

  (define next-cell-id 0)
  (define cells (hasheq-helper))
  (define (add-cell k v)
    (hasheq-helper #:base cells
                   (string->symbol (string-append (symbol->string k) (format "_~a" next-cell-id)))
                   v)
    (set! next-cell-id (add1 next-cell-id))
    (void))

  (define next-netname-id 0)
  (define netnames (hasheq-helper))
  (define (add-netname k v)
    (hasheq-helper #:base netnames
                   (string->symbol (string-append (symbol->string k) (format "_~a" next-netname-id)))
                   v)
    (set! next-netname-id (add1 next-netname-id))
    (void))

  (define parameter-default-values (hasheq-helper))
  (define (add-parameter-default-value k v)
    (hasheq-helper #:base parameter-default-values k v))

  (define memo (make-hash))
  ;;; Generally: individual signals (symbolic constants e.g. 'a' or concrete constants e.g. (bv 1 2))
  ;;; return a list of integers representing bit ids. Note that, in the case that a bit is hardwired
  ;;; to 0 or 1, the id will instead be the strings "0" or "1" as per Yosys's JSON format definition.
  ;;; "Blocks" like physical-to-logical mappings or CLBs return lists of signals (so, a list of lists
  ;;; of integers).
  (define (compile expr)
    (if (hash-has-key? memo expr)
        (hash-ref memo expr)
        (let ([out
               (match expr
                 [(lr:get-hw-module-instance-output
                   (lr:hw-module-instance module-name ports params filepath)
                   signal-name)
                  (let* ([input-ports
                          (filter (λ (p) (equal? (module-instance-port-direction p) 'input)) ports)]
                         [input-port-symbols
                          (map string->symbol (map module-instance-port-name input-ports))]
                         ;;; Pairs of input symbol with compiled expression.
                         [input-pairs (map (λ (p)
                                             (cons (string->symbol (module-instance-port-name p))
                                                   (compile (module-instance-port-value p))))
                                           input-ports)]
                         [output-ports
                          (filter (λ (p) (equal? (module-instance-port-direction p) 'output)) ports)]
                         [output-port-symbols
                          (map string->symbol (map module-instance-port-name output-ports))]
                         ;;; Pairs of output symbol with allocated bit ids.
                         [output-pairs
                          (map (λ (p)
                                 (let ([bits (get-bits (module-instance-port-bitwidth p))])
                                   (add-netname (string->symbol (module-instance-port-name p))
                                                (make-net-details bits))
                                   (cons (string->symbol (module-instance-port-name p)) bits)))
                               output-ports)]

                         ;;; Pairs of parameter symbol with value.
                         [param-pairs (map (λ (p)
                                             (cons (string->symbol (module-instance-parameter-name p))
                                                   (match (module-instance-parameter-value p)
                                                     [(lr:bv v) (make-literal-value-from-bv v)])))
                                           params)]
                         [cell (make-cell
                                module-name
                                (make-cell-port-directions input-port-symbols output-port-symbols)
                                (make-immutable-hash (append input-pairs output-pairs))
                                #:params (make-immutable-hash param-pairs))])

                    (add-cell (string->symbol module-name) cell)

                    ;;; Return the requested signal by looking it up in output-pairs.
                    (cdr (assoc (string->symbol signal-name) output-pairs)))]
                 [(lr:lut (lr:integer 1) (lr:integer 1) 'xilinx-ultrascale-plus lutmem inputs)
                  (compile (ultrascale-plus-lut1 lutmem inputs))]
                 [(lr:lut (lr:integer 2) (lr:integer 1) 'xilinx-ultrascale-plus lutmem inputs)
                  (compile (ultrascale-plus-lut2 lutmem inputs))]
                 [(lr:lut (lr:integer 3) (lr:integer 1) 'xilinx-ultrascale-plus lutmem inputs)
                  (compile (ultrascale-plus-lut3 lutmem inputs))]
                 [(lr:lut (lr:integer 4) (lr:integer 1) 'xilinx-ultrascale-plus lutmem inputs)
                  (compile (ultrascale-plus-lut4 lutmem inputs))]

                 ;;; Have to reverse the inputs for SOFA. Could also reverse the lutmem.
                 ;;;
                 ;;; TODO(@gussmith23): It's probably not great to have the compiler depend on the
                 ;;; interpreter.
                 [(lr:lut (lr:integer 4) (lr:integer 1) 'sofa lutmem inputs)
                  (compile (sofa-lut4 lutmem (apply concat (bitvector->bits (interpret inputs)))))]

                 [(ultrascale-plus-dsp48e2 A
                                           ACASCREG
                                           ACIN
                                           ADREG
                                           ALUMODE
                                           ALUMODEREG
                                           AMULTSEL
                                           AREG
                                           AUTORESET_PATDET
                                           AUTORESET_PRIORITY
                                           A_INPUT
                                           B
                                           BCASCREG
                                           BCIN
                                           BMULTSEL
                                           BREG
                                           B_INPUT
                                           C
                                           CARRYCASCIN
                                           CARRYIN
                                           CARRYINREG
                                           CARRYINSEL
                                           CARRYINSELREG
                                           CEA1
                                           CEA2
                                           CEAD
                                           CEALUMODE
                                           CEB1
                                           CEB2
                                           CEC
                                           CECARRYIN
                                           CECTRL
                                           CED
                                           CEINMODE
                                           CEM
                                           CEP
                                           CLK
                                           CREG
                                           D
                                           DREG
                                           INMODE
                                           INMODEREG
                                           IS_ALUMODE_INVERTED
                                           IS_CARRYIN_INVERTED
                                           IS_CLK_INVERTED
                                           IS_INMODE_INVERTED
                                           IS_OPMODE_INVERTED
                                           IS_RSTALLCARRYIN_INVERTED
                                           IS_RSTALUMODE_INVERTED
                                           IS_RSTA_INVERTED
                                           IS_RSTB_INVERTED
                                           IS_RSTCTRL_INVERTED
                                           IS_RSTC_INVERTED
                                           IS_RSTD_INVERTED
                                           IS_RSTINMODE_INVERTED
                                           IS_RSTM_INVERTED
                                           IS_RSTP_INVERTED
                                           MASK
                                           MREG
                                           MULTSIGNIN
                                           OPMODE
                                           OPMODEREG
                                           PATTERN
                                           PCIN
                                           PREADDINSEL
                                           PREG
                                           RND
                                           RSTA
                                           RSTALLCARRYIN
                                           RSTALUMODE
                                           RSTB
                                           RSTC
                                           RSTCTRL
                                           RSTD
                                           RSTINMODE
                                           RSTM
                                           RSTP
                                           SEL_MASK
                                           SEL_PATTERN
                                           USE_MULT
                                           USE_PATTERN_DETECT
                                           USE_SIMD
                                           USE_WIDEXOR
                                           XORSIMD
                                           unnamed-input-331
                                           unnamed-input-488
                                           unnamed-input-750
                                           unnamed-input-806
                                           unnamed-input-850)
                  (make-ultrascale-plus-dsp48e2 compile
                                                get-bits
                                                add-cell
                                                add-netname
                                                add-parameter-default-value
                                                expr)]
                 [(xilinx-ultrascale-plus-carry8 carry-type ci ci-top di s)
                  (compile-xilinx-ultrascale-plus-carry8 compile
                                                         get-bits
                                                         add-cell
                                                         add-netname
                                                         add-parameter-default-value
                                                         expr)]
                 [(xilinx-ultrascale-plus-lut6 i0 i1 i2 i3 i4 i5 init)
                  (compile-xilinx-ultrascale-plus-lut6 compile
                                                       get-bits
                                                       add-cell
                                                       add-netname
                                                       add-parameter-default-value
                                                       expr)]
                 [(xilinx-ultrascale-plus-lut6-2 i0 i1 i2 i3 i4 i5 init)
                  (compile-xilinx-ultrascale-plus-lut6-2 compile
                                                         get-bits
                                                         add-cell
                                                         add-netname
                                                         add-parameter-default-value
                                                         expr)]
                 [(sofa-lut4 sram inputs)
                  (compile-sofa compile
                                get-bits
                                add-cell
                                add-netname
                                add-parameter-default-value
                                expr)]
                 [(sofa-frac-lut4 in mode mode-inv sram sram-inv)
                  (compile-sofa compile
                                get-bits
                                add-cell
                                add-netname
                                add-parameter-default-value
                                expr)]
                 [(ultrascale-plus-clb cin
                                       lut-a
                                       lut-b
                                       lut-c
                                       lut-d
                                       lut-e
                                       lut-f
                                       lut-g
                                       lut-h
                                       mux-selector-a
                                       mux-selector-b
                                       mux-selector-c
                                       mux-selector-d
                                       mux-selector-e
                                       mux-selector-f
                                       mux-selector-g
                                       mux-selector-h
                                       inputs)
                  (make-ultrascale-plus-clb compile
                                            get-bits
                                            add-cell
                                            add-netname
                                            add-parameter-default-value
                                            expr)]
                 [(lattice-ecp5-pfu lut-a lut-b lut-c lut-d lut-e lut-f lut-g lut-h inputs)
                  (compile-lattice-pfu compile
                                       get-bits
                                       add-cell
                                       add-netname
                                       add-parameter-default-value
                                       expr)]
                 [(lattice-ecp5-ccu2c INIT0 INIT1 INJECT1_0 INJECT1_1 CIN inputs)
                  (compile-lattice-ccu2c compile
                                         get-bits
                                         add-cell
                                         add-netname
                                         add-parameter-default-value
                                         expr)]
                 [(lattice-ecp5-lut2 INIT inputs)
                  (compile-lattice-lut2 compile
                                        get-bits
                                        add-cell
                                        add-netname
                                        add-parameter-default-value
                                        expr)]
                 [(lattice-ecp5-lut4 INIT inputs)
                  (compile-lattice-lut4 compile
                                        get-bits
                                        add-cell
                                        add-netname
                                        add-parameter-default-value
                                        expr)]
                 [(lattice-ecp5-lut6 INIT inputs)
                  (compile-lattice-lut6 compile
                                        get-bits
                                        add-cell
                                        add-netname
                                        add-parameter-default-value
                                        expr)]
                 [(lattice-ecp5-lut8 INIT inputs)
                  (compile-lattice-lut8 compile
                                        get-bits
                                        add-cell
                                        add-netname
                                        add-parameter-default-value
                                        expr)]
                 [(lattice-ecp5-mux21 D0 D1 SD)
                  (compile-lattice-mux21 compile
                                         get-bits
                                         add-cell
                                         add-netname
                                         add-parameter-default-value
                                         expr)]

                 [(lattice-ecp5-l6mux21 D0 D1 SD)
                  (compile-lattice-l6mux21 compile
                                           get-bits
                                           add-cell
                                           add-netname
                                           add-parameter-default-value
                                           expr)]
                 [(lattice-ecp5-pfumx ALUT BLUT CO)
                  (compile-lattice-pfumx compile
                                         get-bits
                                         add-cell
                                         add-netname
                                         add-parameter-default-value
                                         expr)]
                 [(lattice-ecp5-ripple-pfu INIT0
                                           INIT1
                                           INIT2
                                           INIT3
                                           INIT4
                                           INIT5
                                           INIT6
                                           INIT7
                                           INJECT1_0
                                           INJECT1_1
                                           INJECT1_2
                                           INJECT1_3
                                           INJECT1_4
                                           INJECT1_5
                                           INJECT1_6
                                           INJECT1_7
                                           CIN
                                           inputs)
                  (compile-lattice-ripple-pfu compile
                                              get-bits
                                              add-cell
                                              add-netname
                                              add-parameter-default-value
                                              expr)]
                 [(ultrascale-plus-lut1 init inputs)
                  (match-define (list i0) (compile inputs))
                  (define o (get-bits 1))
                  (add-cell 'lut1
                            (make-cell "LUT1"
                                       (make-cell-port-directions (list 'I0) (list 'O))
                                       (make-cell-connections 'I0 i0 'O (first o))
                                       #:params (hasheq 'INIT (make-literal-value-from-bv init))))
                  o]
                 [(ultrascale-plus-lut2 init inputs)
                  (match-define (list i0 i1) (compile inputs))
                  (define o (get-bits 1))
                  (add-cell 'lut2
                            (make-cell "LUT2"
                                       (make-cell-port-directions (list 'I0 'I1) (list 'O))
                                       (make-cell-connections 'I0 i0 'I1 i1 'O (first o))
                                       #:params (hasheq 'INIT (make-literal-value-from-bv init))))
                  o]
                 [(ultrascale-plus-lut3 init inputs)
                  (match-define (list i0 i1 i2) (compile inputs))
                  (define o (get-bits 1))
                  (add-cell 'lut3
                            (make-cell "LUT3"
                                       (make-cell-port-directions (list 'I0 'I1 'I2) (list 'O))
                                       (make-cell-connections 'I0 i0 'I1 i1 'I2 i2 'O (first o))
                                       #:params (hasheq 'INIT (make-literal-value-from-bv init))))
                  o]
                 [(physical-to-logical-mapping f outputs)
                  (compile-physical-to-logical-mapping compile f outputs)]
                 [(logical-to-physical-mapping f inputs)
                  (compile-logical-to-physical-mapping compile f inputs)]

                 ;;; Racket operators.
                 [(lr:take l n) (take (compile l) (compile n))]
                 [(lr:drop l n) (drop (compile l) (compile n))]
                 [(lr:list-ref l n) (list-ref (compile l) (compile n))]
                 [(lr:first lst) (first (compile lst))]
                 [(lr:append lsts) (apply append (compile lsts))]
                 [(lr:map f lsts) (apply map f (compile lsts))]

                 ;;; Rosette operators.
                 [(or (expression (== extract) high low v) (lr:extract high low v))
                  (drop (take (compile v) (add1 (compile high))) (compile low))]
                 [(or (expression (== zero-extend) v bv-type) (lr:zero-extend v bv-type))
                  (append (compile v)
                          (make-list (- (bitvector-size bv-type) (bitvector-size (type-of v))) "0"))]
                 [(or (lr:concat (list v0 v1)) (expression (== concat) v0 v1))
                  (append (compile v1) (compile v0))]
                 ;; TODO: How to handle variadic rosette concats?
                 ;;; TODO(@gussmith23): Compile, then reverse? Or reverse, then compile?
                 [(lr:concat rst) (apply append (reverse (compile rst)))]

                 [(lr:dup-extend v bv-type) (make-list (bitvector-size bv-type) (first (compile v)))]

                 ;;; Symbolic bitvector constants correspond to module inputs!
                 [(lr:bv (? bv? (? symbolic? (? constant? s))))
                  ;;; Get the port details if they exist; create and return them if they don't.
                  (define port-details
                    (hash-ref ports
                              (string->symbol (~a s))
                              (lambda ()
                                (define bits (get-bits (bitvector-size (type-of s))))
                                (define port-details (make-port-details "input" bits))
                                (add-port (string->symbol (~a s)) port-details)
                                port-details)))

                  ;;; Return the bits.
                  (hash-ref port-details 'bits)]

                 ;;; Concrete bitvectors become constants.
                 [(lr:bv (? bv? (? concrete? s)))
                  (map ~a (map bitvector->natural (bitvector->bits s)))]

                 [(lr:integer v) v]
                 [(? string? v) v]

                 ;;; Should go near the bottom -- remember, nearly everything's a list underneath!
                 [(lr:list v) (map compile v)])])

          (hash-set! memo expr out)
          (hash-ref memo expr))))

  (define outputs (list (compile expr)))

  (for ([output-bits outputs] [i (range (length outputs))])
    (add-port (string->symbol (format "out~a" i)) (make-port-details "output" output-bits)))

  (define doc (make-lakeroad-json-doc))
  (add-module-to-doc
   doc
   (string->symbol module-name)
   (make-module ports cells netnames #:parameter-default-values parameter-default-values))

  doc)

(module+ test
  (require rosette/lib/synthax
           rosette/solver/smt/boolector
           rosette
           json
           rackunit
           "interpreter.rkt")

  ;;; Re-enable this test when we support multiple outputs.
  ;;; (test-begin (define-symbolic a b (bitvector 8))
  ;;;             (define out (lakeroad->jsexpr (list a b a)))
  ;;;             (define modules (hash-ref out 'modules))
  ;;;             (check-equal? (hash-count modules) 1)
  ;;;             (define module (hash-ref modules 'top))
  ;;;             (check-equal? (hash-count (hash-ref module 'ports)) 5))

  (test-begin
   (define out (lakeroad->jsexpr (lr:bv (bv #b000111 6))))
   (check-equal?
    (hash-ref (hash-ref (hash-ref out 'modules) 'top) 'ports)
    (hasheq-helper 'out0 (hasheq-helper 'bits '("1" "1" "1" "0" "0" "0") 'direction "output"))))

  (test-begin (current-solver (boolector))
              (define-symbolic a b (bitvector 8))
              (define expr
                (lr:first (physical-to-logical-mapping
                           '(bitwise)
                           ;;; Take the 8 outputs from the LUTs; drop cout.
                           (lr:take (ultrascale-plus-clb (lr:bv (?? (bitvector 1)))
                                                         (lr:bv (?? (bitvector 64)))
                                                         (lr:bv (?? (bitvector 64)))
                                                         (lr:bv (?? (bitvector 64)))
                                                         (lr:bv (?? (bitvector 64)))
                                                         (lr:bv (?? (bitvector 64)))
                                                         (lr:bv (?? (bitvector 64)))
                                                         (lr:bv (?? (bitvector 64)))
                                                         (lr:bv (?? (bitvector 64)))
                                                         (lr:bv (?? (bitvector 2)))
                                                         (lr:bv (?? (bitvector 2)))
                                                         (lr:bv (?? (bitvector 2)))
                                                         (lr:bv (?? (bitvector 2)))
                                                         (lr:bv (?? (bitvector 2)))
                                                         (lr:bv (?? (bitvector 2)))
                                                         (lr:bv (?? (bitvector 2)))
                                                         (lr:bv (?? (bitvector 2)))
                                                         (logical-to-physical-mapping
                                                          '(bitwise)
                                                          (lr:list (list (lr:bv a)
                                                                         (lr:bv b)
                                                                         (lr:bv (bv 0 8))
                                                                         (lr:bv (bv 0 8))
                                                                         (lr:bv (bv 0 8))
                                                                         (lr:bv (bv 0 8))))))
                                    (lr:integer 8)))))
              (define soln
                (synthesize #:forall (list a b)
                            #:guarantee
                            (begin
                              ; Assert that the output of the CLB implements the requested function f.
                              (assert (bveq (bvand a b) (interpret expr))))))
              (check-true (sat? soln))
              (check-not-exn (thunk (lakeroad->jsexpr (evaluate expr soln))))))
