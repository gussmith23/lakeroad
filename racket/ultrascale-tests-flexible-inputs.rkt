; In these tests, we allow the logical inputs to be mapped to the physical inputs in different ways,
; rather than assuming a single way in which they're connected.
#lang racket

(require "ultrascale.rkt"
         rosette
         "programs-to-synthesize.rkt"
         "circt-comb-operators.rkt"
         rosette/solver/smt/boolector
         rosette/lib/angelic)

(current-solver (boolector))

(define-symbolic cin (bitvector 1))
(define-symbolic lut-memory-a (bitvector 64))
(define-symbolic lut-memory-b (bitvector 64))
(define-symbolic lut-memory-c (bitvector 64))
(define-symbolic lut-memory-d (bitvector 64))
(define-symbolic lut-memory-e (bitvector 64))
(define-symbolic lut-memory-f (bitvector 64))
(define-symbolic lut-memory-g (bitvector 64))
(define-symbolic lut-memory-h (bitvector 64))

(define-symbolic mux-selector-a (bitvector 2))
(define-symbolic mux-selector-b (bitvector 2))
(define-symbolic mux-selector-c (bitvector 2))
(define-symbolic mux-selector-d (bitvector 2))
(define-symbolic mux-selector-e (bitvector 2))
(define-symbolic mux-selector-f (bitvector 2))
(define-symbolic mux-selector-g (bitvector 2))
(define-symbolic mux-selector-h (bitvector 2))
(assert (not (bveq mux-selector-a (bv 3 2))))
(assert (not (bveq mux-selector-b (bv 3 2))))
(assert (not (bveq mux-selector-c (bv 3 2))))
(assert (not (bveq mux-selector-d (bv 3 2))))
(assert (not (bveq mux-selector-e (bv 3 2))))
(assert (not (bveq mux-selector-f (bv 3 2))))
(assert (not (bveq mux-selector-g (bv 3 2))))
(assert (not (bveq mux-selector-h (bv 3 2))))

(define-symbolic logical-input-0 (bitvector 8))
(define-symbolic logical-input-1 (bitvector 8))
(define-symbolic logical-input-2 (bitvector 8))
(define-symbolic logical-input-3 (bitvector 8))
(define-symbolic logical-input-4 (bitvector 8))
(define-symbolic logical-input-5 (bitvector 8))

(define-symbolic mask (bitvector 48))

;; Takes in a list of 6 8-bit bitvectors. Returns a list of 8 6-bit bitvectors.
(define (logical-to-physical logical-inputs)
  (let* ([logical-inputs (apply concat logical-inputs)]
         [physical-inputs (apply concat
                                 (for/list ([_ (range 48)])
                                   (define-symbolic* set-idx (bitvector 6))
                                   (assert (< (bitvector->natural set-idx) 48))
                                   (bit (bitvector->natural set-idx) logical-inputs)))])
    (list (extract 47 42 physical-inputs)
          (extract 41 36 physical-inputs)
          (extract 35 30 physical-inputs)
          (extract 29 24 physical-inputs)
          (extract 23 18 physical-inputs)
          (extract 17 12 physical-inputs)
          (extract 11 6 physical-inputs)
          (extract 5 0 physical-inputs))))

(define (logical-to-physical-shufflings logical-inputs)
  (let* ([logical-inputs (apply concat logical-inputs)]
         [symbolic-vars (for/list ([_ (range 48)])
                          (define-symbolic* set-idx (bitvector 6))
                          (assert (< (bitvector->natural set-idx) 48))
                          set-idx)]
         [physical-inputs (apply concat
                                 (for/list ([set-idx symbolic-vars])
                                   (bit (bitvector->natural set-idx) logical-inputs)))])
    (for* ([i (range 48)] [j (range (+ i 1) 48)])
      (assert (not (bveq (list-ref symbolic-vars i) (list-ref symbolic-vars j)))))
    (list (extract 47 42 physical-inputs)
          (extract 41 36 physical-inputs)
          (extract 35 30 physical-inputs)
          (extract 29 24 physical-inputs)
          (extract 23 18 physical-inputs)
          (extract 17 12 physical-inputs)
          (extract 11 6 physical-inputs)
          (extract 5 0 physical-inputs))))

; Loigical inputs mapped directly to physical
(define (logical-to-physical-straight logical-inputs)
  (let* ([logical-inputs (apply concat logical-inputs)] [physical-inputs logical-inputs])
    (list (extract 47 42 physical-inputs)
          (extract 41 36 physical-inputs)
          (extract 35 30 physical-inputs)
          (extract 29 24 physical-inputs)
          (extract 23 18 physical-inputs)
          (extract 17 12 physical-inputs)
          (extract 11 6 physical-inputs)
          (extract 5 0 physical-inputs))))

(define (logical-to-physical-sets logical-inputs)
  (let* ([logical-inputs (apply concat logical-inputs)]
         [symbolic-vars (for/list ([_ (range 48)])
                          (define-symbolic* set-idx integer?)
                          ; Each logical bit is mapped to LUT sets 0-7, or mapped to 8, meaning it's
                          ; not wired up.
                          (assert (>= set-idx 0))
                          (assert (<= set-idx 8))
                          set-idx)]
         ; Function which computes the size of a LUT set.
         [set-size (lambda (set-idx) (apply + (map (lambda (v) (= set-idx v)) symbolic-vars)))]
         ; Gets the bits in the given LUT set.
         [get-bits-in-set
          (lambda (set-idx)
            (for/all ([filtered-list
                       (filter (lambda (i) (= (list-ref symbolic-vars i) set-idx)) (range 48))
                       #:exhaustive])
                     (for/list ([idx-into-logical-inputs filtered-list])
                       (list-ref logical-inputs idx-into-logical-inputs)))
            ;;; (for/list ([idx-into-logical-inputs
            ;;;             (filter (lambda (i) (= (list-ref symbolic-vars i) set-idx)) (range 48))])
            ;;;   (list-ref logical-inputs idx-into-logical-inputs))
            )]
         ; List of 8 lists of at most 6 1-bit bitvectors, representing the LUT sets, or the inputs to
         ; each LUT.
         [lut-sets (for/list ([set-idx (range 8)])
                     (get-bits-in-set set-idx))]
         ; Pad the sets to have 6 elements, and assert they have at most 6 elements.
         ;;;  [lut-sets (for/list ([set lut-sets])
         ;;;              (assert (<= (length set) 6))
         ;;;              (append set
         ;;;                      (for/list ([_ (range (- 6 (length set)))])
         ;;;                        ; Unused inputs hardcoded to 1.
         ;;;                        (bv 1 1))))]
         ; Concatenate bits.
         ;;;  [lut-sets (for/list ([set lut-sets])
         ;;;              (apply concat set))]
         )

    lut-sets))

; A different way to do sets:
; 48 symbolic values, one for each physical input, each one's value corresponding to the idx of the
; logical input it is connected to.
; Assert that, if either one isn't equal to some indicator value, then they must not be equal.
; Assert that they must be ordered within each LUT set.
;
; This one also doesn't terminate!
(define (logical-to-physical-sets-2 logical-inputs)
  (let* ([logical-inputs (apply concat logical-inputs)]
         [num-lut-inputs 6]
         [logical-input-bitwidth 8]
         [total-num-input-bits 48]
         [symbolic-vars
          (for*/list ([_ (range total-num-input-bits)])
            ; Which logical bit feeds into this physical bit.
            (define-symbolic* logical-bit-idx integer?)
            ; We can draw from logical bits 0-47, or be set to 48, which will indicate that this input is
            ; not connected.
            (assert (>= logical-bit-idx 0))
            (assert (<= logical-bit-idx 48))

            logical-bit-idx)])

    ; All values must be greater than or equal to the value to the left, except for the first bit
    ; into each LUT.
    (for ([i (range 48)] #:unless (equal? (modulo i 6) 0))
      (assert (<= (list-ref symbolic-vars (- i 1)) (list-ref symbolic-vars i))))

    ; If two physical inputs i and j (i != j) are mapped to logical inputs (that is, not mapped to the
    ; indicator value 48), then they must not be equal.
    (for* ([i (range 48)] [j (range 48)] #:unless (equal? i j))
      (assert (=> (&& (! (equal? (list-ref symbolic-vars i) 48))
                      (! (equal? (list-ref symbolic-vars j) 48)))
                  (! (= (list-ref symbolic-vars i) (list-ref symbolic-vars j))))))

    (let* ([physical-inputs (map (lambda (logical-bit-idx) (bit logical-bit-idx logical-inputs))
                                 symbolic-vars)]
           [physical-inputs (apply concat physical-inputs)])
      (list (extract 47 42 physical-inputs)
            (extract 41 36 physical-inputs)
            (extract 35 30 physical-inputs)
            (extract 29 24 physical-inputs)
            (extract 23 18 physical-inputs)
            (extract 17 12 physical-inputs)
            (extract 11 6 physical-inputs)
            (extract 5 0 physical-inputs)))))

; There's even more symmetry that we're not harnessing. The logical inputs themselves can be
; rearranged. How do I represent that?

; Zach suggested trying the simplest possible encoding (i.e. don't rely on anything other than theory
; of bitvectors; don't try any symmetry-reducing constraints.)
; For this simplest of encodings, we have a 48x48 bitvector (bit-matrix?) M. The first index of M[i,j]
; indicates the physical bit, while the second indicates the logical bit. So M[i,j] indicates whether
; the ith physical bit is connected to the jth logical bit.
; Then, the only constraint is: for a given i, at most one j is 1.
;
; I think there's still something buggy about this impl.
(define (logical-value-from-physical-idx-helper m physical-idx j)
  ; If we've gotten to the end of the row, then it's not wired up.
  (if (= j 48)
      ; If it's not wired up, then we wire it to HIGH
      (bv 1 1)
      ; Else, if we haven't run out of the row yet, check if this bit is 1. If it is, this
      ; physical bit is wired to logical bit j.
      (if (bitvector->bool (bit j (get-row m physical-idx)))
          (bit (+ (* physical-idx 48) j) logical-inputs)
          (logical-value-from-physical-idx-helper m physical-idx (+ j 1)))))
(define (logical-value-from-physical-idx m physical-idx)
  (logical-value-from-physical-idx-helper m physical-idx 0))
(define (get-row m i)
  (extract (- (* (- 48 i) 48) 1) (* (- (- 48 1) i) 48) m))
(define (logical-to-physical-simple logical-inputs)
  (let* ([logical-inputs (apply concat logical-inputs)]
         [m (let ()
              (define-symbolic m (bitvector 2304))
              m)]
         [physical-inputs
          (apply concat (map (lambda (i) (logical-value-from-physical-idx m i)) (range 48)))]
         [physical-inputs (list (extract 47 42 physical-inputs)
                                (extract 41 36 physical-inputs)
                                (extract 35 30 physical-inputs)
                                (extract 29 24 physical-inputs)
                                (extract 23 18 physical-inputs)
                                (extract 17 12 physical-inputs)
                                (extract 11 6 physical-inputs)
                                (extract 5 0 physical-inputs))])

    ; For a given row i, at most one bit in the row is set.
    (for ([i (range 48)])
      (assert (|| (bvzero? (get-row m i))
                  (apply || (map (lambda (j) (bveq (get-row m i) (bv (expt 2 j) 48))) (range 48))))))

    physical-inputs))

; - Uses mask
; - "default" routing, i.e. logical input 0 goes to lut input 0
; - but each LUT can get any bit of the logical input (rather than LUT0 getting logical0_0, LUT1
;   getting logical0_1)
(define (logical-to-physical-0 mask inputs)
  (match-let*
   ([(list logical-input-0
           logical-input-1
           logical-input-2
           logical-input-3
           logical-input-4
           logical-input-5)
     inputs]
    [helper
     (lambda (idx)
       (concat (apply choose* (bitvector->bits logical-input-5))
               (apply choose* (bitvector->bits logical-input-4))
               (apply choose* (bitvector->bits logical-input-3))
               (apply choose* (bitvector->bits logical-input-2))
               (apply choose* (bitvector->bits logical-input-1))
               (apply choose* (bitvector->bits logical-input-0))))]
    [physical-inputs
     (list (helper 0) (helper 1) (helper 2) (helper 3) (helper 4) (helper 5) (helper 6) (helper 7))]
    [physical-inputs (apply concat physical-inputs)]
    ; mask is in the order (MSB left) [bit 5 of lut a, bit 4 of lut a, ...]
    [physical-inputs (bvor mask physical-inputs)]
    [physical-inputs
     (list (extract 47 42 physical-inputs)
           (extract 41 36 physical-inputs)
           (extract 35 30 physical-inputs)
           (extract 29 24 physical-inputs)
           (extract 23 18 physical-inputs)
           (extract 17 12 physical-inputs)
           (extract 11 6 physical-inputs)
           (extract 5 0 physical-inputs))])
   physical-inputs))

(define out
  (apply interpret-ultrascale-plus-clb
         (ultrascale-plus-clb (ultrascale-plus-lut6-2 lut-memory-a)
                              (ultrascale-plus-lut6-2 lut-memory-b)
                              (ultrascale-plus-lut6-2 lut-memory-c)
                              (ultrascale-plus-lut6-2 lut-memory-d)
                              (ultrascale-plus-lut6-2 lut-memory-e)
                              (ultrascale-plus-lut6-2 lut-memory-f)
                              (ultrascale-plus-lut6-2 lut-memory-g)
                              (ultrascale-plus-lut6-2 lut-memory-h)
                              mux-selector-a
                              mux-selector-b
                              mux-selector-c
                              mux-selector-d
                              mux-selector-e
                              mux-selector-f
                              mux-selector-g
                              mux-selector-h)
         cin
         (logical-to-physical-0 mask
                                (list logical-input-0
                                      logical-input-1
                                      logical-input-2
                                      logical-input-3
                                      logical-input-4
                                      logical-input-5))))

(define logical-inputs
  (list logical-input-0
        logical-input-1
        logical-input-2
        logical-input-3
        logical-input-4
        logical-input-5))

(define (helper f arity)
  (println f)
  (define soln
    (time
     (synthesize
      #:forall logical-inputs
      #:guarantee
      (begin
        ; Assume unused inputs are zero. We can set them to whatever we want, but it's important that
        ; we tell the solver that they're unused and unimportant, and setting them to a constant value
        ; is the way to this.
        ; When these aren't set, synthesis takes about 10-20x longer (20mins vs 1.5mins). In this case,
        ; we synthesize a LUT that is correct for inputs 0 and 1 regardless of the settings of the
        ; other inputs. I'm not sure if that's useful. I also wonder if there's a faster way to get
        ; the same result. E.g. either 1. assume 2-5 are all 0 and then manually edit the resulting LUT
        ; and duplicate the "correct" parts of the LUT memory into the rest of the LUT memory, OR, 2.,
        ; a more graceful solution, `assume` some predicates that basically say that 2-5 "don't matter"
        ; and that the outputs for a given 0 and 1 should be the same for any 2-5.
        (for ([logical-input (list-tail logical-inputs arity)])
          (assume (bvzero? logical-input)))

        ; Assert that the output of the CLB implements the requested function f.
        (assert (bveq (apply f (take logical-inputs arity)) out))))))

  ; Print the output. Unwrap the model if there is one, so that all of the values print.
  (if (sat? soln) (pretty-print (model soln)) (println soln))
  (displayln ""))

; Simple test: identify function.
(helper (lambda (a) a) 1)

; CIRCT Comb dialect.
(helper circt-comb-add 2)
(helper circt-comb-and 2)
(helper circt-comb-divs 2)
(helper circt-comb-divu 2)
(helper (lambda (a b) (zero-extend (circt-comb-icmp a b) (bitvector 8))) 2)
(helper circt-comb-mods 2)
(helper circt-comb-mul 2)
; We can make this one synthesize using logical-to-physical-0 and adding:
; (assume (or (bvzero? logical-input-0) (bveq (bv 1 8) logical-input-0)))
; to our assumptions in the synthesize call.
(helper circt-comb-mux 3)
(helper circt-comb-or 2)
(helper (lambda (a) (zero-extend (circt-comb-parity a) (bitvector 8))) 1)
(helper circt-comb-shl 2)
(helper circt-comb-shrs 2)
(helper circt-comb-shru 2)
(helper circt-comb-sub 2)
(helper circt-comb-xor 2)

; Bithack examples.
(helper floor-avg 2)
(helper bithack3 2)
(helper bithack2 2)
(helper bithack1 2)
(helper ceil-avg 2)
(helper bvadd 2)
(helper cycle 4)
