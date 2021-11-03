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
(define a-memory (generate-memory 6 2))
(define a-inputs (generate-inputs 6))


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
