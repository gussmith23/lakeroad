#lang errortrace racket/base

(require "generated/xilinx-ultrascale-plus-cfglut5.rkt"
         rackunit
         rosette
         rosette/lib/synthax
         "signal.rkt")
(define bv1? (bitvector 1))
(displayln (bv1? (bv 1 1)))


;;; (define c1 (xilinx-ultrascale-plus-cfglut5 
;;;       #:CDI (bv->signal (bv 1 1)) ; what is the cfglut shifting in. In this case its 1
;;;       #:CE (bv->signal (bv 1 1)) ; this is just whether we are "turning on" this module
;;;       #:CLK (bv->signal (bv 0 1))
;;;       #:I0 (bv->signal i0) ; this is the one that is an actual input
;;;       #:I1 (bv->signal i1)
;;;       #:I2 (bv->signal (bv 0 1))
;;;       #:I3 (bv->signal (bv 0 1))
;;;       #:I4 (bv->signal (bv 0 1))
;;;       #:INIT (bv->signal init)
;;;       ))
;;; stack of 3 LUTs, outputs the intermediate value and state,
(define (stack-luts CDI CLK I0 I1 I2 I3 #:STATE [STATE '()])
      (let* (
            [layer1 (xilinx-ultrascale-plus-cfglut5 
                  #:CDI (bv->signal CDI) ; what is the cfglut shifting in. In this case its 1
                  #:CE (bv->signal (bv 1 1)) ; this is just whether we are "turning on" this module
                  #:CLK (bv->signal CLK)
                  #:I0 (signal I0 STATE) ; this is the one that is an actual input
                  #:I1 (bv->signal I1)
                  #:I2 (bv->signal I2)
                  #:I3 (bv->signal I3)
                  #:I4 (bv->signal (bv 1 1))
                  #:INIT (bv->signal (bv 0 32))
                  )]
            [debug (displayln "here")]
            [layer2 (xilinx-ultrascale-plus-cfglut5
                  #:CDI (bv->signal CDI) ; what is the cfglut shifting in. In this case its 1
                  #:CE (bv->signal (bv 1 1)) ; this is just whether we are "turning on" this module
                  #:CLK (bv->signal CLK)
                  #:I0 (signal I0 STATE) ; this is the one that is an actual input
                  #:I1 (bv->signal I1)
                  #:I2 (bv->signal I2)
                  #:I3 (bv->signal I3)
                  #:I4 (bv->signal (bv 1 1))
                  #:INIT (bv->signal (bv 0 32))
                  )] 
            [layer3 (xilinx-ultrascale-plus-cfglut5
                  #:CDI (bv->signal CDI) ; what is the cfglut shifting in. In this case its 1
                  #:CE (bv->signal (bv 1 1)) ; this is just whether we are "turning on" this module
                  #:CLK (bv->signal CLK)
                  #:I0 (signal I0 STATE) ; this is the one that is an actual input
                  #:I1 (bv->signal I1)
                  #:I2 (bv->signal I2)
                  #:I3 (bv->signal I3)
                  #:I4 (bv->signal (bv 1 1))
                  #:INIT (bv->signal (bv 0 32))
                  )]
            ;;; concat all the answers and states together
            [layer1 layer1]
            [layer2 layer2]
            
            [layer3 layer3]
            [output-ans (concat (signal-value (assoc-ref layer1 'O6)) 
                                (signal-value (assoc-ref layer1 'O5))
                                (signal-value (assoc-ref layer2 'O6)) 
                                (signal-value (assoc-ref layer2 'O5)) 
                                (signal-value (assoc-ref layer3 'O6)) 
                                (signal-value (assoc-ref layer3 'O6)))]
            [output-state (append (signal-state (assoc-ref layer1 'O6)) 
                                  (signal-state (assoc-ref layer1 'O5))
                                  (signal-state (assoc-ref layer2 'O6)) 
                                  (signal-state (assoc-ref layer2 'O5)) 
                                  (signal-state (assoc-ref layer3 'O6)) 
                                  (signal-state (assoc-ref layer3 'O6)))]
            
            )
            (cons output-ans output-state)
      ))

(define (run-multiple-times inputs i0 i1 i2 i3)
  (let loop ((cdi-values inputs)
             (clk (bv 0 1))
             (prev-output '('() '())))
    (cond
      ((null? cdi-values)
       (car prev-output))  ; Return the final output-value
      (else
       (let* ((cdi (car cdi-values))
              (debug (displayln "got here"))
              (output (stack-luts cdi clk i0 i1 i2 i3 #:STATE (cdr prev-output)))
              (next-clk (if (bveq clk (bv 0 1)) (bv 1 1) (bv 0 1))))
         (loop (cdr cdi-values) next-clk output))))))

(define-symbolic i0 (bitvector 1))
;;; (displayln (bitvector? i0))

;; each stack requires its own `run-multiple-times` call (with its own inputs). The list of inputs is the same for each stack,
;; and is a list of the 32 bits of CDI that are being streamed in.
(run-multiple-times (list (bv 0 1) (bv 1 1) (bv 0 1) (bv 0 1) (bv 0 1)) (bv 1 1) (bv 0 1) (bv 0 1) (bv 0 1) )
