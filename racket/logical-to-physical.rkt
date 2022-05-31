#lang errortrace racket

;;; Logical to physical (and vice versa) mapping tools for Lakeroad.
;;;
;;; A key component of Lakeroad is determining how *logical* signals (e.g. an 8 bit input) get wired
;;; to *physical* inputs, e.g. the 48 input bits of a Xilinx UltraScale+ Configurable Logic Block.
;;; This module provides tools for representing these mappings.

(provide interpret-logical-to-physical-mapping
         interpret-physical-to-logical-mapping)

(require rosette
         rosette/lib/synthax)

(define (transpose inputs)
  (apply map concat (map bitvector->bits (reverse inputs))))

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
(define (interpret-logical-to-physical-mapping interpreter expr)
  (match expr
    ;;; Variant which uses a Rosette uninterpreted function.
    [`(logical-to-physical-mapping uf ,uf ,bw ,bits-per-group ,inputs)
     (helper uf bw bits-per-group inputs)]
    ;;;
    ;;; Uses an uninterpreted function plus a mask.
    [`(logical-to-physical-mapping uf-with-mask ,uf ,bw ,bits-per-group ,masks ,inputs)
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
    [`(logical-to-physical-mapping bitwise ,inputs) (transpose (interpreter inputs))]
    ;;;
    ;;; Same as bitwise, but includes masks on the physical outputs.
    ;;;
    ;;; `masks` is a list of masks, one for each of the physical output bitvectors. Each mask is a
    ;;; bitvector of the same length as its corresponding physical output. The mask is ORed with the
    ;;; physical outputs before being returned.
    [`(logical-to-physical-mapping bitwise-with-mask ,masks ,inputs)
     (map bvor (transpose (interpreter inputs)) masks)]
    ;;;
    ;;; Like bitwise mapping, but a bit more flexible. Logical input n always maps to bit n of each
    ;;; LUT, but any bit of logical input n can go to bit n of any LUT. (In bitwise, we require that
    ;;; bit 0 of logical input 0 goes to LUT0, bit 1 of logical input 0 goes to LUT1, etc.)
    ;;;
    ;;; Specifically implemented to enable mux, without breaking anything else.
    ;;;
    ;;; This is a generic template that can be copied: constrain a UF via asserts and then pass the UF
    ;;; to `helper`. We could probably make a helper function for this.
    [`(logical-to-physical-mapping uf-constrained
                                   ;;; (~> (bitvector uf-bw) (bitvector uf-bw))
                                   ,uf
                                   ,uf-bw
                                   ,num-logical-inputs
                                   ,logical-input-width
                                   ,num-physical-inputs
                                   ,physical-input-width
                                   ,masks
                                   ,inputs)
     (begin
       ;;; Constrain the underlying uninterpreted function.
       (for* ([physical-i (range num-physical-inputs)] [physical-bit-i (range physical-input-width)])
         (define uf-output (uf (bv (+ (* physical-i physical-input-width) physical-bit-i) uf-bw)))
         ;;; Logical indexes of all the bits of the logical input corresponding to (physical-i (i.e.
         ;;; LUT idx), physical-bit-idx).
         (define valid-logical-idxs
           (for/list ([logical-bit-i (range logical-input-width)])
             (bv (+ (* logical-input-width physical-bit-i) logical-bit-i) uf-bw)))
         ;;; This physical input must take one of the above logical inputs.
         (assert (for/fold ([cond #f]) ([valid-logical-idx valid-logical-idxs])
                   (|| cond (bveq uf-output valid-logical-idx)))))

       ; Map according to the uninterpreted function and apply mask.
       (map bvor (helper uf uf-bw physical-input-width inputs) masks))]
    [other (interpreter other)]))

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
   (define expr
     `(logical-to-physical-mapping bitwise-with-mask
                                   ,(list (?? (bitvector 2)) (?? (bitvector 2)) (?? (bitvector 2)))
                                   ,(list x y)))
   (match-define (list o0 o1 o2) (interpret-logical-to-physical-mapping identity expr))
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
   (check-equal? (list 'logical-to-physical-mapping
                       'bitwise-with-mask
                       (list (bv #b00 2) (bv #b00 2) (bv #b00 2))
                       (list x y))
                 (evaluate expr soln0))
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
   (check-equal? (list 'logical-to-physical-mapping
                       'bitwise-with-mask
                       (list (bv #b01 2) (bv #b00 2) (bv #b11 2))
                       (list x y))
                 (evaluate expr soln1))))

(module+ test
  (require rackunit
           rosette/solver/smt/boolector)
  (current-solver (boolector))

  ;;; Test that we can synthesize a logical-to-physical mapping given constraints.
  (define-symbolic a (bitvector 8))
  (define-symbolic b (bitvector 8))
  (define-symbolic c (bitvector 8))
  (define expr
    `(logical-to-physical-mapping uf ,(?? (~> (bitvector 5) (bitvector 5))) 5 4 ,(list a b c)))
  (match-define (list o0 o1 o2 o3 o4 o5) (interpret-logical-to-physical-mapping identity expr))
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
  (define f
    (match (evaluate expr soln)
      [`(logical-to-physical-mapping uf ,f ,bw ,bits-per-group ,inputs) f]))

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
  (check-equal? (interpret-logical-to-physical-mapping
                 identity
                 `(logical-to-physical-mapping bitwise ,(list (bv #b01 2) (bv #b10 2))))
                (list (bv #b01 2) (bv #b10 2)))
  (check-equal? (interpret-logical-to-physical-mapping
                 identity
                 `(logical-to-physical-mapping bitwise ,(list (bv #b01 2))))
                (list (bv #b1 1) (bv #b0 1)))
  (check-equal? (interpret-logical-to-physical-mapping
                 identity
                 `(logical-to-physical-mapping bitwise ,(list (bv #b01 2))))
                (list (bv #b1 1) (bv #b0 1)))
  (check-exn
   (regexp
    "@map: arity mismatch;\n the expected number of arguments does not match the given number\n  expected: at least 2\n  given: 1")
   (lambda ()
     (interpret-logical-to-physical-mapping identity `(logical-to-physical-mapping bitwise ,(list)))
     (list)))
  (check-exn
   (regexp
    "map: all lists must have same size\n  first list length: 1\n  other list length: 2\n  procedure: concat")
   (lambda ()
     (interpret-logical-to-physical-mapping
      identity
      `(logical-to-physical-mapping bitwise ,(list (bv #b01 2) (bv #b1 1)))))))

;;; Interprets physical-to-logical mappings.
;;; Expects a list of logical outputs in least significant->most significant order.
;;; For example, in a Xilinx UltraScale+ CLB, this list would be (LUTA out, LUTB out, ...).
(define (interpret-physical-to-logical-mapping interpreter expr)
  (match expr
    ;;; Defines the bitwise physical-to-logical mapping for mapping physical outputs to logical
    ;;; outputs.
    ;;;
    ;;; For now, this is nearly the same as the logical-to-physical bitwise mapping.
    [`(physical-to-logical-mapping (bitwise) ,logical-outputs)
     (transpose (interpreter logical-outputs))]
    ;;; Variant which uses a Rosette uninterpreted function.
    [`(physical-to-logical-mapping (uf ,uf ,bw ,bits-per-group) ,logical-outputs)
     (helper uf bw bits-per-group (interpreter logical-outputs))]))

(module+ test
  (require rackunit)
  (check-equal? (interpret-physical-to-logical-mapping
                 identity
                 `(physical-to-logical-mapping (bitwise) ,(list (bv #b1 1) (bv #b0 1))))
                (list (bv #b01 2)))

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
   (define expr
     `(physical-to-logical-mapping (uf ,(?? (~> (bitvector 3) (bitvector 3))) 3 8)
                                   ,(list logical-out-a
                                          logical-out-b
                                          logical-out-c
                                          logical-out-d
                                          logical-out-e
                                          logical-out-f
                                          logical-out-g
                                          logical-out-h)))
   (match-define (list physical-out) (interpret-physical-to-logical-mapping identity expr))
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
   (check-true (sat? soln))))
