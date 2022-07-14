#lang errortrace racket
;;; Synthesis routines for the various architectures.
;;;
;;; TODO provide a top-level synthesis procedure?

(provide synthesize-xilinx-ultrascale-plus-impl
         synthesize-sofa-impl
         synthesize-lattice-ecp5-impl)

(require "interpreter.rkt"
         "ultrascale.rkt"
         "lattice-ecp5.rkt"
         rosette
         rosette/lib/synthax
         rosette/lib/angelic
         racket/pretty
         rosette/solver/smt/boolector
         "utils.rkt")

(current-solver (boolector))

(define (synthesize-sofa-impl bv-expr)
  (or (synthesize-sofa-impl-simple bv-expr) (error "Could not synthesize!")))

(define (synthesize-sofa-impl-simple bv-expr)
  (when (> (length (symbolics bv-expr)) 4)
    (error "Only 4 inputs supported"))

  ;;; Bitwidth of the output.
  (define out-bw (bvlen bv-expr))
  (when (not (concrete? out-bw))
    (error "Out bitwidth must be statically known."))

  ;;; Max bitwidth of any input.
  ;;; If there are no symbolic vars in the expression, default to the bitwidth of the output.
  (define max-input-bw
    (if (empty? (symbolics bv-expr)) out-bw (apply max (map bvlen (symbolics bv-expr)))))
  (when (not (concrete? max-input-bw))
    (error "Input bitwidths must be statically known."))

  ;;; Form the list of logical inputs.
  ;;; Zero-extend them so they're all the same size.
  ;;; Pad so there's 4 logical inputs.
  (define logical-inputs
    (append (map (lambda (v) (zero-extend v (bitvector max-input-bw))) (symbolics bv-expr))
            (make-list (- 4 (length (symbolics bv-expr))) (bv 0 max-input-bw))))

  (define lutmem (?? (bitvector 16)))

  (define lakeroad-expr
    (let* ([physical-inputs `(logical-to-physical-mapping (bitwise) ,logical-inputs)]
           [physical-outputs (for/list ([i max-input-bw])
                               `(sofa-lut4 ,lutmem (list-ref ,physical-inputs ,i)))])
      `(extract ,(sub1 out-bw) 0 (first (physical-to-logical-mapping (bitwise) ,physical-outputs)))))

  (interpret lakeroad-expr)
  (define soln
    ; TODO(@gussmith23) Time synthesis. For some reason, time-apply doesn't mix well with synthesize.
    ; And time just prints to stdout, which is not ideal (but we could deal with it if necessary).
    (synthesize #:forall logical-inputs
                #:guarantee (begin
                              (assert (bveq bv-expr (interpret lakeroad-expr))))))

  (if (sat? soln) (evaluate lakeroad-expr soln) #f))

;;; Synthesize a Xilinx UltraScale+ Lakeroad expression for the given Rosette bitvector expression
;;; using smaller LUTs.
(define (synthesize-xilinx-ultrascale-plus-impl-smaller-luts bv-expr)
  (when (> (length (symbolics bv-expr)) 6)
    (error "Only 6 inputs supported"))

  ;;; Bitwidth of the output.
  (define out-bw (bvlen bv-expr))
  (when (not (concrete? out-bw))
    (error "Out bitwidth must be statically known."))

  ;;; Max bitwidth of any input.
  ;;; If there are no symbolic vars in the expression, default to the bitwidth of the output.
  (define max-input-bw
    (if (empty? (symbolics bv-expr)) out-bw (apply max (map bvlen (symbolics bv-expr)))))
  (when (not (concrete? max-input-bw))
    (error "Input bitwidths must be statically known."))

  ;;; Form the list of logical inputs.
  ;;; Zero-extend them so they're all the same size.
  ;;; TODO I think there's an error here --- Don't we need to pad to length 6?
  ; (define logical-inputs
  ;   (map (lambda (v)
  ;          (if (not (= (bvlen v) max-input-bw)) (dup-extend v (bitvector max-input-bw)) v))
  ;        (symbolics bv-expr)))
  ; (define logical-inputs
  ;   (map (lambda (v)
  ;          (choose `(zero-extend ,v ,(bitvector max-input-bw))
  ;                  `(dup-extend this-is-a-hack-for-dup-extend ,v ,(bitvector max-input-bw))))
  ;        (symbolics bv-expr)))
  (define logical-inputs
    (map (lambda (v)
           (choose (zero-extend v (bitvector max-input-bw))
                   (if (not (= (bvlen v) max-input-bw)) (dup-extend v (bitvector max-input-bw)) v)))
         (symbolics bv-expr)))

  (define lut-fn
    (match (length (symbolics bv-expr))
      [1 'ultrascale-plus-lut1]
      [2 'ultrascale-plus-lut2]
      [3 'ultrascale-plus-lut3]))

  (define lutmem
    (match (length (symbolics bv-expr))
      [1 (?? (bitvector 2))]
      [2 (?? (bitvector 4))]
      [3 (?? (bitvector 8))]))

  (define lakeroad-expr
    (let* ([physical-inputs `(logical-to-physical-mapping ,(choose '(bitwise) '(bitwise-reverse))
                                                          ,logical-inputs)]
           [physical-outputs (for/list ([i max-input-bw])
                               `(,lut-fn ,lutmem (list-ref ,physical-inputs ,i)))])
      `(extract ,(sub1 out-bw)
                0
                (first (physical-to-logical-mapping ,(choose '(bitwise) '(bitwise-reverse))
                                                    ,physical-outputs)))))

  (error-print-width 1000000)
  (displayln "fuck this shit")
  (pretty-display lakeroad-expr)
  (displayln "AAAAAAA")
  (pretty-display (interpret lakeroad-expr))
  (interpret lakeroad-expr)
  (define soln
    ; TODO(@gussmith23) Time synthesis. For some reason, time-apply doesn't mix well with synthesize.
    ; And time just prints to stdout, which is not ideal (but we could deal with it if necessary).
    (synthesize #:forall logical-inputs
                #:guarantee (begin
                              (assert (bveq bv-expr (interpret lakeroad-expr))))))

  (if (sat? soln)
      (evaluate lakeroad-expr
                (complete-solution soln
                                   (set->list (set-subtract (list->set (symbolics lakeroad-expr))
                                                            (list->set (symbolics bv-expr))))))
      #f))

(module+ test
  (require rackunit
           rosette)
  (test-begin
   (define-symbolic a b (bitvector 8))
   (check-not-equal? #f (synthesize-xilinx-ultrascale-plus-impl-smaller-luts (bvand a b)))))

;;; Synthesize a Xilinx UltraScale+ Lakeroad expression for the given Rosette bitvector expression.
;;;
;;; TODO Support returning #f or something if we can't synthesize.
;;;
;;; TODO Use the grammar to generate *any* Lakeroad program. This will probably require that we also
;;; let the user specify the depth to search over and other parameters. At the very least, start by
;;; defining those as keyword args with default values.
(define (synthesize-xilinx-ultrascale-plus-impl bv-expr)
  (if (empty? (symbolics bv-expr))
      ;;; If the expression is a constant, then it's a valid Lakeroad expression. Return it!
      bv-expr
      (let ([out (synthesize-xilinx-ultrascale-plus-impl-smaller-luts bv-expr)])
        (if (not (equal? #f out))
            out
            (synthesize-xilinx-ultrascale-plus-impl-kitchen-sink bv-expr)))))

;;; Throw the kitchen sink at it -- try synthesizing with full CLBs, using LUT6_2s and carry chains.
;;; This is our original synthesis implementation, and remains our fallback.
(define (synthesize-xilinx-ultrascale-plus-impl-kitchen-sink bv-expr)
  (when (> (length (symbolics bv-expr)) 6)
    (error "Only 6 inputs supported"))

  ;;; Bitwidth of the output.
  (define out-bw (bvlen bv-expr))
  (when (not (concrete? out-bw))
    (error "Out bitwidth must be statically known."))

  ;;; Max bitwidth of any input.
  ;;; If there are no symbolic vars in the expression, default to the bitwidth of the output.
  (define max-input-bw
    (if (empty? (symbolics bv-expr)) out-bw (apply max (map bvlen (symbolics bv-expr)))))
  (when (not (concrete? max-input-bw))
    (error "Input bitwidths must be statically known."))

  ;;; Number of CLBs needed to take all of the input bits, assuming each CLB gets at most 8 bits from
  ;;; any one input.
  (define num-clbs (ceiling (/ max-input-bw 8)))

  ;;; The bitwidth that all logical inputs should be extended to.
  (define logical-input-width (* 8 num-clbs))

  ;;; Form the list of logical inputs, and pad up to make sure there are 6.
  ;;; We also zero-extend each input so that it is the correct size.
  (define logical-inputs
    (map (lambda (v) (zero-extend v (bitvector logical-input-width)))
         (append (symbolics bv-expr)
                 (make-list (- 6 (length (symbolics bv-expr))) (bvnot (bv 0 logical-input-width))))))

  (define physical-inputs `(logical-to-physical-mapping (bitwise) ,logical-inputs))

  ;;; Split the physical inputs into groups, grouped by LUT.
  (define physical-inputs-per-clb
    (for/list ([clb-i (range num-clbs)])
      `(take (drop ,physical-inputs ,(* 8 clb-i)) 8)))

  ;;; Returns (list logical-outputs cout).
  (define (clb cin lutmem mux physical-inputs)
    (let* ([clb-out `(ultrascale-plus-clb ,cin
                                          ,lutmem
                                          ,lutmem
                                          ,lutmem
                                          ,lutmem
                                          ,lutmem
                                          ,lutmem
                                          ,lutmem
                                          ,lutmem
                                          ,mux
                                          ,mux
                                          ,mux
                                          ,mux
                                          ,mux
                                          ,mux
                                          ,mux
                                          ,mux
                                          ,physical-inputs)])
      (list `(take ,clb-out 8) `(list-ref ,clb-out 8))))

  (match-define (list physical-outputs cout)
    (let ([cin (?? (bitvector 1))] [lutmem (?? (bitvector 64))] [mux (?? (bitvector 2))])
      (foldl (lambda (physical-inputs previous-out)
               (match-let* ([(list accumulated-physical-output previous-cout) previous-out]
                            [(list this-clb-physical-outputs this-cout)
                             (clb previous-cout lutmem mux physical-inputs)]
                            [accumulated-physical-output
                             (if (equal? accumulated-physical-output 'first)
                                 this-clb-physical-outputs
                                 `(append ,accumulated-physical-output ,this-clb-physical-outputs))])
                           (list accumulated-physical-output this-cout)))
             ;;; It would be cleaner if we could use (bv 0 0) instead of 'first, but it's not allowed.
             (list 'first cin)
             physical-inputs-per-clb)))

  (define lakeroad-expr
    `(extract ,(sub1 out-bw)
              0
              (first (physical-to-logical-mapping ,(choose '(bitwise) '(bitwise-reverse))
                                                  ,physical-outputs))))
  (define soln
    (synthesize #:forall logical-inputs
                #:guarantee (begin
                              (assert (bveq bv-expr (interpret lakeroad-expr))))))

  (when (not (sat? soln))
    (error "expected sat soln"))

  (evaluate lakeroad-expr
            (complete-solution soln
                               (set->list (set-subtract (list->set (symbolics lakeroad-expr))
                                                        (list->set (symbolics bv-expr)))))))

(define (synthesize-lattice-ecp5-impl bv-expr #:primitive [primitive 'all])
  (match primitive
    ['all (synthesize-lattice-ecp5-search-impl bv-expr)]
    ['pfu (synthesize-lattice-ecp5-for-pfu bv-expr)]
    ['ccu2c (synthesize-lattice-ecp5-for-primitive-impl bv-expr #:primitive 'ccu2c)]
    ['ripple-pfu (synthesize-lattice-ecp5-for-ripple-pfu bv-expr)]))

;; Recursively search through primitives to synthesize bv-expr
(define (synthesize-lattice-ecp5-search-impl bv-expr #:primitives [primitives '(pfu ripple-pfu)])
  (match primitives
    [(cons prim prims)
     (or (synthesize-lattice-ecp5-impl bv-expr #:primitive prim)
         (synthesize-lattice-ecp5-search-impl bv-expr #:primitives prims))]
    ['() 'unsynthesizable]))

;;; Synthesize a Lattice ECP5 Lakeroad expression for the given Rosette
;;; bitvector expression.
;;;
;;; Optionally specify the primitive to target, including:
;;;  + 'pfu: a normal pfu
;;;  + 'ccu2c: a 2 bit ccu2c (2-bit adders, etc)
;;;  + 'ripple-pfu: a pfu in ripple mode (8-bit adders, etc)
(define (synthesize-lattice-ecp5-for-primitive-impl bv-expr #:primitive [primitive 'pfu])

  (when (> (length (symbolics bv-expr)) 4)
    (error "Only 4 inputs supported"))

  (define out-bw (bvlen bv-expr))
  (when (not (concrete? out-bw))
    (error "Out bitwidth must be statically known."))

  (define logical-inputs (get-lattice-logical-inputs bv-expr #:expected-bw 8))
  (define lakeroad-expr
    `(extract ,(sub1 out-bw)
              0
              (first (physical-to-logical-mapping
                      (bitwise)
                      ,(match primitive
                         ['pfu (make-lattice-pfu-expr logical-inputs)]
                         ['ccu2c (make-lattice-ccu2c-expr #:inputs logical-inputs)]
                         ['ripple-pfu (make-lattice-ripple-pfu-expr #:inputs logical-inputs)]
                         [_ (error (format "Unsupported primitive ~a" primitive))])))))

  (define soln
    (synthesize #:forall logical-inputs
                #:guarantee (begin
                              (assert (bveq bv-expr (interpret lakeroad-expr))))))

  (if (sat? soln)
      (evaluate
       lakeroad-expr
       ;;; Complete the solution: fill in any symbolic values that *aren't* the logical inputs.
       (complete-solution soln
                          (set->list (set-subtract (list->set (symbolics lakeroad-expr))
                                                   (list->set (symbolics bv-expr))))))
      #f))

(define (synthesize-lattice-ecp5-for-ripple-pfu bv-expr)

  (when (> (length (symbolics bv-expr)) 4)
    (error "Only 4 inputs supported"))

  (define out-bw (bvlen bv-expr))
  (when (not (concrete? out-bw))
    (error "Out bitwidth must be statically known."))

  ;;; Max bitwidth of any input.
  ;;; If there are no symbolic vars in the expression, default to the bitwidth of the output.
  (define max-input-bw
    (if (empty? (symbolics bv-expr)) out-bw (apply max (map bvlen (symbolics bv-expr)))))
  (when (not (concrete? max-input-bw))
    (error "Input bitwidths must be statically known."))

  ;;; Number of PFUs needed to take all of the input bits, assuming each CLB gets at most 8 bits from
  ;;; any one input.
  (define num-pfus (ceiling (/ max-input-bw 8)))

  ;;; The bitwidth that all logical inputs should be extended to.
  (define logical-input-width (* 8 num-pfus))
  (define logical-inputs (get-lattice-logical-inputs bv-expr #:expected-bw logical-input-width))

  ;;; Split the logical inputs into groups, grouped by PFU.
  (define logical-inputs-per-pfu
    (for/list ([pfu-i (range num-pfus)])
      (for/list ([logical-input logical-inputs])
        (extract (sub1 (* 8 (add1 pfu-i))) (* 8 pfu-i) logical-input))))

  (match-define (list physical-output cout)
    (let ([cin (?? (bitvector 1))] [lutmem (?? (bitvector 16))])
      (foldl (lambda (logical-inputs previous-out)
               (match-let* ([(list accumulated-physical-output previous-cout) previous-out]
                            [(list this-pfu-physical-outputs this-cout)
                             (let ([pfu-out (make-lattice-ripple-pfu-expr
                                             #:inputs logical-inputs
                                             #:CIN previous-cout
                                             #:INIT0 lutmem
                                             #:INIT1 lutmem
                                             #:INIT2 lutmem
                                             #:INIT3 lutmem
                                             #:INIT4 lutmem
                                             #:INIT5 lutmem
                                             #:INIT6 lutmem
                                             #:INIT7 lutmem
                                             #:MAPPING (choose '(bitwise) '(bitwise-reverse)))])

                               (list `(take ,pfu-out 8) `(list-ref ,pfu-out 8)))]
                            [accumulated-physical-output
                             (if (equal? accumulated-physical-output 'first)
                                 this-pfu-physical-outputs
                                 `(append ,accumulated-physical-output ,this-pfu-physical-outputs))])
                           (list accumulated-physical-output this-cout)))
             ;;; It would be cleaner if we could use (bv 0 0) instead of 'first, but it's not allowed.
             (list 'first cin)
             logical-inputs-per-pfu)))

  (define lakeroad-expr
    `(extract ,(sub1 out-bw)
              0
              (first (physical-to-logical-mapping ,(choose '(bitwise) '(bitwise-reverse))
                                                  ,physical-output))))

  (interpret lakeroad-expr)

  (define soln
    (synthesize #:forall logical-inputs
                #:guarantee (begin
                              (assert (bveq bv-expr (interpret lakeroad-expr))))))

  (if (sat? soln)
      (evaluate
       lakeroad-expr
       ;;; Complete the solution: fill in any symbolic values that *aren't* the logical inputs.
       (complete-solution soln
                          (set->list (set-subtract (list->set (symbolics lakeroad-expr))
                                                   (list->set (symbolics bv-expr))))))
      #f))

(define (synthesize-lattice-ecp5-for-pfu bv-expr)

  (when (> (length (symbolics bv-expr)) 4)
    (error "Only 4 inputs supported"))

  (define out-bw (bvlen bv-expr))
  (when (not (concrete? out-bw))
    (error "Out bitwidth must be statically known."))

  ;;; Max bitwidth of any input.
  ;;; If there are no symbolic vars in the expression, default to the bitwidth of the output.
  (define max-input-bw
    (if (empty? (symbolics bv-expr)) out-bw (apply max (map bvlen (symbolics bv-expr)))))
  (when (not (concrete? max-input-bw))
    (error "Input bitwidths must be statically known."))

  ;;; Number of PFUs needed to take all of the input bits, assuming each CLB gets at most 8 bits from
  ;;; any one input.
  (define num-pfus (ceiling (/ max-input-bw 8)))

  ;;; The bitwidth that all logical inputs should be extended to.
  (define logical-input-width (* 8 num-pfus))
  (define logical-inputs (get-lattice-logical-inputs bv-expr #:expected-bw logical-input-width))

  ;;; Split the logical inputs into groups, grouped by PFU.
  (define logical-inputs-per-pfu
    (for/list ([pfu-i (range num-pfus)])
      (for/list ([logical-input logical-inputs])
        (extract (sub1 (* 8 (add1 pfu-i))) (* 8 pfu-i) logical-input))))

  (define logical-output
    (let ([cin (?? (bitvector 1))] [lutmem (?? (bitvector 16))])
      (foldl (lambda (logical-inputs previous-out)
               (match-let* ([accumulated-logical-output previous-out]
                            [this-pfu-logical-outputs
                             (let ([pfu-out (make-lattice-pfu-expr logical-inputs)])
                               `(first (physical-to-logical-mapping (bitwise) (take ,pfu-out 8))))]
                            [accumulated-logical-output
                             (if (equal? accumulated-logical-output 'first-iter)
                                 this-pfu-logical-outputs
                                 `(concat ,this-pfu-logical-outputs ,accumulated-logical-output))])
                           accumulated-logical-output))
             ;;; It would be cleaner if we could use (bv 0 0) instead of 'first, but it's not allowed.
             'first-iter
             logical-inputs-per-pfu)))

  (define lakeroad-expr `(extract ,(sub1 out-bw) 0 ,logical-output))

  (interpret lakeroad-expr)

  (define soln
    (synthesize #:forall logical-inputs
                #:guarantee (begin
                              (assert (bveq bv-expr (interpret lakeroad-expr))))))

  (if (sat? soln)
      (evaluate
       lakeroad-expr
       ;;; Complete the solution: fill in any symbolic values that *aren't* the logical inputs.
       (complete-solution soln
                          (set->list (set-subtract (list->set (symbolics lakeroad-expr))
                                                   (list->set (symbolics bv-expr))))))
      #f))
