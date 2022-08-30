#lang errortrace racket
;;; In this file, we demonstrate how to synthesize comparisons (==, !=, >=, >, <=, <) on Lattice
;;; FPGAs. Comparisons are tricky for three reasons:
;;;
;;; 1. Like add and subtract, they require information to flow between bits. That is, they're not
;;;    purely "bitwise" operations, like and/or/xor/not. For example, to know if two multi-bit numbers
;;;    are equal, we have to know if every one of the comparisons between the bits of the inputs is
;;;    equal. We can utilize an FPGA's specialized carry logic for exactly this purpose!
;;;
;;; 2. Some comparisons (>=, >, <=, <) require information to flow from MSB->LSB, which requires us to
;;;    reverse the order in which we input bits into LUTs. That is, to implement a > b, we need to
;;;    input the MSB of a and MSB of b into LUT0, so that its result can flow up the carry chain to be
;;;    merged with the result of LUT1, and so on. This requires a different logical-to-physical
;;;    mapping (bitwise-reverse) from the one that we most commonly use in Lakeroad (bitwise).
;;;
;;; 3. Some comparisons (>=, >, <=, <) are complicated enough to require a few sets of LUTs. That is,
;;;    we need to implement some function f on the bits of a and b and merge those results with the
;;;    results of some function g on the bits of a and b.

(module+ test
  (require rosette
           rosette/solver/smt/boolector
           rosette/lib/synthax
           rosette/lib/angelic
           rackunit
           "interpreter.rkt"
           "logical-to-physical.rkt"
           "lattice-ecp5.rkt"
           (prefix-in lr: "language.rkt"))

  ;;; Boolector is a fast solver for the theory of bitvectors. We have intentionally kept all of
  ;;; Lakeroad in the theory of bitvectors to be able to use fast solvers like boolector.
  (current-solver (boolector))

  ;;; We'll use 3-bit bitvectors; 1-bit bitvectors are trivial, and don't require information
  ;;; to propagate between bits, which is the complicated part of comparisons.
  (define-symbolic a b (bitvector 3))

  (test-case
   "Synthesize == and != implementation with a single ripple PFU"
   (begin
     (define lakeroad-expr
       (let* (;;; Lattice PFUs are groups of 8 4-input LUTs, side by side. To feed inputs into a PFU,
              ;;; we generally use what we call a "bitwise" pattern, which means for an 8-bit input
              ;;; i0, bit 0 of i0 will feed into input 0 of LUT0, bit 1 of i0 will feed into input 0
              ;;; of LUT1, etc. For the second input i1, bit 0 of i1 will feed into input 1 of LUT0,
              ;;; bit 1 of i1 will feed into input 1 of LUT1, etc. Each of the 8 LUTs have 4 inputs,
              ;;; which means that a PFU can handle a total of 4 8-bit inputs, when they are input
              ;;; using this "bitwise" pattern. Currently, our code for a Lattice PFU *expects* a list
              ;;; of 4 8-bit inputs---that is, it won't do padding for you. To make sure that's the
              ;;; case, we add two types of padding: (1) we zero-extend or 2-bit inputs to 8 bits, and
              ;;; (2) we add two more 8-bit inputs. Thus, padded-inputs is a list of 4 8-bit inputs.
              ;;;
              ;;; Note that the two extra 8-bit inputs we add have the value #xff. It is important for
              ;;; the functioning of the Lattice ripple PFU (a special type of PFU that we're using)
              ;;; that these inputs not be all zeros, so we use #xff instead. You can try this for
              ;;; yourself---switch it to #x00 and see if the tests still pass!
              [padded-inputs (list (zero-extend a (bitvector 8))
                                   (zero-extend b (bitvector 8))
                                   (bv #xff 8)
                                   (bv #xff 8))]

              ;;; To start generating our Lakeroad expression, we first convert our list of logical
              ;;; inputs (our 2bit a and b, padded to 8 bits, with two additional 8-bit zero values to
              ;;; bring it up to 4 logical inputs) into the physical inputs that will feed into the
              ;;; LUTs. In this case, we are using the "bitwise-reverse" pattern, which is much like
              ;;; the "bitwise" pattern described above, except bit 0 of i0/i1/i2/i3 will feed into
              ;;; LUT7, rather than LUT0, bit 1 will feed into LUT6, etc. The reason why we use
              ;;; bitwise-reverse is specific to implementing some comparisons (>, <, >=, <=); other
              ;;; comparisons (==, !=) can use bitwise OR bitwise-reverse.
              [physical-inputs (logical-to-physical-mapping '(bitwise-reverse) padded-inputs)]
              ;;; A symbolic value representing a LUT memory. All 8 LUTs will perform the same function,
              ;;; so we can just use a single LUT memory. This significantly speeds up search.
              [ripple-pfu-lutmem (?? (bitvector 16))]
              ;;; A symbolic value representing the carry-in to the ripple PFU.
              [ripple-pfu-cin (?? (bitvector 1))]
              ;;; The Lakeroad expression representing the output of a Lattice ripple PFU. We feed our
              ;;; physical inputs in, and also give it our LUT memories, and we get a list of outputs
              ;;; out.
              ;;;
              ;;; A ripple PFU is a special type of PFU in Lattice.
              ;;;
              ;;; In the case of a ripple PFU, we also give it additional arguments---the so-called
              ;;; "INJECT" value (which we can always set to 0) and a cin. These values control the
              ;;; special carry chain functionality that is specific to the ripple PFU, and is not
              ;;; present in the standard PFU. A carry chain is a 1-bit signal which is affected by
              ;;; the output of each LUT in sequence. The carry chain is initialized with the carry in
              ;;; (cin) value, and then each LUT has the opportunity to change the value of the carry
              ;;; chain, based on the function programmed into the LUT. Carry chains are most commonly
              ;;; used for implementing adders, but Lakeroad is able to find many clever ways to use
              ;;; them!
              [ripple-pfu-output (lattice-ecp5-ripple-pfu ripple-pfu-lutmem
                                                          ripple-pfu-lutmem
                                                          ripple-pfu-lutmem
                                                          ripple-pfu-lutmem
                                                          ripple-pfu-lutmem
                                                          ripple-pfu-lutmem
                                                          ripple-pfu-lutmem
                                                          ripple-pfu-lutmem
                                                          (bv 0 1)
                                                          (bv 0 1)
                                                          (bv 0 1)
                                                          (bv 0 1)
                                                          (bv 0 1)
                                                          (bv 0 1)
                                                          (bv 0 1)
                                                          (bv 0 1)
                                                          ripple-pfu-cin
                                                          physical-inputs)]

              ;;; For comparisons, we actually care most about the 1-bit carry out output! This output
              ;;; will indicate the result of our comparison. Ripple PFUs in Lakeroad return 9 values:
              ;;; the 8 LUT outputs (xor'ed with the carry value at that location, which allows
              ;;; ripple PFUs to implement adders) plus the carry out value.
              [cout (lr:list-ref ripple-pfu-output 8)])
         cout))

     ;;; Synthesize an implementation of the template which implements ==.
     (define eq-soln
       (synthesize #:forall (list a b)
                   #:guarantee (assert (bveq (bool->bitvector (bveq a b))
                                             (interpret lakeroad-expr)))))
     (check-true (sat? eq-soln))

     ;;; Synthesize an implementation of the template which implements !=.
     (define neq-soln
       (synthesize #:forall (list a b)
                   #:guarantee (assert (bveq (bool->bitvector (not (bveq a b)))
                                             (interpret lakeroad-expr)))))
     (check-true (sat? neq-soln))))

  (test-case
   "Synthesize <=, <, >=, > implementations with three ripple PFUs"
   (begin
     (define lakeroad-expr
       (let* ([padded-inputs (list (zero-extend a (bitvector 8))
                                   (zero-extend b (bitvector 8))
                                   (bv #xff 8)
                                   (bv #xff 8))]
              [physical-inputs (logical-to-physical-mapping '(bitwise-reverse) padded-inputs)]

              ;;; To implement the more complicated comparisons, we need more than one ripple PFU. We
              ;;; may be able to implement this with two ripple PFUs, but I just use three, as I think
              ;;; it makes the pattern clearer. Ripple PFUs 0 and 1 implement some arbitrary function
              ;;; over a and b:
              [ripple-pfu-0-lutmem (?? (bitvector 16))]
              [ripple-pfu-0-output (lattice-ecp5-ripple-pfu ripple-pfu-0-lutmem
                                                            ripple-pfu-0-lutmem
                                                            ripple-pfu-0-lutmem
                                                            ripple-pfu-0-lutmem
                                                            ripple-pfu-0-lutmem
                                                            ripple-pfu-0-lutmem
                                                            ripple-pfu-0-lutmem
                                                            ripple-pfu-0-lutmem
                                                            (bv 0 1)
                                                            (bv 0 1)
                                                            (bv 0 1)
                                                            (bv 0 1)
                                                            (bv 0 1)
                                                            (bv 0 1)
                                                            (bv 0 1)
                                                            (bv 0 1)
                                                            (?? (bitvector 1))
                                                            physical-inputs)]
              [ripple-pfu-1-lutmem (?? (bitvector 16))]
              [ripple-pfu-1-output (lattice-ecp5-ripple-pfu ripple-pfu-1-lutmem
                                                            ripple-pfu-1-lutmem
                                                            ripple-pfu-1-lutmem
                                                            ripple-pfu-1-lutmem
                                                            ripple-pfu-1-lutmem
                                                            ripple-pfu-1-lutmem
                                                            ripple-pfu-1-lutmem
                                                            ripple-pfu-1-lutmem
                                                            (bv 0 1)
                                                            (bv 0 1)
                                                            (bv 0 1)
                                                            (bv 0 1)
                                                            (bv 0 1)
                                                            (bv 0 1)
                                                            (bv 0 1)
                                                            (bv 0 1)
                                                            (?? (bitvector 1))
                                                            physical-inputs)]

              ;;; Then, we use the outputs of ripple PFUs 0 and 1, and feed them in to another ripple
              ;;; PFU. Note that we're using the 8 LUT outputs of ripple PFUs 0 and 1, and ignoring
              ;;; their carry out values, while we are using the carry out value of ripple PFU 2 as
              ;;; our output (and ignoring its LUT values).
              [ripple-pfu-2-lutmem (?? (bitvector 16))]
              [ripple-pfu-2-output
               (lattice-ecp5-ripple-pfu
                ripple-pfu-2-lutmem
                ripple-pfu-2-lutmem
                ripple-pfu-2-lutmem
                ripple-pfu-2-lutmem
                ripple-pfu-2-lutmem
                ripple-pfu-2-lutmem
                ripple-pfu-2-lutmem
                ripple-pfu-2-lutmem
                (bv 0 1)
                (bv 0 1)
                (bv 0 1)
                (bv 0 1)
                (bv 0 1)
                (bv 0 1)
                (bv 0 1)
                (bv 0 1)
                (?? (bitvector 1))
                ;;; Once again, note the use of all ones (and not zeros) when
                ;;; padding the inputs to the ripple PFUs.
                (list (lr:concat (list (bv #b11 2)
                                       (lr:concat (list (lr:list-ref ripple-pfu-0-output 0)
                                                        (lr:list-ref ripple-pfu-1-output 0)))))
                      (lr:concat (list (bv #b11 2)
                                       (lr:concat (list (lr:list-ref ripple-pfu-0-output 1)
                                                        (lr:list-ref ripple-pfu-1-output 1)))))
                      (lr:concat (list (bv #b11 2)
                                       (lr:concat (list (lr:list-ref ripple-pfu-0-output 2)
                                                        (lr:list-ref ripple-pfu-1-output 2)))))
                      (lr:concat (list (bv #b11 2)
                                       (lr:concat (list (lr:list-ref ripple-pfu-0-output 3)
                                                        (lr:list-ref ripple-pfu-1-output 3)))))
                      (lr:concat (list (bv #b11 2)
                                       (lr:concat (list (lr:list-ref ripple-pfu-0-output 4)
                                                        (lr:list-ref ripple-pfu-1-output 4)))))
                      (lr:concat (list (bv #b11 2)
                                       (lr:concat (list (lr:list-ref ripple-pfu-0-output 5)
                                                        (lr:list-ref ripple-pfu-1-output 5)))))
                      (lr:concat (list (bv #b11 2)
                                       (lr:concat (list (lr:list-ref ripple-pfu-0-output 6)
                                                        (lr:list-ref ripple-pfu-1-output 6)))))
                      (lr:concat (list (bv #b11 2)
                                       (lr:concat (list (lr:list-ref ripple-pfu-0-output 7)
                                                        (lr:list-ref ripple-pfu-1-output 7)))))))]

              ;;; Our output is the carry out of ripple PFU 2.
              [cout (lr:list-ref ripple-pfu-2-output 8)])
         cout))

     ;;; Use the template to synthesize solutions.

     (define uge-soln
       (synthesize #:forall (list a b)
                   #:guarantee (assert (bveq (bool->bitvector (bvuge a b))
                                             (interpret lakeroad-expr)))))
     (check-true (sat? uge-soln))

     (define ugt-soln
       (synthesize #:forall (list a b)
                   #:guarantee (assert (bveq (bool->bitvector (bvugt a b))
                                             (interpret lakeroad-expr)))))
     (check-true (sat? ugt-soln))

     (define ule-soln
       (synthesize #:forall (list a b)
                   #:guarantee (assert (bveq (bool->bitvector (bvule a b))
                                             (interpret lakeroad-expr)))))
     (check-true (sat? ule-soln))

     (define ult-soln
       (synthesize #:forall (list a b)
                   #:guarantee (assert (bveq (bool->bitvector (bvult a b))
                                             (interpret lakeroad-expr)))))
     (check-true (sat? ult-soln)))))
