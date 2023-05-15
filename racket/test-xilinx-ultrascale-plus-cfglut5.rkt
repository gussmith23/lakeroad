#lang racket/base

(require "generated/xilinx-ultrascale-plus-cfglut5.rkt"
         rackunit
         rosette
         rosette/lib/synthax
         "signal.rkt")

;;; High-level goal:
;;; 1. Pick 

;;; 1010  0101 1011

;;; (define c1 (xilinx-ultrascale-plus-cfglut5 
;;;       #:CDI (bv->signal (bv 1 1)) ; what is the cfglut shifting in. In this case its 1
;;;       #:CE (bv->signal (bv 1 1)) ; this is just whether we are "turning on" this module
;;;       #:CLK (bv->signal (bv 0 1))
;;;       #:I0 (bv->signal (bv 0 1)) ; this is the one that is an actual input
;;;       #:I1 (bv->signal (bv 0 1))
;;;       #:I2 (bv->signal (bv 0 1))
;;;       #:I3 (bv->signal (bv 0 1))
;;;       #:I4 (bv->signal (bv 0 1))
;;;       #:IS_CLK_INVERTED (bv->signal (bv 0 1))
;;;       ))
;;; (displayln c1)
;;; (displayln "\n\n")
;;; (define output (assoc-ref c1 'O6))
;;; (define c2 (xilinx-ultrascale-plus-cfglut5 
;;;       #:CDI (bv->signal (bv 1 1)) ; what is the cfglut shifting in. In this case its 1
;;;       #:CE (bv->signal (bv 1 1)) ; this is just whether we are "turning on" this module
;;;       #:CLK (bv->signal (bv 1 1))
;;;       #:I0 (bv->signal (bv 1 1) output) ; this is the one that is an actual input
;;;       #:I1 (bv->signal (bv 0 1))
;;;       #:I2 (bv->signal (bv 0 1))
;;;       #:I3 (bv->signal (bv 0 1))
;;;       #:I4 (bv->signal (bv 0 1))
;;;       #:IS_CLK_INVERTED (bv->signal (bv 0 1))
;;;       ))
;;; (displayln c2)
;;; (define output2 (assoc-ref c2 'O6))
;;; (displayln "\n\n")
;;; (displayln output2)
;;; (displayln "\n\n")
;;; (define c3 (xilinx-ultrascale-plus-cfglut5 
;;;       #:CDI (bv->signal (bv 1 1)) ; what is the cfglut shifting in. In this case its 1
;;;       #:CE (bv->signal (bv 1 1)) ; this is just whether we are "turning on" this module
;;;       #:CLK (bv->signal (bv 0 1))
;;;       #:I0 (bv->signal (bv 1 1) output2) ; this is the one that is an actual input
;;;       #:I1 (bv->signal (bv 0 1))
;;;       #:I2 (bv->signal (bv 0 1))
;;;       #:I3 (bv->signal (bv 0 1))
;;;       #:I4 (bv->signal (bv 0 1))
;;;       #:IS_CLK_INVERTED (bv->signal (bv 0 1))
;;;       ))
;;; (displayln c3)




(define-symbolic i0 (bitvector 1))
(define c1 (xilinx-ultrascale-plus-cfglut5 
      #:CDI (bv->signal (bv 1 1)) ; what is the cfglut shifting in. In this case its 1
      #:CE (bv->signal (bv 1 1)) ; this is just whether we are "turning on" this module
      #:CLK (bv->signal (bv 0 1))
      #:I0 (bv->signal (bv 0 1)) ; this is the one that is an actual input
      #:I1 (bv->signal (bv 0 1))
      #:I2 (bv->signal (bv 0 1))
      #:I3 (bv->signal (bv 0 1))
      #:I4 (bv->signal (bv 0 1))
      ))
(displayln c1)
(displayln "\n\n")
(define output (assoc-ref c1 'O6))
(define c2 (xilinx-ultrascale-plus-cfglut5 
      #:CDI (bv->signal (bv 1 1)) ; what is the cfglut shifting in. In this case its 1
      #:CE (bv->signal (bv 1 1)) ; this is just whether we are "turning on" this module
      #:CLK (bv->signal (bv 1 1))
      #:I0 (bv->signal (bv 1 1) output) ; this is the one that is an actual input
      #:I1 (bv->signal (bv 0 1))
      #:I2 (bv->signal (bv 0 1))
      #:I3 (bv->signal (bv 0 1))
      #:I4 (bv->signal (bv 0 1))
      ))
(displayln c2)
(define output2 (assoc-ref c2 'O6))
(check-equal? (signal-value output2) (bv 0 1))
(displayln "\n\n")
(displayln output2)
(define c3 (xilinx-ultrascale-plus-cfglut5 
      #:CDI (bv->signal (?? (bitvector 1))) ; what is the cfglut shifting in. In this case its 1
      #:CE (bv->signal (?? (bitvector 1))); this is just whether we are "turning on" this module
      #:CLK (bv->signal (?? (bitvector 1)))
      #:I0 (bv->signal i0 output2) ; this is the one that is an actual input
      #:I1 (bv->signal (bv 0 1))
      #:I2 (bv->signal (bv 0 1))
      #:I3 (bv->signal (bv 0 1))
      #:I4 (bv->signal (bv 0 1))
      ))
(define output3 (assoc-ref c3 'O6))
;;; (check-equal? (signal-value output3) (bv 0 1))
(verify (assert (bveq (signal-value output3) (bvnot i0))))
;;; (displayln "\n\n")
;;; (define c3 (xilinx-ultrascale-plus-cfglut5 
;;;       #:CDI (bv->signal (bv 0 1)) ; what is the cfglut shifting in. In this case its 1
;;;       #:CE (bv->signal (bv 1 1)) ; this is just whether we are "turning on" this module
;;;       #:CLK (bv->signal (bv 0 1))
;;;       #:I0 (bv->signal (bv 1 1) output2) ; this is the one that is an actual input
;;;       #:I1 (bv->signal (bv 0 1))
;;;       #:I2 (bv->signal (bv 0 1))
;;;       #:I3 (bv->signal (bv 0 1))
;;;       #:I4 (bv->signal (bv 0 1))
;;;       ))
;;; (displayln c3)
;;; TESTING AND

;;; X | X
;;; -----
;;; X | X

;;; i0 | i1 | mem || out
;;; --------------------
;;; 0  |  0 |abcd || 
;;; 0  |  1 |
;;; 1  |  0 |
;;; 1  |  1 |

;;; input = (i0=0, i1=1, mem=abcd):
;;; 11: a
;;; 10: b
;;; 01: c
;;; 00: d 
;;; i0=0, i1=1, (concatenate i0 i1) = 01
;;; use that value to "index" into the memory 
;;; index abcd @ 01 == c 
;;; the way you can implement index using bitvector ops is via bitshift:
;;; (bit 0 (bvlshr memory (concatenate i0 i1)))