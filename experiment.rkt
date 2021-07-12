#lang racket

(require rosette)

(define input-width 6)

(define-symbolic lut-a (bitvector (* 2 (expt 2 input-width))))
(define-symbolic inputs-a (bitvector input-width))
(define output-a 
  (let ((i (bitvector->integer inputs-a)))
    (extract (+ 1 (* 2 i)) (* 2 i) lut-a)))

(define-symbolic lut-b (bitvector (* 2 (expt 2 input-width))))
(define-symbolic inputs-b (bitvector input-width))
(define output-b 
  (let ((i (bitvector->integer inputs-b)))
    (extract (+ 1 (* 2 i)) (* 2 i) lut-b)))

(define-symbolic lut-c (bitvector (* 2 (expt 2 input-width))))
(define-symbolic inputs-c (bitvector input-width))
(define output-c 
  (let ((i (bitvector->integer inputs-c)))
    (extract (+ 1 (* 2 i)) (* 2 i) lut-c)))

(define-symbolic lut-d (bitvector (* 2 (expt 2 input-width))))
(define-symbolic inputs-d (bitvector input-width))
(define output-d 
  (let ((i (bitvector->integer inputs-d)))
    (extract (+ 1 (* 2 i)) (* 2 i) lut-d)))

(synthesize
 #:forall (list inputs-a)
 #:guarantee 
 (assert (bveq (bvand (bit inputs-a 1)
                      (bit inputs-a 0))
               (bit output-a 0))))

(assert (bveq (bvand (bit inputs-a 1)
                     (bit inputs-a 0))
              (bit output-a 0)))

; lut has input width of 2, what's the value of memory that implements AND

; cool first target: from 1. slice description and 2. highl evel program (e.g. add), find a "clever" (i.e. using a mux) way to implement the program

; another optimization: if you have an 8-bit x+1 circuit, xilinx tools can remove the carry chain to make it 1 cycle faster

; one way to think about it: software people started with structure, and now are being more free form in their search. hardware people started with no structure and we are now trying to add structure back in
; alex aiken talk is an example of sw people loosening structure
; adding structure helps guide the search
; is this an artifact of old systems being so small? so they were much smaller and the problem was easier