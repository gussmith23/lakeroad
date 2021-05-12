#lang racket

(require rosette)

(define input-width 6)
(define-symbolic lut (bitvector (expt 2 input-width)))
(define-symbolic inputs (bitvector input-width))
(let ((i (bitvector->integer inputs)))
  (extract i i lut))

; lut has input width of 2, what's the value of memory that implements AND

; cool first target: from 1. slice description and 2. highl evel program (e.g. add), find a "clever" (i.e. using a mux) way to implement the program
