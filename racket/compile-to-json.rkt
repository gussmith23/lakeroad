#lang racket/base

(provide lakeroad->jsexpr)

(require racket/list
         racket/match
         racket/format
         "comp-json.rkt"
         "logical-to-physical.rkt"
         (only-in rosette
                  bv?
                  concrete?
                  constant?
                  symbolic?
                  bitvector->natural
                  bitvector->bits
                  bitvector-size
                  type-of
                  bitvector
                  zero-extend)
         (prefix-in lr: "language.rkt")
         "architecture-description.rkt")

;;; Compile Lakeroad expr to a JSON jsexpr, which can then be used by Yosys.
;;;
;;; TODO Write helper function to convert Yosys JSON to Verilog.
;;;
;;; - yosys-techmap-format: Whether or not to output in Yosys techmapping format, as described here:
;;;   https://github.com/YosysHQ/yosys/blob/c2285b3460083afbd8f2dd21d81d7f726e8c93d2/passes/techmap/techmap.cc#L1129
(define (lakeroad->jsexpr expr
                          #:module-name [module-name "top"]
                          #:output-signal-name [output-signal-name "out0"]
                          #:yosys-techmap-format [yosys-techmap-format #f])

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
    (hasheq-helper
     #:base cells
     (string->symbol
      (format "~a~a_~a"
              ;;; Prefix with `TECHMAP_REPLACE.` if we're outputting in Yosys techmapping format.
              (if yosys-techmap-format "TECHMAP_REPLACE." "")
              (symbol->string k)
              next-cell-id))
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
                 [(lr:bitvector v) v]
                 [(lr:symbol s) s]
                 [(lr:make-immutable-hash list-expr) (make-immutable-hash (compile list-expr))]
                 [(lr:cons v0-expr v1-expr) (cons (compile v0-expr) (compile v1-expr))]
                 [(lr:hash-remap-keys h-expr ks)
                  (let* ([h (compile h-expr)]
                         [new-h (make-immutable-hash
                                 (hash-map h
                                           (λ (k v)
                                             (cons (cdr (or (assoc k ks)
                                                            (error "old key not found: " k)))
                                                   v))))])
                    new-h)]
                 [(lr:hash-ref h-expr k) (hash-ref (compile h-expr) k)]
                 [(lr:hw-module-instance module-name inst-name ports params _)
                  (let* ([input-ports
                          (filter (λ (p) (equal? (module-instance-port-direction p) 'input)) ports)]
                         [input-port-symbols (map string->symbol
                                                  (map module-instance-port-name input-ports))]
                         ;;; Pairs of input symbol with compiled expression.
                         [input-pairs (map (λ (p)
                                             (cons (string->symbol (module-instance-port-name p))
                                                   (compile (module-instance-port-value p))))
                                           input-ports)]
                         [output-ports
                          (filter (λ (p) (equal? (module-instance-port-direction p) 'output)) ports)]
                         [output-port-symbols (map string->symbol
                                                   (map module-instance-port-name output-ports))]
                         ;;; Pairs of output symbol with allocated bit ids.
                         [output-pairs
                          (map (λ (p)
                                 (let ([bits (get-bits (module-instance-port-bitwidth p))])
                                   (add-netname (string->symbol (module-instance-port-name p))
                                                (make-net-details bits))
                                   (cons (string->symbol (module-instance-port-name p)) bits)))
                               output-ports)]

                         ;;; For now, you can add logic here to override parameter compilation.
                         [compile-parameter-override
                          (lambda (module-name param)

                            (define (intel-cyclone10lp-enum-val-to-str v)
                              (match (bitvector->natural (lr:bv-v v))
                                [0 "none"]
                                [1 "TRUE"]
                                [_ (error "Unknown Cyclone 10 LP enum value" v)]))

                            (define (intel-altmult-accum-enum-val-to-str v)
                              (match (bitvector->natural (lr:bv-v v))
                                [0 "ACLR0"]
                                [1 "ACLR1"]
                                [2 "ACLR2"]
                                [3 "ACLR3"]
                                [4 "ADD"]
                                [5 "AUTO"]
                                [6 "CLOCK0"]
                                [7 "CLOCK1"]
                                [8 "CLOCK2"]
                                [9 "CLOCK3"]
                                [10 "DATAA"]
                                [11 "DATAB"]
                                [12 "NO"]
                                [13 "NONE"]
                                [14 "PORT_CONNECTIVITY"]
                                [15 "PORT_UNUSED"]
                                [16 "PORT_USED"]
                                [17 "SCANA"]
                                [18 "SCANB"]
                                [19 "SIGNED"]
                                [20 "SIMPLE"]
                                [21 "SUB"]
                                [22 "Stratix"]
                                [23 "UNREGISTERED"]
                                [24 "UNSIGNED"]
                                [25 "UNUSED"]
                                [26 "VARIABLE"]
                                [27 "YES"]
                                [28 "altmult_accum"]
                                [_ #f]))

                            (define (dsp48e2-enum-val-to-str v)
                              (match (bitvector->natural (lr:bv-v v))
                                [0 "A"]
                                [1 "B"]
                                [2 "AD"]
                                [3 "NO_RESET"]
                                [4 "RESET_MATCH"]
                                [5 "RESET_NOT_MATCH"]
                                [6 "RESET"]
                                [7 "DIRECT"]
                                [8 "MASK"]
                                [9 "PATTERN"]
                                [10 "MULTIPLY"]
                                [11 "NO_PATDET"]
                                [12 "ONE48"]
                                [13 "FALSE"]
                                [14 "XOR24_48_96"]
                                [15 "CASCADE"]
                                [16 "CEP"]
                                [17 "C"]
                                [18 "DYNAMIC"]
                                [19 "FOUR12"]
                                [20 "NONE"]
                                [21 "PATDET"]
                                [22 "ROUNDING_MODE1"]
                                [23 "ROUNDING_MODE2"]
                                [24 "TRUE"]
                                [25 "TWO24"]
                                [26 "XOR12"]
                                [_ #f]))
                            (define (dsp48e1-enum-val-to-str v)
                              (match (bitvector->natural (lr:bv-v v))
                                [0 "NO_RESET"]
                                [1 "DIRECT"]
                                [2 "MASK"]
                                [3 "PATTERN"]
                                [4 "FALSE"]
                                [5 "MULTIPLY"]
                                [6 "NO_PATDET"]
                                [7 "ONE48"]
                                [8 "CASCADE"]
                                [9 "TRUE"]
                                [10 "PATDET"]
                                [11 "NONE"]
                                [12 "TWO24"]
                                [13 "FOUR12"]
                                [14 "C"]
                                [15 "ROUNDING_MODE1"]
                                [16 "ROUNDING_MODE2"]
                                [17 "RESET_MATCH"]
                                [18 "RESET_NOT_MATCH"]))
                            (define (lattice-mult18x18d-enum-val-to-str v)
                              (match (bitvector->natural (lr:bv-v v))
                                [0 "NONE"]
                                [1 "CE0"]
                                [2 "RST0"]
                                [3 "ENABLED"]
                                [4 "FALSE"]
                                [5 "DISABLED"]
                                [6 "SYNC"]
                                [7 "B_SHIFT"]
                                [8 "C_SHIFT"]
                                [9 "B_C_DYNAMIC"]
                                [10 "HIGHSPEED"]
                                [11 "CLK0"]
                                [12 "CLK1"]
                                [13 "CLK2"]
                                [14 "CLK3"]
                                [15 "CE1"]
                                [16 "CE2"]
                                [17 "CE3"]
                                [18 "RST1"]
                                [19 "RST2"]
                                [20 "RST3"]
                                [21 "ASYNC"]
                                [22 "TRUE"]
                                [23 "STATIC"]
                                [24 "DYNAMIC"]
                                [_ (error (format "Unknown Lattice enum value: ~a" v))]))
                            (cond
                              [(and (equal? module-name "CARRY8")
                                    (equal? (module-instance-parameter-name param) "CARRY_TYPE"))
                               (match (bitvector->natural (lr:bv-v (module-instance-parameter-value
                                                                    param)))
                                 [0 "SINGLE_CY8"]
                                 [1 "DUAL_CY4"]
                                 [_
                                  (error (format "Unexpected CARRY_TYPE ~a"
                                                 (module-instance-parameter-name
                                                  (lr:bv-v (module-instance-parameter-value
                                                            param)))))])]
                              [(and (equal? module-name "DSP48E2")
                                    (member (module-instance-parameter-name param)
                                            (list "AMULTSEL"
                                                  "AUTORESET_PATDET"
                                                  "AUTORESET_PRIORITY"
                                                  "A_INPUT"
                                                  "BMULTSEL"
                                                  "B_INPUT"
                                                  "PREADDINSEL"
                                                  "SEL_MASK"
                                                  "SEL_PATTERN"
                                                  "USE_MULT"
                                                  "USE_PATTERN_DETECT"
                                                  "USE_SIMD"
                                                  "USE_WIDEXOR"
                                                  "XORSIMD")))
                               (dsp48e2-enum-val-to-str (module-instance-parameter-value param))]
                              [(and (equal? module-name "DSP48E1")
                                    (member (module-instance-parameter-name param)
                                            (list "A_INPUT"
                                                  "B_INPUT"
                                                  "USE_DPORT"
                                                  "USE_MULT"
                                                  "USE_SIMD"
                                                  "AUTORESET_PATDET"
                                                  "SEL_MASK"
                                                  "SEL_PATTERN"
                                                  "USE_PATTERN_DETECT")))
                               (dsp48e1-enum-val-to-str (module-instance-parameter-value param))]
                              [(and (or (equal? module-name "MULT18X18C")
                                        (equal? module-name "MULT18X18D")
                                        (equal? module-name "ALU54A"))
                                    (member (module-instance-parameter-name param)
                                            (list "CLK0_DIV"
                                                  "CLK1_DIV"
                                                  "CLK2_DIV"
                                                  "CLK3_DIV"
                                                  "GSR"
                                                  "HIGHSPEED_CLK"
                                                  "MULT_BYPASS"
                                                  "CAS_MATCH_REG"
                                                  "SOURCEB_MODE"
                                                  "REG_INPUTA_CE"
                                                  "REG_INPUTB_CE"
                                                  "REG_INPUTC_CE"
                                                  "REG_PIPELINE_CE"
                                                  "REG_OUTPUT_CE"
                                                  "REG_INPUTA_CLK"
                                                  "REG_INPUTB_CLK"
                                                  "REG_INPUTC_CLK"
                                                  "REG_PIPELINE_CLK"
                                                  "REG_OUTPUT_CLK"
                                                  "REG_INPUTA_RST"
                                                  "REG_INPUTB_RST"
                                                  "REG_INPUTC_RST"
                                                  "REG_PIPELINE_RST"
                                                  "REG_OUTPUT_RST"
                                                  "REG_INPUTC0_CLK"
                                                  "REG_INPUTC0_CE"
                                                  "REG_INPUTC0_RST"
                                                  "REG_INPUTC1_CLK"
                                                  "REG_INPUTC1_CE"
                                                  "REG_INPUTC1_RST"
                                                  "REG_OPCODEOP0_0_CLK"
                                                  "REG_OPCODEOP0_0_CE"
                                                  "REG_OPCODEOP0_0_RST"
                                                  "REG_OPCODEOP1_0_CLK"
                                                  "REG_OPCODEOP0_1_CLK"
                                                  "REG_OPCODEOP0_1_CE"
                                                  "REG_OPCODEOP0_1_RST"
                                                  "REG_OPCODEOP1_1_CLK"
                                                  "REG_OPCODEIN_0_CLK"
                                                  "REG_OPCODEIN_0_CE"
                                                  "REG_OPCODEIN_0_RST"
                                                  "REG_OPCODEIN_1_CLK"
                                                  "REG_OPCODEIN_1_CE"
                                                  "REG_OPCODEIN_1_RST"
                                                  "REG_OUTPUT0_CLK"
                                                  "REG_OUTPUT0_CE"
                                                  "REG_OUTPUT0_RST"
                                                  "REG_OUTPUT1_CLK"
                                                  "REG_OUTPUT1_CE"
                                                  "REG_OUTPUT1_RST"
                                                  "REG_FLAG_CLK"
                                                  "REG_FLAG_CE"
                                                  "REG_FLAG_RST"
                                                  "MCPAT_SOURCE"
                                                  "MASKPAT_SOURCE"
                                                  "GSR"
                                                  "RESETMODE"
                                                  "MULT9_MODE"
                                                  "LEGACY")))
                               (lattice-mult18x18d-enum-val-to-str
                                (module-instance-parameter-value param))]
                              [(and (equal? module-name "altmult_accum")
                                    (member (module-instance-parameter-name param)
                                            (list "input_reg_a"
                                                  "input_aclr_a"
                                                  "multiplier1_direction"
                                                  "multiplier3_direction"
                                                  "input_reg_b"
                                                  "input_aclr_b"
                                                  "port_addnsub"
                                                  "addnsub_reg"
                                                  "addnsub_aclr"
                                                  "addnsub_pipeline_reg"
                                                  "addnsub_pipeline_aclr"
                                                  "accum_direction"
                                                  "accum_sload_reg"
                                                  "accum_sload_aclr"
                                                  "accum_sload_pipeline_reg"
                                                  "accum_sload_pipeline_aclr"
                                                  "representation_a"
                                                  "port_signa"
                                                  "sign_reg_a"
                                                  "sign_aclr_a"
                                                  "sign_pipeline_reg_a"
                                                  "sign_pipeline_aclr_a"
                                                  "port_signb"
                                                  "representation_b"
                                                  "sign_reg_b"
                                                  "sign_aclr_b"
                                                  "sign_pipeline_reg_b"
                                                  "sign_pipeline_aclr_b"
                                                  "multiplier_reg"
                                                  "multiplier_aclr"
                                                  "output_reg"
                                                  "output_aclr"
                                                  "lpm_type"
                                                  "lpm_hint"
                                                  "dedicated_multiplier_circuitry"
                                                  "dsp_block_balancing"
                                                  "intended_device_family"
                                                  "accum_round_aclr"
                                                  "accum_round_pipeline_aclr"
                                                  "accum_round_pipeline_reg"
                                                  "accum_round_reg"
                                                  "accum_saturation_aclr"
                                                  "accum_saturation_pipeline_aclr"
                                                  "accum_saturation_pipeline_reg"
                                                  "accum_saturation_reg"
                                                  "accum_sload_upper_data_aclr"
                                                  "accum_sload_upper_data_pipeline_aclr"
                                                  "accum_sload_upper_data_pipeline_reg"
                                                  "accum_sload_upper_data_reg"
                                                  "mult_round_aclr"
                                                  "mult_round_reg"
                                                  "mult_saturation_aclr"
                                                  "mult_saturation_reg"
                                                  "input_source_a"
                                                  "input_source_b")))
                               (intel-altmult-accum-enum-val-to-str
                                (module-instance-parameter-value param))]
                              [(or (and (equal? module-name "cyclone10lp_mac_out")
                                        (member (module-instance-parameter-name param)
                                                (list "output_clock")))
                                   (and
                                    (equal? module-name "cyclone10lp_mac_mult")
                                    (member
                                     (module-instance-parameter-name param)
                                     (list "dataa_clock" "datab_clock" "signa_clock" "signb_clock"))))
                               (intel-cyclone10lp-enum-val-to-str
                                (module-instance-parameter-value param))]

                              [else #f]))]

                         ;;; Pairs of parameter symbol with value.
                         [param-pairs
                          (map
                           (λ (p)
                             (cons
                              (string->symbol (module-instance-parameter-name p))
                              ;;; Here, we allow for overrides on parameter compilation. This is
                              ;;; because we've had to manually convert string parameters to
                              ;;; bitvectors, and so we need to convert them back for some modules.
                              (or (compile-parameter-override module-name p)
                                  (match (module-instance-parameter-value p)
                                    [(lr:bv v) (make-literal-value-from-bv v)]
                                    ;;; TODO(@gussmith23): This is hardcoded; we should write a little
                                    ;;; compiler here.
                                    [(lr:zero-extend (lr:bv v) (lr:bitvector (bitvector w)))
                                     (make-literal-value-from-bv (zero-extend v (bitvector w)))]))))
                           params)]
                         ;;; TODO(@gussmith23): This is a hack to support CCU2C, which uses string
                         ;;; parameters. We will need to figure out a way around this hack especially
                         ;;; if we want to support other modules that use string parameters e.g. DSP.
                         [param-pairs (if (equal? module-name "CCU2C")
                                          (append param-pairs
                                                  (list (cons 'INJECT1_0 "NO")
                                                        (cons 'INJECT1_1 "NO")))
                                          param-pairs)]
                         [cell (make-cell module-name
                                          (make-cell-port-directions input-port-symbols
                                                                     output-port-symbols)
                                          (make-immutable-hash (append input-pairs output-pairs))
                                          #:params (make-immutable-hash param-pairs))])

                    (add-cell (string->symbol module-name) cell)

                    ;;; Return a hashmap of output port symbols to values.
                    (make-immutable-hash output-pairs))]
                 [(lr:physical-to-logical-mapping f outputs)
                  (compile-physical-to-logical-mapping compile f outputs)]
                 [(lr:logical-to-physical-mapping f inputs)
                  (compile-logical-to-physical-mapping compile f inputs)]

                 ;;; Racket operators.
                 [(lr:take l n) (take (compile l) (compile n))]
                 [(lr:drop l n) (drop (compile l) (compile n))]
                 [(lr:list-ref l n) (list-ref (compile l) (compile n))]
                 [(lr:first lst) (first (compile lst))]
                 [(lr:append lsts) (apply append (compile lsts))]
                 [(lr:map f lsts) (apply map f (compile lsts))]

                 ;;; Rosette operators.
                 [(lr:extract high low v)
                  (drop (take (compile v) (add1 (compile high))) (compile low))]
                 [(lr:zero-extend v bv-type)
                  (append (compile v)
                          (make-list (- (bitvector-size (compile bv-type)) (length (compile v)))
                                     "0"))]
                 [(lr:sign-extend v bv-type)
                  (append (compile v)
                          (make-list (- (bitvector-size (compile bv-type)) (length (compile v)))
                                     (last (compile v))))]
                 [(lr:concat (list v0 v1)) (append (compile v1) (compile v0))]
                 ;; TODO: How to handle variadic rosette concats?
                 ;;; TODO(@gussmith23): Compile, then reverse? Or reverse, then compile?
                 [(lr:concat rst) (apply append (reverse (compile rst)))]

                 [(lr:dup-extend v bv-type)
                  (make-list (bitvector-size (compile bv-type)) (first (compile v)))]

                 ;;; Symbolic bitvector constants correspond to module inputs!
                 [(lr:bv (? bv? (? symbolic? (? constant? s))))
                  (error "Symbolic bitvector constants are not supported.")
                  (void)]

                 ;;; Vars correspond to module inputs!
                 [(lr:var name bw)
                  ;;; Get the port details if they exist; create and return them if they don't.
                  (define port-details
                    (hash-ref ports
                              name
                              (lambda ()
                                (define bits (get-bits bw))
                                (define port-details (make-port-details "input" bits))
                                (add-port (string->symbol name) port-details)
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

  (define outputs (compile expr))

  (add-port (string->symbol output-signal-name) (make-port-details "output" outputs))

  (define doc (make-lakeroad-json-doc))
  (add-module-to-doc
   doc
   (string->symbol module-name)
   (make-module ports cells netnames #:parameter-default-values parameter-default-values))

  doc)

(module+ test
  (require rosette
           rackunit)

  ;;; Re-enable this test when we support multiple outputs.
  ;;; (test-case "multiple outputs" (define-symbolic a b (bitvector 8))
  ;;;             (define out (lakeroad->jsexpr (list a b a)))
  ;;;             (define modules (hash-ref out 'modules))
  ;;;             (check-equal? (hash-count modules) 1)
  ;;;             (define module (hash-ref modules 'top))
  ;;;             (check-equal? (hash-count (hash-ref module 'ports)) 5))

  (test-case "test"
    (define out (lakeroad->jsexpr (lr:bv (bv #b000111 6))))
    (check-equal?
     (hash-ref (hash-ref (hash-ref out 'modules) 'top) 'ports)
     (hasheq-helper 'out0 (hasheq-helper 'bits '("1" "1" "1" "0" "0" "0") 'direction "output")))))
