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
;;;
;;; Sketch generators should return a list of two items:
;;; - The sketch, which is a Lakeroad expression with holes (i.e. symbolic Rosette values).
;;; - An opaque "internal data" object. This object is used to share symbolic state between
;;;   invocations of a sketch generator. If you would like to use a sketch generator multiple times to
;;;   generate a larger sketch, and you know that the symbolic state (e.g. the LUT memories) between
;;;   the two sketches should be the same (e.g. they're both performing addition), then you can pass
;;;   this internal data to the second invocation of the sketch generator.

#lang racket/base

(provide generate-sketch
         all-sketch-generators
         bitwise-sketch-generator
         bitwise-with-carry-sketch-generator
         carry-sketch-generator
         comparison-sketch-generator
         shallow-comparison-sketch-generator
         multiplication-sketch-generator
         shift-sketch-generator
         single-dsp-sketch-generator
         parallel-dsp-sketch-generator
         parallel-add-dsp-sketch-generator
         make-sketch-inputs)

(require "architecture-description.rkt"
         "logical-to-physical.rkt"
         (prefix-in lr: "language.rkt")
         "signal.rkt"
         rosette
         rosette/lib/synthax
         racket/pretty
         "verilator.rkt"
         rosette/lib/angelic
         "utils.rkt")

;;; List of all sketch generators. Ordered roughly in terms of complexity/expected synthesis time.
(define (all-sketch-generators)
  (list bitwise-sketch-generator
        carry-sketch-generator
        bitwise-with-carry-sketch-generator
        comparison-sketch-generator
        multiplication-sketch-generator))

;;; A struct which captures all of the Lakeroad expression inputs and metadata used by sketch
;;; generators.
;;;
;;; Note: it's useful to use `make-sketch-inputs` to construct these structs, rather
;;; than the default constructor, especially when you don't have a clock or reset.
;;;
;;; - output-width: int: the bitwidth of the output. In the future, we'll likely want to support
;;;     multiple outputs here.
;;; - clk: (cons lr-expr int) or #f: the expr and bitwidth of the clock, if one exists.
;;; - rst: (cons lr-expr int) or #f: the expr and bitwidth of the reset, if one exists.
;;; - data: (listof (cons lr-expr int)): the exprs and bitwidths of the data inputs.
(struct sketch-inputs (output-width clk rst data) #:transparent)
(define (make-sketch-inputs #:output-width output-width #:data data #:clk [clk #f] #:rst [rst #f])
  (begin
    (sketch-inputs output-width clk rst data)))

;;; Simple helper to generate an architecture-specific sketch for the given bitvector expression.
(define (generate-sketch sketch-generator architecture-description bv-expr)
  (first (sketch-generator architecture-description
                           (make-sketch-inputs
                            #:data (map (lambda (symb) (cons (lr:bv (bv->signal symb)) (bvlen symb)))
                                        (symbolics bv-expr))
                            #:output-width (bvlen bv-expr)))))

;;; Generates a "bitwise" sketch, for operations like AND and OR.
;;;
;;; Bitwise operations are very simple: for n-bit inputs i0 and i1, bit 0 of i0 and bit 0 of i1 are
;;; paired together and put into a LUT, bit 1 of i0 and bit 1 of i1 are paired together and put into a
;;; LUT, and so on. This simple pattern is able to implement many useful operations.
;;;
;;; - sketch-inputs: a `sketch-inputs` struct describing the inputs to the sketch.
(define (bitwise-sketch-generator architecture-description
                                  sketch-inputs
                                  #:internal-data [internal-data #f])
  (match-let*
      ([_ 1] ;;; Dummy line to prevent formatter from messing up my comment structure.

       [_ (when (sketch-inputs-clk sketch-inputs)
            (error "Bitwise sketches do not support clocks."))]
       [_ (when (sketch-inputs-rst sketch-inputs)
            (error "Bitwise sketches do not support resets."))]
       ;;; We used to take an input named `logical-inputs`, but now we take `sketch-inputs` instead.
       ;;; Reconstruct the old `logical-inputs`, plus some other legacy inputs.
       [logical-inputs (lr:list (map car (sketch-inputs-data sketch-inputs)))]
       [num-logical-inputs (length (sketch-inputs-data sketch-inputs))]
       [bitwidth (sketch-inputs-output-width sketch-inputs)]

       ;;; Unpack the internal data.
       [lut-internal-data (if internal-data (first internal-data) #f)]
       [logical-to-physical-chooser (if internal-data (second internal-data) (?? boolean?))]
       [physical-to-logical-chooser (if internal-data (third internal-data) (?? boolean?))]
       [logical-input-extension-choosers (if internal-data
                                             (fourth internal-data)
                                             (for/list ([i num-logical-inputs])
                                               (define-symbolic* logical-input-extension-chooser
                                                                 boolean?)
                                               logical-input-extension-chooser))]

       [logical-inputs (lr:list (for/list ([i num-logical-inputs]
                                           [chooser logical-input-extension-choosers])
                                  (if chooser
                                      (lr:zero-extend (lr:list-ref logical-inputs (lr:integer i))
                                                      (lr:bitvector (bitvector bitwidth)))
                                      (lr:dup-extend (lr:list-ref logical-inputs (lr:integer i))
                                                     (lr:bitvector (bitvector bitwidth))))))]

       ;;; First, we construct a LUT just to get the `internal-data`. We will reuse this internal data
       ;;; to create more LUTs which use the same LUT memory. Note that if lut-internal-data is not #f
       ;;; above, then this function should simply pass it through and not change it, so it's
       ;;; effectively a no-op in the case where lut-internal-data isn't #f.
       [(list _ lut-internal-data)
        (construct-interface
         architecture-description
         (interface-identifier "LUT" (hash "num_inputs" num-logical-inputs))
         ;;; Note that we don't care what the inputs are hooked up to here, because we are
         ;;; just trying to get the internal data.
         (for/list ([i num-logical-inputs])
           (cons (format "I~a" i) (bv 0 1)))
         #:internal-data lut-internal-data)]

       ;;; Get physical inputs to luts by performing a logical-to-physical mapping.
       [physical-inputs (lr:logical-to-physical-mapping
                         (if logical-to-physical-chooser (lr:ltop-bitwise) (lr:ltop-bitwise-reverse))
                         logical-inputs)]

       ;;; Construct the LUTs.
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

       ;;; Construct the output by mapping the physical outputs back to logical space and taking the
       ;;; first result.
       ;;;
       ;;; TODO(@gussmith23): Could support more results in the future.
       [logical-outputs (lr:physical-to-logical-mapping
                         (if physical-to-logical-chooser (lr:ptol-bitwise) (lr:ptol-bitwise-reverse))
                         physical-outputs)]
       [out-expr (lr:list-ref logical-outputs (lr:integer 0))])

    (list out-expr
          (list lut-internal-data
                logical-to-physical-chooser
                physical-to-logical-chooser
                logical-input-extension-choosers))))

;;; Try using _only_ a carry chain! Pass the first logical input to DI
;;; and the second logical input to S.
(define (carry-sketch-generator architecture-description
                                sketch-inputs
                                #:internal-data [internal-data #f])
  (match-let* ([_ 1] ;;; Dummy line to prevent formatter from messing up comment structure

               [_ (when (sketch-inputs-clk sketch-inputs)
                    (error "Bitwise sketches do not support clocks."))]
               [_ (when (sketch-inputs-rst sketch-inputs)
                    (error "Bitwise sketches do not support resets."))]
               ;;; We used to take an input named `logical-inputs`, but now we take `sketch-inputs`
               ;;; instead. Reconstruct the old `logical-inputs`, plus some other legacy inputs.
               [logical-inputs (lr:list (map car (sketch-inputs-data sketch-inputs)))]
               [num-logical-inputs (length (sketch-inputs-data sketch-inputs))]
               [bitwidth (sketch-inputs-output-width sketch-inputs)]

               [(list carry-expr internal-data)
                (construct-interface architecture-description
                                     (interface-identifier "carry" (hash "width" bitwidth))
                                     (list (cons "CI" (lr:bv (bv->signal (?? (bitvector 1)))))
                                           (cons "DI" (lr:list-ref logical-inputs (lr:integer 0)))
                                           (cons "S"
                                                 (if (>= num-logical-inputs 2)
                                                     (lr:list-ref logical-inputs (lr:integer 1))
                                                     (lr:bv (bv->signal (?? (bitvector bitwidth)))))))
                                     #:internal-data internal-data)]
               [out-expr (lr:hash-ref carry-expr 'O)])
    (list out-expr internal-data)))

;;; Using a DSP block, where "A" is the first logical input and "B" is the second logical input.
;;; Essentially a wrapper for the DSP interface right now!
;;; TODO(@ninehusky): ask about the bitwidth
;;; (do we need to revisit this decision at the interface level?)
;;; and, do we need to assert that there are exactly two logical inputs?
;;;
;;; - architecture-description: the architecture description of the architecture to generate the
;;;     sketch for.
;;; - inputs: a sketch-inputs struct.
(define (single-dsp-sketch-generator architecture-description
                                     inputs
                                     #:internal-data [internal-data #f])
  (match-let* ([_ 1] ;;; Dummy line to prevent formatter from messing up comment structure
               ;;; Unpack clk and rst signals; default to 0 if neither is set.
               [test (displayln "INPUTS ARE HERE")]
               [test2 (displayln inputs)]
               [test4 (displayln (sketch-inputs-data inputs))]
               [test3 (displayln (assoc "c" (sketch-inputs-data inputs)))]
               [clk-expr (if (sketch-inputs-clk inputs)
                             (car (sketch-inputs-clk inputs))
                             (lr:bv (bv->signal (bv 0 1))))]
               [rst-expr (if (sketch-inputs-rst inputs)
                             (car (sketch-inputs-rst inputs))
                             (lr:bv (bv->signal (bv 0 1))))]

               [make-dsp-expr (lambda (internal-data out-width
                                                     clk-expr
                                                     rst-expr
                                                     a-expr
                                                     a-width
                                                     b-expr
                                                     b-width
                                                     c-expr
                                                     c-width
                                                     d-expr
                                                     d-width)
                                (match-define (list dsp-expr ignored-internal-data)
                                  (construct-interface architecture-description
                                                       (interface-identifier "DSP"
                                                                             (hash "out-width"
                                                                                   out-width
                                                                                   "a-width"
                                                                                   a-width
                                                                                   "b-width"
                                                                                   b-width
                                                                                   "c-width"
                                                                                   c-width
                                                                                   "d-width"
                                                                                   d-width))
                                                       (list (cons "clk" clk-expr)
                                                             (cons "rst" rst-expr)
                                                             (cons "A" a-expr)
                                                             (cons "B" b-expr)
                                                             (cons "C" c-expr)
                                                             (cons "D" d-expr))
                                                       #:internal-data internal-data))
                                ;;; Ignoring internal data for now, but we could use it in the future.
                                ;(list (lr:hash-ref dsp-expr 'O) internal-data)
                                (lr:hash-ref dsp-expr 'O))]
               ;;; TODO(@gussmith23): Support a variable number of data inputs, i.e. if they don't
               ;;; give C.
               [(list (cons a-expr a-bw) (cons b-expr b-bw) (cons c-expr c-bw) (cons d-expr d-bw))
                (match (sketch-inputs-data inputs)
                  [(list a-tuple b-tuple c-tuple d-tuple) (list a-tuple b-tuple c-tuple d-tuple)]
                  [(list a-tuple b-tuple c-tuple)
                   (list a-tuple b-tuple c-tuple (cons (lr:bv (bv->signal (bv 0 1))) 1))]
                  [(list a-tuple b-tuple)
                   (list a-tuple
                         b-tuple
                         (cons (lr:bv (bv->signal (bv 0 1))) 1)
                         (cons (lr:bv (bv->signal (bv 0 1))) 1))])]

               [out-expr (choose (make-dsp-expr internal-data
                                                (sketch-inputs-output-width inputs)
                                                clk-expr
                                                rst-expr
                                                a-expr
                                                a-bw
                                                b-expr
                                                b-bw
                                                c-expr
                                                c-bw
                                                d-expr
                                                d-bw))])
    (list out-expr internal-data)))
(define (parallel-dsp-bla-sketch-generator architecture-description
                                           inputs
                                           #:internal-data [internal-data #f])
  (match-let* ([_ 1]
               [clk-expr (if (sketch-inputs-clk inputs)
                             (car (sketch-inputs-clk inputs))
                             (lr:bv (bv->signal (bv 0 1))))]
               [rst-expr (if (sketch-inputs-rst inputs)
                             (car (sketch-inputs-rst inputs))
                             (lr:bv (bv->signal (bv 0 1))))]
               [make-dsp-expr (lambda (internal-data out-width
                                                     clk-expr
                                                     rst-expr
                                                     a-expr
                                                     a-width
                                                     b-expr
                                                     b-width
                                                     c-expr
                                                     c-width
                                                     d-expr
                                                     d-width
                                                     cin-expr)
                                (match-define (list dsp-expr ignored-internal-data)
                                  (construct-interface architecture-description
                                                       (interface-identifier "DSP"
                                                                             (hash "out-width"
                                                                                   out-width
                                                                                   "a-width"
                                                                                   a-width
                                                                                   "b-width"
                                                                                   b-width
                                                                                   "c-width"
                                                                                   c-width
                                                                                   "d-width"
                                                                                   d-width))
                                                       (list (cons "clk" clk-expr)
                                                             (cons "rst" rst-expr)
                                                             (cons "A" a-expr)
                                                             (cons "B" b-expr)
                                                             (cons "C" c-expr)
                                                             (cons "D" d-expr)
                                                             (cons "CARRYIN" cin-expr))
                                                       #:internal-data internal-data))
                                ;;; Ignoring internal data for now, but we could use it in the future.
                                dsp-expr)]
               [get-dsp-output (lambda (dsp-expr out) (lr:hash-ref dsp-expr out))]
               [(list a-expr a-bw) (if (assoc "a" (sketch-inputs-data inputs))
                                       (list (second (assoc "a" (sketch-inputs-data inputs)))
                                             (third (assoc "a" (sketch-inputs-data inputs))))
                                       (list (lr:bv (bv->signal (choose (bv 0 1) (bv 1 1)))) 1))]
               [(list b-expr b-bw) (if (assoc "b" (sketch-inputs-data inputs))
                                       (list (second (assoc "b" (sketch-inputs-data inputs)))
                                             (third (assoc "b" (sketch-inputs-data inputs))))
                                       (list (lr:bv (bv->signal (choose (bv 0 1) (bv 1 1)))) 1))]
               [(list c-expr c-bw) (if (assoc "c" (sketch-inputs-data inputs))
                                       (list (second (assoc "c" (sketch-inputs-data inputs)))
                                             (third (assoc "c" (sketch-inputs-data inputs))))
                                       (list (lr:bv (bv->signal (choose (bv 0 1) (bv 1 1)))) 1))]
               [(list d-expr d-bw) (if (assoc "d" (sketch-inputs-data inputs))
                                       (list (second (assoc "d" (sketch-inputs-data inputs)))
                                             (third (assoc "d" (sketch-inputs-data inputs))))
                                       (list (lr:bv (bv->signal (choose (bv 0 1) (bv 1 1)))) 1))]

               [lookup-port-width
                (lambda (x name)
                  (hash-ref (interface-identifier-parameters
                             (interface-implementation-identifier
                              (findf (lambda (y)
                                       (equal? "DSP"
                                               (interface-identifier-name
                                                (interface-implementation-identifier y))))
                                     (architecture-description-interface-implementations x))))
                            name))]

               ;; the output width on this architecture to determine how many dsps to use
               [out-width (lookup-port-width "out-width")]
               ;    [_ (displayln out-width)]
               ;    [a-width (lookup-port-width architecture-description "a-width")]
               ;    [iterations (floor (/ c-bw out-width))]
               ;    [iterations (floor (/ c-bw 48))]
               [mod (modulo c-bw 48)] ;; leftover bits for the last dsp
               ;; deals with the least significant 48 bits
               [dsp1 (make-dsp-expr internal-data
                                    out-width
                                    clk-expr
                                    rst-expr
                                    (lr:extract (lr:integer 47) (lr:integer 18) a-expr)
                                    30
                                    (lr:extract (lr:integer 17) (lr:integer 0) a-expr)
                                    18
                                    (lr:extract (lr:integer 47) (lr:integer 0) c-expr)
                                    48
                                    d-expr
                                    d-bw
                                    (choose (lr:bv (bv->signal (bv 0 1)))))]
               ;; deals with the most significant bits
               [dsp2 (make-dsp-expr
                      internal-data
                      out-width
                      clk-expr
                      rst-expr
                      (lr:extract (lr:integer 93) (lr:integer 66) a-expr)
                      28
                      (lr:extract (lr:integer 65) (lr:integer 48) a-expr)
                      18
                      (lr:extract (lr:integer 93) (lr:integer 48) c-expr)
                      46
                      d-expr
                      d-bw
                      (lr:extract (lr:integer 0) (lr:integer 0) (lr:hash-ref dsp1 'CARRYOUT)))]
               [outputlow (lr:extract (lr:integer 47) (lr:integer 0) (lr:hash-ref dsp1 'O))]
               [outputhigh (lr:extract (lr:integer 45) (lr:integer 0) (lr:hash-ref dsp2 'O))]
               [output (lr:concat (lr:list (list outputhigh outputlow)))])
    (list output internal-data)))
(define (parallel-add-dsp-sketch-generator architecture-description
                                           inputs
                                           #:internal-data [internal-data #f])
  (match-let*
      ([_ 1]
       [clk-expr (if (sketch-inputs-clk inputs)
                     (car (sketch-inputs-clk inputs))
                     (lr:bv (bv->signal (bv 0 1))))]
       [rst-expr (if (sketch-inputs-rst inputs)
                     (car (sketch-inputs-rst inputs))
                     (lr:bv (bv->signal (bv 0 1))))]
       [make-dsp-expr (lambda (internal-data out-width
                                             clk-expr
                                             rst-expr
                                             a-expr
                                             a-width
                                             b-expr
                                             b-width
                                             c-expr
                                             c-width
                                             d-expr
                                             d-width
                                             cin-expr)
                        (match-define (list dsp-expr ignored-internal-data)
                          (construct-interface architecture-description
                                               (interface-identifier "DSP"
                                                                     (hash "out-width"
                                                                           out-width
                                                                           "a-width"
                                                                           a-width
                                                                           "b-width"
                                                                           b-width
                                                                           "c-width"
                                                                           c-width
                                                                           "d-width"
                                                                           d-width))
                                               (list (cons "clk" clk-expr)
                                                     (cons "rst" rst-expr)
                                                     (cons "A" a-expr)
                                                     (cons "B" b-expr)
                                                     (cons "C" c-expr)
                                                     (cons "D" d-expr)
                                                     (cons "CARRYIN" cin-expr))
                                               #:internal-data internal-data))
                        ;;; Ignoring internal data for now, but we could use it in the future.
                        dsp-expr)]
       ;;; extract the value out of the input-list for each of the main dsp inputs, or default
       [(list a-expr a-bw) (if (assoc "a" (sketch-inputs-data inputs))
                               (list (second (assoc "a" (sketch-inputs-data inputs)))
                                     (third (assoc "a" (sketch-inputs-data inputs))))
                               (list (lr:bv (bv->signal (choose (bv 0 1) (bv 1 1)))) 1))]
       [(list b-expr b-bw) (if (assoc "b" (sketch-inputs-data inputs))
                               (list (second (assoc "b" (sketch-inputs-data inputs)))
                                     (third (assoc "b" (sketch-inputs-data inputs))))
                               (list (lr:bv (bv->signal (choose (bv 0 1) (bv 1 1)))) 1))]
       [(list c-expr c-bw) (if (assoc "c" (sketch-inputs-data inputs))
                               (list (second (assoc "c" (sketch-inputs-data inputs)))
                                     (third (assoc "c" (sketch-inputs-data inputs))))
                               (list (lr:bv (bv->signal (choose (bv 0 1) (bv 1 1)))) 1))]
       [(list d-expr d-bw) (if (assoc "d" (sketch-inputs-data inputs))
                               (list (second (assoc "d" (sketch-inputs-data inputs)))
                                     (third (assoc "d" (sketch-inputs-data inputs))))
                               (list (lr:bv (bv->signal (choose (bv 0 1) (bv 1 1)))) 1))]
       [lookup-port-width
        (lambda (name)
          (hash-ref
           (interface-identifier-parameters
            (interface-implementation-identifier
             (findf (lambda (y)
                      (equal? "DSP"
                              (interface-identifier-name (interface-implementation-identifier y))))
                    (architecture-description-interface-implementations architecture-description))))
           name))]
       [out-width (lookup-port-width "out-width")]
       [mod (modulo c-bw out-width)] ;; leftover bits for the last dsp
       [iterations (floor (/ c-bw out-width))]
       [generate-dsp-array
        (letrec
            ([helper
              (lambda (depth)
                (if (< depth 0)
                    '()
                    (let* ([arr (helper (- depth 1))])
                      (cons
                       (make-dsp-expr
                        internal-data
                        out-width
                        clk-expr
                        rst-expr
                        (lr:extract (lr:integer (+ (* depth 48) 47))
                                    (lr:integer (- (+ (* depth 48) 47) 29))
                                    a-expr)
                        30
                        (lr:extract (lr:integer (+ (* depth 48) 17)) (lr:integer (* depth 48)) a-expr)
                        18
                        (lr:extract (lr:integer (+ (* depth 48) 47)) (lr:integer (* depth 48)) c-expr)
                        out-width
                        d-expr
                        d-bw
                        (if (= depth 0)
                            (begin
                              (lr:bv (bv->signal (bv 0 1))))
                            (begin
                              (lr:extract (lr:integer 0)
                                          (lr:integer 0)
                                          (lr:hash-ref (car arr) 'CARRYOUT)))))
                       arr))))])
          helper)]
       [dsp-array (generate-dsp-array (- iterations 1))]
       [_ (displayln mod)]
       [fencepost
        (if (= mod 0)
            '()
            (lr:extract
             (lr:integer (- mod 1))
             (lr:integer 0)
             (lr:hash-ref
              (make-dsp-expr
               internal-data
               mod
               clk-expr
               rst-expr
               (if (> mod 30) ;; we need to use a for some top bits
                   (lr:extract
                    (lr:integer (+ (* iterations 48)
                                   (- mod 1))) ;; top is how many ever bits of leftover we have - 1,
                    (lr:integer
                     (+
                      (* iterations 48)
                      18)) ;; bottom STARTS at 17 + endofloop, since we need to use the first 17 in b
                    a-expr)
                   ;; we can use a for everything
                   (lr:extract (lr:integer (+ (* iterations 48) (- mod 1)))
                               (lr:integer (* iterations 48))
                               a-expr))
               (if (> mod 30) (- mod 17) mod)
               (if (> mod 30) ;; if we need to use b for the botom bits
                   (lr:extract
                    (lr:integer
                     (+
                      (* iterations 48)
                      17)) ;; top is 17 + the end of whole loop, since we need to use the first 17 in b
                    (lr:integer (* iterations 48)) ;; bottom is the end of the whole loop
                    a-expr)
                   b-expr)
               (if (> mod 30) 18 b-bw)
               (lr:extract (lr:integer (+ (* iterations 48) (- mod 1)))
                           (lr:integer (* iterations 48))
                           c-expr)
               mod
               d-expr
               d-bw
               (lr:extract (lr:integer 0) (lr:integer 0) (lr:hash-ref (car dsp-array) 'CARRYOUT)))
              'O)))]
       [output (if (= mod 0)
                   (lr:concat (lr:list (map (lambda (dsp) (lr:hash-ref dsp 'O)) dsp-array)))
                   (lr:concat (lr:list (append (list fencepost)
                                               (map (lambda (dsp) (lr:hash-ref dsp 'O))
                                                    dsp-array)))))])
    (list output internal-data)))
(define (parallel-dsp-sketch-generator architecture-description
                                       inputs
                                       #:internal-data [internal-data #f])
  (match-let*
      ([_ 1] ;;; Dummy line to prevent formatter from messing up comment structure
       ;;; Unpack clk and rst signals; default to 0 if neither is set.
       [clk-expr (if (sketch-inputs-clk inputs)
                     (car (sketch-inputs-clk inputs))
                     (lr:bv (bv->signal (bv 0 1))))]
       [rst-expr (if (sketch-inputs-rst inputs)
                     (car (sketch-inputs-rst inputs))
                     (lr:bv (bv->signal (bv 0 1))))]

       [make-dsp-expr (lambda (internal-data
                               out-width
                               clk-expr
                               rst-expr
                               a-expr
                               a-width
                               b-expr
                               b-width
                               c-expr
                               c-width
                               d-expr
                               d-width)
                        (match-define (list dsp-expr ignored-internal-data)
                          (construct-interface architecture-description
                                               (interface-identifier "DSP"
                                                                     (hash "out-width"
                                                                           out-width
                                                                           "a-width"
                                                                           a-width
                                                                           "b-width"
                                                                           b-width
                                                                           "c-width"
                                                                           c-width
                                                                           "d-width"
                                                                           d-width))
                                               (list (cons "clk" clk-expr)
                                                     (cons "rst" rst-expr)
                                                     (cons "A" a-expr)
                                                     (cons "B" b-expr)
                                                     (cons "C" c-expr)
                                                     (cons "D" d-expr)
                                                     (cons "CARRYIN" (lr:bv (bv->signal (bv 0 1)))))
                                               #:internal-data internal-data))
                        ;;; Ignoring internal data for now, but we could use it in the future.
                        ;(list (lr:hash-ref dsp-expr 'O) internal-data)
                        (lr:hash-ref dsp-expr 'O))]
       [(list a-expr a-bw) (if (assoc "a" (sketch-inputs-data inputs))
                               (list (second (assoc "a" (sketch-inputs-data inputs)))
                                     (third (assoc "a" (sketch-inputs-data inputs))))
                               (list (lr:bv (bv->signal (choose (bv 0 1) (bv 1 1)))) 1))]
       [(list b-expr b-bw) (if (assoc "b" (sketch-inputs-data inputs))
                               (list (second (assoc "b" (sketch-inputs-data inputs)))
                                     (third (assoc "b" (sketch-inputs-data inputs))))
                               (list (lr:bv (bv->signal (choose (bv 0 1) (bv 1 1)))) 1))]
       [(list c-expr c-bw) (if (assoc "c" (sketch-inputs-data inputs))
                               (list (second (assoc "c" (sketch-inputs-data inputs)))
                                     (third (assoc "c" (sketch-inputs-data inputs))))
                               (list (lr:bv (bv->signal (choose (bv 0 1) (bv 1 1)))) 1))]
       [(list d-expr d-bw) (if (assoc "d" (sketch-inputs-data inputs))
                               (list (second (assoc "d" (sketch-inputs-data inputs)))
                                     (third (assoc "d" (sketch-inputs-data inputs))))
                               (list (lr:bv (bv->signal (choose (bv 0 1) (bv 1 1)))) 1))]

       [lookup-port-width
        (lambda (x name)
          (hash-ref
           (interface-identifier-parameters
            (interface-implementation-identifier
             (findf (lambda (y)
                      (equal? "DSP"
                              (interface-identifier-name (interface-implementation-identifier y))))
                    (architecture-description-interface-implementations x))))
           name))]
       ;; the output width on this architecture to determine how many dsps to use
       [out-width (lookup-port-width architecture-description "out-width")]
       [a-width (lookup-port-width architecture-description "a-width")]
       [iterations (floor (/ c-bw out-width))]
       [iterations (floor (/ c-bw 48))]
       [mod (modulo c-bw 48)] ;; leftover bits for the last dsp
       [outputlist
        (for/list ([i iterations])
          (lr:extract
           (lr:integer 47)
           (lr:integer 0)
           (make-dsp-expr
            internal-data
            (lookup-port-width architecture-description "out-width")
            clk-expr
            rst-expr
            (lr:extract (lr:integer (+ (* i 48) 47)) (lr:integer (- (+ (* i 48) 47) 29)) a-expr)
            30
            (lr:extract (lr:integer (+ (* i 48) 17)) (lr:integer (- (+ (* i 48) 17) 17)) a-expr)
            18
            (lr:extract (lr:integer (+ (* i 48) 47)) (lr:integer (* i 48)) c-expr)
            48
            d-expr
            d-bw)))]
       ;; we now have some cleanup: if the leftover bits are less than 31, then we dont nee to use b.
       [fencepost
        (lr:extract
         (lr:integer (- mod 1))
         (lr:integer 0)
         (make-dsp-expr
          internal-data
          mod
          clk-expr
          rst-expr
          (if (> mod 30) ;; we need to use a for some top bits
              (lr:extract
               (lr:integer (+ (* iterations 48)
                              (- mod 1))) ;; top is how many ever bits of leftover we have - 1,
               (lr:integer
                (+ (* iterations 48)
                   18)) ;; bottom STARTS at 17 + endofloop, since we need to use the first 17 in b
               a-expr)
              ;; we can use a for everything
              (lr:extract (lr:integer (+ (* iterations 48) (- mod 1)))
                          (lr:integer (* iterations 48))
                          a-expr))
          (if (> mod 30) (- mod 17) mod)
          (if (> mod 30) ;; if we need to use b for the botom bits
              (lr:extract
               (lr:integer
                (+ (* iterations 48)
                   17)) ;; top is 17 + the end of whole loop, since we need to use the first 17 in b
               (lr:integer (* iterations 48)) ;; bottom is the end of the whole loop
               a-expr)
              b-expr)
          (if (> mod 30) 18 b-bw)
          (lr:extract (lr:integer (+ (* iterations 48) (- mod 1)))
                      (lr:integer (* iterations 48))
                      c-expr)
          48
          d-expr
          d-bw))]
       [output-list (if (> mod 0) (cons fencepost (reverse outputlist)) (reverse outputlist))]
       [output (lr:concat (lr:list output-list))])
    (list output internal-data)))
;;; Suitable for arithmetic operations like addition and subtraction.
(define (bitwise-with-carry-sketch-generator architecture-description
                                             sketch-inputs
                                             #:internal-data [internal-data #f])
  (match-let*
      ([_ 1] ;;; Dummy line to prevent formatter from messing up my comment structure.

       [_ (when (sketch-inputs-clk sketch-inputs)
            (error "Bitwise sketches do not support clocks."))]
       [_ (when (sketch-inputs-rst sketch-inputs)
            (error "Bitwise sketches do not support resets."))]
       ;;; We used to take an input named `logical-inputs`, but now we take `sketch-inputs` instead.
       ;;; Reconstruct the old `logical-inputs`, plus some other legacy inputs.
       [logical-inputs (lr:list (map car (sketch-inputs-data sketch-inputs)))]
       [num-logical-inputs (length (sketch-inputs-data sketch-inputs))]
       [bitwidth (sketch-inputs-output-width sketch-inputs)]

       ;;; Unpack the internal data.
       [bitwise-sketch-internal-data (if internal-data (first internal-data) #f)]
       [carry-internal-data (if internal-data (second internal-data) #f)]

       ;;; Generate a bitwise sketch over the inputs. We use this to generate the S signal.
       [(list bitwise-sketch bitwise-sketch-internal-data)
        (bitwise-sketch-generator architecture-description
                                  sketch-inputs
                                  #:internal-data bitwise-sketch-internal-data)]

       ;;; Pass the results into a carry. We populate the DI signal with one of the logical inputs.
       [(list carry-expr carry-internal-data)
        (construct-interface architecture-description
                             (interface-identifier "carry" (hash "width" bitwidth))
                             (list (cons "CI" (lr:bv (bv->signal (?? (bitvector 1)))))
                                   (cons "DI" (lr:list-ref logical-inputs (lr:integer 0)))
                                   (cons "S" bitwise-sketch))
                             #:internal-data carry-internal-data)]

       ;;; Get the output from the carry.
       [out-expr (lr:hash-ref carry-expr 'O)])

    (list out-expr (list bitwise-sketch-internal-data carry-internal-data))))

;;; Comparison sketch generator.
;;;
;;; Very similar to bitwise with carry, but computes a function on *both* inputs to the carry. Returns
;;; a single bit. Given this name as it can be used to implement comparisions (especially because it
;;; just returns a single bit!)
;;;
;;; Note that we can adjust these sketches so that they return hashmaps, so both outputs are
;;; accessible.
(define (comparison-sketch-generator architecture-description
                                     sketch-inputs
                                     #:internal-data [internal-data #f])
  (match-let*
      ([_ 1] ;;; Dummy line to prevent formatter from messing up my comment structure.

       [_ (when (sketch-inputs-clk sketch-inputs)
            (error "Bitwise sketches do not support clocks."))]
       [_ (when (sketch-inputs-rst sketch-inputs)
            (error "Bitwise sketches do not support resets."))]

       ;;; Bitwidth of the data inputs. Check that they are all the same.
       [input-bitwidth
        (begin
          (for ([bw (map cdr (sketch-inputs-data sketch-inputs))])
            (unless (equal? bw (cdr (first (sketch-inputs-data sketch-inputs))))
              (error "Comparison sketches require all inputs to have the same bitwidth.")))
          (cdr (first (sketch-inputs-data sketch-inputs))))]

       ;;; Unpack the internal data.
       [bitwise-sketch-0-internal-data (if internal-data (first internal-data) #f)]
       [bitwise-sketch-1-internal-data (if internal-data (second internal-data) #f)]
       [carry-internal-data (if internal-data (third internal-data) #f)]

       ;;; Generate a bitwise sketch over the inputs. We do this twice, one per carry input (DI and
       ;;; S). It may be the case that these can share internal data, but I'm not sure.
       [bitwise-sketch-inputs (make-sketch-inputs #:data (sketch-inputs-data sketch-inputs)
                                                  #:output-width input-bitwidth)]
       [(list bitwise-sketch-0 bitwise-sketch-0-internal-data)
        (bitwise-sketch-generator architecture-description
                                  bitwise-sketch-inputs
                                  #:internal-data bitwise-sketch-0-internal-data)]
       [(list bitwise-sketch-1 bitwise-sketch-1-internal-data)
        (bitwise-sketch-generator architecture-description
                                  bitwise-sketch-inputs
                                  #:internal-data bitwise-sketch-1-internal-data)]

       ;;; Construct a carry, which will effectively do the reduction operation for the comparison.
       [(list carry-expr carry-internal-data)
        (construct-interface architecture-description
                             (interface-identifier "carry" (hash "width" input-bitwidth))
                             (list (cons "CI" (lr:bv (bv->signal (?? (bitvector 1)))))
                                   (cons "DI" bitwise-sketch-0)
                                   (cons "S" bitwise-sketch-1))
                             #:internal-data carry-internal-data)]

       ;;; Return the carry out signal.
       [out-expr (lr:hash-ref carry-expr 'CO)])

    (list out-expr
          (list bitwise-sketch-0-internal-data bitwise-sketch-1-internal-data carry-internal-data))))

;;; A comparison sketch generator that makes efficient use of LUTs.
;;;
;;; This sketch generator starts by _densely packing_ all input signals into a
;;; row of LUTs: this means that multiple input bits are handled in a single LUT.
;;;
;;; This first row of LUTs then has its outputs densely packed into a second row
;;; of LUTs, which then is passed into a third row of LUTs etc, until only a
;;; single LUT remains. This has log depth in the size of the the input
(define (shallow-comparison-sketch-generator architecture-description
                                             sketch-inputs
                                             #:internal-data [internal-data #f])
  ;; Recursive helper function that builds the 'tree' portion of our circuit
  ;; (not including the top row)
  (define (helper inputs shared-internal-data)
    (cond
      [(= (length inputs) 0) (error "length of inputs should not be 0")]
      [(= (length inputs) 1) (list inputs shared-internal-data)]
      [else
       (match-let* ([(list outputs shared-internal-data)
                     (densely-pack-inputs-into-luts architecture-description
                                                    (list inputs)
                                                    #:internal-data shared-internal-data)])
         (helper outputs shared-internal-data))]))

  (match-let* ([_ 1] ;;; Dummy line to prevent formatter from messing up my comment structure.

               [_ (when (sketch-inputs-clk sketch-inputs)
                    (error "Bitwise sketches do not support clocks."))]
               [_ (when (sketch-inputs-rst sketch-inputs)
                    (error "Bitwise sketches do not support resets."))]
               ;;; We used to take an input named `logical-inputs`, but now we take `sketch-inputs`
               ;;; instead. Reconstruct the old `logical-inputs`, plus some other legacy inputs.
               [logical-inputs (lr:list (map car (sketch-inputs-data sketch-inputs)))]
               [num-logical-inputs (length (sketch-inputs-data sketch-inputs))]
               ;;; Bitwidth of the data inputs. Check that they are all the same.
               [bitwidth
                (begin
                  (for ([bw (map cdr (sketch-inputs-data sketch-inputs))])
                    (unless (equal? bw (cdr (first (sketch-inputs-data sketch-inputs))))
                      (error "Comparison sketches require all inputs to have the same bitwidth.")))
                  (cdr (first (sketch-inputs-data sketch-inputs))))]

               ;;; Unpack the internal data.
               [(list first-row-internal-data lut-tree-internal-data)
                (if internal-data internal-data (list #f #f))]

               ;;; Transform inputs into an explicit list of lists
               [inputs (for/list ([i num-logical-inputs])
                         (let ([input (lr:list-ref logical-inputs (lr:integer i))])
                           (for/list ([j bitwidth])
                             (lr:extract (lr:integer j) (lr:integer j) input))))]
               [(list first-row-outputs first-row-internal-data)
                (densely-pack-inputs-into-luts architecture-description
                                               inputs
                                               #:internal-data first-row-internal-data)]
               [(list lut-tree-expr-wrapped lut-tree-internal-data) (helper first-row-outputs
                                                                            lut-tree-internal-data)]
               ; We need to get the first item from helper's outputs, which is a
               ; list of hash-maps
               [lut-tree-expr (first lut-tree-expr-wrapped)]

               [out-expr lut-tree-expr])

    (list out-expr (list first-row-internal-data lut-tree-internal-data))))

;;; A comparison sketch generator that makes efficient use of LUTs that can
;;; handle bvult, etc.
;;;
;;; This sketch generator starts by _densely packing_ all input signals into a
;;; row of LUTs: this means that multiple input bits are handled in a single LUT.
;;;
;;; This first row of LUTs then has its outputs densely packed into a second row
;;; of LUTs, which then is passed into a third row of LUTs etc, until only a
;;; single LUT remains. This has log depth in the size of the the input
;;;
;;; NOTE: This is currently not functioning properly and is not exported
(define (double-shallow-comparison-sketch-generator architecture-description
                                                    sketch-inputs
                                                    #:internal-data [internal-data #f])
  ;; Recursive helper function that builds the 'tree' portion of our circuit
  ;; (not including the top row)
  (define (helper inputs shared-internal-data)
    (cond
      [(= (length inputs) 0) (error "length of inputs should not be 0")]
      [(= (length inputs) 1) (list inputs shared-internal-data)]
      [else
       (match-let* ([(list outputs shared-internal-data)
                     (densely-pack-inputs-into-luts architecture-description
                                                    (list inputs)
                                                    #:internal-data shared-internal-data)])
         (helper outputs shared-internal-data))]))

  (match-let* ([_ 1] ;;; Dummy line to prevent formatter from messing up my comment structure.

               [_ (when (sketch-inputs-clk sketch-inputs)
                    (error "Bitwise sketches do not support clocks."))]
               [_ (when (sketch-inputs-rst sketch-inputs)
                    (error "Bitwise sketches do not support resets."))]
               ;;; We used to take an input named `logical-inputs`, but now we take `sketch-inputs`
               ;;; instead. Reconstruct the old `logical-inputs`, plus some other legacy inputs.
               [logical-inputs (lr:list (map car (sketch-inputs-data sketch-inputs)))]
               [num-logical-inputs (length (sketch-inputs-data sketch-inputs))]
               [bitwidth (sketch-inputs-output-width sketch-inputs)]

               ;;; Unpack the internal data.
               [(list first-row-a-internal-data first-row-b-internal-data lut-tree-internal-data)
                (if internal-data internal-data (list #f #f #f))]

               ;;; Transform inputs into an explicit list of lists
               [inputs (for/list ([i num-logical-inputs])
                         (let ([input (lr:list-ref logical-inputs (lr:integer i))])
                           (for/list ([j bitwidth])
                             (lr:extract (lr:integer j) (lr:integer j) input))))]
               ;;; Generate two rows: we need more than one bit of information
               ;;; output from each LUT: we need to know if a set of inputs is one of
               ;;; A_GT_B, A_EQ_B, or A_LT_B.
               [(list first-row-a-outputs first-row-a-internal-data)
                (densely-pack-inputs-into-luts architecture-description
                                               inputs
                                               #:internal-data first-row-a-internal-data)]
               [(list first-row-b-outputs first-row-b-internal-data)
                (densely-pack-inputs-into-luts architecture-description
                                               inputs
                                               #:internal-data first-row-b-internal-data)]
               ;;; We now want to interleave the outputs of rows a and b,
               ;;; transforming them from
               ;;;  (a0 a1 a2 a3) (b0 b1 b2 b3) to (a0 b0 a1 b1 a2 b2 a3 b3)
               ;;; NOTE: we need to ensure that ai and bi are always paired, and this is
               ;;; maintained by the `window-size` variable in
               ;;; `densely-pack-inputs-into-luts`: `window-size` is always even, and this means
               ;;; this means that even numbers of bits will always be packed together.
               [interleaved-outputs (interleave (list first-row-a-outputs first-row-b-outputs))]
               [(list lut-tree-expr-wrapped lut-tree-internal-data) (helper interleaved-outputs
                                                                            lut-tree-internal-data)]
               ; We need to get the first item from helper's outputs, which is a
               ; list of hash-maps
               [lut-tree-expr (first lut-tree-expr-wrapped)]

               [out-expr lut-tree-expr])

    (list out-expr
          (list first-row-a-internal-data first-row-b-internal-data lut-tree-internal-data))))
;;; Logical inputs should be a lr:list of length 2, where both bitvectors are the same length.
;;;
;;; We implement multiplication as (using four bits as an example):
;;;
;;;     a3   a2   a1   a0
;;; x   b3   b2   b1   b0
;;; ---------------------
;;;   a3b0 a2b0 a1b0 a0b0 (anbm represents an AND bm)
;;;   a2b1 a1b1 a0b1 1'b0
;;;   a1b2 a0b2 1'b0 1'b0
;;; + a0b3 1'b0 1'b0 1'b0
;;; ---------------------
;;;              <answer>
;;;
;;; Note that this works for signed, two's complement multiplication where the result is the same
;;; bitwidth as the inputs. I don't think this will work for "correct" multiplication, where the
;;; result is twice the bitwidth of the inputs.
(define (multiplication-sketch-generator architecture-description
                                         sketch-inputs
                                         #:internal-data [internal-data #f])
  (match-let*
      ([_ 0] ;;; Dummy line to prevent formatter from messing up my comments.

       [_ (when (sketch-inputs-clk sketch-inputs)
            (error "Bitwise sketches do not support clocks."))]
       [_ (when (sketch-inputs-rst sketch-inputs)
            (error "Bitwise sketches do not support resets."))]
       ;;; We used to take an input named `logical-inputs`, but now we take `sketch-inputs`
       ;;; instead. Reconstruct the old `logical-inputs`, plus some other legacy inputs.
       [logical-inputs (lr:list (map car (sketch-inputs-data sketch-inputs)))]
       [num-logical-inputs (length (sketch-inputs-data sketch-inputs))]
       [bitwidth (sketch-inputs-output-width sketch-inputs)]

       ;;; Unpack the internal data.
       [and-lut-internal-data (if internal-data (first internal-data) #f)]
       [bitwise-with-carry-internal-data (if internal-data (second internal-data) #f)]

       [a-expr (lr:list-ref logical-inputs (lr:integer 0))]
       [b-expr (lr:list-ref logical-inputs (lr:integer 1))]

       ;;; Generate internal data to be shared across all AND luts.
       [(list _ and-lut-internal-data)
        (construct-interface architecture-description
                             (interface-identifier "LUT" (hash "num_inputs" 2))
                             (list (cons "I0" 'unused) (cons "I1" 'unused) (cons "I2" 'unused))
                             #:internal-data and-lut-internal-data)]

       ;;; List of ANDs.
       ;;;
       ;;; List of `bitwidth` expressions which have bitwidth `bitwidth`.
       [to-be-added-exprs
        (for/list ([row-i bitwidth])
          (lr:concat
           ;;; Note that we reverse the list; we produce ands in the order [a0b0, a1b0, a2b0, ...],
           ;;; which is LSB-first. So we reverse so that MSB is first when we concat. Note that it
           ;;; doesn't actually seem to matter---I suspect because bitwise-reverse can do the
           ;;; reversing during addition. But it's better to have it correct here.
           (lr:list
            (reverse
             (for/list ([col-i bitwidth])
               ;;; Only generate ANDs for the correct bits. Refer to our diagram above if you want to
               ;;; double check the condition on this if statement.
               (if (> row-i col-i)
                   (lr:bv (bv->signal (bv 0 1)))
                   (lr:hash-ref
                    (first (construct-interface
                            architecture-description
                            (interface-identifier "LUT" (hash "num_inputs" 2))
                            (list (cons "I0"
                                        (lr:extract (lr:integer (- col-i row-i))
                                                    (lr:integer (- col-i row-i))
                                                    a-expr))
                                  (cons "I1"
                                        (lr:extract (lr:integer row-i) (lr:integer row-i) b-expr)))
                            #:internal-data and-lut-internal-data))
                    'O)))))))]

       ;;; Generate the internal data that will be shared across all of the sketches used to compute
       ;;; the additions.
       [(list _ bitwise-with-carry-internal-data)
        (bitwise-with-carry-sketch-generator
         architecture-description
         ;;; TODO(@gussmith23): Resolve this hack. We are just calling the sketch generator to get the
         ;;; internal data, so we don't actually need to provide valid inputs, but we do need to
         ;;; indicate that there are two inputs.
         (make-sketch-inputs #:data (list (cons 'unused 'unused) (cons 'unused 'unused))
                             #:output-width bitwidth)
         #:internal-data bitwise-with-carry-internal-data)]

       ;;; TODO(@gussmith23): support more than 2 inputs on bitwise/bitwise-with-carry.
       [fold-fn (lambda (next-to-add-expr acc-expr)
                  (first (bitwise-with-carry-sketch-generator
                          architecture-description
                          (make-sketch-inputs #:data (list (cons next-to-add-expr bitwidth)
                                                           (cons acc-expr bitwidth))
                                              #:output-width bitwidth)
                          #:internal-data bitwise-with-carry-internal-data)))]

       [out-expr (foldl fold-fn (lr:bv (bv->signal (bv 0 bitwidth))) to-be-added-exprs)])

    (list out-expr (list and-lut-internal-data bitwise-with-carry-internal-data))))

(define (shift-sketch-generator architecture-description
                                sketch-inputs
                                #:internal-data [internal-data #f])
  (when (not (equal? (length (sketch-inputs-data sketch-inputs)) 2))
    (error "Shift sketch should take 2 inputs."))
  (match-let*
      ([_ 0] ;;; Dummy line to prevent formatter from messing up my comments.

       [_ (when (sketch-inputs-clk sketch-inputs)
            (error "Bitwise sketches do not support clocks."))]
       [_ (when (sketch-inputs-rst sketch-inputs)
            (error "Bitwise sketches do not support resets."))]
       ;;; We used to take an input named `logical-inputs`, but now we take `sketch-inputs`
       ;;; instead. Reconstruct the old `logical-inputs`, plus some other legacy inputs.
       [logical-inputs (lr:list (map car (sketch-inputs-data sketch-inputs)))]
       [num-logical-inputs (length (sketch-inputs-data sketch-inputs))]
       [bitwidth (sketch-inputs-output-width sketch-inputs)]

       ;;; a is the value we're shifting, b is the value we're shifting it by.
       [a-expr (lr:list-ref logical-inputs (lr:integer 0))]
       [b-expr (lr:list-ref logical-inputs (lr:integer 1))]

       [logical-or-arithmetic-chooser (?? boolean?)]

       ;;; Generate the internal data for a mux2, so we can share it.
       [(list _ mux2-internal-data)
        (construct-interface architecture-description
                             (interface-identifier "MUX" (hash "num_inputs" 2))
                             (list (cons "I0" 'unused) (cons "I1" 'unused) (cons "S" 'unused))
                             #:internal-data #f)]

       [num-stages (exact-ceiling (log (add1 (add1 bitwidth)) 2))]
       ;;; I'm being lazy and throwing an extra stage in to fix bugs that were popping up. I don't
       ;;; think this extra stage is technically necessary, but it doesn't work without it.
       ;[num-stages (add1 num-stages)]
       ;;; Ok, now i'm just being extra lazy.
       ;;; TODO(@gussmith23): Make bitshifts actually efficient.
       [num-stages bitwidth]

       [(list _ or-internal-data)
        (construct-interface architecture-description
                             (interface-identifier "LUT"
                                                   (hash "num_inputs" (add1 (- bitwidth num-stages))))
                             (for/list ([i (add1 (- bitwidth num-stages))])
                               (cons (format "I~a" i) 'unused))
                             #:internal-data #f)]

       [fold-fn
        (lambda (stage-i previous-stage-expr)
          (let* (;;; The selector bit for all the muxes in this row.
                 [s-expr (if (not (equal? stage-i (sub1 num-stages)))
                             (lr:extract (lr:integer stage-i) (lr:integer stage-i) b-expr)
                             ;;; for the last stage, the selector ORs all the remaining bits.
                             (lr:hash-ref (first (construct-interface
                                                  architecture-description
                                                  (interface-identifier
                                                   "LUT"
                                                   (hash "num_inputs" (add1 (- bitwidth num-stages))))
                                                  (for/list ([i (add1 (- bitwidth num-stages))])
                                                    (cons (format "I~a" i)
                                                          (lr:extract (lr:integer (+ stage-i i))
                                                                      (lr:integer (+ stage-i i))
                                                                      b-expr)))
                                                  #:internal-data or-internal-data))
                                          'O))]
                 [make-mux-fn
                  (lambda (bit-i)
                    (let* (;;; The bit to select for the i0 input of this mux.
                           [i0-bit bit-i]
                           [i0-expr
                            (lr:extract (lr:integer i0-bit) (lr:integer i0-bit) previous-stage-expr)]

                           ;;; The bit to select for the i1 input of this mux.
                           [i1-bit-right (+ bit-i (expt 2 stage-i))]
                           [i1-bit-left (- bit-i (expt 2 stage-i))]
                           [i1-value-right (if (>= i1-bit-right bitwidth)
                                               ;;; Either shift in 0s or the sign bit.
                                               (if logical-or-arithmetic-chooser
                                                   (lr:bv (bv->signal (bv 0 1)))
                                                   (lr:extract (lr:integer (sub1 bitwidth))
                                                               (lr:integer (sub1 bitwidth))
                                                               a-expr))
                                               (lr:extract (lr:integer i1-bit-right)
                                                           (lr:integer i1-bit-right)
                                                           previous-stage-expr))]
                           [i1-value-left (if (< i1-bit-left 0)
                                              (lr:bv (bv->signal (bv 0 1)))
                                              (lr:extract (lr:integer i1-bit-left)
                                                          (lr:integer i1-bit-left)
                                                          previous-stage-expr))]
                           [mux-expr-right (first (construct-interface
                                                   architecture-description
                                                   (interface-identifier "MUX" (hash "num_inputs" 2))
                                                   (list (cons "I0" i0-expr)
                                                         (cons "I1" i1-value-right)
                                                         (cons "S" s-expr))
                                                   #:internal-data mux2-internal-data))]
                           [mux-expr-left (first (construct-interface
                                                  architecture-description
                                                  (interface-identifier "MUX" (hash "num_inputs" 2))
                                                  (list (cons "I0" i0-expr)
                                                        (cons "I1" i1-value-left)
                                                        (cons "S" s-expr))
                                                  #:internal-data mux2-internal-data))]

                           ;;; It's unclear why this choose* can't be a choose, but if you change it,
                           ;;; you'll see that tests break. Vishal debugged this and came up with two
                           ;;; possible fixes. One which puts the choose* "into hardware" (i.e. stamps
                           ;;; out both the right and left exprs and muxes them) and one that uses
                           ;;; choose*. This one will produce smaller hardware but may have worse
                           ;;; solver performance. Choosing to go with this one. Both PRs are here:
                           ;;; This one: https://github.com/uwsampl/lakeroad/pull/198
                           ;;; Mux fix: https://github.com/uwsampl/lakeroad/pull/199
                           [out-expr (lr:hash-ref (choose* mux-expr-right mux-expr-left) 'O)])

                      out-expr))]

                 [out-expr (lr:concat (lr:list (reverse (for/list ([bit-i bitwidth])
                                                          (make-mux-fn bit-i)))))])
            out-expr))]

       [out-expr (foldl fold-fn a-expr (range num-stages))])
    (list out-expr (list))))

(module+ test
  (require rackunit
           "interpreter.rkt"
           "generated/lattice-ecp5-lut4.rkt"
           "generated/lattice-ecp5-ccu2c.rkt"
           "xilinx-ultrascale-plus-lut2.rkt"
           "generated/xilinx-ultrascale-plus-lut6.rkt"
           "generated/xilinx-ultrascale-plus-carry8.rkt"
           "generated/xilinx-ultrascale-plus-dsp48e2.rkt"
           "generated/sofa-frac-lut4.rkt"
           rosette/solver/smt/bitwuzla)

  (current-solver (bitwuzla))

  (error-print-width 10000000000)
  (define-syntax-rule (sketch-test #:name name
                                   #:defines defines
                                   ...
                                   #:bv-expr bv-expr
                                   #:architecture-description architecture-description
                                   #:sketch-generator sketch-generator
                                   #:module-semantics module-semantics
                                   #:include-dirs include-dirs
                                   #:extra-verilator-args extra-verilator-args)
    (test-case name
      (with-terms
       (begin
         (displayln
          "--------------------------------------------------------------------------------")
         (displayln (format "running test ~a" name))
         defines ...

         (define start-sketch-gen-time (current-inexact-milliseconds))
         (define sketch (generate-sketch sketch-generator architecture-description bv-expr))
         ;;; (displayln sketch)

         (define end-sketch-gen-time (current-inexact-milliseconds))

         (displayln (format "number of symbolics in sketch: ~a" (length (symbolics sketch))))
         (displayln (format "sketch generation time: ~ams"
                            (- end-sketch-gen-time start-sketch-gen-time)))

         (define start-synthesis-time (current-inexact-milliseconds))
         (define result
           (with-vc (with-terms (synthesize #:forall (symbolics bv-expr)
                                            #:guarantee
                                            (assert (bveq bv-expr
                                                          (signal-value
                                                           (interpret sketch
                                                                      #:module-semantics
                                                                      module-semantics))))))))

         (define end-synthesis-time (current-inexact-milliseconds))
         (displayln (format "synthesis time: ~ams" (- end-synthesis-time start-synthesis-time)))

         (check-true (normal? result))
         (define soln (result-value result))
         (check-true (sat? soln))))))

  (sketch-test
   #:name "DSP for bvmul on Xilinx DSP48E2"
   #:defines (define-symbolic a b (bitvector 16))
   #:bv-expr (bvmul a b)
   #:architecture-description (xilinx-ultrascale-plus-architecture-description)
   ;;; TODO(@gussmith23): Resolve this hack. Make sketch generators have the same signature.
   ;;;
   ;;; Manually force the DSP sketch generator to look like a normal sketch generator.
   #:sketch-generator single-dsp-sketch-generator
   #:module-semantics
   (list (cons (cons "DSP48E2" "../verilog/simulation/xilinx-ultrascale-plus/DSP48E2.v")
               xilinx-ultrascale-plus-dsp48e2))
   #:include-dirs (list (build-path (get-lakeroad-directory)
                                    "verilog/simulation/xilinx-ultrascale-plus"))
   #:extra-verilator-args
   "-Wno-UNUSED -Wno-LATCH -Wno-ASSIGNDLY -DXIL_XECLIB -Wno-TIMESCALEMOD -Wno-PINMISSING -Wno-UNOPT -Wno-UNOPTFLAT -Wno-WIDTH -Wno-CASEX")

  (sketch-test
   #:name "DSP for bvmul and bvand on Xilinx DSP48E2"
   #:defines (define-symbolic a b (bitvector 16))
   #:bv-expr (bvand (bvmul a b) (bvmul a b))
   #:architecture-description (xilinx-ultrascale-plus-architecture-description)
   ;;; Manually force the DSP sketch generator to look like a normal sketch generator.
   #:sketch-generator single-dsp-sketch-generator
   #:module-semantics
   (list (cons (cons "DSP48E2" "../verilog/simulation/xilinx-ultrascale-plus/DSP48E2.v")
               xilinx-ultrascale-plus-dsp48e2))
   #:include-dirs (list (build-path (get-lakeroad-directory)
                                    "verilog/simulation/xilinx-ultrascale-plus"))
   #:extra-verilator-args
   "-Wno-UNUSED -Wno-LATCH -Wno-ASSIGNDLY -DXIL_XECLIB -Wno-TIMESCALEMOD -Wno-PINMISSING -Wno-UNOPTFLAT -Wno-UNOPT -Wno-WIDTH -Wno-CASEX")

  (sketch-test
   #:name "left shift on SOFA"
   #:defines (define-symbolic a b (bitvector 8))
   #:bv-expr (bvshl a b)
   #:architecture-description (sofa-architecture-description)
   #:sketch-generator shift-sketch-generator
   #:module-semantics (list (cons (cons "frac_lut4" "../modules_for_importing/SOFA/frac_lut4.v")
                                  sofa-frac-lut4))
   #:include-dirs (list (build-path (get-lakeroad-directory) "modules_for_importing" "SOFA")
                        (build-path (get-lakeroad-directory) "verilog/simulation/skywater/"))
   #:extra-verilator-args
   "-Wno-LITENDIAN -Wno-EOFNEWLINE -Wno-UNUSED -Wno-PINMISSING -Wno-TIMESCALEMOD -DSKY130_FD_SC_HD__UDP_MUX_2TO1_LAKEROAD_HACK -DNO_PRIMITIVES")

  ;;; TODO(@vcanumalla): Shifts work on SOFA, but there is probably a better way of doing the sketch.
  (sketch-test
   #:name "logical right shift on SOFA"
   #:defines (define-symbolic a b (bitvector 3))
   #:bv-expr (bvlshr a b)
   #:architecture-description (sofa-architecture-description)
   #:sketch-generator shift-sketch-generator
   #:module-semantics (list (cons (cons "frac_lut4" "../modules_for_importing/SOFA/frac_lut4.v")
                                  sofa-frac-lut4))
   #:include-dirs (list (build-path (get-lakeroad-directory) "modules_for_importing" "SOFA")
                        (build-path (get-lakeroad-directory) "verilog/simulation/skywater/"))
   #:extra-verilator-args
   "-Wno-LITENDIAN -Wno-EOFNEWLINE -Wno-UNUSED -Wno-PINMISSING -Wno-TIMESCALEMOD -DSKY130_FD_SC_HD__UDP_MUX_2TO1_LAKEROAD_HACK -DNO_PRIMITIVES")
  (sketch-test
   #:name "arithmetic right shift on SOFA"
   #:defines (define-symbolic a b (bitvector 3))
   #:bv-expr (bvashr a b)
   #:architecture-description (sofa-architecture-description)
   #:sketch-generator shift-sketch-generator
   #:module-semantics (list (cons (cons "frac_lut4" "../modules_for_importing/SOFA/frac_lut4.v")
                                  sofa-frac-lut4))
   #:include-dirs (list (build-path (get-lakeroad-directory) "modules_for_importing" "SOFA")
                        (build-path (get-lakeroad-directory) "verilog/simulation/skywater/"))
   #:extra-verilator-args
   "-Wno-LITENDIAN -Wno-EOFNEWLINE -Wno-UNUSED -Wno-PINMISSING -Wno-TIMESCALEMOD -DSKY130_FD_SC_HD__UDP_MUX_2TO1_LAKEROAD_HACK -DNO_PRIMITIVES")

  (sketch-test
   #:name "logical right shift on lattice"
   #:defines (define-symbolic a b (bitvector 5))
   #:bv-expr (bvlshr a b)
   #:architecture-description (lattice-ecp5-architecture-description)
   #:sketch-generator shift-sketch-generator
   #:module-semantics (list (cons (cons "LUT4" "../verilog/simulation/lattice-ecp5/LUT4.v")
                                  lattice-ecp5-lut4))
   #:include-dirs (list (build-path (get-lakeroad-directory) "verilog/simulation/lattice-ecp5"))
   #:extra-verilator-args "-Wno-UNUSED")

  (sketch-test
   #:name "arithmetic right shift on lattice"
   #:defines (define-symbolic a b (bitvector 5))
   #:bv-expr (bvashr a b)
   #:architecture-description (lattice-ecp5-architecture-description)
   #:sketch-generator shift-sketch-generator
   #:module-semantics (list (cons (cons "LUT4" "../verilog/simulation/lattice-ecp5/LUT4.v")
                                  lattice-ecp5-lut4))
   #:include-dirs (list (build-path (get-lakeroad-directory) "verilog/simulation/lattice-ecp5"))
   #:extra-verilator-args "-Wno-UNUSED")

  (sketch-test
   #:name "left shift on lattice"
   #:defines (define-symbolic a b (bitvector 5))
   #:bv-expr (bvshl a b)
   #:architecture-description (lattice-ecp5-architecture-description)
   #:sketch-generator shift-sketch-generator
   #:module-semantics (list (cons (cons "LUT4" "../verilog/simulation/lattice-ecp5/LUT4.v")
                                  lattice-ecp5-lut4))
   #:include-dirs (list (build-path (get-lakeroad-directory) "verilog/simulation/lattice-ecp5"))
   #:extra-verilator-args "-Wno-UNUSED")

  ;;; TODO(@gussmith23): we have a bug in bvexpr->cexpr that's causing this to fail. (I think.)
  (sketch-test
   #:name "logical right shift on lattice"
   #:defines (define-symbolic a b (bitvector 16))
   #:bv-expr (bvlshr a b)
   #:architecture-description (lattice-ecp5-architecture-description)
   #:sketch-generator shift-sketch-generator
   #:module-semantics (list (cons (cons "LUT4" "../verilog/simulation/lattice-ecp5/LUT4.v")
                                  lattice-ecp5-lut4))
   #:include-dirs (list (build-path (get-lakeroad-directory) "verilog/simulation/lattice-ecp5"))
   #:extra-verilator-args "-Wno-UNUSED")

  (sketch-test
   #:name "arithmetic right shift on lattice"
   #:defines (define-symbolic a b (bitvector 16))
   #:bv-expr (bvashr a b)
   #:architecture-description (lattice-ecp5-architecture-description)
   #:sketch-generator shift-sketch-generator
   #:module-semantics (list (cons (cons "LUT4" "../verilog/simulation/lattice-ecp5/LUT4.v")
                                  lattice-ecp5-lut4))
   #:include-dirs (list (build-path (get-lakeroad-directory) "verilog/simulation/lattice-ecp5"))
   #:extra-verilator-args "-Wno-UNUSED")

  (sketch-test
   #:name "left shift on lattice"
   #:defines (define-symbolic a b (bitvector 16))
   #:bv-expr (bvshl a b)
   #:architecture-description (lattice-ecp5-architecture-description)
   #:sketch-generator shift-sketch-generator
   #:module-semantics (list (cons (cons "LUT4" "../verilog/simulation/lattice-ecp5/LUT4.v")
                                  lattice-ecp5-lut4))
   #:include-dirs (list (build-path (get-lakeroad-directory) "verilog/simulation/lattice-ecp5"))
   #:extra-verilator-args "-Wno-UNUSED")

  (sketch-test
   #:name "bitwise sketch generator on lattice"
   #:defines (define-symbolic a b (bitvector 2))
   #:bv-expr (bvand a b)
   #:architecture-description (lattice-ecp5-architecture-description)
   #:sketch-generator bitwise-sketch-generator
   #:module-semantics (list (cons (cons "LUT4" "../verilog/simulation/lattice-ecp5/LUT4.v")
                                  lattice-ecp5-lut4))
   #:include-dirs (list (build-path (get-lakeroad-directory) "verilog/simulation/lattice-ecp5"))
   #:extra-verilator-args "-Wno-UNUSED")

  (sketch-test
   #:name "bitwise sketch generator on lattice (2 bit mux)"
   #:defines (define-symbolic a b (bitvector 2))
   (define-symbolic sel (bitvector 1))
   #:bv-expr (if (not (bvzero? sel)) a b)
   #:architecture-description (lattice-ecp5-architecture-description)
   #:sketch-generator bitwise-sketch-generator
   #:module-semantics (list (cons (cons "LUT4" "../verilog/simulation/lattice-ecp5/LUT4.v")
                                  lattice-ecp5-lut4))
   #:include-dirs (list (build-path (get-lakeroad-directory) "verilog/simulation/lattice-ecp5"))
   #:extra-verilator-args "-Wno-UNUSED")

  (sketch-test #:name "bitwise with carry sketch generator on ultrascale"
               #:defines (define-symbolic a b (bitvector 8))
               #:bv-expr (bvadd a b)
               #:architecture-description (xilinx-ultrascale-plus-architecture-description)
               #:sketch-generator bitwise-with-carry-sketch-generator
               #:module-semantics
               (list (cons (cons "LUT2" "../verilog/simulation/xilinx-ultrascale-plus/LUT2.v")
                           xilinx-ultrascale-plus-lut2)
                     (cons (cons "LUT6" "../verilog/simulation/xilinx-ultrascale-plus/LUT6.v")
                           xilinx-ultrascale-plus-lut6)
                     (cons (cons "CARRY8" "../verilog/simulation/xilinx-ultrascale-plus/CARRY8.v")
                           xilinx-ultrascale-plus-carry8))
               #:include-dirs (list (build-path (get-lakeroad-directory)
                                                "verilog/simulation/xilinx-ultrascale-plus"))
               #:extra-verilator-args "-Wno-UNUSED -Wno-PINMISSING -Wno-WIDTH -Wno-TIMESCALEMOD")

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;;                             TEST COMPARISONS                             ;;
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;;; XILINX ULTRASCALE PLUS

  (sketch-test #:name "comparison sketch generator for bveq on ultrascale (2 bit)"
               #:defines (define-symbolic a b (bitvector 2))
               #:bv-expr (bool->bitvector (bveq a b))
               #:architecture-description (xilinx-ultrascale-plus-architecture-description)
               #:sketch-generator comparison-sketch-generator
               #:module-semantics
               (list (cons (cons "LUT2" "../verilog/simulation/xilinx-ultrascale-plus/LUT2.v")
                           xilinx-ultrascale-plus-lut2)
                     (cons (cons "LUT6" "../verilog/simulation/xilinx-ultrascale-plus/LUT6.v")
                           xilinx-ultrascale-plus-lut6)
                     (cons (cons "CARRY8" "../verilog/simulation/xilinx-ultrascale-plus/CARRY8.v")
                           xilinx-ultrascale-plus-carry8))
               #:include-dirs (list (build-path (get-lakeroad-directory)
                                                "verilog/simulation/xilinx-ultrascale-plus"))
               #:extra-verilator-args "-Wno-UNUSED -Wno-PINMISSING -Wno-WIDTH -Wno-TIMESCALEMOD")

  (sketch-test #:name "shallow comparison sketch generator for bveq on ultrascale (2 bit)"
               #:defines (define-symbolic a b (bitvector 2))
               #:bv-expr (bool->bitvector (bveq a b))
               #:architecture-description (xilinx-ultrascale-plus-architecture-description)
               #:sketch-generator shallow-comparison-sketch-generator
               #:module-semantics
               (list (cons (cons "LUT2" "../verilog/simulation/xilinx-ultrascale-plus/LUT2.v")
                           xilinx-ultrascale-plus-lut2)
                     (cons (cons "LUT6" "../verilog/simulation/xilinx-ultrascale-plus/LUT6.v")
                           xilinx-ultrascale-plus-lut6)
                     (cons (cons "CARRY8" "../verilog/simulation/xilinx-ultrascale-plus/CARRY8.v")
                           xilinx-ultrascale-plus-carry8))
               #:include-dirs (list (build-path (get-lakeroad-directory)
                                                "verilog/simulation/xilinx-ultrascale-plus"))
               #:extra-verilator-args "-Wno-UNUSED -Wno-PINMISSING -Wno-WIDTH -Wno-TIMESCALEMOD")

  (sketch-test #:name "comparison sketch generator for bvneq on ultrascale (2 bit)"
               #:defines (define-symbolic a b (bitvector 2))
               #:bv-expr (bool->bitvector (not (bveq a b)))
               #:architecture-description (xilinx-ultrascale-plus-architecture-description)
               #:sketch-generator comparison-sketch-generator
               #:module-semantics
               (list (cons (cons "LUT2" "../verilog/simulation/xilinx-ultrascale-plus/LUT2.v")
                           xilinx-ultrascale-plus-lut2)
                     (cons (cons "LUT6" "../verilog/simulation/xilinx-ultrascale-plus/LUT6.v")
                           xilinx-ultrascale-plus-lut6)
                     (cons (cons "CARRY8" "../verilog/simulation/xilinx-ultrascale-plus/CARRY8.v")
                           xilinx-ultrascale-plus-carry8))
               #:include-dirs (list (build-path (get-lakeroad-directory)
                                                "verilog/simulation/xilinx-ultrascale-plus"))
               #:extra-verilator-args "-Wno-UNUSED -Wno-PINMISSING -Wno-WIDTH -Wno-TIMESCALEMOD")

  (sketch-test #:name "shallow comparison sketch generator for bvneq on ultrascale (2 bit)"
               #:defines (define-symbolic a b (bitvector 2))
               #:bv-expr (bool->bitvector (not (bveq a b)))
               #:architecture-description (xilinx-ultrascale-plus-architecture-description)
               #:sketch-generator shallow-comparison-sketch-generator
               #:module-semantics
               (list (cons (cons "LUT2" "../verilog/simulation/xilinx-ultrascale-plus/LUT2.v")
                           xilinx-ultrascale-plus-lut2)
                     (cons (cons "LUT6" "../verilog/simulation/xilinx-ultrascale-plus/LUT6.v")
                           xilinx-ultrascale-plus-lut6)
                     (cons (cons "CARRY8" "../verilog/simulation/xilinx-ultrascale-plus/CARRY8.v")
                           xilinx-ultrascale-plus-carry8))
               #:include-dirs (list (build-path (get-lakeroad-directory)
                                                "verilog/simulation/xilinx-ultrascale-plus"))
               #:extra-verilator-args "-Wno-UNUSED -Wno-PINMISSING -Wno-WIDTH -Wno-TIMESCALEMOD")

  (sketch-test #:name "comparison sketch generator for bvneq on ultrascale (2 bit)"
               #:defines (define-symbolic a b (bitvector 2))
               #:bv-expr (bool->bitvector (not (bveq a b)))
               #:architecture-description (xilinx-ultrascale-plus-architecture-description)
               #:sketch-generator comparison-sketch-generator
               #:module-semantics
               (list (cons (cons "LUT2" "../verilog/simulation/xilinx-ultrascale-plus/LUT2.v")
                           xilinx-ultrascale-plus-lut2)
                     (cons (cons "LUT6" "../verilog/simulation/xilinx-ultrascale-plus/LUT6.v")
                           xilinx-ultrascale-plus-lut6)
                     (cons (cons "CARRY8" "../verilog/simulation/xilinx-ultrascale-plus/CARRY8.v")
                           xilinx-ultrascale-plus-carry8))
               #:include-dirs (list (build-path (get-lakeroad-directory)
                                                "verilog/simulation/xilinx-ultrascale-plus"))
               #:extra-verilator-args "-Wno-UNUSED -Wno-PINMISSING -Wno-WIDTH -Wno-TIMESCALEMOD")

  (sketch-test #:name "shallow comparison sketch generator for bvneq on ultrascale (2 bit)"
               #:defines (define-symbolic a b (bitvector 2))
               #:bv-expr (bool->bitvector (not (bveq a b)))
               #:architecture-description (xilinx-ultrascale-plus-architecture-description)
               #:sketch-generator shallow-comparison-sketch-generator
               #:module-semantics
               (list (cons (cons "LUT2" "../verilog/simulation/xilinx-ultrascale-plus/LUT2.v")
                           xilinx-ultrascale-plus-lut2)
                     (cons (cons "LUT6" "../verilog/simulation/xilinx-ultrascale-plus/LUT6.v")
                           xilinx-ultrascale-plus-lut6)
                     (cons (cons "CARRY8" "../verilog/simulation/xilinx-ultrascale-plus/CARRY8.v")
                           xilinx-ultrascale-plus-carry8))
               #:include-dirs (list (build-path (get-lakeroad-directory)
                                                "verilog/simulation/xilinx-ultrascale-plus"))
               #:extra-verilator-args "-Wno-UNUSED -Wno-PINMISSING -Wno-WIDTH -Wno-TIMESCALEMOD")

  (sketch-test #:name "comparison sketch generator for bvult on ultrascale (2 bit)"
               #:defines (define-symbolic a b (bitvector 2))
               #:bv-expr (bool->bitvector (bvult a b))
               #:architecture-description (xilinx-ultrascale-plus-architecture-description)
               #:sketch-generator comparison-sketch-generator
               #:module-semantics
               (list (cons (cons "LUT2" "../verilog/simulation/xilinx-ultrascale-plus/LUT2.v")
                           xilinx-ultrascale-plus-lut2)
                     (cons (cons "LUT6" "../verilog/simulation/xilinx-ultrascale-plus/LUT6.v")
                           xilinx-ultrascale-plus-lut6)
                     (cons (cons "CARRY8" "../verilog/simulation/xilinx-ultrascale-plus/CARRY8.v")
                           xilinx-ultrascale-plus-carry8))
               #:include-dirs (list (build-path (get-lakeroad-directory)
                                                "verilog/simulation/xilinx-ultrascale-plus"))
               #:extra-verilator-args "-Wno-UNUSED -Wno-PINMISSING -Wno-WIDTH -Wno-TIMESCALEMOD")

  (sketch-test #:name "comparison sketch generator for bvugt on ultrascale (2 bit)"
               #:defines (define-symbolic a b (bitvector 2))
               #:bv-expr (bool->bitvector (bvugt a b))
               #:architecture-description (xilinx-ultrascale-plus-architecture-description)
               #:sketch-generator comparison-sketch-generator
               #:module-semantics
               (list (cons (cons "LUT2" "../verilog/simulation/xilinx-ultrascale-plus/LUT2.v")
                           xilinx-ultrascale-plus-lut2)
                     (cons (cons "LUT6" "../verilog/simulation/xilinx-ultrascale-plus/LUT6.v")
                           xilinx-ultrascale-plus-lut6)
                     (cons (cons "CARRY8" "../verilog/simulation/xilinx-ultrascale-plus/CARRY8.v")
                           xilinx-ultrascale-plus-carry8))
               #:include-dirs (list (build-path (get-lakeroad-directory)
                                                "verilog/simulation/xilinx-ultrascale-plus"))
               #:extra-verilator-args "-Wno-UNUSED -Wno-PINMISSING -Wno-WIDTH -Wno-TIMESCALEMOD")

  ; (sketch-test
  ;  #:name "shallow comparison sketch generator for bvugt on ultrascale (2 bit)"
  ;  #:defines (define-symbolic a b (bitvector 2))
  ;  #:bv-expr (bool->bitvector (bvugt a b))
  ;  #:architecture-description (xilinx-ultrascale-plus-architecture-description)
  ;  #:sketch-generator shallow-comparison-sketch-generator
  ;  #:module-semantics
  ;  (list (cons (cons "LUT2" "../verilog/simulation/xilinx-ultrascale-plus/LUT2.v") xilinx-ultrascale-plus-lut2)
  ;        (cons (cons "LUT6" "../verilog/simulation/xilinx-ultrascale-plus/LUT6.v") xilinx-ultrascale-plus-lut6)
  ;        (cons (cons "CARRY8" "../verilog/simulation/xilinx-ultrascale-plus/CARRY8.v") xilinx-ultrascale-plus-carry8))
  ;  #:include-dirs (list (build-path (get-lakeroad-directory) "verilog/simulation/xilinx-ultrascale-plus"))
  ;  #:extra-verilator-args "-Wno-UNUSED -Wno-PINMISSING -Wno-WIDTH -Wno-TIMESCALEMOD")

  (sketch-test #:name "comparison sketch generator for bveq on ultrascale (4 bit)"
               #:defines (define-symbolic a b (bitvector 4))
               #:bv-expr (bool->bitvector (bveq a b))
               #:architecture-description (xilinx-ultrascale-plus-architecture-description)
               #:sketch-generator comparison-sketch-generator
               #:module-semantics
               (list (cons (cons "LUT2" "../verilog/simulation/xilinx-ultrascale-plus/LUT2.v")
                           xilinx-ultrascale-plus-lut2)
                     (cons (cons "LUT6" "../verilog/simulation/xilinx-ultrascale-plus/LUT6.v")
                           xilinx-ultrascale-plus-lut6)
                     (cons (cons "CARRY8" "../verilog/simulation/xilinx-ultrascale-plus/CARRY8.v")
                           xilinx-ultrascale-plus-carry8))
               #:include-dirs (list (build-path (get-lakeroad-directory)
                                                "verilog/simulation/xilinx-ultrascale-plus"))
               #:extra-verilator-args "-Wno-UNUSED -Wno-PINMISSING -Wno-WIDTH -Wno-TIMESCALEMOD")

  (sketch-test #:name "shallow comparison sketch generator for bveq on ultrascale (4 bit)"
               #:defines (define-symbolic a b (bitvector 4))
               #:bv-expr (bool->bitvector (bveq a b))
               #:architecture-description (xilinx-ultrascale-plus-architecture-description)
               #:sketch-generator shallow-comparison-sketch-generator
               #:module-semantics
               (list (cons (cons "LUT2" "../verilog/simulation/xilinx-ultrascale-plus/LUT2.v")
                           xilinx-ultrascale-plus-lut2)
                     (cons (cons "LUT6" "../verilog/simulation/xilinx-ultrascale-plus/LUT6.v")
                           xilinx-ultrascale-plus-lut6)
                     (cons (cons "CARRY8" "../verilog/simulation/xilinx-ultrascale-plus/CARRY8.v")
                           xilinx-ultrascale-plus-carry8))
               #:include-dirs (list (build-path (get-lakeroad-directory)
                                                "verilog/simulation/xilinx-ultrascale-plus"))
               #:extra-verilator-args "-Wno-UNUSED -Wno-PINMISSING -Wno-WIDTH -Wno-TIMESCALEMOD")

  (sketch-test #:name "comparison sketch generator for bvneq on ultrascale (4 bit)"
               #:defines (define-symbolic a b (bitvector 4))
               #:bv-expr (bool->bitvector (not (bveq a b)))
               #:architecture-description (xilinx-ultrascale-plus-architecture-description)
               #:sketch-generator comparison-sketch-generator
               #:module-semantics
               (list (cons (cons "LUT2" "../verilog/simulation/xilinx-ultrascale-plus/LUT2.v")
                           xilinx-ultrascale-plus-lut2)
                     (cons (cons "LUT6" "../verilog/simulation/xilinx-ultrascale-plus/LUT6.v")
                           xilinx-ultrascale-plus-lut6)
                     (cons (cons "CARRY8" "../verilog/simulation/xilinx-ultrascale-plus/CARRY8.v")
                           xilinx-ultrascale-plus-carry8))
               #:include-dirs (list (build-path (get-lakeroad-directory)
                                                "verilog/simulation/xilinx-ultrascale-plus"))
               #:extra-verilator-args "-Wno-UNUSED -Wno-PINMISSING -Wno-WIDTH -Wno-TIMESCALEMOD")

  (sketch-test #:name "shallow comparison sketch generator for bvneq on ultrascale (4 bit)"
               #:defines (define-symbolic a b (bitvector 4))
               #:bv-expr (bool->bitvector (not (bveq a b)))
               #:architecture-description (xilinx-ultrascale-plus-architecture-description)
               #:sketch-generator shallow-comparison-sketch-generator
               #:module-semantics
               (list (cons (cons "LUT2" "../verilog/simulation/xilinx-ultrascale-plus/LUT2.v")
                           xilinx-ultrascale-plus-lut2)
                     (cons (cons "LUT6" "../verilog/simulation/xilinx-ultrascale-plus/LUT6.v")
                           xilinx-ultrascale-plus-lut6)
                     (cons (cons "CARRY8" "../verilog/simulation/xilinx-ultrascale-plus/CARRY8.v")
                           xilinx-ultrascale-plus-carry8))
               #:include-dirs (list (build-path (get-lakeroad-directory)
                                                "verilog/simulation/xilinx-ultrascale-plus"))
               #:extra-verilator-args "-Wno-UNUSED -Wno-PINMISSING -Wno-WIDTH -Wno-TIMESCALEMOD")

  (sketch-test #:name "comparison sketch generator for bvult on ultrascale (4 bit)"
               #:defines (define-symbolic a b (bitvector 4))
               #:bv-expr (bool->bitvector (bvult a b))
               #:architecture-description (xilinx-ultrascale-plus-architecture-description)
               #:sketch-generator comparison-sketch-generator
               #:module-semantics
               (list (cons (cons "LUT2" "../verilog/simulation/xilinx-ultrascale-plus/LUT2.v")
                           xilinx-ultrascale-plus-lut2)
                     (cons (cons "LUT6" "../verilog/simulation/xilinx-ultrascale-plus/LUT6.v")
                           xilinx-ultrascale-plus-lut6)
                     (cons (cons "CARRY8" "../verilog/simulation/xilinx-ultrascale-plus/CARRY8.v")
                           xilinx-ultrascale-plus-carry8))
               #:include-dirs (list (build-path (get-lakeroad-directory)
                                                "verilog/simulation/xilinx-ultrascale-plus"))
               #:extra-verilator-args "-Wno-UNUSED -Wno-PINMISSING -Wno-WIDTH -Wno-TIMESCALEMOD")

  ; (sketch-test
  ;  #:name "shallow comparison sketch generator for bvult on ultrascale (4 bit)"
  ;  #:defines (define-symbolic a b (bitvector 4))
  ;  #:bv-expr (bool->bitvector (bvult a b))
  ;  #:architecture-description (xilinx-ultrascale-plus-architecture-description)
  ;  #:sketch-generator shallow-comparison-sketch-generator
  ;  #:module-semantics
  ;  (list (cons (cons "LUT2" "../verilog/simulation/xilinx-ultrascale-plus/LUT2.v") xilinx-ultrascale-plus-lut2)
  ;        (cons (cons "LUT6" "../verilog/simulation/xilinx-ultrascale-plus/LUT6.v") xilinx-ultrascale-plus-lut6)
  ;        (cons (cons "CARRY8" "../verilog/simulation/xilinx-ultrascale-plus/CARRY8.v") xilinx-ultrascale-plus-carry8))
  ;  #:include-dirs (list (build-path (get-lakeroad-directory) "verilog/simulation/xilinx-ultrascale-plus"))
  ;  #:extra-verilator-args "-Wno-UNUSED -Wno-PINMISSING -Wno-WIDTH -Wno-TIMESCALEMOD")

  (sketch-test #:name "comparison sketch generator for bvugt on ultrascale (4 bit)"
               #:defines (define-symbolic a b (bitvector 4))
               #:bv-expr (bool->bitvector (bvugt a b))
               #:architecture-description (xilinx-ultrascale-plus-architecture-description)
               #:sketch-generator comparison-sketch-generator
               #:module-semantics
               (list (cons (cons "LUT2" "../verilog/simulation/xilinx-ultrascale-plus/LUT2.v")
                           xilinx-ultrascale-plus-lut2)
                     (cons (cons "LUT6" "../verilog/simulation/xilinx-ultrascale-plus/LUT6.v")
                           xilinx-ultrascale-plus-lut6)
                     (cons (cons "CARRY8" "../verilog/simulation/xilinx-ultrascale-plus/CARRY8.v")
                           xilinx-ultrascale-plus-carry8))
               #:include-dirs (list (build-path (get-lakeroad-directory)
                                                "verilog/simulation/xilinx-ultrascale-plus"))
               #:extra-verilator-args "-Wno-UNUSED -Wno-PINMISSING -Wno-WIDTH -Wno-TIMESCALEMOD")

  ; (sketch-test
  ;  #:name "shallow comparison sketch generator for bvugt on ultrascale (4 bit)"
  ;  #:defines (define-symbolic a b (bitvector 4))
  ;  #:bv-expr (bool->bitvector (bvugt a b))
  ;  #:architecture-description (xilinx-ultrascale-plus-architecture-description)
  ;  #:sketch-generator shallow-comparison-sketch-generator
  ;  #:module-semantics
  ;  (list (cons (cons "LUT2" "../verilog/simulation/xilinx-ultrascale-plus/LUT2.v") xilinx-ultrascale-plus-lut2)
  ;        (cons (cons "LUT6" "../verilog/simulation/xilinx-ultrascale-plus/LUT6.v") xilinx-ultrascale-plus-lut6)
  ;        (cons (cons "CARRY8" "../verilog/simulation/xilinx-ultrascale-plus/CARRY8.v") xilinx-ultrascale-plus-carry8))
  ;  #:include-dirs (list (build-path (get-lakeroad-directory) "verilog/simulation/xilinx-ultrascale-plus"))
  ;  #:extra-verilator-args "-Wno-UNUSED -Wno-PINMISSING -Wno-WIDTH -Wno-TIMESCALEMOD")

  (sketch-test #:name "comparison sketch generator for bveq on ultrascale (8 bit)"
               #:defines (define-symbolic a b (bitvector 8))
               #:bv-expr (bool->bitvector (bveq a b))
               #:architecture-description (xilinx-ultrascale-plus-architecture-description)
               #:sketch-generator comparison-sketch-generator
               #:module-semantics
               (list (cons (cons "LUT2" "../verilog/simulation/xilinx-ultrascale-plus/LUT2.v")
                           xilinx-ultrascale-plus-lut2)
                     (cons (cons "LUT6" "../verilog/simulation/xilinx-ultrascale-plus/LUT6.v")
                           xilinx-ultrascale-plus-lut6)
                     (cons (cons "CARRY8" "../verilog/simulation/xilinx-ultrascale-plus/CARRY8.v")
                           xilinx-ultrascale-plus-carry8))
               #:include-dirs (list (build-path (get-lakeroad-directory)
                                                "verilog/simulation/xilinx-ultrascale-plus"))
               #:extra-verilator-args "-Wno-UNUSED -Wno-PINMISSING -Wno-WIDTH -Wno-TIMESCALEMOD")

  (sketch-test #:name "shallow comparison sketch generator for bveq on ultrascale (8 bit)"
               #:defines (define-symbolic a b (bitvector 8))
               #:bv-expr (bool->bitvector (bveq a b))
               #:architecture-description (xilinx-ultrascale-plus-architecture-description)
               #:sketch-generator shallow-comparison-sketch-generator
               #:module-semantics
               (list (cons (cons "LUT2" "../verilog/simulation/xilinx-ultrascale-plus/LUT2.v")
                           xilinx-ultrascale-plus-lut2)
                     (cons (cons "LUT6" "../verilog/simulation/xilinx-ultrascale-plus/LUT6.v")
                           xilinx-ultrascale-plus-lut6)
                     (cons (cons "CARRY8" "../verilog/simulation/xilinx-ultrascale-plus/CARRY8.v")
                           xilinx-ultrascale-plus-carry8))
               #:include-dirs (list (build-path (get-lakeroad-directory)
                                                "verilog/simulation/xilinx-ultrascale-plus"))
               #:extra-verilator-args "-Wno-UNUSED -Wno-PINMISSING -Wno-WIDTH -Wno-TIMESCALEMOD")

  (sketch-test #:name "comparison sketch generator for bvneq on ultrascale (8 bit)"
               #:defines (define-symbolic a b (bitvector 8))
               #:bv-expr (bool->bitvector (not (bveq a b)))
               #:architecture-description (xilinx-ultrascale-plus-architecture-description)
               #:sketch-generator comparison-sketch-generator
               #:module-semantics
               (list (cons (cons "LUT2" "../verilog/simulation/xilinx-ultrascale-plus/LUT2.v")
                           xilinx-ultrascale-plus-lut2)
                     (cons (cons "LUT6" "../verilog/simulation/xilinx-ultrascale-plus/LUT6.v")
                           xilinx-ultrascale-plus-lut6)
                     (cons (cons "CARRY8" "../verilog/simulation/xilinx-ultrascale-plus/CARRY8.v")
                           xilinx-ultrascale-plus-carry8))
               #:include-dirs (list (build-path (get-lakeroad-directory)
                                                "verilog/simulation/xilinx-ultrascale-plus"))
               #:extra-verilator-args "-Wno-UNUSED -Wno-PINMISSING -Wno-WIDTH -Wno-TIMESCALEMOD")

  (sketch-test #:name "shallow comparison sketch generator for bvneq on ultrascale (8 bit)"
               #:defines (define-symbolic a b (bitvector 8))
               #:bv-expr (bool->bitvector (not (bveq a b)))
               #:architecture-description (xilinx-ultrascale-plus-architecture-description)
               #:sketch-generator shallow-comparison-sketch-generator
               #:module-semantics
               (list (cons (cons "LUT2" "../verilog/simulation/xilinx-ultrascale-plus/LUT2.v")
                           xilinx-ultrascale-plus-lut2)
                     (cons (cons "LUT6" "../verilog/simulation/xilinx-ultrascale-plus/LUT6.v")
                           xilinx-ultrascale-plus-lut6)
                     (cons (cons "CARRY8" "../verilog/simulation/xilinx-ultrascale-plus/CARRY8.v")
                           xilinx-ultrascale-plus-carry8))
               #:include-dirs (list (build-path (get-lakeroad-directory)
                                                "verilog/simulation/xilinx-ultrascale-plus"))
               #:extra-verilator-args "-Wno-UNUSED -Wno-PINMISSING -Wno-WIDTH -Wno-TIMESCALEMOD")

  (sketch-test #:name "comparison sketch generator for bvult on ultrascale (8 bit)"
               #:defines (define-symbolic a b (bitvector 8))
               #:bv-expr (bool->bitvector (bvult a b))
               #:architecture-description (xilinx-ultrascale-plus-architecture-description)
               #:sketch-generator comparison-sketch-generator
               #:module-semantics
               (list (cons (cons "LUT2" "../verilog/simulation/xilinx-ultrascale-plus/LUT2.v")
                           xilinx-ultrascale-plus-lut2)
                     (cons (cons "LUT6" "../verilog/simulation/xilinx-ultrascale-plus/LUT6.v")
                           xilinx-ultrascale-plus-lut6)
                     (cons (cons "CARRY8" "../verilog/simulation/xilinx-ultrascale-plus/CARRY8.v")
                           xilinx-ultrascale-plus-carry8))
               #:include-dirs (list (build-path (get-lakeroad-directory)
                                                "verilog/simulation/xilinx-ultrascale-plus"))
               #:extra-verilator-args "-Wno-UNUSED -Wno-PINMISSING -Wno-WIDTH -Wno-TIMESCALEMOD")

  ; (sketch-test
  ;  #:name "shallow comparison sketch generator for bvult on ultrascale (8 bit)"
  ;  #:defines (define-symbolic a b (bitvector 8))
  ;  #:bv-expr (bool->bitvector (bvult a b))
  ;  #:architecture-description (xilinx-ultrascale-plus-architecture-description)
  ;  #:sketch-generator shallow-comparison-sketch-generator
  ;  #:module-semantics
  ;  (list (cons (cons "LUT2" "../verilog/simulation/xilinx-ultrascale-plus/LUT2.v") xilinx-ultrascale-plus-lut2)
  ;        (cons (cons "LUT6" "../verilog/simulation/xilinx-ultrascale-plus/LUT6.v") xilinx-ultrascale-plus-lut6)
  ;        (cons (cons "CARRY8" "../verilog/simulation/xilinx-ultrascale-plus/CARRY8.v") xilinx-ultrascale-plus-carry8))
  ;  #:include-dirs (list (build-path (get-lakeroad-directory) "verilog/simulation/xilinx-ultrascale-plus"))
  ;  #:extra-verilator-args "-Wno-UNUSED -Wno-PINMISSING -Wno-WIDTH -Wno-TIMESCALEMOD")

  (sketch-test #:name "comparison sketch generator for bvugt on ultrascale (8 bit)"
               #:defines (define-symbolic a b (bitvector 8))
               #:bv-expr (bool->bitvector (bvugt a b))
               #:architecture-description (xilinx-ultrascale-plus-architecture-description)
               #:sketch-generator comparison-sketch-generator
               #:module-semantics
               (list (cons (cons "LUT2" "../verilog/simulation/xilinx-ultrascale-plus/LUT2.v")
                           xilinx-ultrascale-plus-lut2)
                     (cons (cons "LUT6" "../verilog/simulation/xilinx-ultrascale-plus/LUT6.v")
                           xilinx-ultrascale-plus-lut6)
                     (cons (cons "CARRY8" "../verilog/simulation/xilinx-ultrascale-plus/CARRY8.v")
                           xilinx-ultrascale-plus-carry8))
               #:include-dirs (list (build-path (get-lakeroad-directory)
                                                "verilog/simulation/xilinx-ultrascale-plus"))
               #:extra-verilator-args "-Wno-UNUSED -Wno-PINMISSING -Wno-WIDTH -Wno-TIMESCALEMOD")

  ; (sketch-test
  ;  #:name "shallow comparison sketch generator for bvugt on ultrascale (8 bit)"
  ;  #:defines (define-symbolic a b (bitvector 8))
  ;  #:bv-expr (bool->bitvector (bvugt a b))
  ;  #:architecture-description (xilinx-ultrascale-plus-architecture-description)
  ;  #:sketch-generator shallow-comparison-sketch-generator
  ;  #:module-semantics
  ;  (list (cons (cons "LUT2" "../verilog/simulation/xilinx-ultrascale-plus/LUT2.v") xilinx-ultrascale-plus-lut2)
  ;        (cons (cons "LUT6" "../verilog/simulation/xilinx-ultrascale-plus/LUT6.v") xilinx-ultrascale-plus-lut6)
  ;        (cons (cons "CARRY8" "../verilog/simulation/xilinx-ultrascale-plus/CARRY8.v") xilinx-ultrascale-plus-carry8))
  ;  #:include-dirs (list (build-path (get-lakeroad-directory) "verilog/simulation/xilinx-ultrascale-plus"))
  ;  #:extra-verilator-args "-Wno-UNUSED -Wno-PINMISSING -Wno-WIDTH -Wno-TIMESCALEMOD")

  (sketch-test #:name "comparison sketch generator for bveq on ultrascale (16 bit)"
               #:defines (define-symbolic a b (bitvector 16))
               #:bv-expr (bool->bitvector (bveq a b))
               #:architecture-description (xilinx-ultrascale-plus-architecture-description)
               #:sketch-generator comparison-sketch-generator
               #:module-semantics
               (list (cons (cons "LUT2" "../verilog/simulation/xilinx-ultrascale-plus/LUT2.v")
                           xilinx-ultrascale-plus-lut2)
                     (cons (cons "LUT6" "../verilog/simulation/xilinx-ultrascale-plus/LUT6.v")
                           xilinx-ultrascale-plus-lut6)
                     (cons (cons "CARRY8" "../verilog/simulation/xilinx-ultrascale-plus/CARRY8.v")
                           xilinx-ultrascale-plus-carry8))
               #:include-dirs (list (build-path (get-lakeroad-directory)
                                                "verilog/simulation/xilinx-ultrascale-plus"))
               #:extra-verilator-args "-Wno-UNUSED -Wno-PINMISSING -Wno-WIDTH -Wno-TIMESCALEMOD")

  (sketch-test #:name "shallow comparison sketch generator for bveq on ultrascale (16 bit)"
               #:defines (define-symbolic a b (bitvector 16))
               #:bv-expr (bool->bitvector (bveq a b))
               #:architecture-description (xilinx-ultrascale-plus-architecture-description)
               #:sketch-generator shallow-comparison-sketch-generator
               #:module-semantics
               (list (cons (cons "LUT2" "../verilog/simulation/xilinx-ultrascale-plus/LUT2.v")
                           xilinx-ultrascale-plus-lut2)
                     (cons (cons "LUT6" "../verilog/simulation/xilinx-ultrascale-plus/LUT6.v")
                           xilinx-ultrascale-plus-lut6)
                     (cons (cons "CARRY8" "../verilog/simulation/xilinx-ultrascale-plus/CARRY8.v")
                           xilinx-ultrascale-plus-carry8))
               #:include-dirs (list (build-path (get-lakeroad-directory)
                                                "verilog/simulation/xilinx-ultrascale-plus"))
               #:extra-verilator-args "-Wno-UNUSED -Wno-PINMISSING -Wno-WIDTH -Wno-TIMESCALEMOD")

  (sketch-test #:name "comparison sketch generator for bvneq on ultrascale (16 bit)"
               #:defines (define-symbolic a b (bitvector 16))
               #:bv-expr (bool->bitvector (not (bveq a b)))
               #:architecture-description (xilinx-ultrascale-plus-architecture-description)
               #:sketch-generator comparison-sketch-generator
               #:module-semantics
               (list (cons (cons "LUT2" "../verilog/simulation/xilinx-ultrascale-plus/LUT2.v")
                           xilinx-ultrascale-plus-lut2)
                     (cons (cons "LUT6" "../verilog/simulation/xilinx-ultrascale-plus/LUT6.v")
                           xilinx-ultrascale-plus-lut6)
                     (cons (cons "CARRY8" "../verilog/simulation/xilinx-ultrascale-plus/CARRY8.v")
                           xilinx-ultrascale-plus-carry8))
               #:include-dirs (list (build-path (get-lakeroad-directory)
                                                "verilog/simulation/xilinx-ultrascale-plus"))
               #:extra-verilator-args "-Wno-UNUSED -Wno-PINMISSING -Wno-WIDTH -Wno-TIMESCALEMOD")

  (sketch-test #:name "shallow comparison sketch generator for bvneq on ultrascale (16 bit)"
               #:defines (define-symbolic a b (bitvector 16))
               #:bv-expr (bool->bitvector (not (bveq a b)))
               #:architecture-description (xilinx-ultrascale-plus-architecture-description)
               #:sketch-generator shallow-comparison-sketch-generator
               #:module-semantics
               (list (cons (cons "LUT2" "../verilog/simulation/xilinx-ultrascale-plus/LUT2.v")
                           xilinx-ultrascale-plus-lut2)
                     (cons (cons "LUT6" "../verilog/simulation/xilinx-ultrascale-plus/LUT6.v")
                           xilinx-ultrascale-plus-lut6)
                     (cons (cons "CARRY8" "../verilog/simulation/xilinx-ultrascale-plus/CARRY8.v")
                           xilinx-ultrascale-plus-carry8))
               #:include-dirs (list (build-path (get-lakeroad-directory)
                                                "verilog/simulation/xilinx-ultrascale-plus"))
               #:extra-verilator-args "-Wno-UNUSED -Wno-PINMISSING -Wno-WIDTH -Wno-TIMESCALEMOD")

  (sketch-test #:name "comparison sketch generator for bveq on ultrascale (32 bit)"
               #:defines (define-symbolic a b (bitvector 32))
               #:bv-expr (bool->bitvector (bveq a b))
               #:architecture-description (xilinx-ultrascale-plus-architecture-description)
               #:sketch-generator comparison-sketch-generator
               #:module-semantics
               (list (cons (cons "LUT2" "../verilog/simulation/xilinx-ultrascale-plus/LUT2.v")
                           xilinx-ultrascale-plus-lut2)
                     (cons (cons "LUT6" "../verilog/simulation/xilinx-ultrascale-plus/LUT6.v")
                           xilinx-ultrascale-plus-lut6)
                     (cons (cons "CARRY8" "../verilog/simulation/xilinx-ultrascale-plus/CARRY8.v")
                           xilinx-ultrascale-plus-carry8))
               #:include-dirs (list (build-path (get-lakeroad-directory)
                                                "verilog/simulation/xilinx-ultrascale-plus"))
               #:extra-verilator-args "-Wno-UNUSED -Wno-PINMISSING -Wno-WIDTH -Wno-TIMESCALEMOD")

  (sketch-test #:name "shallow comparison sketch generator for bveq on ultrascale (32 bit)"
               #:defines (define-symbolic a b (bitvector 32))
               #:bv-expr (bool->bitvector (bveq a b))
               #:architecture-description (xilinx-ultrascale-plus-architecture-description)
               #:sketch-generator shallow-comparison-sketch-generator
               #:module-semantics
               (list (cons (cons "LUT2" "../verilog/simulation/xilinx-ultrascale-plus/LUT2.v")
                           xilinx-ultrascale-plus-lut2)
                     (cons (cons "LUT6" "../verilog/simulation/xilinx-ultrascale-plus/LUT6.v")
                           xilinx-ultrascale-plus-lut6)
                     (cons (cons "CARRY8" "../verilog/simulation/xilinx-ultrascale-plus/CARRY8.v")
                           xilinx-ultrascale-plus-carry8))
               #:include-dirs (list (build-path (get-lakeroad-directory)
                                                "verilog/simulation/xilinx-ultrascale-plus"))
               #:extra-verilator-args "-Wno-UNUSED -Wno-PINMISSING -Wno-WIDTH -Wno-TIMESCALEMOD")

  (sketch-test #:name "comparison sketch generator for bvneq on ultrascale (32 bit)"
               #:defines (define-symbolic a b (bitvector 32))
               #:bv-expr (bool->bitvector (not (bveq a b)))
               #:architecture-description (xilinx-ultrascale-plus-architecture-description)
               #:sketch-generator comparison-sketch-generator
               #:module-semantics
               (list (cons (cons "LUT2" "../verilog/simulation/xilinx-ultrascale-plus/LUT2.v")
                           xilinx-ultrascale-plus-lut2)
                     (cons (cons "LUT6" "../verilog/simulation/xilinx-ultrascale-plus/LUT6.v")
                           xilinx-ultrascale-plus-lut6)
                     (cons (cons "CARRY8" "../verilog/simulation/xilinx-ultrascale-plus/CARRY8.v")
                           xilinx-ultrascale-plus-carry8))
               #:include-dirs (list (build-path (get-lakeroad-directory)
                                                "verilog/simulation/xilinx-ultrascale-plus"))
               #:extra-verilator-args "-Wno-UNUSED -Wno-PINMISSING -Wno-WIDTH -Wno-TIMESCALEMOD")

  (sketch-test #:name "shallow comparison sketch generator for bvneq on ultrascale (32 bit)"
               #:defines (define-symbolic a b (bitvector 32))
               #:bv-expr (bool->bitvector (not (bveq a b)))
               #:architecture-description (xilinx-ultrascale-plus-architecture-description)
               #:sketch-generator shallow-comparison-sketch-generator
               #:module-semantics
               (list (cons (cons "LUT2" "../verilog/simulation/xilinx-ultrascale-plus/LUT2.v")
                           xilinx-ultrascale-plus-lut2)
                     (cons (cons "LUT6" "../verilog/simulation/xilinx-ultrascale-plus/LUT6.v")
                           xilinx-ultrascale-plus-lut6)
                     (cons (cons "CARRY8" "../verilog/simulation/xilinx-ultrascale-plus/CARRY8.v")
                           xilinx-ultrascale-plus-carry8))
               #:include-dirs (list (build-path (get-lakeroad-directory)
                                                "verilog/simulation/xilinx-ultrascale-plus"))
               #:extra-verilator-args "-Wno-UNUSED -Wno-PINMISSING -Wno-WIDTH -Wno-TIMESCALEMOD")

  (sketch-test #:name "multiplication sketch generator on ultrascale (8 bit)"
               #:defines (define-symbolic a b (bitvector 8))
               #:bv-expr (bvmul a b)
               #:architecture-description (xilinx-ultrascale-plus-architecture-description)
               #:sketch-generator multiplication-sketch-generator
               #:module-semantics
               (list (cons (cons "LUT2" "../verilog/simulation/xilinx-ultrascale-plus/LUT2.v")
                           xilinx-ultrascale-plus-lut2)
                     (cons (cons "LUT6" "../verilog/simulation/xilinx-ultrascale-plus/LUT6.v")
                           xilinx-ultrascale-plus-lut6)
                     (cons (cons "CARRY8" "../verilog/simulation/xilinx-ultrascale-plus/CARRY8.v")
                           xilinx-ultrascale-plus-carry8))
               #:include-dirs (list (build-path (get-lakeroad-directory)
                                                "verilog/simulation/xilinx-ultrascale-plus"))
               #:extra-verilator-args "-Wno-UNUSED -Wno-PINMISSING -Wno-WIDTH -Wno-TIMESCALEMOD")

  (sketch-test
   #:name "bitwise sketch generator on lattice"
   #:defines (define-symbolic a b (bitvector 8))
   #:bv-expr (bvand a b)
   #:architecture-description (lattice-ecp5-architecture-description)
   #:sketch-generator bitwise-sketch-generator
   #:module-semantics
   (list (cons (cons "LUT4" "../verilog/simulation/lattice-ecp5/LUT4.v") lattice-ecp5-lut4)
         (cons (cons "CCU2C" "../verilog/simulation/lattice-ecp5/CCU2C.v") lattice-ecp5-ccu2c))
   #:include-dirs (list (build-path (get-lakeroad-directory) "verilog/simulation/lattice-ecp5"))
   #:extra-verilator-args "-Wno-UNUSED -Wno-PINMISSING")

  (sketch-test
   #:name "bitwise with carry sketch generator on lattice"
   #:defines (define-symbolic a b (bitvector 2))
   #:bv-expr (bvadd a b)
   #:architecture-description (lattice-ecp5-architecture-description)
   #:sketch-generator bitwise-with-carry-sketch-generator
   #:module-semantics
   (list (cons (cons "LUT4" "../verilog/simulation/lattice-ecp5/LUT4.v") lattice-ecp5-lut4)
         (cons (cons "CCU2C" "../verilog/simulation/lattice-ecp5/CCU2C.v") lattice-ecp5-ccu2c))
   #:include-dirs (list (build-path (get-lakeroad-directory) "verilog/simulation/lattice-ecp5"))
   #:extra-verilator-args "-Wno-UNUSED -Wno-PINMISSING")

  (sketch-test
   #:name "bitwise with carry sketch generator on lattice (3 bit)"
   #:defines (define-symbolic a b (bitvector 3))
   #:bv-expr (bvadd a b)
   #:architecture-description (lattice-ecp5-architecture-description)
   #:sketch-generator bitwise-with-carry-sketch-generator
   #:module-semantics
   (list (cons (cons "LUT4" "../verilog/simulation/lattice-ecp5/LUT4.v") lattice-ecp5-lut4)
         (cons (cons "CCU2C" "../verilog/simulation/lattice-ecp5/CCU2C.v") lattice-ecp5-ccu2c))
   #:include-dirs (list (build-path (get-lakeroad-directory) "verilog/simulation/lattice-ecp5"))
   #:extra-verilator-args "-Wno-UNUSED -Wno-PINMISSING")

  (sketch-test
   #:name "bitwise with carry sketch generator on lattice (1 bit)"
   #:defines (define-symbolic a b (bitvector 1))
   #:bv-expr (bvadd a b)
   #:architecture-description (lattice-ecp5-architecture-description)
   #:sketch-generator bitwise-with-carry-sketch-generator
   #:module-semantics
   (list (cons (cons "LUT4" "../verilog/simulation/lattice-ecp5/LUT4.v") lattice-ecp5-lut4)
         (cons (cons "CCU2C" "../verilog/simulation/lattice-ecp5/CCU2C.v") lattice-ecp5-ccu2c))
   #:include-dirs (list (build-path (get-lakeroad-directory) "verilog/simulation/lattice-ecp5"))
   #:extra-verilator-args "-Wno-UNUSED -Wno-PINMISSING")

  (sketch-test
   #:name "bitwise with carry sketch generator on lattice (9 bit)"
   #:defines (define-symbolic a b (bitvector 9))
   #:bv-expr (bvadd a b)
   #:architecture-description (lattice-ecp5-architecture-description)
   #:sketch-generator bitwise-with-carry-sketch-generator
   #:module-semantics
   (list (cons (cons "LUT4" "../verilog/simulation/lattice-ecp5/LUT4.v") lattice-ecp5-lut4)
         (cons (cons "CCU2C" "../verilog/simulation/lattice-ecp5/CCU2C.v") lattice-ecp5-ccu2c))
   #:include-dirs (list (build-path (get-lakeroad-directory) "verilog/simulation/lattice-ecp5"))
   #:extra-verilator-args "-Wno-UNUSED -Wno-PINMISSING")

  (sketch-test
   #:name "carry sketch generator on lattice"
   #:defines (define-symbolic a b (bitvector 2))
   #:bv-expr (bvadd a b)
   #:architecture-description (lattice-ecp5-architecture-description)
   #:sketch-generator carry-sketch-generator
   #:module-semantics
   (list (cons (cons "LUT4" "../verilog/simulation/lattice-ecp5/LUT4.v") lattice-ecp5-lut4)
         (cons (cons "CCU2C" "../verilog/simulation/lattice-ecp5/CCU2C.v") lattice-ecp5-ccu2c))
   #:include-dirs (list (build-path (get-lakeroad-directory) "verilog/simulation/lattice-ecp5"))
   #:extra-verilator-args "-Wno-UNUSED -Wno-PINMISSING")

  (sketch-test
   #:name "carry sketch generator on lattice (3 bit)"
   #:defines (define-symbolic a b (bitvector 3))
   #:bv-expr (bvadd a b)
   #:architecture-description (lattice-ecp5-architecture-description)
   #:sketch-generator carry-sketch-generator
   #:module-semantics
   (list (cons (cons "LUT4" "../verilog/simulation/lattice-ecp5/LUT4.v") lattice-ecp5-lut4)
         (cons (cons "CCU2C" "../verilog/simulation/lattice-ecp5/CCU2C.v") lattice-ecp5-ccu2c))
   #:include-dirs (list (build-path (get-lakeroad-directory) "verilog/simulation/lattice-ecp5"))
   #:extra-verilator-args "-Wno-UNUSED -Wno-PINMISSING")

  (sketch-test
   #:name "carry sketch generator on lattice (1 bit)"
   #:defines (define-symbolic a b (bitvector 1))
   #:bv-expr (bvadd a b)
   #:architecture-description (lattice-ecp5-architecture-description)
   #:sketch-generator carry-sketch-generator
   #:module-semantics
   (list (cons (cons "LUT4" "../verilog/simulation/lattice-ecp5/LUT4.v") lattice-ecp5-lut4)
         (cons (cons "CCU2C" "../verilog/simulation/lattice-ecp5/CCU2C.v") lattice-ecp5-ccu2c))
   #:include-dirs (list (build-path (get-lakeroad-directory) "verilog/simulation/lattice-ecp5"))
   #:extra-verilator-args "-Wno-UNUSED -Wno-PINMISSING")

  (sketch-test
   #:name "carry sketch generator on lattice (9 bit)"
   #:defines (define-symbolic a b (bitvector 9))
   #:bv-expr (bvadd a b)
   #:architecture-description (lattice-ecp5-architecture-description)
   #:sketch-generator carry-sketch-generator
   #:module-semantics
   (list (cons (cons "LUT4" "../verilog/simulation/lattice-ecp5/LUT4.v") lattice-ecp5-lut4)
         (cons (cons "CCU2C" "../verilog/simulation/lattice-ecp5/CCU2C.v") lattice-ecp5-ccu2c))
   #:include-dirs (list (build-path (get-lakeroad-directory) "verilog/simulation/lattice-ecp5"))
   #:extra-verilator-args "-Wno-UNUSED -Wno-PINMISSING")

  (sketch-test
   #:name "comparison sketch generator on lattice"
   #:defines (define-symbolic a b (bitvector 2))
   #:bv-expr (bool->bitvector (bveq a b))
   #:architecture-description (lattice-ecp5-architecture-description)
   #:sketch-generator comparison-sketch-generator
   #:module-semantics
   (list (cons (cons "LUT4" "../verilog/simulation/lattice-ecp5/LUT4.v") lattice-ecp5-lut4)
         (cons (cons "CCU2C" "../verilog/simulation/lattice-ecp5/CCU2C.v") lattice-ecp5-ccu2c))
   #:include-dirs (list (build-path (get-lakeroad-directory) "verilog/simulation/lattice-ecp5"))
   #:extra-verilator-args "-Wno-UNUSED -Wno-PINMISSING")

  (sketch-test
   #:name "shallow comparison sketch generator on lattice"
   #:defines (define-symbolic a b (bitvector 2))
   #:bv-expr (bool->bitvector (bveq a b))
   #:architecture-description (lattice-ecp5-architecture-description)
   #:sketch-generator shallow-comparison-sketch-generator
   #:module-semantics
   (list (cons (cons "LUT4" "../verilog/simulation/lattice-ecp5/LUT4.v") lattice-ecp5-lut4)
         (cons (cons "CCU2C" "../verilog/simulation/lattice-ecp5/CCU2C.v") lattice-ecp5-ccu2c))
   #:include-dirs (list (build-path (get-lakeroad-directory) "verilog/simulation/lattice-ecp5"))
   #:extra-verilator-args "-Wno-UNUSED -Wno-PINMISSING")

  (sketch-test
   #:name "multiplication sketch generator on lattice (1 bit)"
   #:defines (define-symbolic a b (bitvector 1))
   #:bv-expr (bvmul (zero-extend a (bitvector 1)) (zero-extend b (bitvector 1)))
   #:architecture-description (lattice-ecp5-architecture-description)
   #:sketch-generator multiplication-sketch-generator
   #:module-semantics
   (list (cons (cons "LUT4" "../verilog/simulation/lattice-ecp5/LUT4.v") lattice-ecp5-lut4)
         (cons (cons "CCU2C" "../verilog/simulation/lattice-ecp5/CCU2C.v") lattice-ecp5-ccu2c))
   #:include-dirs (list (build-path (get-lakeroad-directory) "verilog/simulation/lattice-ecp5"))
   #:extra-verilator-args "-Wno-UNUSED -Wno-PINMISSING")

  (sketch-test
   #:name "multiplication sketch generator on lattice (2 bit)"
   #:defines (define-symbolic a b (bitvector 2))
   #:bv-expr (bvmul a b)
   #:architecture-description (lattice-ecp5-architecture-description)
   #:sketch-generator multiplication-sketch-generator
   #:module-semantics
   (list (cons (cons "LUT4" "../verilog/simulation/lattice-ecp5/LUT4.v") lattice-ecp5-lut4)
         (cons (cons "CCU2C" "../verilog/simulation/lattice-ecp5/CCU2C.v") lattice-ecp5-ccu2c))
   #:include-dirs (list (build-path (get-lakeroad-directory) "verilog/simulation/lattice-ecp5"))
   #:extra-verilator-args "-Wno-UNUSED -Wno-PINMISSING")

  (sketch-test
   #:name "multiplication sketch generator on lattice (3 bit)"
   #:defines (define-symbolic a b (bitvector 3))
   #:bv-expr (bvmul a b)
   #:architecture-description (lattice-ecp5-architecture-description)
   #:sketch-generator multiplication-sketch-generator
   #:module-semantics
   (list (cons (cons "LUT4" "../verilog/simulation/lattice-ecp5/LUT4.v") lattice-ecp5-lut4)
         (cons (cons "CCU2C" "../verilog/simulation/lattice-ecp5/CCU2C.v") lattice-ecp5-ccu2c))
   #:include-dirs (list (build-path (get-lakeroad-directory) "verilog/simulation/lattice-ecp5"))
   #:extra-verilator-args "-Wno-UNUSED -Wno-PINMISSING")

  (sketch-test
   #:name "bitwise on SOFA"
   #:defines (define-symbolic a b (bitvector 2))
   #:bv-expr (bvand a b)
   #:architecture-description (sofa-architecture-description)
   #:sketch-generator bitwise-sketch-generator
   #:module-semantics (list (cons (cons "frac_lut4" "../modules_for_importing/SOFA/frac_lut4.v")
                                  sofa-frac-lut4))
   #:include-dirs
   (list
    (build-path (get-lakeroad-directory) "modules_for_importing" "SOFA")
    (build-path (get-lakeroad-directory) "verilog/simulation/skywater/")
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
   #:module-semantics (list (cons (cons "frac_lut4" "../modules_for_importing/SOFA/frac_lut4.v")
                                  sofa-frac-lut4))
   #:include-dirs
   (list
    (build-path (get-lakeroad-directory) "modules_for_importing" "SOFA")
    (build-path (get-lakeroad-directory) "verilog/simulation/skywater/")
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
   #:module-semantics (list (cons (cons "frac_lut4" "../modules_for_importing/SOFA/frac_lut4.v")
                                  sofa-frac-lut4))
   #:include-dirs
   (list
    (build-path (get-lakeroad-directory) "modules_for_importing" "SOFA")
    (build-path (get-lakeroad-directory) "verilog/simulation/skywater/")
    (build-path (get-lakeroad-directory) "skywater-pdk-libs-sky130_fd_sc_hd/cells/inv/")
    (build-path (get-lakeroad-directory) "skywater-pdk-libs-sky130_fd_sc_hd/cells/buf/")
    (build-path (get-lakeroad-directory) "skywater-pdk-libs-sky130_fd_sc_hd/cells/mux2/")
    (build-path (get-lakeroad-directory) "skywater-pdk-libs-sky130_fd_sc_hd" "models" "udp_mux_2to1"))
   #:extra-verilator-args
   "-Wno-LITENDIAN -Wno-EOFNEWLINE -Wno-UNUSED -Wno-PINMISSING -Wno-TIMESCALEMOD -DSKY130_FD_SC_HD__UDP_MUX_2TO1_LAKEROAD_HACK -DNO_PRIMITIVES")

  (sketch-test
   #:name "shallow comparison sketch on SOFA"
   #:defines (define-symbolic a b (bitvector 4))
   #:bv-expr (bool->bitvector (bveq a b))
   #:architecture-description (sofa-architecture-description)
   #:sketch-generator shallow-comparison-sketch-generator
   #:module-semantics (list (cons (cons "frac_lut4" "../modules_for_importing/SOFA/frac_lut4.v")
                                  sofa-frac-lut4))
   #:include-dirs
   (list
    (build-path (get-lakeroad-directory) "modules_for_importing" "SOFA")
    (build-path (get-lakeroad-directory) "verilog/simulation/skywater/")
    (build-path (get-lakeroad-directory) "skywater-pdk-libs-sky130_fd_sc_hd/cells/inv/")
    (build-path (get-lakeroad-directory) "skywater-pdk-libs-sky130_fd_sc_hd/cells/buf/")
    (build-path (get-lakeroad-directory) "skywater-pdk-libs-sky130_fd_sc_hd/cells/mux2/")
    (build-path (get-lakeroad-directory) "skywater-pdk-libs-sky130_fd_sc_hd" "models" "udp_mux_2to1"))
   #:extra-verilator-args
   "-Wno-LITENDIAN -Wno-EOFNEWLINE -Wno-UNUSED -Wno-PINMISSING -Wno-TIMESCALEMOD -DSKY130_FD_SC_HD__UDP_MUX_2TO1_LAKEROAD_HACK -DNO_PRIMITIVES")

  (sketch-test
   #:name "multiplication sketch on SOFA (1bit)"
   #:defines (define-symbolic a b (bitvector 1))
   #:bv-expr (bvmul a b)
   #:architecture-description (sofa-architecture-description)
   #:sketch-generator multiplication-sketch-generator
   #:module-semantics (list (cons (cons "frac_lut4" "../modules_for_importing/SOFA/frac_lut4.v")
                                  sofa-frac-lut4))
   #:include-dirs
   (list
    (build-path (get-lakeroad-directory) "modules_for_importing" "SOFA")
    (build-path (get-lakeroad-directory) "verilog/simulation/skywater/")
    (build-path (get-lakeroad-directory) "skywater-pdk-libs-sky130_fd_sc_hd/cells/inv/")
    (build-path (get-lakeroad-directory) "skywater-pdk-libs-sky130_fd_sc_hd/cells/buf/")
    (build-path (get-lakeroad-directory) "skywater-pdk-libs-sky130_fd_sc_hd/cells/mux2/")
    (build-path (get-lakeroad-directory) "skywater-pdk-libs-sky130_fd_sc_hd" "models" "udp_mux_2to1"))
   #:extra-verilator-args
   "-Wno-LITENDIAN -Wno-EOFNEWLINE -Wno-UNUSED -Wno-PINMISSING -Wno-TIMESCALEMOD -DSKY130_FD_SC_HD__UDP_MUX_2TO1_LAKEROAD_HACK -DNO_PRIMITIVES")

  (sketch-test
   #:name "multiplication sketch on SOFA (2 bit)"
   #:defines (define-symbolic a b (bitvector 2))
   #:bv-expr (bvmul a b)
   #:architecture-description (sofa-architecture-description)
   #:sketch-generator multiplication-sketch-generator
   #:module-semantics (list (cons (cons "frac_lut4" "../modules_for_importing/SOFA/frac_lut4.v")
                                  sofa-frac-lut4))
   #:include-dirs
   (list
    (build-path (get-lakeroad-directory) "modules_for_importing" "SOFA")
    (build-path (get-lakeroad-directory) "verilog/simulation/skywater/")
    (build-path (get-lakeroad-directory) "skywater-pdk-libs-sky130_fd_sc_hd/cells/inv/")
    (build-path (get-lakeroad-directory) "skywater-pdk-libs-sky130_fd_sc_hd/cells/buf/")
    (build-path (get-lakeroad-directory) "skywater-pdk-libs-sky130_fd_sc_hd/cells/mux2/")
    (build-path (get-lakeroad-directory) "skywater-pdk-libs-sky130_fd_sc_hd" "models" "udp_mux_2to1"))
   #:extra-verilator-args
   "-Wno-LITENDIAN -Wno-EOFNEWLINE -Wno-UNUSED -Wno-PINMISSING -Wno-TIMESCALEMOD -DSKY130_FD_SC_HD__UDP_MUX_2TO1_LAKEROAD_HACK -DNO_PRIMITIVES")

  (sketch-test
   #:name "multiplication sketch on SOFA (3 bits)"
   #:defines (define-symbolic a b (bitvector 3))
   #:bv-expr (bvmul a b)
   #:architecture-description (sofa-architecture-description)
   #:sketch-generator multiplication-sketch-generator
   #:module-semantics (list (cons (cons "frac_lut4" "../modules_for_importing/SOFA/frac_lut4.v")
                                  sofa-frac-lut4))
   #:include-dirs
   (list
    (build-path (get-lakeroad-directory) "modules_for_importing" "SOFA")
    (build-path (get-lakeroad-directory) "verilog/simulation/skywater/")
    (build-path (get-lakeroad-directory) "skywater-pdk-libs-sky130_fd_sc_hd/cells/inv/")
    (build-path (get-lakeroad-directory) "skywater-pdk-libs-sky130_fd_sc_hd/cells/buf/")
    (build-path (get-lakeroad-directory) "skywater-pdk-libs-sky130_fd_sc_hd/cells/mux2/")
    (build-path (get-lakeroad-directory) "skywater-pdk-libs-sky130_fd_sc_hd" "models" "udp_mux_2to1"))
   #:extra-verilator-args
   "-Wno-LITENDIAN -Wno-EOFNEWLINE -Wno-UNUSED -Wno-PINMISSING -Wno-TIMESCALEMOD -DSKY130_FD_SC_HD__UDP_MUX_2TO1_LAKEROAD_HACK -DNO_PRIMITIVES")

  (sketch-test
   #:name "multiplication sketch on SOFA (8 bit)"
   #:defines (define-symbolic a b (bitvector 8))
   #:bv-expr (bvmul a b)
   #:architecture-description (sofa-architecture-description)
   #:sketch-generator multiplication-sketch-generator
   #:module-semantics (list (cons (cons "frac_lut4" "../modules_for_importing/SOFA/frac_lut4.v")
                                  sofa-frac-lut4))
   #:include-dirs
   (list
    (build-path (get-lakeroad-directory) "modules_for_importing" "SOFA")
    (build-path (get-lakeroad-directory) "verilog/simulation/skywater/")
    (build-path (get-lakeroad-directory) "skywater-pdk-libs-sky130_fd_sc_hd/cells/inv/")
    (build-path (get-lakeroad-directory) "skywater-pdk-libs-sky130_fd_sc_hd/cells/buf/")
    (build-path (get-lakeroad-directory) "skywater-pdk-libs-sky130_fd_sc_hd/cells/mux2/")
    (build-path (get-lakeroad-directory) "skywater-pdk-libs-sky130_fd_sc_hd" "models" "udp_mux_2to1"))
   #:extra-verilator-args
   "-Wno-LITENDIAN -Wno-EOFNEWLINE -Wno-UNUSED -Wno-PINMISSING -Wno-TIMESCALEMOD -DSKY130_FD_SC_HD__UDP_MUX_2TO1_LAKEROAD_HACK -DNO_PRIMITIVES"))
