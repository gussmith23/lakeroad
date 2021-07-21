#lang racket

(require rosette
         rosette/lib/synthax)

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