#lang errortrace racket
(require rosette
         rosette/lib/angelic
         racket/pretty
         (prefix-in lr: "../language.rkt")
         "../logical-to-physical.rkt"
         "../utils.rkt"
         "arch-config.rkt"
         "primitive-interface.rkt"
         (submod "primitive-interface.rkt" helpers))

; helper function that transforms logical inputs into the following three pieces
; of information:
; 1. physical-inputs
; 2. bitwidth (num-luts)
; 3. lut-width (bits-per-lut)
(define (process-inputs logical-inputs)
  (let* ([bitwidth (apply max (map bvlen logical-inputs))]
         [lut-width (length logical-inputs)]
         [logical-inputs (map (lambda (v)
                                (choose* (lr:zero-extend v (bitvector bitwidth))
                                         (lr:dup-extend v (bitvector bitwidth))))
                              logical-inputs)]
         [physical-inputs (logical-to-physical-mapping (choose* '(bitwise) '(bitwise-reverse))
                                                       logical-inputs)]
         [physical-inputs (for/list ([i bitwidth])
                            (lr:list-ref physical-inputs i))])
    (list physical-inputs bitwidth lut-width)))

(define (bitwise-sketch-generator arch-config logical-inputs)
  (match-define (list physical-inputs bitwidth lut-width) (process-inputs logical-inputs))
  (let* (; This proc is fed to foldr. It produces a list of
         ; (cons lr:primitive symbolic-state) pairs, allowing symbolic state to
         ; be reused between lr:primitives. The result of this should have `(map
         ; car ...)` applied to it to discard symbolic states
         [proc (lambda (phys-input xs)
                 ; First, make the primitive-interface we want to implement
                 (let* ([prim-interface (make-lut-interface lut-width 1 phys-input)]
                        ; Next, grab previous symbolic state if it exists
                        [symbolic-state (match xs
                                          [(list (cons _ sym-state) _ ...) sym-state]
                                          ['() #f])]
                        ; Implement the primitive interface
                        [impl (implement-primitive-interface arch-config
                                                             prim-interface
                                                             #:symbolic-state symbolic-state)])
                   (cons impl xs)))]

         [impl-output-pairs (foldr proc '() physical-inputs)]
         [impl-pairs (map car impl-output-pairs)]
         [outputs (physical-to-logical-mapping (choose* '(bitwise) '(bitwise-reverse)) impl-pairs)])
    outputs))

(define (luts-with-carry-sketch-generator arch-config logical-inputs)
  (match-define (list physical-inputs num-luts bits-per-lut) (process-inputs logical-inputs))
  (let* ([prim-interface (make-lut-with-carry-interface num-luts bits-per-lut physical-inputs)]
         [impl-state-pair (implement-primitive-interface arch-config prim-interface)]
         [lut-w-carry (car impl-state-pair)]
         [sym-state (cdr impl-state-pair)]
         [outputs (physical-to-logical-mapping (choose* '(bitwise) '(bitwise-reverse)) lut-w-carry)])
    (println prim-interface)
    (println lut-w-carry)))

;;;;;;;;; TESTS ;;;;;;;;
(module+ test
  (require rackunit
           (submod "arch-config.rkt" test-values))
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ; The following expression tests bitwise sketch generators forms on 2-bit
  ; inputs
  (with-terms
   (with-vc
    (begin
      (define-symbolic a b c d (bitvector 2))
      (let ([sketch-1 (bitwise-sketch-generator ecp5:config (list a))]
            [sketch-2 (bitwise-sketch-generator ecp5:config (list a b))])
        ; Check sketch:
        (check-match sketch-1
                     ; Sketch should produce a physical-to-logical mapping
                     (physical-to-logical-mapping
                      ; The first arg is a union over '(bitwise) and '(bitwise-reverse)
                      ; TODO: Make a stronger assertion about this form
                      (list _)
                      ; The second arg is a list of primitives.
                      ;
                      ; There should be two primitives since we are
                      ; working with logical inputs of 2 bits: each bit
                      ; needs a single 'LUT' in this sketch
                      ;
                      ; TODO: make stronger assertions on the inputs to each of the luts
                      (list (lr:primitive 'LUT4 (lr:append (? list)) (list (cons 'INIT _)))
                            (lr:primitive 'LUT4 (lr:append (? list)) (list (cons 'INIT _))))))
        (check-match sketch-2
                     ; Sketch should produce a physical-to-logical mapping
                     (physical-to-logical-mapping
                      ; The first arg is a union over '(bitwise) and '(bitwise-reverse)
                      ; TODO: Make a stronger assertion about this form
                      (list _)
                      ; The second arg is a list of primitives.
                      ;
                      ; There should be two primitives since we are
                      ; working with logical inputs of 2 bits: each bit
                      ; needs a single 'LUT' in this sketch
                      ;
                      ; TODO: make stronger assertions on the inputs to each of the luts
                      (list (lr:primitive 'LUT4 (lr:append (? list)) (list (cons 'INIT (? (bitvector 16)))))
                            (lr:primitive 'LUT4 (lr:append (? list)) (list (cons 'INIT (? (bitvector 16))))))))))))
  (clear-terms!)
  (clear-vc!)

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ; The following expression tests luts with carry sketch generators forms on
  ; 2-bit inputs
  (with-terms
   (with-vc (begin
              (define-symbolic a b c d (bitvector 2))
              (let ([sketch-1 (luts-with-carry-sketch-generator ecp5:config (list a))])
                ; Check that the sketch is of the correct form.
                (check-match
                 sketch-1
                 ; Sketch should produce a physical-to-logical mapping
                 (physical-to-logical-mapping
                  ; The first arg is a union over '(bitwise) and '(bitwise-reverse)
                  ; TODO: Make a stronger assertion about this form
                  (list _)
                  ; The second arg is a list of primitives.
                  ;
                  ; There should be two primitives since we are
                  ; working with logical inputs of 2 bits: each bit
                  ; needs a single 'LUT' in this sketch
                  (list (lr:primitive 'CCU2C (lr:append (? list)) (? list)))))
                ; Sketch is of the correct form but we haven't tried to match
                ; the assoc list of paramters
                (match-let ([(lr:primitive 'CCU2C _ params) sketch-1])
                  (check-match (assoc params 'INIT0) (cons 'INIT0 (? (bitvector 16))))
                  (check-match (assoc params 'INIT1) (cons 'INIT1 (? (bitvector 16))))
                  (check-match (assoc params 'INJECT1_0) (cons 'INJECT1_0 (? (bitvector 1))))
                  (check-match (assoc params 'INJECT1_1) (cons 'INJECT1_1 (? (bitvector 1))))))))))
