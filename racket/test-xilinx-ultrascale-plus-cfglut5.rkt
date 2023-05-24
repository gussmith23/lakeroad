#lang racket/base

(require "generated/xilinx-ultrascale-plus-cfglut5-modified.rkt"
         rackunit
         rosette
         rosette/lib/synthax
         "signal.rkt")



(define-symbolic i0 (bitvector 1))
(define-symbolic i1 (bitvector 1))
(define-symbolic init (bitvector 32))

(define c1 (xilinx-ultrascale-plus-cfglut5 
      #:CDI (bv->signal (bv 1 1)) ; what is the cfglut shifting in. In this case its 1
      #:CE (bv->signal (bv 1 1)) ; this is just whether we are "turning on" this module
      #:CLK (bv->signal (bv 0 1))
      #:I0 (bv->signal i0) ; this is the one that is an actual input
      #:I1 (bv->signal i1)
      #:I2 (bv->signal (bv 0 1))
      #:I3 (bv->signal (bv 0 1))
      #:I4 (bv->signal (bv 0 1))
      #:INIT (bv->signal init)
      ))
(define output1 (assoc-ref c1 'O6))
;;; (displayln output1)
;;; (verify (assert (bveq (signal-value output1) (bvand i0 i1))))
;;; (synthesize 
;;;       #:forall (list i0)
;;;       #:guarantee (assert (bveq 
;;;             (signal-value (assoc-ref (xilinx-ultrascale-plus-cfglut5 
;;;             #:CDI (bv->signal (bv 1 1)) ; what is the cfglut shifting in. In this case its 1
;;;             #:CE (bv->signal (bv 0 1)) ; this is just whether we are "turning on" this module
;;;             #:CLK (bv->signal (bv 0 1))
;;;             #:I0 (bv->signal i0) ; this is the one that is an actual input
;;;             #:I1 (bv->signal (bv 0 1))
;;;             #:I2 (bv->signal (bv 0 1))
;;;             #:I3 (bv->signal (bv 0 1))
;;;             #:I4 (bv->signal (bv 0 1))
;;;             #:INIT (bv->signal init)) 'O6))
;;;             (bvnot i0)
;;;        )))
;;; (displayln (extract 0 0 (bv 1 32)))

;;; (synthesize 
;;;       #:forall (list i0 i1)
;;;       #:guarantee (assert (bveq (bit 0 (bvlshr init (zero-extend i0 (bitvector 32)))) (bvand i0 i1))))


;;; a stack of cfglut5s with the same input, but different INIT vlaues.
(define (cfglut5-stack CE CDI CLK I0 I1 I2 I3)
      
      (let*
            ([cfglut5-1 (xilinx-ultrascale-plus-cfglut5 
                  #:CDI (bv->signal (bv 1 1)) ; what is the cfglut shifting in. In this case its 1
                  #:CE (bv->signal CE) ; this is just whether we are "turning on" this module
                  #:CLK (bv->signal CLK)
                  #:I0 (bv->signal I0) ; this is the one that is an actual input
                  #:I1 (bv->signal I1)
                  #:I2 (bv->signal I2)
                  #:I3 (bv->signal I3)
                  #:I4 (bv->signal (bv 1 1))
                  #:INIT (bv->signal (bv 0 32))
                  )]
              [answer (concat (signal-value (assoc-ref cfglut5-1 'O6)) (signal-value (assoc-ref cfglut5-1 'O5)))]
              [cfglut5-2 (xilinx-ultrascale-plus-cfglut5 
                  #:CDI (bv->signal (bv 1 1)) ; what is the cfglut shifting in. In this case its 1
                  #:CE (bv->signal CE) ; this is just whether we are "turning on" this module
                  #:CLK (bv->signal CLK)
                  #:I0 (bv->signal I0) ; this is the one that is an actual input
                  #:I1 (bv->signal I1)
                  #:I2 (bv->signal I2)
                  #:I3 (bv->signal I3)
                  #:I4 (bv->signal (bv 1 1))
                  #:INIT (bv->signal (bv 0 32))
                  )]
              [answer (concat (signal-value (assoc-ref cfglut5-2 'O6)) (signal-value (assoc-ref cfglut5-2 'O5)) answer)]
              [cfglut5-3 (xilinx-ultrascale-plus-cfglut5 
                  #:CDI (bv->signal (bv 1 1)) ; what is the cfglut shifting in. In this case its 1
                  #:CE (bv->signal CE) ; this is just whether we are "turning on" this module
                  #:CLK (bv->signal CLK)
                  #:I0 (bv->signal I0) ; this is the one that is an actual input
                  #:I1 (bv->signal I1)
                  #:I2 (bv->signal I2)
                  #:I3 (bv->signal I3)
                  #:I4 (bv->signal (bv 1 1))
                  #:INIT (bv->signal (bv 0 32))
                  )] 
               [answer (concat (signal-value (assoc-ref cfglut5-3 'O6)) (signal-value (assoc-ref cfglut5-3 'O5)) answer)]
              )
            answer))
(define INIT1 (bv 6 32))
(define stack1 (cfglut5-stack (bv 1 1) (bv 0 1) (bv 1 1) (bv 0 1) (bv 1 1) (bv 0 1) (bv 127 32) (bv 125 32) (bv 100 32)))
(define stack2 (cfglut5-stack (bv 1 1) (bv 0 1) (bv 1 1) (bv 0 1) (bv 1 1) (bv 0 1) (bv 6 32) (bv 2 32) (bv 5 32)))
(displayln (bvadd stack1 stack2))























;; 1 input: 2 slot or 2^1 01
;; 2 inputs; 4 slots or 2^2 0011
;; 3 inputs; 8 slots or 2^3 00001111
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




;;; (define-symbolic i0 (bitvector 1))
;;; (define-symbolic i1 (bitvector 1))
;;; (define-symbolic i2 (bitvector 1))

;;; (define notc1 (xilinx-ultrascale-plus-cfglut5 
;;;       #:CDI (bv->signal (bv 1 1)) ; what is the cfglut shifting in. In this case its 1
;;;       #:CE (bv->signal (bv 1 1)) ; this is just whether we are "turning on" this module
;;;       #:CLK (bv->signal (bv 0 1))
;;;       #:I0 (bv->signal (bv 0 1)) ; this is the one that is an actual input
;;;       #:I1 (bv->signal (bv 0 1))
;;;       #:I2 (bv->signal (bv 0 1))
;;;       #:I3 (bv->signal (bv 0 1))
;;;       #:I4 (bv->signal (bv 0 1))
;;;       #:INIT (bv->signal (bv 0 32))
;;;       ))
;;; ;;; (displayln c1)
;;; ;;; (displayln "\n\n")
;;; (define output (assoc-ref notc1 'O6))
;;; (define notc2 (xilinx-ultrascale-plus-cfglut5 
;;;       #:CDI (bv->signal (bv 1 1)) ; what is the cfglut shifting in. In this case its 1
;;;       #:CE (bv->signal (bv 1 1)) ; this is just whether we are "turning on" this module
;;;       #:CLK (bv->signal (bv 1 1))
;;;       #:I0 (bv->signal (bv 1 1) output) ; this is the one that is an actual input
;;;       #:I1 (bv->signal (bv 0 1))
;;;       #:I2 (bv->signal (bv 0 1))
;;;       #:I3 (bv->signal (bv 0 1))
;;;       #:I4 (bv->signal (bv 0 1))
;;;       #:INIT (bv->signal (bv 0 32))
;;;       ))

;;; (displayln notc2)
;;; (define output2 (assoc-ref notc2 'O6))
;;; (check-equal? (signal-value output2) (bv 0 1))
;;; (displayln "\n\n")
;;; (displayln output2)
;;; (define c3 (xilinx-ultrascale-plus-cfglut5 
;;;       #:CDI (bv->signal (?? (bitvector 1))) ; what is the cfglut shifting in. In this case its 1
;;;       #:CE (bv->signal (?? (bitvector 1))); this is just whether we are "turning on" this module
;;;       #:CLK (bv->signal (?? (bitvector 1)))
;;;       #:I0 (bv->signal i0 output2) ; this is the one that is an actual input
;;;       #:I1 (bv->signal (bv 0 1))
;;;       #:I2 (bv->signal (bv 0 1))
;;;       #:I3 (bv->signal (bv 0 1))
;;;       #:I4 (bv->signal (bv 0 1))
;;;       ))
;;; (define output3 (assoc-ref c3 'O6))
;;; ;;; (check-equal? (signal-value output3) (bv 0 1))

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

;;; the inputs for a 3 input and. For any 3 inputs, the correct answer should be received. AND
;;; quite easy. The 8th bit in memory is the only one that should be set to 1, as thats the only 
;;l time that all 3 inputs are 1.

;;; (define c1 (xilinx-ultrascale-plus-cfglut5 
;;;       #:CDI (bv->signal (bv 1 1)) ; what is the cfglut shifting in. In this case its 1
;;;       #:CE (bv->signal (bv 1 1)) ; this is just whether we are "turning on" this module
;;;       #:CLK (bv->signal (bv 0 1))
;;;       #:I0 (bv->signal i0) ; this is the one that is an actual input
;;;       #:I1 (bv->signal i1)
;;;       #:I2 (bv->signal (bv 0 1))
;;;       #:I3 (bv->signal (bv 0 1))
;;;       #:I4 (bv->signal (bv 0 1))
;;;       #:INIT (bv->signal (bv 0 32))
;;;       ))
;;; (define output1 (assoc-ref c1 'O6))
;;; ;;; (displayln output1)

;;; (define c2 (xilinx-ultrascale-plus-cfglut5 
;;;       #:CDI (bv->signal (bv 1 1)) ; what is the cfglut shifting in. In this case its 1
;;;       #:CE (bv->signal (bv 1 1)) ; this is just whether we are "turning on" this module
;;;       #:CLK (bv->signal (bv 1 1) output1)
;;;       #:I0 (bv->signal i0) ; this is the one that is an actual input
;;;       #:I1 (bv->signal i1)
;;;       #:I2 (bv->signal (bv 0 1))
;;;       #:I3 (bv->signal (bv 0 1))
;;;       #:I4 (bv->signal (bv 0 1))
;;;       #:INIT (bv->signal (bv 0 32))
;;;       ))
;;; (define output2 (assoc-ref c2 'O6))
;;; ;;; (displayln output2)

;;; (define c3 (xilinx-ultrascale-plus-cfglut5 
;;;       #:CDI (bv->signal (bv 0 1)) ; what is the cfglut shifting in. In this case its 1
;;;       #:CE (bv->signal (bv 1 1)) ; this is just whether we are "turning on" this module
;;;       #:CLK (bv->signal (bv 0 1) output2)
;;;       #:I0 (bv->signal i0) ; this is the one that is an actual input
;;;       #:I1 (bv->signal i1)
;;;       #:I2 (bv->signal (bv 0 1))
;;;       #:I3 (bv->signal (bv 0 1))
;;;       #:I4 (bv->signal (bv 0 1))
;;;       #:INIT (bv->signal (bv 0 32))
;;;       ))

;;; (define output3 (assoc-ref c3 'O6))

;;; (define c4 (xilinx-ultrascale-plus-cfglut5 
;;;       #:CDI (bv->signal (bv 0 1)) ; what is the cfglut shifting in. In this case its 1
;;;       #:CE (bv->signal (bv 1 1)) ; this is just whether we are "turning on" this module
;;;       #:CLK (bv->signal (bv 1 1) output3)
;;;       #:I0 (bv->signal i0) ; this is the one that is an actual input
;;;       #:I1 (bv->signal i1)
;;;       #:I2 (bv->signal (bv 0 1))
;;;       #:I3 (bv->signal (bv 0 1))
;;;       #:I4 (bv->signal (bv 0 1))
;;;       #:INIT (bv->signal (bv 0 32))
;;;       ))
;;; (define output4 (assoc-ref c4 'O6))

;;; (define c5 (xilinx-ultrascale-plus-cfglut5 
;;;       #:CDI (bv->signal (bv 0 1)) ; what is the cfglut shifting in. In this case its 1
;;;       #:CE (bv->signal (bv 1 1)) ; this is just whether we are "turning on" this module
;;;       #:CLK (bv->signal (bv 0 1) output4)
;;;       #:I0 (bv->signal i0) ; this is the one that is an actual input
;;;       #:I1 (bv->signal i1)
;;;       #:I2 (bv->signal (bv 0 1))
;;;       #:I3 (bv->signal (bv 0 1))
;;;       #:I4 (bv->signal (bv 0 1))
;;;       #:INIT (bv->signal (bv 0 32))
;;;       ))
;;; (define output5 (assoc-ref c5 'O6))

;;; (define c6 (xilinx-ultrascale-plus-cfglut5 
;;;       #:CDI (bv->signal (bv 0 1)) ; what is the cfglut shifting in. In this case its 1
;;;       #:CE (bv->signal (bv 1 1)) ; this is just whether we are "turning on" this module
;;;       #:CLK (bv->signal (bv 1 1) output5)
;;;       #:I0 (bv->signal i0) ; this is the one that is an actual input
;;;       #:I1 (bv->signal i1)
;;;       #:I2 (bv->signal (bv 0 1))
;;;       #:I3 (bv->signal (bv 0 1))
;;;       #:I4 (bv->signal (bv 0 1))
;;;       #:INIT (bv->signal (bv 0 32))
;;;       ))
;;; (define output6 (assoc-ref c6 'O6))

;;; (define c7 (xilinx-ultrascale-plus-cfglut5 
;;;       #:CDI (bv->signal (bv 0 1)) ; what is the cfglut shifting in. In this case its 1
;;;       #:CE (bv->signal (bv 1 1)) ; this is just whether we are "turning on" this module
;;;       #:CLK (bv->signal (bv 0 1) output6)
;;;       #:I0 (bv->signal i0) ; this is the one that is an actual input
;;;       #:I1 (bv->signal i1)
;;;       #:I2 (bv->signal (bv 0 1))
;;;       #:I3 (bv->signal (bv 0 1))
;;;       #:I4 (bv->signal (bv 0 1))
;;;       #:INIT (bv->signal (bv 0 32))
;;;       ))

;;; (define output7 (assoc-ref c7 'O6))

;;; (define c8 (xilinx-ultrascale-plus-cfglut5 
;;;       #:CDI (bv->signal (bv 0 1)) ; what is the cfglut shifting in. In this case its 1
;;;       #:CE (bv->signal (bv 1 1)) ; this is just whether we are "turning on" this module
;;;       #:CLK (bv->signal (bv 1 1) output7)
;;;       #:I0 (bv->signal i0) ; this is the one that is an actual input
;;;       #:I1 (bv->signal i1)
;;;       #:I2 (bv->signal (bv 0 1))
;;;       #:I3 (bv->signal (bv 0 1))
;;;       #:I4 (bv->signal (bv 0 1))
;;;       #:INIT (bv->signal (bv 0 32))
;;;       ))

;;; (define output8 (assoc-ref c8 'O6))
;;; ;;; (verify (assert (bveq (signal-value output3) (bvand i0 i1 i2))))
;;; (displayln output8)
;;; ;;; (displayln (bvand (bv 1 1) (bv 1 1) (bv 0 1)))
;;; (define c9 (xilinx-ultrascale-plus-cfglut5 
;;;       #:CDI (bv->signal (bv 0 1)) ; what is the cfglut shifting in. In this case its 1
;;;       #:CE (bv->signal (bv 1 1)) ; this is just whether we are "turning on" this module
;;;       #:CLK (bv->signal (bv 0 1) output8)
;;;       #:I0 (bv->signal i0) ; this is the one that is an actual input
;;;       #:I1 (bv->signal i1)
;;;       #:I2 (bv->signal i2)
;;;       #:I3 (bv->signal (bv 0 1))
;;;       #:I4 (bv->signal (bv 0 1))
;;;       #:INIT (bv->signal (bv 0 32))
;;;       ))

;;; (define output9 (assoc-ref c9 'O6))

;;; (define c10 (xilinx-ultrascale-plus-cfglut5 
;;;       #:CDI (bv->signal (bv 0 1)) ; what is the cfglut shifting in. In this case its 1
;;;       #:CE (bv->signal (bv 1 1)) ; this is just whether we are "turning on" this module
;;;       #:CLK (bv->signal (bv 1 1) output9)
;;;       #:I0 (bv->signal i0) ; this is the one that is an actual input
;;;       #:I1 (bv->signal i1)
;;;       #:I2 (bv->signal i2)
;;;       #:I3 (bv->signal (bv 0 1))
;;;       #:I4 (bv->signal (bv 0 1))
;;;       #:INIT (bv->signal (bv 0 32))
;;;       ))

;;; (define output10 (assoc-ref c10 'O6))

;;; (define c11 (xilinx-ultrascale-plus-cfglut5 
;;;       #:CDI (bv->signal (bv 0 1)) ; what is the cfglut shifting in. In this case its 1
;;;       #:CE (bv->signal (bv 1 1)) ; this is just whether we are "turning on" this module
;;;       #:CLK (bv->signal (bv 0 1) output10)
;;;       #:I0 (bv->signal i0) ; this is the one that is an actual input
;;;       #:I1 (bv->signal i1)
;;;       #:I2 (bv->signal i2)
;;;       #:I3 (bv->signal (bv 0 1))
;;;       #:I4 (bv->signal (bv 0 1))
;;;       #:INIT (bv->signal (bv 0 32))
;;;       ))

;;; (define output11 (assoc-ref c11 'O6))

;;; (define c12 (xilinx-ultrascale-plus-cfglut5 
;;;       #:CDI (bv->signal (bv 0 1)) ; what is the cfglut shifting in. In this case its 1
;;;       #:CE (bv->signal (bv 1 1)) ; this is just whether we are "turning on" this module
;;;       #:CLK (bv->signal (bv 1 1) output11)
;;;       #:I0 (bv->signal i0) ; this is the one that is an actual input
;;;       #:I1 (bv->signal i1)
;;;       #:I2 (bv->signal i2)
;;;       #:I3 (bv->signal (bv 0 1))
;;;       #:I4 (bv->signal (bv 0 1))
;;;       #:INIT (bv->signal (bv 0 32))
;;;       ))

;;; (define output12 (assoc-ref c12 'O6))

;;; (define c13 (xilinx-ultrascale-plus-cfglut5 
;;;       #:CDI (bv->signal (bv 0 1)) ; what is the cfglut shifting in. In this case its 1
;;;       #:CE (bv->signal (bv 1 1)) ; this is just whether we are "turning on" this module
;;;       #:CLK (bv->signal (bv 0 1) output12)
;;;       #:I0 (bv->signal i0) ; this is the one that is an actual input
;;;       #:I1 (bv->signal i1)
;;;       #:I2 (bv->signal i2)
;;;       #:I3 (bv->signal (bv 0 1))
;;;       #:I4 (bv->signal (bv 0 1))
;;;       #:INIT (bv->signal (bv 0 32))
;;;       ))

;;; (define output13 (assoc-ref c13 'O6))

;;; (define c14 (xilinx-ultrascale-plus-cfglut5 
;;;       #:CDI (bv->signal (bv 0 1)) ; what is the cfglut shifting in. In this case its 1
;;;       #:CE (bv->signal (bv 1 1)) ; this is just whether we are "turning on" this module
;;;       #:CLK (bv->signal (bv 1 1) output13)
;;;       #:I0 (bv->signal i0) ; this is the one that is an actual input
;;;       #:I1 (bv->signal i1)
;;;       #:I2 (bv->signal i2)
;;;       #:I3 (bv->signal (bv 1 1))
;;;       #:I4 (bv->signal (bv 0 1))
;;;       #:INIT (bv->signal (bv 0 32))
;;;       ))

;;; (define output14 (assoc-ref c14 'O6))
;;; (displayln output14)
;;; (define c15 (xilinx-ultrascale-plus-cfglut5 
;;;       #:CDI (bv->signal (bv 0 1)) ; what is the cfglut shifting in. In this case its 1
;;;       #:CE (bv->signal (bv 1 1)) ; this is just whether we are "turning on" this module
;;;       #:CLK (bv->signal (bv 0 1) output14)
;;;       #:I0 (bv->signal i0) ; this is the one that is an actual input
;;;       #:I1 (bv->signal i1)
;;;       #:I2 (bv->signal i2)
;;;       #:I3 (bv->signal (bv 1 1))
;;;       #:I4 (bv->signal (bv 0 1))
;;;       #:INIT (bv->signal (bv 0 32))
;;;       ))

;;; (define output15 (assoc-ref c15 'O6))

;;; (define c16 (xilinx-ultrascale-plus-cfglut5 
;;;       #:CDI (bv->signal (bv 0 1)) ; what is the cfglut shifting in. In this case its 1
;;;       #:CE (bv->signal (bv 1 1)) ; this is just whether we are "turning on" this module
;;;       #:CLK (bv->signal (bv 1 1) output15)
;;;       #:I0 (bv->signal i0) ; this is the one that is an actual input
;;;       #:I1 (bv->signal i1)
;;;       #:I2 (bv->signal i2)
;;;       #:I3 (bv->signal (bv 0 1))
;;;       #:I4 (bv->signal (bv 0 1))
;;;       #:INIT (bv->signal (bv 0 32))
;;;       ))

;;; (define output16 (assoc-ref c16 'O6))
;;; (displayln output16)
;;; (displayln (signal-value output16))
;;; (verify (assert (bveq (signal-value output16) (bvand i0 i1 i2))))