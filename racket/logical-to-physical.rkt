;;; Logical to physical (and vice versa) mapping tools for Lakeroad.
;;;
;;; A key component of Lakeroad is determining how *logical* signals (e.g. an 8 bit input) get wired
;;; to *physical* inputs, e.g. the 48 input bits of a Xilinx UltraScale+ Configurable Logic Block.
;;; This module provides tools for representing these mappings.
#lang racket

(require rosette)

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
(define (bitwise-input-mapping inputs)
  (transpose inputs))

(module+ test
  (require rackunit)
  (check-equal? (bitwise-input-mapping (list (bv #b01 2) (bv #b10 2))) (list (bv #b10 2) (bv #b01 2)))
  (check-equal? (bitwise-input-mapping (list (bv #b01 2))) (list (bv #b1 1) (bv #b0 1)))
  (check-equal? (bitwise-input-mapping (list (bv #b01 2))) (list (bv #b1 1) (bv #b0 1)))
  (check-exn exn:fail?
             (lambda ()
               (bitwise-input-mapping (list))
               (list)))
  (check-exn exn:fail? (lambda () (bitwise-input-mapping (list (bv #b01 2) (bv #b1 1))))))

;;; Defines the bitwise physical-to-logical mapping for mapping physical outputs to logical outputs.
;;;
;;; For now, this is nearly the same as the logical-to-physical bitwise mapping.
(define (bitwise-output-mapping outputs)
  (transpose (reverse outputs)))

(module+ test
  (require rackunit)
  (check-equal? (bitwise-output-mapping (list (bv #b1 1) (bv #b0 1))) (list (bv #b01 2))))
