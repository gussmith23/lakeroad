#lang errortrace rosette/safe

;;; Logical to physical (and vice versa) mapping tools for Lakeroad.
;;;
;;; A key component of Lakeroad is determining how *logical* signals (e.g. an 8 bit input) get wired
;;; to *physical* inputs, e.g. the 48 input bits of a Xilinx UltraScale+ Configurable Logic Block.
;;; This module provides tools for representing these mappings.

(provide interpret-logical-to-physical-mapping
         interpret-physical-to-logical-mapping
         compile-logical-to-physical-mapping
         compile-physical-to-logical-mapping
         logical-to-physical-mapping
         physical-to-logical-mapping)

(require rosette
         racket/pretty
         rosette/lib/synthax
         "utils.rkt"
         (prefix-in lr: "language.rkt"))

(struct logical-to-physical-mapping (f inputs) #:transparent)
(struct physical-to-logical-mapping (f outputs) #:transparent)

(define (transpose inputs)
  (apply map concat (map bitvector->bits (reverse inputs))))

;;; Compiles physical-to-logical mapping.
(define (compile-physical-to-logical-mapping compile f physical-expr)
  (match f
    ['(bitwise) (apply map list (compile physical-expr))]
    ;;; Same as bitwise, but reverses each result first.
    ['(bitwise-reverse) (apply map list (reverse (compile physical-expr)))]
    ['(identity) (compile physical-expr)]))

;;; Compiles logical-to-physical mapping.
(define (compile-logical-to-physical-mapping compile f logical-expr)
  (match f
    ['(bitwise) (apply map list (compile logical-expr))]
    ['(bitwise-reverse) (apply map list (map reverse (compile logical-expr)))]
    ['(identity) (compile logical-expr)]
    [`(shift ,n)  (let* ([compiled (apply map list (compile logical-expr))]
            [num-bits (length compiled)]
            [shift-amount (min (abs n) num-bits)]
            [num-pads (max 0 (- num-bits shift-amount))]
            [shifted (if (> n 0)
                         (append (make-list shift-amount (list "0")) (take compiled num-pads))
                         (append (drop compiled shift-amount) (make-list shift-amount (list "0"))))])
       shifted)]
    [`(constant ,n) (map list (compile n))]
    ))

(module+ test
  (require rackunit)
  (check-equal? (compile-logical-to-physical-mapping identity '(bitwise) '((1 2 6) (3 4 5)))
                '((1 3) (2 4) (6 5))))

;;; Interprets logical-to-physical-input mapping.
;;;
;;; There are two variants.
;;;
;;; Both variants take an interpreter function, to interpret unrecognized expressions.
;;;
;;; The second argument is an expression, whose syntax is defined below:
;;;
;;; The first variant uses a Rosette uninterpreted function to represent
;;; the underlying logical-to-physical mapping. The second variant allows a Racket function to be used
;;; directly.
;;;
;;; The first variant takes arguments:
;;; bw: bitwidth of map indices.
;;; f: a Rosette function value (i.e. passes (fv? f)), symbolic or concrete.
;;; bits-per-group: Number of bits per physical input group.
;;;
;;; The second variant takes:
;;; f: a function taking a list of bitvectors and returning a list of bitvectors. the input list is
;;;    (logical input 0, logical input 1, ...). the returned list is (physical input 0, physical input
;;;    1, ...).
;;;
;;; Both variants take:
;;; inputs: list of logical input bitvectors: (logical input 0, logical input 1, ...). These are
;;; assumed to be the same bitwidth and be in MSB..LSB order.
;;;
;;; If neither of these variants are matched, then the expression is passed to the interpreter fn.
;;;
;;; Returns: list of physical input bitvectors: (physical input 0, physical input 1, ...).
(define (interpret-logical-to-physical-mapping interpreter f inputs)
  (for/all
   ([f f])
   ;;; We have to use nested for/alls here because Rosette will merge (union '(bitwise)
   ;;; '(bitwise-reverse)) into ((union 'bitwise 'bitwise-reverse)).
   (match-define `(,fn-name ,args ...) f)
   (for/all
    ([fn-name fn-name])
    (match `(,fn-name ,@args)
      ['(identity) inputs]
      ;;; Variant which uses a Rosette uninterpreted function.
      [`(uf ,uf ,bw ,bits-per-group) (helper uf bw bits-per-group inputs)]
      ;;;
      ;;; Uses an uninterpreted function plus a mask.
      [`(uf-with-mask ,uf ,bw ,bits-per-group ,masks)
       (map bvor (helper uf bw bits-per-group inputs) masks)]
      ;;;
      ;;; "Bitwise" logical-to-physical mapping.
      ;;;
      ;;; The "bitwise" logical to physical mapping groups the 0th bits of each logical input, the 1st
      ;;; bit, the 2nd bit, etc., together into groups, with groups ordered from least significant up to
      ;;; most significant. E.g., if we had two 8-bit inputs, the bitwise mapping would return a list of
      ;;; pairs containing the pair of their 0th bits, the pair of their 1st bits, etc. up to the pair
      ;;; of their 7th bit.
      ;;;
      ;;; Args:
      ;;;   inputs: the list of logical inputs. Expects a list of Rosette bitvectors of the same length.
      ;;;
      ;;; Returns: A list of  Rosette bitvectors with bits mapped according to the bitwise pattern
      ;;;   described above.
      ['(bitwise) (transpose (interpreter inputs))]
      ;;;
      ;;; "Shift" logical-to-physical-mapping.
      ;;;
      ;;; The "shift" logical to physical mapping is like the "bitwise" mapping
      ;;; but shifts the physical bits by n. If n is positive then it is a left
      ;;; shift; if n is negative then it is a right shift.
      ;;;
      ;;; Note this uses 'logical' shifting, not 'arithmetic' shifting.
      ;;;
      ;;; Since bits are grouped from least significant to most significant, a
      ;;; 'left shift' actually of the underlying number corresponds to a 'right
      ;;; shift' of our list and vice versa.
      [`(shift ,n)
       (for/all ([n n #:exhaustive])
                (let* ([transposed (transpose (interpreter inputs))]
                       [num-cols (length transposed)]
                       [pad-col (bv #x0 (length inputs))]
                       [num-pads (min (abs n) num-cols)]
                       [pads (make-list num-pads pad-col)])
                  (cond
                    [(> n 0) (append pads (take transposed (- num-cols num-pads)))]
                    [(< n 0) (append (drop transposed num-pads) pads)]
                    [else transposed])))]

      [`(constant ,c) (bitvector->bits c)]
      ;;;
      ;;; Same as bitwise, but includes masks on the physical outputs.
      ;;;
      ;;; `masks` is a list of masks, one for each of the physical output bitvectors. Each mask is a
      ;;; bitvector of the same length as its corresponding physical output. The mask is ORed with the
      ;;; physical outputs before being returned.
      [`(bitwise-with-mask ,masks) (map bvor (transpose (interpreter inputs)) masks)]
      ;;;
      ;;; Same as bitwise, but reverse.
      ['(bitwise-reverse)
       (transpose (map (lambda (v) (apply concat (bitvector->bits v))) (interpreter inputs)))]
      ;;;
      ;;; Like bitwise mapping, but a bit more flexible. Logical input n always maps to bit n of each
      ;;; LUT, but any bit of logical input n can go to bit n of any LUT. (In bitwise, we require that
      ;;; bit 0 of logical input 0 goes to LUT0, bit 1 of logical input 0 goes to LUT1, etc.)
      ;;;
      ;;; Specifically implemented to enable mux, without breaking anything else.
      ;;;
      ;;; This is a generic template that can be copied: constrain a UF via asserts and then pass the UF
      ;;; to `helper`. We could probably make a helper function for this.
      [;;; (~> (bitvector uf-bw) (bitvector uf-bw))
       `(uf-constrained ,uf
                        ,uf-bw
                        ,num-logical-inputs
                        ,logical-input-width
                        ,num-physical-inputs
                        ,physical-input-width)
       (begin
         ;;; Constrain the underlying uninterpreted function.
         (for* ([physical-i (range num-physical-inputs)]
                [physical-bit-i (range physical-input-width)])
           (define uf-output (uf (bv (+ (* physical-i physical-input-width) physical-bit-i) uf-bw)))
           ;;; Logical indexes of all the bits of the logical input corresponding to (physical-i (i.e.
           ;;; LUT idx), physical-bit-idx).
           (define valid-logical-idxs
             (for/list ([logical-bit-i (range logical-input-width)])
               (bv (+ (* logical-input-width physical-bit-i) logical-bit-i) uf-bw)))
           ;;; This physical input must take one of the above logical inputs.
           (assert (for/fold ([cond #f]) ([valid-logical-idx valid-logical-idxs])
                     (|| cond (bveq uf-output valid-logical-idx)))))

         ; Map according to the uninterpreted function.
         (helper uf uf-bw physical-input-width inputs))]
      ; [`(logical-to-physical-mapping uf-constrained-with-mask
      ;                                ;;; (~> (bitvector uf-bw) (bitvector uf-bw))
      ;                                ,uf
      ;                                ,uf-bw
      ;                                ,num-logical-inputs
      ;                                ,logical-input-width
      ;                                ,num-physical-inputs
      ;                                ,physical-input-width
      ;                                ,masks
      ;                                ,inputs)
      ;  (begin
      ;    ;;; Constrain the underlying uninterpreted function.
      ;    (for* ([physical-i (range num-physical-inputs)]
      ;           [physical-bit-i (range physical-input-width)])
      ;      (define uf-output (uf (bv (+ (* physical-i physical-input-width) physical-bit-i) uf-bw)))
      ;      ;;; Logical indexes of all the bits of the logical input corresponding to (physical-i (i.e.
      ;      ;;; LUT idx), physical-bit-idx).
      ;      (define valid-logical-idxs
      ;        (for/list ([logical-bit-i (range logical-input-width)])
      ;          (bv (+ (* logical-input-width physical-bit-i) logical-bit-i) uf-bw)))
      ;      ;;; This physical input must take one of the above logical inputs.
      ;      (assert (for/fold ([cond #f]) ([valid-logical-idx valid-logical-idxs])
      ;                (|| cond (bveq uf-output valid-logical-idx)))))

      ; Map according to the uninterpreted function and apply mask.
      ; (map bvor (helper uf uf-bw physical-input-width inputs) masks))]
      [other (interpreter other)]))))

;;; Helper, which interprets a Rosette uninterpreted function value used as a logical-to-physical map.
;;;
;;; l-to-p-uf: logical-to-physical-inputs-uf
(define (helper f bw bits-per-group inputs)
  (let* (;;; First, creates one large bitvector in the following bit order:
         ;;; MSB of last input...LSB of last input:MSB of 2nd to last input...:...:MSB of i0...LSB i0
         ;;; Then converts to a list of bits, which reverses the bit order into lsb...msb order.
         [inputs (apply concat (reverse inputs))]
         [inputs-length (length (bitvector->bits inputs))]
         ;;; 0..inputs-length-1
         [indices (map (lambda (v) (integer->bitvector v (bitvector bw))) (range inputs-length))]
         ;;; We assume this list is also in lsb...msb order, i.e.
         ;;; (lsb i0, ..., msb i0, lsb i1, ..., lsb in, ..., msb in)
         [outputs (map (lambda (idx)
                         (bit 0 (bvlshr inputs (zero-extend (f idx) (bitvector inputs-length)))))
                       indices)]
         [num-groups (if (not (equal? (modulo inputs-length bits-per-group) 0))
                         (error "bits-per-group must divide inputs-length")
                         (/ inputs-length bits-per-group))]
         ;;; must reverse bits to get them back in msb..lsb order, and concat.
         [outputs (apply concat (reverse outputs))]
         ;;; Extract from right to left (bits-per-group-1 to 0 first, which we assume is o0, and so
         ;;; on.)
         [outputs
          (map (lambda (i) (extract (sub1 (* bits-per-group (+ i 1))) (* bits-per-group i) outputs))
               (range num-groups))])
    outputs))

(module+ test
  (require rackunit
           rosette/solver/smt/boolector)

  (current-solver (boolector))

  (test-begin
   (define-symbolic x (bitvector 3))
   (define-symbolic y (bitvector 3))
   (define pttn (list (?? (bitvector 2)) (?? (bitvector 2)) (?? (bitvector 2))))
   (match-define (list o0 o1 o2)
     (interpret-logical-to-physical-mapping identity `(bitwise-with-mask ,pttn) (list x y)))
   ;;; Simple case: none should be masked.
   (define soln0
     (synthesize #:forall (list x y)
                 #:guarantee (begin
                               (assert (bveq (bit 0 o0) (bit 0 x)))
                               (assert (bveq (bit 1 o0) (bit 0 y)))
                               (assert (bveq (bit 0 o1) (bit 1 x)))
                               (assert (bveq (bit 1 o1) (bit 1 y)))
                               (assert (bveq (bit 0 o2) (bit 2 x)))
                               (assert (bveq (bit 1 o2) (bit 2 y))))))
   (check-equal? (list (bv #b00 2) (bv #b00 2) (bv #b00 2)) (evaluate pttn soln0))
   ;;; More complex case: some should be masked.
   (define soln1
     (synthesize #:forall (list x y)
                 #:guarantee (begin
                               (assert (bveq (bit 0 o0) (bv 1 1)))
                               (assert (bveq (bit 1 o0) (bit 0 y)))
                               (assert (bveq (bit 0 o1) (bit 1 x)))
                               (assert (bveq (bit 1 o1) (bit 1 y)))
                               (assert (bveq (bit 0 o2) (bv 1 1)))
                               (assert (bveq (bit 1 o2) (bv 1 1))))))
   (check-equal? (list (bv #b01 2) (bv #b00 2) (bv #b11 2)) (evaluate pttn soln1))))

(module+ test
  (require rackunit
           rosette/solver/smt/boolector)
  (current-solver (boolector))

  ;;; Test that we can synthesize a logical-to-physical mapping given constraints.
  (define-symbolic a (bitvector 8))
  (define-symbolic b (bitvector 8))
  (define-symbolic c (bitvector 8))
  (define pttn (?? (~> (bitvector 5) (bitvector 5))))
  (match-define (list o0 o1 o2 o3 o4 o5)
    (interpret-logical-to-physical-mapping identity `(uf ,pttn 5 4) (list a b c)))
  (define soln
    (synthesize #:forall (list a b c)
                #:guarantee (begin
                              ;;; Make up some random constraints...
                              (assert (bveq (bit 0 a) (bit 0 o1)))
                              (assert (bveq (bit 1 a) (bit 2 o0)))
                              (assert (bveq (extract 7 4 c) o4))
                              ;;; This one reverses the bits (via bitvector->bits --> concat).
                              (assert (bveq (apply concat (bitvector->bits (extract 3 1 b)))
                                            (extract 2 0 o3))))))
  (check-true (sat? soln))
  ;;; Get the mapping function...
  (define f (evaluate pttn soln))

  ;;; Helper to help us run checks. Checks that the logical index maps to the expected physical index.
  (define (ch logical-idx physical-idx)
    (check-equal? (f (bv physical-idx 5)) (bv logical-idx 5)))
  (ch 1 2)
  (ch 0 5)
  (ch 20 16)
  (ch 21 17)
  (ch 22 18)
  (ch 23 19)
  (ch 11 12)
  (ch 10 13)
  (ch 9 14))

(module+ test
  (require rackunit)
  (check-equal?
   (interpret-logical-to-physical-mapping identity '(bitwise) (list (bv #b01 2) (bv #b10 2)))
   (list (bv #b01 2) (bv #b10 2)))
  (check-equal? (interpret-logical-to-physical-mapping identity '(bitwise) (list (bv #b01 2)))
                (list (bv #b1 1) (bv #b0 1)))
  (check-equal? (interpret-logical-to-physical-mapping identity '(bitwise) (list (bv #b01 2)))
                (list (bv #b1 1) (bv #b0 1)))

  ; The following two functions are helpers to help us test our wire
  ; implementations. They each create and interpret a logical-to-physical
  ; mapping (a shift and a constant) respectively.
  ;
  ; The functions create a lakeroad expression of the given type and then
  ; interpret it using a custom 'interpreter'. Note that we cannot pass in the
  ; `interpret` function from `interpret.rkt` since that would result in a
  ; circular dependency. Instead, we pass a simple lambda that uses
  ; `interpret-logical-to-physical-mapping identity...` on the nested expression
  ; we want to recursively interpret.
  (define (interpret-shift-instruction #:inputs inputs #:shift-by shift-by)
    (first (interpret-physical-to-logical-mapping
            ; interpret
            (lambda (x) (interpret-logical-to-physical-mapping identity x))
            `(physical-to-logical-mapping (bitwise)
                                          (logical-to-physical-mapping (shift ,shift-by) ,inputs)))))

  ; Helper function for testing
  (define (interpret-constant-instruction bitwidth)
    (first (interpret-physical-to-logical-mapping
            ; interpret
            (lambda (x) (interpret-logical-to-physical-mapping identity x))
            `(physical-to-logical-mapping (bitwise)
                                          (logical-to-physical-mapping (constant ,bitwidth) ())))))
  ;;;                 TEST CONSTANTS                    ;;;
  (check-equal? (interpret-shift-instruction #:inputs (list (bv #b01 2)) #:shift-by 0) (bv 1 2))

  ;;;                 TEST SHIFTS                    ;;;
  (check-equal? (interpret-shift-instruction #:inputs (list (bv #b01 2)) #:shift-by 0) (bv 1 2))
  (check-equal? (interpret-shift-instruction #:inputs (list (bv #b01 2)) #:shift-by 1) (bv 2 2))
  (check-equal? (interpret-shift-instruction #:inputs (list (bv #b01 2)) #:shift-by 2) (bv 0 2))
  (check-equal? (interpret-shift-instruction #:inputs (list (bv #b01 2)) #:shift-by 3) (bv 0 2))
  (check-equal? (interpret-shift-instruction #:inputs (list (bv #b10 2)) #:shift-by -1) (bv 1 2))
  (check-equal? (interpret-shift-instruction #:inputs (list (bv #b10 2)) #:shift-by -2) (bv 0 2))
  (check-equal? (interpret-shift-instruction #:inputs (list (bv #b10 2)) #:shift-by -3) (bv 0 2))

  ;; Test right shifts
  (check-equal? (interpret-shift-instruction #:inputs (list (bv #xaa 8)) #:shift-by 0) (bv #xaa 8))
  (check-equal? (interpret-shift-instruction #:inputs (list (bv #xaa 8)) #:shift-by -1) (bv #x55 8))
  (check-equal? (interpret-shift-instruction #:inputs (list (bv #xaa 8)) #:shift-by -2) (bv #x2a 8))
  (check-equal? (interpret-shift-instruction #:inputs (list (bv #xaa 8)) #:shift-by -3) (bv #x15 8))
  (check-equal? (interpret-shift-instruction #:inputs (list (bv #xaa 8)) #:shift-by -4) (bv #x0a 8))
  (check-equal? (interpret-shift-instruction #:inputs (list (bv #xaa 8)) #:shift-by -5) (bv #x05 8))
  (check-equal? (interpret-shift-instruction #:inputs (list (bv #xaa 8)) #:shift-by -6) (bv #x02 8))
  (check-equal? (interpret-shift-instruction #:inputs (list (bv #xaa 8)) #:shift-by -7) (bv #x01 8))
  (check-equal? (interpret-shift-instruction #:inputs (list (bv #xaa 8)) #:shift-by -8) (bv #x00 8))

  ;; Test left shifts
  (check-equal? (interpret-shift-instruction #:inputs (list (bv #xaa 8)) #:shift-by 1) (bv #x54 8))
  (check-equal? (interpret-shift-instruction #:inputs (list (bv #xaa 8)) #:shift-by 2) (bv #xa8 8))
  (check-equal? (interpret-shift-instruction #:inputs (list (bv #xaa 8)) #:shift-by 3) (bv #x50 8))
  (check-equal? (interpret-shift-instruction #:inputs (list (bv #xaa 8)) #:shift-by 4) (bv #xa0 8))
  (check-equal? (interpret-shift-instruction #:inputs (list (bv #xaa 8)) #:shift-by 5) (bv #x40 8))
  (check-equal? (interpret-shift-instruction #:inputs (list (bv #xaa 8)) #:shift-by 6) (bv #x80 8))
  (check-equal? (interpret-shift-instruction #:inputs (list (bv #xaa 8)) #:shift-by 7) (bv #x00 8))
  (check-equal? (interpret-shift-instruction #:inputs (list (bv #xaa 8)) #:shift-by 8) (bv #x00 8))

  (check-exn
   (regexp
    "@map: arity mismatch;\n the expected number of arguments does not match the given number\n  expected: at least 2\n  given: 1")
   (lambda ()
     (interpret-logical-to-physical-mapping identity '(bitwise) (list))
     (list)))
  (check-exn
   (regexp
    "map: all lists must have same size\n  first list length: 1\n  other list length: 2\n  procedure: concat")
   (lambda ()
     (interpret-logical-to-physical-mapping identity '(bitwise) (list (bv #b01 2) (bv #b1 1))))))

;;; Interprets physical-to-logical mappings.
;;; Expects a list of logical outputs in least significant->most significant order.
;;; For example, in a Xilinx UltraScale+ CLB, this list would be (LUTA out, LUTB out, ...).
(define (interpret-physical-to-logical-mapping interpreter f logical-outputs)
  (for/all
   ([f f])
   ;;; We have to use nested for/alls here because Rosette will merge (union '(bitwise)
   ;;; '(bitwise-reverse)) into ((union 'bitwise 'bitwise-reverse)).
   (match-define `(,fn-name ,args ...) f)
   (for/all
    ([fn-name fn-name])
    (match `(,fn-name ,@args)
      ;;; Defines the bitwise physical-to-logical mapping for mapping physical outputs to logical
      ;;; outputs.
      ;;;
      ;;; For now, this is nearly the same as the logical-to-physical bitwise mapping.
      ['(bitwise) (transpose (interpreter logical-outputs))]
      ;;;
      ;;; Same as bitwise, but reverse.
      ['(bitwise-reverse) (transpose (reverse (interpreter logical-outputs)))]
      ;;; Variant which uses a Rosette uninterpreted function.
      [`(uf ,uf ,bw ,bits-per-group) (helper uf bw bits-per-group (interpreter logical-outputs))]
      ;;;
      ;;; Choose one of the bits to be the output.
      [`(choose-one ,idx)
       (let* ([logical-outputs (apply concat (interpreter logical-outputs))])
         (list (bit 0
                    (bvlshr
                     logical-outputs
                     (zero-extend idx (bitvector (length (bitvector->bits logical-outputs))))))))]))))

(module+ test
  (require rackunit)
  (check-equal?
   (interpret-physical-to-logical-mapping identity '(bitwise) (list (bv #b1 1) (bv #b0 1)))
   (list (bv #b01 2)))

  (check-equal?
   (interpret-physical-to-logical-mapping identity '(bitwise-reverse) (list (bv #b1 1) (bv #b0 1)))
   (list (bv #b10 2)))

  ;;; Test that we can synthesize a logical-to-physical mapping given constraints.
  (test-begin
   (define-symbolic logical-out-a (bitvector 1))
   (define-symbolic logical-out-b (bitvector 1))
   (define-symbolic logical-out-c (bitvector 1))
   (define-symbolic logical-out-d (bitvector 1))
   (define-symbolic logical-out-e (bitvector 1))
   (define-symbolic logical-out-f (bitvector 1))
   (define-symbolic logical-out-g (bitvector 1))
   (define-symbolic logical-out-h (bitvector 1))
   (define pttn (?? (~> (bitvector 3) (bitvector 3))))
   (match-define (list physical-out)
     (interpret-physical-to-logical-mapping identity
                                            `(uf ,pttn 3 8)
                                            (list logical-out-a
                                                  logical-out-b
                                                  logical-out-c
                                                  logical-out-d
                                                  logical-out-e
                                                  logical-out-f
                                                  logical-out-g
                                                  logical-out-h)))
   (define soln
     (synthesize #:forall (list logical-out-a
                                logical-out-b
                                logical-out-c
                                logical-out-d
                                logical-out-e
                                logical-out-f
                                logical-out-g
                                logical-out-h)
                 #:guarantee
                 (begin
                   ;;; Make up some random constraints...
                   (assert (bveq logical-out-a (bit 0 physical-out)))
                   (assert (bveq (concat logical-out-e logical-out-d logical-out-c logical-out-b)
                                 (extract 4 1 physical-out)))
                   (assert (bveq (concat logical-out-f logical-out-g logical-out-h)
                                 (extract 7 5 physical-out))))))
   (check-true (sat? soln)))

  (test-begin
   (check-equal? (list (bv 0 1))
                 (interpret-physical-to-logical-mapping
                  identity
                  `(choose-one ,(bv 0 3))
                  (list (bv 1 1) (bv 1 1) (bv 1 1) (bv 1 1) (bv 1 1) (bv 1 1) (bv 1 1) (bv 0 1))))
   (check-equal? (list (bv 1 1))
                 (interpret-physical-to-logical-mapping
                  identity
                  `(choose-one ,(bv 7 3))
                  (list (bv 1 1) (bv 1 1) (bv 1 1) (bv 1 1) (bv 1 1) (bv 1 1) (bv 1 1) (bv 0 1))))))
