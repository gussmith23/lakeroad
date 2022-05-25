;;; Logical to physical (and vice versa) mapping tools for Lakeroad.
;;;
;;; A key component of Lakeroad is determining how *logical* signals (e.g. an 8 bit input) get wired
;;; to *physical* inputs, e.g. the 48 input bits of a Xilinx UltraScale+ Configurable Logic Block.
;;; This module provides tools for representing these mappings.
#lang errortrace racket

(require rosette)

(provide interpret-logical-to-physical-inputs
         bitwise-input-mapping)

;;; Interprets logical-to-physical-input mapping.
;;;
;;; There are two variants. The first variant uses a Rosette uninterpreted function to represent
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
;;; Returns: list of physical input bitvectors: (physical input 0, physical input 1, ...).
(define (interpret-logical-to-physical-inputs expr)
  (match expr
    [`(logical-to-physical-inputs ,uf ,bw ,bits-per-group ,inputs)
     (helper uf bw bits-per-group inputs)]
    [`(logical-to-physical-inputs ,f ,inputs) (f inputs)]))

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

  ;;; Test that we can synthesize a logical-to-physical mapping given constraints.
  (define-symbolic l-to-p-f (~> (bitvector 5) (bitvector 5)))
  (define-symbolic a (bitvector 8))
  (define-symbolic b (bitvector 8))
  (define-symbolic c (bitvector 8))
  (define expr `(logical-to-physical-inputs ,l-to-p-f 5 4 ,(list a b c)))
  (match-define (list o0 o1 o2 o3 o4 o5) (interpret-logical-to-physical-inputs expr))
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
      [`(logical-to-physical-inputs ,f ,bw ,bits-per-group ,inputs) f]))

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

(define (transpose inputs)
  (apply map concat (map bitvector->bits inputs)))

;;; Defines the "bitwise" logical to physical mapping.
;;;
;;; The "bitwise" logical to physical mapping groups the 0th bits of each logical input, the 1st bit,
;;; the 2nd bit, etc., together into groups, with groups ordered from least significant up to most
;;; significant. E.g., if we had two 8-bit inputs, the bitwise mapping would return a list of pairs
;;; containing the pair of their 0th bits, the pair of their 1st bits, etc. up to the pair of their
;;; 7th bit.
;;;
;;; Args:
;;;   inputs: the list of logical inputs. Expects a list of Rosette bitvectors of the same length.
;;;
;;; Returns: A list of  Rosette bitvectors with bits mapped according to the bitwise pattern described
;;;   above.
(define bitwise-input-mapping (lambda (inputs) (transpose inputs)))

(module+ test
  (require rackunit)
  (check-equal? (interpret-logical-to-physical-inputs
                 `(logical-to-physical-inputs ,bitwise-input-mapping ,(list (bv #b01 2) (bv #b10 2))))
                (list (bv #b10 2) (bv #b01 2)))
  (check-equal? (interpret-logical-to-physical-inputs
                 `(logical-to-physical-inputs ,bitwise-input-mapping ,(list (bv #b01 2))))
                (list (bv #b1 1) (bv #b0 1)))
  (check-equal? (interpret-logical-to-physical-inputs
                 `(logical-to-physical-inputs ,bitwise-input-mapping ,(list (bv #b01 2))))
                (list (bv #b1 1) (bv #b0 1)))
  (check-exn
   (regexp
    "@map: arity mismatch;\n the expected number of arguments does not match the given number\n  expected: at least 2\n  given: 1")
   (lambda ()
     (interpret-logical-to-physical-inputs
      `(logical-to-physical-inputs ,bitwise-input-mapping ,(list)))
     (list)))
  (check-exn
   (regexp
    "map: all lists must have same size\n  first list length: 2\n  other list length: 1\n  procedure: concat")
   (lambda ()
     (interpret-logical-to-physical-inputs
      `(logical-to-physical-inputs ,bitwise-input-mapping ,(list (bv #b01 2) (bv #b1 1)))))))

;;; Defines the bitwise physical-to-logical mapping for mapping physical outputs to logical outputs.
;;;
;;; For now, this is nearly the same as the logical-to-physical bitwise mapping.
(define (bitwise-output-mapping outputs)
  (transpose (reverse outputs)))

(module+ test
  (require rackunit)
  (check-equal? (bitwise-output-mapping (list (bv #b1 1) (bv #b0 1))) (list (bv #b01 2))))
