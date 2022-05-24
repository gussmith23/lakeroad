#lang errortrace racket

(require rosette)

(provide interpret-lattice-ecp5-pfu
         lattice-ecp5-pfu
         lattice-ecp5-lut4
         lattice-ecp5-logical-to-physical-inputs
         ; compile-clb-to-verilog
         )

; Contains the state for a LUT4, a 4-input LUT.
;
; memory: (bitvector 16): The LUT's INIT memory value
(struct lattice-ecp5-lut4 (memory))

; The output of a LUT is simply the bit at the entry pointed to by `inputs`,
; when interpreted as an integer.
;
; LUTs must return only one bit.
;
; TODO: figure out how to return multiple bits while still using theory of
;       bitvectors only. The old solution used theory of integers to index into
;       the bitvector.
;
; TODO: It's probably worth putting this somewhere more generally usable.
(define (lut memory inputs)
  (let* ([inputs (zero-extend inputs (bitvector (length (bitvector->bits memory))))])
    (bit 0 (bvlshr memory inputs))))

(module+ test
  (require rackunit)
  (check-equal? (lut (bv #b0110 4) (bv 0 1)) (bv #b0 1))
  (check-equal? (lut (bv #b0110 4) (bv 1 1)) (bv #b1 1))
  (check-equal? (lut (bv #b0110 4) (bv 2 2)) (bv #b1 1))
  (check-equal? (lut (bv #b0110 4) (bv 3 2)) (bv #b0 1)))


; LUT4 described on page 450 (464) of
; https://www.latticesemi.com/-/media/LatticeSemi/Documents/UserManuals/EI/FPGALibrariesReferenceGuide35.ashx?document_id=51084
;
; Params:
; + lut4::lattice-ecp5-lut4: the LUT4 struct
;
; + inputs::(bitvector 4): a 4-bit bitvector with MSB on the left and LSB on the right
;
; Returns: the index of `inputs` into `memory` (see `lut` function defined above
; for details)
(define (interpret-lattice-ecp5-lut4 lut4 inputs)
  (let* ([memory (lattice-ecp5-lut4-memory lut4)])
    (lut memory (extract 3 0 inputs))))

(module+ test
  (require rackunit)
  (check-equal? (interpret-lattice-ecp5-lut4
                  (lattice-ecp5-lut4 (bv #xff81 16))
                  (bv 0 4))
                (bv 1 1))
  (check-equal? (interpret-lattice-ecp5-lut4
                  (lattice-ecp5-lut4 (bv #xff81 16))
                  (bv 1 4))
                (bv 0 1))
  (check-equal? (interpret-lattice-ecp5-lut4
                  (lattice-ecp5-lut4 (bv #xff81 16))
                  (bv 7 4))
                (bv 1 1))
  (check-equal? (interpret-lattice-ecp5-lut4
                  (lattice-ecp5-lut4 (bv #xff81 16))
                  (bv 8 4))
                (bv 1 1)))

; Defines the programmable state of a Programmable Functional Unit.
; These consist of four slices 0-3, and each slice has 2 LUT4s and a 2
; flip-flops.
;
; For now I'm not including the slice structure and I'm only inclusing a list of
; the luts (and ommitting flip-flops).
(struct lattice-ecp5-pfu
    (lut-a lut-b
           lut-c
           lut-d
           lut-e
           lut-f
           lut-g
           lut-h))

; Interpret a PFU
; Inputs:
; + pfu::lattice-ecp5-pfu
; + cin::??: TODO this isn't used yet so I've commented it out
; + lut-input-X::(bitvector 4): the input to `pfu`'s lut-X
;
; Returns:
; + (bitvector 8): the outputs of each LUT
(define (interpret-lattice-ecp5-pfu pfu
                                    ; cin
                                    lut-input-a
                                    lut-input-b
                                    lut-input-c
                                    lut-input-d
                                    lut-input-e
                                    lut-input-f
                                    lut-input-g
                                    lut-input-h)
  (match-let* 
   ([a (interpret-lattice-ecp5-lut4 (lattice-ecp5-pfu-lut-a pfu) lut-input-a)]
    [b (interpret-lattice-ecp5-lut4 (lattice-ecp5-pfu-lut-a pfu) lut-input-b)]
    [c (interpret-lattice-ecp5-lut4 (lattice-ecp5-pfu-lut-a pfu) lut-input-c)]
    [d (interpret-lattice-ecp5-lut4 (lattice-ecp5-pfu-lut-a pfu) lut-input-d)]
    [e (interpret-lattice-ecp5-lut4 (lattice-ecp5-pfu-lut-a pfu) lut-input-e)]
    [f (interpret-lattice-ecp5-lut4 (lattice-ecp5-pfu-lut-a pfu) lut-input-f)]
    [g (interpret-lattice-ecp5-lut4 (lattice-ecp5-pfu-lut-a pfu) lut-input-g)]
    [h (interpret-lattice-ecp5-lut4 (lattice-ecp5-pfu-lut-a pfu) lut-input-h)])
   ; TODO: double check order RE: MSB vs LSB
   (concat h g f e d c b a)))
   
; (define (lattice-ecp5-pfu-helper physical-inputs)
;   ; Programmable State of the CLB
;   ; (define-symbolic* cin (bitvector 1))
;   (define-symbolic* lut-memory-a (bitvector 16))
;   (define-symbolic* lut-memory-b (bitvector 16))
;   (define-symbolic* lut-memory-c (bitvector 16))
;   (define-symbolic* lut-memory-d (bitvector 16))
;   (define-symbolic* lut-memory-e (bitvector 16))
;   (define-symbolic* lut-memory-f (bitvector 16))
;   (define-symbolic* lut-memory-g (bitvector 16))
;   (define-symbolic* lut-memory-h (bitvector 16))
;   (values ; cin
;           lut-memory-a
;           lut-memory-b
;           lut-memory-c
;           lut-memory-d
;           lut-memory-e
;           lut-memory-f
;           lut-memory-g
;           lut-memory-h
;           (apply interpret-lattice-ecp5-pfu )))



; Implements the basic arity-4 routing template for bv8 inputs.
;
; + We choose arity-4 because we are working with LUT4s
; + We default to bv8s because there are 8 LUT4s
; + Thus there are 4*8 = 32 input wires.
;
; Logical Inputs:
;
;   Each 'logical input' represents an input of a high-level operation that we
;   are trying to translate to a low-level LUT operation. For instance, if we
;   are trying to synthesize arity-2 addition for bv8s, the logical inputs
;   would be two bv8s.
;
; Physical Inputs:
;
;   Each 'physical input' represents an input pin on a LUT4.
; 
;
; Diagramatically, this routing template looks like:
;
;       in3-0 --> 0 +-------+     # LSB of input 3 goes to pin 0 of LUT A
;       in2-0 --> 1 | LUT A |
;       in1-0 --> 2 |       |
;       in0-0 --> 3 +-------+
;
;       in3-1 --> 0 +-------+
;       in2-1 --> 1 | LUT B |
;       in1-1 --> 2 |       |
;       in0-1 --> 3 +-------+
;
;       in3-2 --> 0 +-------+
;       in2-2 --> 1 | LUT C |
;       in1-2 --> 2 |       |
;       in0-2 --> 3 +-------+
;
;       in3-3 --> 0 +-------+
;       in2-3 --> 1 | LUT D |
;       in1-3 --> 2 |       |
;       in0-3 --> 3 +-------+
;
;       in3-4 --> 0 +-------+
;       in2-4 --> 1 | LUT E |
;       in1-4 --> 2 |       |
;       in0-4 --> 3 +-------+
;
;       in3-5 --> 0 +-------+
;       in2-5 --> 1 | LUT F |
;       in1-5 --> 2 |       |
;       in0-5 --> 3 +-------+
;
;       in3-6 --> 0 +-------+
;       in2-6 --> 1 | LUT G |
;       in1-6 --> 2 |       |
;       in0-6 --> 3 +-------+
;
;       in3-7 --> 0 +-------+
;       in2-7 --> 1 | LUT H |
;       in1-7 --> 2 |       |
;       in0-7 --> 3 +-------+
(define (lattice-ecp5-logical-to-physical-inputs logical-input-0
                                                 logical-input-1
                                                 logical-input-2
                                                 logical-input-3)
  (let ([helper (lambda (idx)
                  (concat (extract idx idx logical-input-3)
                          (extract idx idx logical-input-2)
                          (extract idx idx logical-input-1)
                          (extract idx idx logical-input-0)))])
    (list (helper 0) (helper 1) (helper 2) (helper 3) (helper 4) (helper 5) (helper 6) (helper 7))))

(module+ test
  (require rackunit)
  (let* ([li0 (bv #b00000000 8)]
         [li1 (bv #b11110000 8)]
         [li2 (bv #b11001100 8)]
         [li3 (bv #b10101010 8)]
         [out (lattice-ecp5-logical-to-physical-inputs li0 li1 li2 li3)])
         
    (check-equal? (list-ref out 7) (bv #b1110 4))
    (check-equal? (list-ref out 6) (bv #b0110 4))
    (check-equal? (list-ref out 5) (bv #b1010 4))
    (check-equal? (list-ref out 4) (bv #b0010 4))
    (check-equal? (list-ref out 3) (bv #b1100 4))
    (check-equal? (list-ref out 2) (bv #b0100 4))
    (check-equal? (list-ref out 1) (bv #b1000 4))
    (check-equal? (list-ref out 0) (bv #b0000 4))
    ))