#lang errortrace racket/base

(require "generated/xilinx-ultrascale-plus-cfglut5.rkt"
         rackunit
         rosette
         rosette/lib/synthax
         "signal.rkt")
;;; (define bv1? (bitvector 1))
;;; (displayln (bv1? (bv 1 1)))


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
(define (stack-luts CDI CLK I0 I1 I2 I3 stackID #:STATE [STATE '()] #:INIT [INIT (bv 0 32)])
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
                  #:INIT (bv->signal INIT)
                  #:NAME (string-append "layer1" stackID)
                  )]
            ;;; [debug (displayln "here")]
            [layer2 (xilinx-ultrascale-plus-cfglut5
                  #:CDI (bv->signal CDI) ; what is the cfglut shifting in. In this case its 1
                  #:CE (bv->signal (bv 1 1)) ; this is just whether we are "turning on" this module
                  #:CLK (bv->signal CLK)
                  #:I0 (signal I0 STATE) ; this is the one that is an actual input
                  #:I1 (bv->signal I1)
                  #:I2 (bv->signal I2)
                  #:I3 (bv->signal I3)
                  #:I4 (bv->signal (bv 1 1))
                  #:INIT (bv->signal INIT)
                  #:NAME (string-append "layer2" stackID)
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
                  #:INIT (bv->signal INIT)
                  #:NAME (string-append "layer3" stackID)
                  )]
            ;;; concat all the answers and states together
            [output-ans (concat (signal-value (assoc-ref layer1 'O6)) 
                                (signal-value (assoc-ref layer1 'O5)))]
            [output-state (append (signal-state (assoc-ref layer1 'O6)) 
                                  (signal-state (assoc-ref layer1 'O5)))]
            ;;; [layer1 layer1]
            ;;; [layer2 layer2]
            
            ;;; [layer3 layer3]
            ;;; [output-ans (concat (signal-value (assoc-ref layer1 'O6)) 
            ;;;                     (signal-value (assoc-ref layer1 'O5))
            ;;;                     (signal-value (assoc-ref layer2 'O6)) 
            ;;;                     (signal-value (assoc-ref layer2 'O5)) 
            ;;;                     (signal-value (assoc-ref layer3 'O6)) 
            ;;;                     (signal-value (assoc-ref layer3 'O5)))]
            ;;; [output-state (append (signal-state (assoc-ref layer1 'O6)) 
            ;;;                       (signal-state (assoc-ref layer1 'O5))
            ;;;                       (signal-state (assoc-ref layer2 'O6)) 
            ;;;                       (signal-state (assoc-ref layer2 'O5)) 
            ;;;                       (signal-state (assoc-ref layer3 'O6)) 
            ;;;                       (signal-state (assoc-ref layer3 'O5)))]
            
            )
            (cons output-ans output-state)
      ))

(define (run-multiple-times inputs i0 i1 i2 i3 stackID)
  (let loop ((cdi-values inputs)
             (clk (bv 0 1))
             (prev-output '('() '())))
    (cond
      ((null? cdi-values)
       prev-output)  ; Return the final output-value
      (else
       (let* ((cdi (car cdi-values))
            ;;;   (debug (displayln "got here"))
              (output (stack-luts cdi clk i0 i1 i2 i3 stackID #:STATE (cdr prev-output)))
              (debug (if (bveq clk (bv 1 1)) (displayln output) (displayln "\n")))
              (next-clk (if (bveq clk (bv 0 1)) (bv 1 1) (bv 0 1))))
         (loop (cdr cdi-values) next-clk output))))))

;;; (define shifters (list (bv 1 1) (bv 1 1) (bv 1 1) (bv 1 1) (bv 0 1) (bv 0 1)))
;;; (define fencepost (stack-luts (bv 0 1) (bv 1 1) (bv 0 1) (bv 0 1) (bv 0 1) (bv 0 1) "name" #:STATE (cdr (run-multiple-times shifters (bv 1 1) (bv 0 1) (bv 0 1) (bv 0 1) "name" ))))
;;; (define concrete-run (run-multiple-times shifters (bv 1 1) (bv 0 1) (bv 0 1) (bv 0 1)))


;;; (displayln (car fencepost))
;;; (displayln (bitvector? i0))

;; each stack requires its own `run-multiple-times` call (with its own inputs). The list of inputs is the same for each stack,
;; and is a list of the 32 bits of CDI that are being streamed in.
;;; (run-multiple-times (list (bv 0 1) (bv 1 1) (bv 0 1) (bv 0 1) (bv 0 1)) (bv 1 1) (bv 0 1) (bv 0 1) (bv 0 1) )

;; write semantics for the function itself

;; constant vector
;;; (define (const-vector) (list (bv 3 4) (bv 4 4) (bv 4 4) (bv 2 4) (bv 4 4) (bv 3 4) (bv 5 4) (bv 2 4)))
(define (const-vector) (list (bv 0 4) (bv 0 4) (bv 0 4) (bv 0 4) (bv 0 4) (bv 0 4) (bv 0 4) (bv 0 4)))
(define-symbolic x0 (bitvector 4))
(define-symbolic x1 (bitvector 4))
(define-symbolic x2 (bitvector 4))
(define-symbolic x3 (bitvector 4))
(define-symbolic x4 (bitvector 4))
(define-symbolic x5 (bitvector 4))
(define-symbolic x6 (bitvector 4))
(define-symbolic x7 (bitvector 4))
(define-symbolic x8 (bitvector 4))

;; 32 cdi bits
(define-symbolic cdi1 (bitvector 1))
(define-symbolic cdi2 (bitvector 1))
(define-symbolic cdi3 (bitvector 1))
(define-symbolic cdi4 (bitvector 1))
(define-symbolic cdi5 (bitvector 1))
(define-symbolic cdi6 (bitvector 1))
(define-symbolic cdi7 (bitvector 1))
(define-symbolic cdi8 (bitvector 1))
(define-symbolic cdi9 (bitvector 1))
(define-symbolic cdi10 (bitvector 1))
(define-symbolic cdi11 (bitvector 1))
(define-symbolic cdi12 (bitvector 1))
(define-symbolic cdi13 (bitvector 1))
(define-symbolic cdi14 (bitvector 1))
(define-symbolic cdi15 (bitvector 1))
(define-symbolic cdi16 (bitvector 1))
(define-symbolic cdi17 (bitvector 1))
(define-symbolic cdi18 (bitvector 1))
(define-symbolic cdi19 (bitvector 1))
(define-symbolic cdi20 (bitvector 1))
(define-symbolic cdi21 (bitvector 1))
(define-symbolic cdi22 (bitvector 1))
(define-symbolic cdi23 (bitvector 1))
(define-symbolic cdi24 (bitvector 1))
(define-symbolic cdi25 (bitvector 1))
(define-symbolic cdi26 (bitvector 1))
(define-symbolic cdi27 (bitvector 1))
(define-symbolic cdi28 (bitvector 1))
(define-symbolic cdi29 (bitvector 1))
(define-symbolic cdi30 (bitvector 1))
(define-symbolic cdi31 (bitvector 1))
(define-symbolic cdi32 (bitvector 1))
;;; (list cdi1 cdi1 cdi2 cdi2 cdi3 cdi3 cdi4 cdi4 cdi5 cdi5 cdi6 cdi6 cdi7 cdi7 cdi8 cdi8 cdi9 cdi9 
;;; cdi10 cdi10 cdi11 cdi11 cdi12 cdi12 cdi13 cdi13 cdi14 cdi14 cdi15 cdi15 cdi16 cdi16 cdi17 cdi17 
;;; cdi18 cdi18 cdi19 cdi19 cdi20 cdi20 cdi21 cdi21 cdi22 cdi22 cdi23 cdi23 cdi24 cdi24 cdi25 cdi25 
;;; cdi26 cdi26 cdi27 cdi27 cdi28 cdi28 cdi29 cdi29 cdi30 cdi30 cdi31 cdi31 cdi32 cdi32)

(define (f bit)
(let* (
      [sum (bv 0 6)]
      [sum (bvadd (bvmul (zero-extend (extract bit bit x0) (bitvector 6)) (zero-extend (first (const-vector)) (bitvector 6))) sum)]
      [sum (bvadd (bvmul (zero-extend (extract bit bit x1) (bitvector 6)) (zero-extend (second (const-vector)) (bitvector 6))) sum)]
      [sum (bvadd (bvmul (zero-extend (extract bit bit x2) (bitvector 6)) (zero-extend (third (const-vector)) (bitvector 6))) sum)]
      [sum (bvadd (bvmul (zero-extend (extract bit bit x3) (bitvector 6)) (zero-extend (fourth (const-vector)) (bitvector 6))) sum)]
      [sum (bvadd (bvmul (zero-extend (extract bit bit x4) (bitvector 6)) (zero-extend (fifth (const-vector)) (bitvector 6))) sum)]
      [sum (bvadd (bvmul (zero-extend (extract bit bit x5) (bitvector 6)) (zero-extend (sixth (const-vector)) (bitvector 6)))sum)]
      [sum (bvadd (bvmul (zero-extend (extract bit bit x6) (bitvector 6)) (zero-extend (seventh (const-vector)) (bitvector 6))) sum)]
      [sum (bvadd (bvmul (zero-extend (extract bit bit x7) (bitvector 6)) (zero-extend (eighth (const-vector)) (bitvector 6))) sum)]
)
sum))

(define (f-lut bit)
      (let* (
       [stack1 (run-multiple-times (list cdi1 cdi1 cdi2 cdi2 cdi3 cdi3 cdi4 cdi4 
        cdi5 cdi5 cdi6 cdi6 cdi7 cdi7 cdi8 cdi8 cdi9 cdi9 
        cdi10 cdi10 cdi11 cdi11 cdi12 cdi12 cdi13 cdi13 cdi14 
        cdi14 cdi15 cdi15 cdi16 cdi16 cdi17 cdi17 
        cdi18 cdi18 cdi19 cdi19 cdi20 cdi20 cdi21 cdi21 
        cdi22 cdi22 cdi23 cdi23 cdi24 cdi24 cdi25 cdi25 
        cdi26 cdi26 cdi27 cdi27 cdi28 cdi28 cdi29 cdi29 
        cdi30 cdi30 cdi31 cdi31 cdi32 cdi32) (extract bit bit x0) (extract bit bit x1)
      (extract bit bit x2) (extract bit bit x3) "stack1")]
      [fencepost (stack-luts (bv 0 1) (bv 0 1) (extract bit bit x0) (extract bit bit x1)
      (extract bit bit x2) (extract bit bit x3) "stack1" #:STATE (cdr stack1))]
      [stack2 (run-multiple-times (list cdi1 cdi1 cdi2 cdi2 cdi3 cdi3 cdi4 cdi4 
        cdi5 cdi5 cdi6 cdi6 cdi7 cdi7 cdi8 cdi8 cdi9 cdi9 
        cdi10 cdi10 cdi11 cdi11 cdi12 cdi12 cdi13 cdi13 cdi14 
        cdi14 cdi15 cdi15 cdi16 cdi16 cdi17 cdi17 
        cdi18 cdi18 cdi19 cdi19 cdi20 cdi20 cdi21 cdi21 
        cdi22 cdi22 cdi23 cdi23 cdi24 cdi24 cdi25 cdi25 
        cdi26 cdi26 cdi27 cdi27 cdi28 cdi28 cdi29 cdi29 
        cdi30 cdi30 cdi31 cdi31 cdi32 cdi32) (extract bit bit x4) (extract bit bit x5)
      (extract bit bit x6) (extract bit bit x7) "stack2")]
      [fencepost2 (stack-luts (bv 0 1) (bv 0 1) (extract bit bit x0) (extract bit bit x1)
      (extract bit bit x2) (extract bit bit x3) "stack2" #:STATE (cdr stack2))]
      [output (bvadd (car fencepost) (car fencepost2))]
      ) output)
      )

;;; (define (f-lut-concrete bit)
;;;       (let* (
;;;        [stack1 (run-multiple-times (list (bv 0 1) (bv 0 1) (bv 0 1) (bv 0 1) (bv 0 1) (bv 0 1) (bv 1 1) (bv 1 1) 
;;;         (bv 1 1) (bv 1 1) (bv 1 1) (bv 1 1) (bv 1 1) (bv 1 1) (bv 1 1) (bv 1 1) (bv 1 1) (bv 1 1) 
;;;         (bv 1 1) (bv 1 1) (bv 1 1) (bv 1 1) (bv 1 1) (bv 1 1) (bv 1 1) (bv 1 1) (bv 1 1) 
;;;         (bv 1 1) (bv 1 1) (bv 1 1) (bv 1 1) (bv 1 1) (bv 1 1) (bv 1 1) 
;;;         (bv 1 1) (bv 1 1) (bv 1 1) (bv 1 1) (bv 1 1) (bv 1 1) (bv 1 1) (bv 1 1) 
;;;         (bv 1 1) (bv 1 1) (bv 1 1) (bv 1 1) (bv 1 1) (bv 1 1) (bv 1 1) (bv 1 1) 
;;;         (bv 1 1) (bv 1 1) (bv 1 1) (bv 1 1) (bv 1 1) (bv 1 1) (bv 1 1) (bv 1 1) 
;;;         (bv 1 1) (bv 1 1) (bv 1 1) (bv 1 1) (bv 1 1) (bv 1 1) ) (extract bit bit y0) (extract bit bit y1)
;;;       (extract bit bit y2) (extract bit bit y3))]
;;;       [debug (displayln stack1)]
;;;       [stack2 (run-multiple-times (list (bv 0 1) (bv 0 1) (bv 0 1) (bv 0 1) (bv 0 1) (bv 0 1) (bv 1 1) (bv 1 1) 
;;;         (bv 1 1) (bv 1 1) (bv 1 1) (bv 1 1) (bv 1 1) (bv 1 1) (bv 1 1) (bv 1 1) (bv 1 1) (bv 1 1) 
;;;         (bv 1 1) (bv 1 1) (bv 1 1) (bv 1 1) (bv 1 1) (bv 1 1) (bv 1 1) (bv 1 1) (bv 1 1) 
;;;         (bv 1 1) (bv 1 1) (bv 1 1) (bv 1 1) (bv 1 1) (bv 1 1) (bv 1 1) 
;;;         (bv 1 1) (bv 1 1) (bv 1 1) (bv 1 1) (bv 1 1) (bv 1 1) (bv 1 1) (bv 1 1) 
;;;         (bv 1 1) (bv 1 1) (bv 1 1) (bv 1 1) (bv 1 1) (bv 1 1) (bv 1 1) (bv 1 1) 
;;;         (bv 1 1) (bv 1 1) (bv 1 1) (bv 1 1) (bv 1 1) (bv 1 1) (bv 1 1) (bv 1 1) 
;;;         (bv 1 1) (bv 1 1) (bv 1 1) (bv 1 1) (bv 1 1) (bv 1 1) ) (extract bit bit y4) (extract bit bit y5)
;;;       (extract bit bit y6) (extract bit bit y7))]
;;;       [debug (displayln stack2)]
;;;       [output (bvadd stack1 stack2)]
;;;       ) output)
;;;       )
;;; ;;; (displayln (f-lut-concrete 1))
;;; ;;; (displayln (f 0))
;;; (define-symbolic cdi-symbolic (bitvector 32))



(define (simple-const) (list (bv 0 1) (bv 1 1) (bv 1 1) (bv 1 1)))

;;;             #:guarantee (assert (bveq (f 0) (f-static cdi-symbolic 0)))))

(define y0 (bv 1 1))
(define y1 (bv 0 1))
(define y2 (bv 1 1))
(define y3 (bv 0 1))
(define y4 (bv 0 1))
(define y5 (bv 1 1))
(define y6 (bv 1 1))
(define y7 (bv 0 1))

(define (simple-f bit)
(let* (
      [sum (bv 0 6)]
      [sum (bvadd (bvmul (zero-extend (extract bit bit y0) (bitvector 6)) (zero-extend (first (simple-const)) (bitvector 6))) sum)]
      [sum (bvadd (bvmul (zero-extend (extract bit bit y1) (bitvector 6)) (zero-extend (second (simple-const)) (bitvector 6))) sum)]
      [sum (bvadd (bvmul (zero-extend (extract bit bit y2) (bitvector 6)) (zero-extend (third (simple-const)) (bitvector 6))) sum)]
      [sum (bvadd (bvmul (zero-extend (extract bit bit y3) (bitvector 6)) (zero-extend (fourth (simple-const)) (bitvector 6))) sum)]
      ;;; [sum (bvadd (bvmul (zero-extend (extract bit bit y4) (bitvector 6)) (zero-extend (fifth (const-vector)) (bitvector 6))) sum)]
      ;;; [sum (bvadd (bvmul (zero-extend (extract bit bit y5) (bitvector 6)) (zero-extend (sixth (const-vector)) (bitvector 6)))sum)]
      ;;; [sum (bvadd (bvmul (zero-extend (extract bit bit y6) (bitvector 6)) (zero-extend (seventh (const-vector)) (bitvector 6))) sum)]
      ;;; [sum (bvadd (bvmul (zero-extend (extract bit bit y7) (bitvector 6)) (zero-extend (eighth (const-vector)) (bitvector 6))) sum)]
)
sum))

(define (simple-f-lut bit)
(let* (
      [stack1 (run-multiple-times (list (bv 1 1) (bv 1 1) (bv 1 1) (bv 1 1) (bv 0 1) (bv 0 1) (bv 1 1) (bv 1 1) (bv 1 1) (bv 1 1) (bv 1 1) (bv 1 1) (bv 1 1) (bv 1 1) (bv 1 1) (bv 1 1)) (extract bit bit y0) (extract bit bit y1)
      (extract bit bit y2) (extract bit bit y3) "stack1")]
      ;;; [debug (displayln stack1)]
      [fencepost (stack-luts (bv 0 1) (bv 0 1) (extract bit bit y0) (extract bit bit y1)
      (extract bit bit y2) (extract bit bit y3) "stack1" #:STATE (cdr stack1))]
      [debug (displayln fencepost)]

) (car fencepost)))

(simple-f 0)
(synthesize #:forall '() #:guarantee (assert (bveq (simple-f 0) (simple-f-lut 0))))
