#lang racket

(require "compile-to-json.rkt"
         "verilator.rkt"
         "sofa.rkt"
         rosette)

(module+ test 
(check-no-exn
 (lambda ()
   (simulate-expr `(sofa-lut4 ,(bv 0 16) ,(bv 0 4)) (bv 0 1) #:includes includes)))

)