#lang racket

(require rosette)

; number of bits which a LUT takes as input
(define input-width 6)
; number of bits which a LUT outputs
(define output-width 2)

; the LUT contains an `output-width`-sized entry for each of the possible `2^input-width` entries.
(define-symbolic lut-a (bitvector (* output-width (expt 2 input-width))))
(define-symbolic inputs-a (bitvector input-width))
; The output of a LUT is simply the `output-width`-length bitvector at the entry pointed to by
; `inputs-a`, when interpreted as an integer.
(define output-a 
  (let ((i (bitvector->integer inputs-a)))
    (extract 
     (+ (- output-width 1) (* output-width i)) 
     (* output-width i) 
     lut-a)))

(define m (synthesize
           #:forall (list inputs-a)
           #:guarantee 
           (assert (bveq (bvand (bit 1 inputs-a)
                                (bit 0 inputs-a))
                         (bit 0 output-a)))))

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