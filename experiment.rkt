#lang racket

(require rosette)

; An `input-width`-sized vector of bits to serve as the inputs to a LUT.
(define (generate-inputs input-width)
  (define-symbolic* inputs (bitvector input-width))
  inputs)

; A LUT's memory contains an `output-width`-sized entry for each of the possible `2^input-width`
; entries.
(define (generate-memory input-width output-width)
  (define-symbolic* memory (bitvector (* output-width (expt 2 input-width))))
  memory)

; The output of a LUT is simply the `output-width`-length bitvector at the entry pointed to by
; `inputs-a`, when interpreted as an integer.
(define
  (lut output-width memory inputs)
  (let* ((i (bitvector->natural inputs))
         (low (* output-width i))
         (high (+ (- output-width 1) low)))
    (extract high low memory)))

(define input-width 6)
(define output-width 2)
(define memory (generate-memory input-width output-width))
(define inputs (generate-inputs input-width))
(define m (synthesize
           #:forall (list inputs)
           #:guarantee
           (assert (bveq (bvand (bit 1 inputs) (bit 0 inputs))
                         (bit 0 (lut output-width memory inputs))))))

(print m)

(define 7-series-input-width 6)
(define 7-series-output-width 2)



; my question: how does data get fed into a slice? in how many ways can the e.g. 8 bits that are
; loaded from a bram end up at the inputs to the luts at the start of a slice? can those 8 bits be fed
; into the first and second luts only, for example? can a single bit be fed into each of the 8 luts
; across two slices? can two bits be fed into each of the four luts in a single slice?

; lut has input width of 2, what's the value of memory that implements AND

; cool first target: from 1. slice description and 2. highl evel program (e.g. add), find a "clever"
; (i.e. using a mux) way to implement the program

; another optimization: if you have an 8-bit x+1 circuit, xilinx tools can remove the carry chain to
; make it 1 cycle faster

; one way to think about it: software people started with structure, and now are being more free form
; in their search. hardware people started with no structure and we are now trying to add structure
; back in alex aiken talk is an example of sw people loosening structure adding structure helps guide
; the search is this an artifact of old systems being so small? so they were much smaller and the
; problem was easier

; Should we focus on logic or DSP slices? Talking with Luis, it seems like DSPs are the most important
; thing. So if we don't have DSP functionality, then we don't do much. And if this approach doesn't
; work  with DSPs, then we should focus on something else.


; There are no loops!
;
; Basically whatever data you want can get wherever you want in the slice.
;
; But then the question is: that blows the problem up hugely, does it not? We basically have to ask
; the synthesizer: what bits do you want to send to which inputs AND how will you configure the slice.
; I don't know much about synthesis, but that seems a bit crazy.
;
; Perhaps it's safe to make the assumption that we'll always input the data as bit0s into lut0, bit1s
; into lut1, etc., and that we'll read the data out in the same way. It's probably best to make that
; assumption for now, and make it more complex later as needed.
;
; But part of me also feels that the actual novelty here would be in making no assumptions about what
; is wired to where. As long as the wiring assignments produced are actually possible, why does it
; matter?
;
; How would it be done? We would need to produce 1. a mapping from bits of the logical inputs to
; actual slice inputs, 2. the slice configuration, and 3. a mapping from the bits of the slice outputs
; to the logical outputs.

; What does a mapping of logical bits to slice inputs look like? How is represented? We could just
; basically give every LUT input a variable, which represents the index into which it indexes the
; inputs (if we view the inputs as a concatenated list of bits). We could also include hardcoded 0 and
; 1 inputs.

; Benefit 1: targeting a higher level IR; no need to do equivalence checking
;
; Benefit 2: given a description of hardware, we can automatically generate this portion of the
; compiler -> support a new FPGA in a matter of hrs -> call out to Reticle paper: luis needed to write
; this stuff by hand, now we can do it automatically
;
; Norman ramsey's instruction selection work

; Another argument: if the compiler/synthesizer is sound, then you don't have to do equivalence
; checking.

; A benefit to this approach: we increase everyone (in PL)'s understanding of FPGAs and how to program
; them. Define your audience!

; Flag planting is different in different communities.

(clear-vc!)

(define a-memory (generate-memory 7-series-input-width 7-series-output-width))
(define b-memory (generate-memory 7-series-input-width 7-series-output-width))
(define c-memory (generate-memory 7-series-input-width 7-series-output-width))
(define d-memory (generate-memory 7-series-input-width 7-series-output-width))
(define e-memory (generate-memory 7-series-input-width 7-series-output-width))
(define f-memory (generate-memory 7-series-input-width 7-series-output-width))
(define g-memory (generate-memory 7-series-input-width 7-series-output-width))
(define h-memory (generate-memory 7-series-input-width 7-series-output-width))

; The physical inputs to the configurable logic block (CLB).
(define-symbolic physical-inputs (bitvector (* 8 7-series-input-width)))

; The logical inputs. Differs based on the thing you're trying to synthesize.
(define-symbolic logical-input-a (bitvector 8))
(define-symbolic logical-input-b (bitvector 8))

; Define a mapping between the physical and logical inputs. The mapping maps from a physical input bit
; index to a logical input bit index (assuming we concatenate logical inputs together).
;
; One way to do this is to allow any physical bit to be fed from any logical bit. I think this is
; possible on the FPGA. In that case, we could define a symbolic mapping to be solved for by Rosette:
;
; (define-symbolic mapping (~> natural? natural?))
;
; Talking with Luis Vega, however, he thinks we'll get a lot of mileage out of the "standard" mapping
; pattern of mapping Lin0Bit0 (bit 0 of logical input 0) to LUT0In0 (input/bit 0 of LUT0, or physical
; input 0), mapping Lin0Bit1 to LUT1In0, etc; mapping Lin1Bit0 to LUT0In1, Lin1Bit1 to LUT1In1, and so
; on. In that case, we can define a concrete mapping:
;
; Note that we determine logical bit ID by concatenating all logical inputs. If we have two logical 8
; bit inputs, then L0Bit0 = 0, L1Bit0 = 8. There's probably a better way to do this, though.
; Assumes all inputs have the same bitwidth.
(define (logical-to-physical-input num-lut-inputs bitwidth logical-bit)
  (let-values ([(lut-bit lut-index) (quotient/remainder logical-bit bitwidth)])
    (+ (* lut-index num-lut-inputs) lut-bit)))
; use a better assert
; Logical bit 0 goes to LUT 0 bit 0.
(or (= (logical-to-physical-input 6 8 0) 0) (error "error"))
; Logical bit 1 (logical input 0 bit 1) goes to LUT 1 bit 0.
(or (= (logical-to-physical-input 6 8 1) 6) (error "error"))
; Logical bit 9 (logical input 1 bit 1) goes to LUT 1 bit 1.
(or (= (logical-to-physical-input 6 8 9) 7) (error "error"))

(define (physical-to-logical-input num-lut-inputs bitwidth physical-bit)
  (let-values ([(logical-bit-index logical-input-index) (quotient/remainder physical-bit num-lut-inputs)])
    (+ (* logical-input-index bitwidth) logical-bit-index)))
; Physical bit 0 goes to logical bit 0.
(or (= (physical-to-logical-input 6 8 0) 0) (error "error"))
; Physical bit 1 (LUT 0 input 1) goes to logical input 1 bit 0.
(or (= (logical-to-physical-input 6 8 1) 8) (error "error"))
; Logical bit 9 (logical input 1 bit 1) goes to LUT 1 bit 1.
; TODO
;(or (= (logical-to-physical-input 6 8 9) 7) (error "error"))

(define a-out (lut 7-series-output-width a-memory (extract 47 42 physical-inputs)))
(define b-out (lut 7-series-output-width a-memory (extract 41 36 physical-inputs)))
(define c-out (lut 7-series-output-width a-memory (extract 35 30 physical-inputs)))
(define d-out (lut 7-series-output-width a-memory (extract 29 24 physical-inputs)))
(define e-out (lut 7-series-output-width a-memory (extract 23 18 physical-inputs)))
(define f-out (lut 7-series-output-width a-memory (extract 17 12 physical-inputs)))
(define g-out (lut 7-series-output-width a-memory (extract 11 6 physical-inputs)))
(define h-out (lut 7-series-output-width a-memory (extract 5 0 physical-inputs)))