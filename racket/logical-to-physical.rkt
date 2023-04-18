#lang rosette/safe

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
         physical-to-logical-mapping
         (struct-out ltop-bitwise)
         (struct-out ltop-shift)
         (struct-out ltop-identity)
         (struct-out ltop-constant)
         (struct-out ltop-bitwise-reverse)
         (struct-out ptol-bitwise)
         (struct-out ptol-bitwise-reverse)
         (struct-out ptol-choose-one))

(require rosette
         racket/pretty
         rosette/lib/synthax
         "utils.rkt"
         "signal.rkt"
         (prefix-in lr: "language.rkt")
         rosette/lib/destruct)

(struct logical-to-physical-mapping (f inputs) #:transparent)
(struct physical-to-logical-mapping (f outputs) #:transparent)

;; this is a function to help with operating on lists of signals. We take in a list of bitvectors
;; (extracted from the signal input) and return the list of bitvectors with the match arm's operations applied.
(define (signal-helper f inputs)
  f
  inputs)

(define (bvvs->signalvs inputs state)
  (map (lambda (bv) (signal bv state)) inputs))

(define (transpose inputs)
  (apply map concat (map bitvector->bits (reverse inputs))))
;;; Compiles physical-to-logical mapping.
(define (compile-physical-to-logical-mapping compile f physical-expr)
  (destruct f
            [(ptol-bitwise) (apply map list (compile physical-expr))]
            ;;; Same as bitwise, but reverses each result first.
            [(ptol-bitwise-reverse) (apply map list (reverse (compile physical-expr)))]
            [(ptol-identity) (compile physical-expr)]))

;;; Compiles logical-to-physical mapping.
(define (compile-logical-to-physical-mapping compile f logical-expr)
  (destruct
   f
   [(ltop-bitwise) (apply map list (compile logical-expr))]
   [(ltop-bitwise-reverse) (apply map list (map reverse (compile logical-expr)))]
   [(ltop-identity) (compile logical-expr)]
   [(ltop-shift n)
    (let* ([compiled (apply map list (compile logical-expr))]
           [num-bits (length compiled)]
           [shift-amount (min (abs n) num-bits)]
           [num-pads (max 0 (- num-bits shift-amount))]
           [shifted (if (> n 0)
                        (append (make-list shift-amount (list "0")) (take compiled num-pads))
                        (append (drop compiled shift-amount) (make-list shift-amount (list "0"))))])
      shifted)]
   [(ltop-constant n) (map list (compile n))]))

(module+ test
  (require rackunit)
  (check-equal? (compile-logical-to-physical-mapping identity (ltop-bitwise) '((1 2 6) (3 4 5)))
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
(struct ltop-identity () #:transparent)
(struct ltop-bitwise () #:transparent)
(struct ltop-bitwise-reverse () #:transparent)
(struct ltop-bitwise-with-mask (masks) #:transparent)
(struct ltop-uf (uf bw bits-per-group) #:transparent)
(struct ltop-shift (n) #:transparent)
(struct ltop-constant (c) #:transparent)
(define (interpret-logical-to-physical-mapping interpreter f inputs)
  (destruct
   f
   [(ltop-identity) inputs]
   ;;; Variant which uses a Rosette uninterpreted function.
   [(ltop-uf uf bw bits-per-group)
    (helper uf bw bits-per-group inputs)]
   ;;;
   ;;; Uses an uninterpreted function plus a mask.
   ;;;[`(uf-with-mask ,uf ,bw ,bits-per-group ,masks)
   ;;; (map bvor (helper uf bw bits-per-group inputs) masks)]
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
   [(ltop-bitwise)
    (let* ([inputs (interpreter inputs)]
           [inputs-bv (map signal-value inputs)]
           [state (merge-state inputs)])
      (bvvs->signalvs (transpose inputs-bv) state))]
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
   [(ltop-shift n)
    (for/all
     ([n n #:exhaustive])
     (let* ([inputs (interpreter inputs)]
            [inputs-bv (map signal-value inputs)]
            [state (merge-state inputs)]
            [transposed (transpose inputs-bv)]
            [num-cols (length transposed)]
            [pad-col (bv #x0 (length inputs-bv))]
            [num-pads (min (abs n) num-cols)]
            [pads (make-list num-pads pad-col)])
       (cond
         [(> n 0) (bvvs->signalvs (append pads (take transposed (- num-cols num-pads))) state)]
         [(< n 0) (bvvs->signalvs (append (drop transposed num-pads) pads) state)]
         [else (bvvs->signalvs transposed state)])))]
   [(ltop-constant c)
    (let* ([inputs (interpreter c)])
      (map (lambda (b) (signal b (signal-state inputs))) (bitvector->bits (signal-value inputs))))]
   ;;;
   ;;; Same as bitwise, but includes masks on the physical outputs.
   ;;;
   ;;; `masks` is a list of masks, one for each of the physical output bitvectors. Each mask is a
   ;;; bitvector of the same length as its corresponding physical output. The mask is ORed with the
   ;;; physical outputs before being returned.
   [(ltop-bitwise-with-mask masks)
    (let* ([inputs (interpreter inputs)]
           [inputs-bv (map signal-value inputs)]
           [state (merge-state inputs)]
           [masks-bv (map signal-value masks)]
           )
      (bvvs->signalvs (map bvor (transpose inputs-bv) masks-bv) state))]
   ;;;
   ;;; Same as bitwise, but reverse.
   [(ltop-bitwise-reverse)
    (let* ([inputs (interpreter inputs)]
           [inputs-bv (map signal-value inputs)]
           [state (merge-state inputs)])
      (bvvs->signalvs (transpose (map (lambda (v) (apply concat (bitvector->bits v))) inputs-bv))
                      state))]
   ;;;
   ;;; Like bitwise mapping, but a bit more flexible. Logical input n always maps to bit n of each
   ;;; LUT, but any bit of logical input n can go to bit n of any LUT. (In bitwise, we require that
   ;;; bit 0 of logical input 0 goes to LUT0, bit 1 of logical input 0 goes to LUT1, etc.)
   ;;;
   ;;; Specifically implemented to enable mux, without breaking anything else.
   ;;;
   ;;; This is a generic template that can be copied: constrain a UF via asserts and then pass the UF
   ;;; to `helper`. We could probably make a helper function for this.
   ;;;[;;; (~> (bitvector uf-bw) (bitvector uf-bw))
   ;;; `(uf-constrained ,uf
   ;;;                  ,uf-bw
   ;;;                  ,num-logical-inputs
   ;;;                  ,logical-input-width
   ;;;                  ,num-physical-inputs
   ;;;                  ,physical-input-width)
   ;;; (begin
   ;;;   ;;; Constrain the underlying uninterpreted function.
   ;;;   (for* ([physical-i (range num-physical-inputs)]
   ;;;          [physical-bit-i (range physical-input-width)])
   ;;;     (define uf-output (uf (bv (+ (* physical-i physical-input-width) physical-bit-i) uf-bw)))
   ;;;     ;;; Logical indexes of all the bits of the logical input corresponding to (physical-i (i.e.
   ;;;     ;;; LUT idx), physical-bit-idx).
   ;;;     (define valid-logical-idxs
   ;;;       (for/list ([logical-bit-i (range logical-input-width)])
   ;;;         (bv (+ (* logical-input-width physical-bit-i) logical-bit-i) uf-bw)))
   ;;;     ;;; This physical input must take one of the above logical inputs.
   ;;;     (assert (for/fold ([cond #f]) ([valid-logical-idx valid-logical-idxs])
   ;;;               (|| cond (bveq uf-output valid-logical-idx)))))
   ;;;   ; Map according to the uninterpreted function.
   ;;;   (helper uf uf-bw physical-input-width inputs))]
   ;;;; [`(logical-to-physical-mapping uf-constrained-with-mask
   ;;;;                                ;;; (~> (bitvector uf-bw) (bitvector uf-bw))
   ;;;;                                ,uf
   ;;;;                                ,uf-bw
   ;;;;                                ,num-logical-inputs
   ;;;;                                ,logical-input-width
   ;;;;                                ,num-physical-inputs
   ;;;;                                ,physical-input-width
   ;;;;                                ,masks
   ;;;;                                ,inputs)
   ;;;;  (begin
   ;;;;    ;;; Constrain the underlying uninterpreted function.
   ;;;;    (for* ([physical-i (range num-physical-inputs)]
   ;;;;           [physical-bit-i (range physical-input-width)])
   ;;;;      (define uf-output (uf (bv (+ (* physical-i physical-input-width) physical-bit-i) uf-bw)))
   ;;;;      ;;; Logical indexes of all the bits of the logical input corresponding to (physical-i (i.e.
   ;;;;      ;;; LUT idx), physical-bit-idx).
   ;;;;      (define valid-logical-idxs
   ;;;;        (for/list ([logical-bit-i (range logical-input-width)])
   ;;;;          (bv (+ (* logical-input-width physical-bit-i) logical-bit-i) uf-bw)))
   ;;;;      ;;; This physical input must take one of the above logical inputs.
   ;;;;      (assert (for/fold ([cond #f]) ([valid-logical-idx valid-logical-idxs])
   ;;;;                (|| cond (bveq uf-output valid-logical-idx)))))
   ;;;; Map according to the uninterpreted function and apply mask.
   ;;;; (map bvor (helper uf uf-bw physical-input-width inputs) masks))]
   ;;;[other (interpreter other)]
   ))

;;; Helper, which interprets a Rosette uninterpreted function value used as a logical-to-physical map.
;;;
;;; l-to-p-uf: logical-to-physical-inputs-uf
(define (helper f bw bits-per-group inputs)
  (let* (;;; First, creates one large bitvector in the following bit order:
         ;;; MSB of last input...LSB of last input:MSB of 2nd to last input...:...:MSB of i0...LSB i0
         ;;; Then converts to a list of bits, which reverses the bit order into lsb...msb order.
         [state (merge-state inputs)]
         [inputs-bv (map signal-value inputs)]
         [inputs (apply concat (reverse inputs-bv))]
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
         [outputs (map (lambda (i)
                         (extract (sub1 (* bits-per-group (+ i 1))) (* bits-per-group i) outputs))
                       (range num-groups))]
         [outputs (map (lambda (bv) (signal bv state)) outputs)])
    outputs))

(module+ test
  (require rackunit
           rosette/solver/smt/boolector)

  (current-solver (boolector))

  (test-case
   "bitwise with mask"
   (begin
     (define x (bv->signal (?? (bitvector 3))))
     (define y (bv->signal (?? (bitvector 3))))
     (define pttn (map bv->signal (list (?? (bitvector 2)) (?? (bitvector 2)) (?? (bitvector 2)))))
     (match-define (list o0 o1 o2)
       (interpret-logical-to-physical-mapping identity (ltop-bitwise-with-mask pttn) (list x y)))
     (define soln0
       (synthesize #:forall (list x y)
                   #:guarantee (begin
                                 (assert (bveq (bit 0 (signal-value o0)) (bit 0 (signal-value x))))
                                 (assert (bveq (bit 1 (signal-value o0)) (bit 0 (signal-value y))))
                                 (assert (bveq (bit 0 (signal-value o1)) (bit 1 (signal-value x))))
                                 (assert (bveq (bit 1 (signal-value o1)) (bit 1 (signal-value y))))
                                 (assert (bveq (bit 0 (signal-value o2)) (bit 2 (signal-value x))))
                                 (assert (bveq (bit 1 (signal-value o2)) (bit 2 (signal-value y)))))))
     (check-equal? (list (bv #b00 2) (bv #b00 2) (bv #b00 2))
                   (map signal-value (evaluate pttn soln0)))
     (define soln1
       (synthesize #:forall (list x y)
                   #:guarantee (begin
                                 (assert (bveq (bit 0 (signal-value o0)) (bv 1 1)))
                                 (assert (bveq (bit 1 (signal-value o0)) (bit 0 (signal-value y))))
                                 (assert (bveq (bit 0 (signal-value o1)) (bit 1 (signal-value x))))
                                 (assert (bveq (bit 1 (signal-value o1)) (bit 1 (signal-value y))))
                                 (assert (bveq (bit 0 (signal-value o2)) (bv 1 1)))
                                 (assert (bveq (bit 1 (signal-value o2)) (bv 1 1))))))
     (check-equal? (list (bv #b01 2) (bv #b00 2) (bv #b11 2))
                   (map signal-value (evaluate pttn soln1))))))

(module+ test
  (require rackunit
           rosette/solver/smt/boolector)
  (current-solver (boolector))

  (test-true
   "test ltop-uf"
   (normal?
    (with-vc
     (with-terms
      (begin

        ;;; Test that we can synthesize a logical-to-physical mapping given constraints.
        (define a (bv->signal (?? (bitvector 8))))
        (define b (bv->signal (?? (bitvector 8))))
        (define c (bv->signal (?? (bitvector 8))))
        (define pttn (?? (~> (bitvector 5) (bitvector 5))))
        (match-define (list o0 o1 o2 o3 o4 o5)
          (interpret-logical-to-physical-mapping identity (ltop-uf pttn 5 4) (list a b c)))
        (define soln
          (synthesize #:forall (list a b c)
                      #:guarantee
                      (begin
                        ;;; Make up some random constraints...
                        (assert (bveq (bit 0 (signal-value a)) (bit 0 (signal-value o1))))
                        (assert (bveq (bit 1 (signal-value a)) (bit 2 (signal-value o0))))
                        (assert (bveq (extract 7 4 (signal-value c)) (signal-value o4)))
                        ;;; This one reverses the bits (via bitvector->bits --> concat).
                        (assert (bveq (apply concat (bitvector->bits (extract 3 1 (signal-value b))))
                                      (extract 2 0 (signal-value o3)))))))
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
        (ch 9 14)))))))

(module+ test
  (require rackunit)
  (check-equal? (interpret-logical-to-physical-mapping
                 identity
                 (ltop-bitwise)
                 (list (bv->signal (bv #b01 2)) (bv->signal (bv #b10 2))))
                (list (bv->signal (bv #b01 2)) (bv->signal (bv #b10 2))))
  (check-equal?
   (interpret-logical-to-physical-mapping identity (ltop-bitwise) (list (bv->signal (bv #b01 2))))
   (list (bv->signal (bv #b1 1)) (bv->signal (bv #b0 1))))
  (check-equal?
   (interpret-logical-to-physical-mapping identity (ltop-bitwise) (list (bv->signal (bv #b01 2))))
   (list (bv->signal (bv #b1 1)) (bv->signal (bv #b0 1))))

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
            (lambda (x) (interpret-logical-to-physical-mapping identity (ltop-shift shift-by) x))
            (ptol-bitwise)
            inputs)))

  ; Helper function for testing
  (define (interpret-constant-instruction bitwidth)
    (first (interpret-physical-to-logical-mapping
            ; interpret
            (lambda (x) (interpret-logical-to-physical-mapping identity `(constant bitwidth) x))
            (ptol-bitwise)
            '())))
  ;;;                 TEST CONSTANTS                    ;;;
  (check-equal? (signal-value (interpret-shift-instruction #:inputs (list (bv->signal (bv #b01 2)))
                                                           #:shift-by 0))
                (bv 1 2))

  ;;;                 TEST SHIFTS                    ;;;
  (check-equal? (signal-value (interpret-shift-instruction #:inputs (list (bv->signal (bv #b01 2)))
                                                           #:shift-by 0))
                (bv 1 2))
  (check-equal? (signal-value (interpret-shift-instruction #:inputs (list (bv->signal (bv #b01 2)))
                                                           #:shift-by 1))
                (bv 2 2))
  (check-equal? (signal-value (interpret-shift-instruction #:inputs (list (bv->signal (bv #b01 2)))
                                                           #:shift-by 2))
                (bv 0 2))
  (check-equal? (signal-value (interpret-shift-instruction #:inputs (list (bv->signal (bv #b01 2)))
                                                           #:shift-by 3))
                (bv 0 2))
  (check-equal? (signal-value (interpret-shift-instruction #:inputs (list (bv->signal (bv #b10 2)))
                                                           #:shift-by -1))
                (bv 1 2))
  (check-equal? (signal-value (interpret-shift-instruction #:inputs (list (bv->signal (bv #b10 2)))
                                                           #:shift-by -2))
                (bv 0 2))
  (check-equal? (signal-value (interpret-shift-instruction #:inputs (list (bv->signal (bv #b10 2)))
                                                           #:shift-by -3))
                (bv 0 2))

  ;; Test right shifts
  (check-equal? (signal-value (interpret-shift-instruction #:inputs (list (bv->signal (bv #xaa 8)))
                                                           #:shift-by 0))
                (bv #xaa 8))
  (check-equal? (signal-value (interpret-shift-instruction #:inputs (list (bv->signal (bv #xaa 8)))
                                                           #:shift-by -1))
                (bv #x55 8))
  (check-equal? (signal-value (interpret-shift-instruction #:inputs (list (bv->signal (bv #xaa 8)))
                                                           #:shift-by -2))
                (bv #x2a 8))
  (check-equal? (signal-value (interpret-shift-instruction #:inputs (list (bv->signal (bv #xaa 8)))
                                                           #:shift-by -3))
                (bv #x15 8))
  (check-equal? (signal-value (interpret-shift-instruction #:inputs (list (bv->signal (bv #xaa 8)))
                                                           #:shift-by -4))
                (bv #x0a 8))
  (check-equal? (signal-value (interpret-shift-instruction #:inputs (list (bv->signal (bv #xaa 8)))
                                                           #:shift-by -5))
                (bv #x05 8))
  (check-equal? (signal-value (interpret-shift-instruction #:inputs (list (bv->signal (bv #xaa 8)))
                                                           #:shift-by -6))
                (bv #x02 8))
  (check-equal? (signal-value (interpret-shift-instruction #:inputs (list (bv->signal (bv #xaa 8)))
                                                           #:shift-by -7))
                (bv #x01 8))
  (check-equal? (signal-value (interpret-shift-instruction #:inputs (list (bv->signal (bv #xaa 8)))
                                                           #:shift-by -8))
                (bv #x00 8))

  ;; Test left shifts
  (check-equal? (signal-value (interpret-shift-instruction #:inputs (list (bv->signal (bv #xaa 8)))
                                                           #:shift-by 1))
                (bv #x54 8))
  (check-equal? (signal-value (interpret-shift-instruction #:inputs (list (bv->signal (bv #xaa 8)))
                                                           #:shift-by 2))
                (bv #xa8 8))
  (check-equal? (signal-value (interpret-shift-instruction #:inputs (list (bv->signal (bv #xaa 8)))
                                                           #:shift-by 3))
                (bv #x50 8))
  (check-equal? (signal-value (interpret-shift-instruction #:inputs (list (bv->signal (bv #xaa 8)))
                                                           #:shift-by 4))
                (bv #xa0 8))
  (check-equal? (signal-value (interpret-shift-instruction #:inputs (list (bv->signal (bv #xaa 8)))
                                                           #:shift-by 5))
                (bv #x40 8))
  (check-equal? (signal-value (interpret-shift-instruction #:inputs (list (bv->signal (bv #xaa 8)))
                                                           #:shift-by 6))
                (bv #x80 8))
  (check-equal? (signal-value (interpret-shift-instruction #:inputs (list (bv->signal (bv #xaa 8)))
                                                           #:shift-by 7))
                (bv #x00 8))
  (check-equal? (signal-value (interpret-shift-instruction #:inputs (list (bv->signal (bv #xaa 8)))
                                                           #:shift-by 8))
                (bv #x00 8))

  (check-exn
   (regexp
    "@map: arity mismatch;\n the expected number of arguments does not match the given number\n  expected: at least 2\n  given: 1")
   (lambda ()
     (interpret-logical-to-physical-mapping identity (ltop-bitwise) (list))
     (list)))
  (check-exn
   (regexp
    "map: all lists must have same size\n  first list length: 1\n  other list length: 2\n  procedure: concat")
   (lambda ()
     (interpret-logical-to-physical-mapping
      identity
      (ltop-bitwise)
      (list (bv->signal (bv #b01 2)) (bv->signal (bv #b1 1)))))))

;;; Interprets physical-to-logical mappings.
;;; Expects a list of logical outputs in least significant->most significant order.
;;; For example, in a Xilinx UltraScale+ CLB, this list would be (LUTA out, LUTB out, ...).
(struct ptol-bitwise () #:transparent)
(struct ptol-bitwise-reverse () #:transparent)
(struct ptol-uf (uf bw bits-per-group) #:transparent)
(struct ptol-choose-one (idx) #:transparent)
(struct ptol-identity () #:transparent)
(define (interpret-physical-to-logical-mapping interpreter f logical-outputs)
  (destruct
   f
   ;;; Defines the bitwise physical-to-logical mapping for mapping physical outputs to logical
   ;;; outputs.
   ;;;
   ;;; For now, this is nearly the same as the logical-to-physical bitwise mapping.
   ;;;  [(ptol-bitwise) (transpose (interpreter logical-outputs))]
   [(ptol-bitwise)
    (let* ([outputs (interpreter logical-outputs)]
           [state (merge-state outputs)]
           [outputs-bv (map signal-value outputs)])
      (bvvs->signalvs (transpose outputs-bv) state))]
   ;;;
   ;;; Same as bitwise, but reverse.
   [(ptol-bitwise-reverse)
    (let* ([outputs (interpreter logical-outputs)]
           [state (merge-state outputs)]
           [outputs-bv (map signal-value outputs)])
      (bvvs->signalvs (transpose (reverse outputs-bv)) state))]
   ;;; Variant which uses a Rosette uninterpreted function.
   [(ptol-uf uf bw bits-per-group) (helper uf bw bits-per-group (interpreter logical-outputs))]
   ;;;
   ;;; Choose one of the bits to be the output.
   [(ptol-choose-one idx)
    (let* ([vs (interpreter logical-outputs)]
           [state (merge-state vs)]
           [bvvs (map signal-value vs)]
           [logical-outputs (apply concat bvvs)])
      (list (signal
             (bit 0
                  (bvlshr logical-outputs
                          (zero-extend idx (bitvector (length (bitvector->bits logical-outputs))))))
             state)))]))

(module+ test
  (require rackunit)
  (check-equal? (interpret-physical-to-logical-mapping
                 identity
                 (ptol-bitwise)
                 (list (bv->signal (bv #b1 1)) (bv->signal (bv #b0 1))))
                (list (bv->signal (bv #b01 2))))

  (check-equal? (interpret-physical-to-logical-mapping
                 identity
                 (ptol-bitwise-reverse)
                 (list (bv->signal (bv #b1 1)) (bv->signal (bv #b0 1))))
                (list (bv->signal (bv #b10 2))))

  ;;; Test that we can synthesize a logical-to-physical mapping given constraints.
  (test-begin (define logical-out-a (bv->signal (?? (bitvector 1))))
              (define logical-out-b (bv->signal (?? (bitvector 1))))
              (define logical-out-c (bv->signal (?? (bitvector 1))))
              (define logical-out-d (bv->signal (?? (bitvector 1))))
              (define logical-out-e (bv->signal (?? (bitvector 1))))
              (define logical-out-f (bv->signal (?? (bitvector 1))))
              (define logical-out-g (bv->signal (?? (bitvector 1))))
              (define logical-out-h (bv->signal (?? (bitvector 1))))
              (define pttn (?? (~> (bitvector 3) (bitvector 3))))
              (match-define (list physical-out)
                (interpret-physical-to-logical-mapping identity
                                                       (ptol-uf pttn 3 8)
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
                            #:guarantee (begin
                                          ;;; Make up some random constraints...
                                          (assert (bveq (signal-value logical-out-a)
                                                        (bit 0 (signal-value physical-out))))
                                          (assert (bveq (concat (signal-value logical-out-e)
                                                                (signal-value logical-out-d)
                                                                (signal-value logical-out-c)
                                                                (signal-value logical-out-b))
                                                        (extract 4 1 (signal-value physical-out))))
                                          (assert (bveq (concat (signal-value logical-out-f)
                                                                (signal-value logical-out-g)
                                                                (signal-value logical-out-h))
                                                        (extract 7 5 (signal-value physical-out)))))))
              (check-true (sat? soln)))
  (test-begin
   (check-equal?
    (list (bv 0 1))
    (map signal-value
         (interpret-physical-to-logical-mapping
          identity
          (ptol-choose-one (bv 0 3))
          (map bv->signal
               (list (bv 1 1) (bv 1 1) (bv 1 1) (bv 1 1) (bv 1 1) (bv 1 1) (bv 1 1) (bv 0 1))))))
   (check-equal?
    (list (bv 1 1))
    (map signal-value
         (interpret-physical-to-logical-mapping
          identity
          (ptol-choose-one (bv 7 3))
          (map bv->signal
               (list (bv 1 1) (bv 1 1) (bv 1 1) (bv 1 1) (bv 1 1) (bv 1 1) (bv 1 1) (bv 0 1))))))))
