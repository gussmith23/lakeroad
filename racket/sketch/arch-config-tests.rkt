#lang errortrace racket

(require (prefix-in lr: "../language.rkt")
         (submod "primitive-interface.rkt" helpers)
         "../utils.rkt"
         "../interpreter.rkt"
         "arch-config.rkt"
         (submod "arch-config.rkt" test-values)
         "primitive-interface.rkt"
         rosette
         racket/pretty)

; helper function to make matches not horrible. While in general we cannot
; interpret the inputs to a lr:primitive struct independently (we may need to
; synthesize over it), for any of the following tests we will be using concrete
; non/symbolic inputs, and we can go ahead and interpret those now.
(define (interpret-primitive-inputs p)
  (match p
    [(lr:primitive name inputs parameters)
     (begin
       (printf "\033[32;1mInputs:\033[0m~a\n" p)
       (lr:primitive name (interpret inputs) parameters))]))

(module+ test
  (require rackunit)

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;;                          TEST LUT IMPLEMENTATIONS                        ;;
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ; ========================================================================== ;
  ; Test smaller LUT implementations (> 4 inputs)                              ;
  ;                                                                            ;
  ; This test checks that ecp5:impl works correctly on LUT implementations     ;
  ; with 4 or fewer inputs                                                     ;
  ; ========================================================================== ;
  (test-begin
   (check-equal? (arch-config-primitives ecp5:config) (list ecp5:lut4 ecp5:l6mux21))
   ; ------------------------------------------------------------------------- ;
   ; Define inputs of different widths. Each input begins with (bv 0 1) and    ;
   ; the remaining inputs are all (bv 1 1). This allows us to check ordering   ;
   ; ------------------------------------------------------------------------- ;
   (define inputs-4 (list 1 2 3 4))
   (define inputs-3 (list 1 2 3))
   (define inputs-2 (list 1 2))
   (define inputs-1 (list 1))
   ; ------------------------------------------------------------------------- ;
   ; Define lut interfaces of varying widths. These should all be implemented  ;
   ; with a Lattice LUT4 primitive (we test larger luts requiring multiple     ;
   ; LUT4 primitives below.                                                    ;
   ; ------------------------------------------------------------------------- ;
   (define lut4-interface (make-lut-interface 4 1 inputs-4))
   (define lut3-interface (make-lut-interface 3 1 inputs-3))
   (define lut2-interface (make-lut-interface 2 1 inputs-2))
   (define lut1-interface (make-lut-interface 1 1 inputs-1))
   ; ------------------------------------------------------------------------- ;
   ; Implement the above lut primitive interfaces.                             ;
   ; ------------------------------------------------------------------------- ;
   (match-define (cons lut4-prim lut4-sym-state)
     (ecp5:impl ecp5:config lut4-interface #:symbolic-state #f))
   (match-define (cons lut3-prim lut3-sym-state)
     (ecp5:impl ecp5:config lut3-interface #:symbolic-state #f))
   (match-define (cons lut2-prim lut2-sym-state)
     (ecp5:impl ecp5:config lut2-interface #:symbolic-state #f))
   (match-define (cons lut1-prim lut1-sym-state)
     (ecp5:impl ecp5:config lut1-interface #:symbolic-state #f))
   ; ------------------------------------------------------------------------- ;
   ; Test that these implementations are all the correct form.                 ;
   ; ------------------------------------------------------------------------- ;
   ; helper: this function takes an expected inputs list and returns a lambda
   ; that takes an actual inputs as observed by running the ecp5:impl function
   ; and compares them.
   ;
   ; When the inputs list is too short (< 4) the returned lambda right pads with
   ; (bv 1 1) to make it conform with the implementation [if a LUT4 is passed
   ; bits (list a b) as inputs it gets padded to (list a b (bv 1 1) (bv 1 1)) so
   ; that all LUT4 input ports are defined].
   (define (helper expected-xs)
     (lambda (actual-xs)
       (equal? (lr:append (list expected-xs (make-list (- 4 (length expected-xs)) (bv 1 1))))
               actual-xs)))
   (check-match (interpret-primitive-inputs lut4-prim)
                (lr:primitive 'LUT4 inputs-4 (list (cons 'INIT _))))
   ; TODO: i'm having trouble getting the (bv _ _)s to match when I change them
   ; to literals (bv #b1 1)
   (check-match
    (interpret-primitive-inputs lut3-prim)
    (lr:primitive 'LUT4 (list (cons 'A 1) (cons 'B 2) (cons 'C 3) (cons 'D (bv _ _))) (? list?)))
   (check-match (interpret-primitive-inputs lut2-prim)
                (lr:primitive 'LUT4
                              (list (cons 'A 1) (cons 'B 2) (cons 'C (bv _ _)) (cons 'D (bv _ _)))
                              (? list?)))
   (check-match
    lut1-prim
    (lr:primitive
     'LUT4
     (lr:map cons (list '(A B C D) (lr:append (list inputs-1 (list (bv _ _) (bv _ _) (bv _ _))))))
     (list (cons 'INIT _))))
   ; ------------------------------------------------------------------------- ;
   ; Test that symbolic states are of the correct form                         ;
   ;                                                                           ;
   ; Each symbolic state should be of the form (list (cons 'INIT ??))          ;
   ; ------------------------------------------------------------------------- ;
   (check-match lut4-sym-state (list (cons 'INIT _)))
   (check-match lut3-sym-state (list (cons 'INIT _)))
   (check-match lut2-sym-state (list (cons 'INIT _)))
   (check-match lut1-sym-state (list (cons 'INIT _)))
   ; ------------------------------------------------------------------------- ;
   ; Test that fresh symbolic states are allocated                             ;
   ;                                                                           ;
   ; When #:symbolic-state #f is passed (or no value is specified) fresh       ;
   ; symbolic state should be allocated. To test this we rerun ecp5:impl and   ;
   ; ensure that the symbolic states are not equal.                            ;
   ;                                                                           ;
   ; To sanity check that the symbolic states are of the correct form we will  ;
   ; rerun the rpevious tests and then assert that previuos sym state and this ;
   ; newly defined fresh symbolic state are not equal. This means that the     ;
   ; only thing that is possibly different is the wild card that is matched .  ;
   ; ------------------------------------------------------------------------- ;
   ; Define fresh symbolic state
   (match-define (cons _ lut4-sym-state-fresh)
     (ecp5:impl ecp5:config lut4-interface #:symbolic-state #f))
   (match-define (cons _ lut3-sym-state-fresh)
     (ecp5:impl ecp5:config lut3-interface #:symbolic-state #f))
   (match-define (cons _ lut2-sym-state-fresh)
     (ecp5:impl ecp5:config lut2-interface #:symbolic-state #f))
   (match-define (cons _ lut1-sym-state-fresh)
     (ecp5:impl ecp5:config lut1-interface #:symbolic-state #f))
   (check-match lut4-sym-state-fresh (list (cons 'INIT _)))
   (check-match lut3-sym-state-fresh (list (cons 'INIT _)))
   (check-match lut2-sym-state-fresh (list (cons 'INIT _)))
   (check-match lut1-sym-state-fresh (list (cons 'INIT _)))
   (check-not-equal? lut4-sym-state-fresh lut4-sym-state)
   (check-not-equal? lut3-sym-state-fresh lut3-sym-state)
   (check-not-equal? lut2-sym-state-fresh lut2-sym-state)
   (check-not-equal? lut1-sym-state-fresh lut1-sym-state)
   ; ------------------------------------------------------------------------- ;
   ; Test that symbolic states are reused when specified                       ;
   ;                                                                           ;
   ; When #:symbolic-state is passed a previously allocated symbolic state     ;
   ; that state should be reused.
   ;                                                                           ;
   ; To test this we rerun ecp5:impl and ensure that the symbolic states are   ;
   ; equal.                                                                    ;
   ; ------------------------------------------------------------------------- ;
   ; Define fresh symbolic state
   (match-define (cons _ lut4-sym-state-reused)
     (ecp5:impl ecp5:config lut4-interface #:symbolic-state lut4-sym-state))
   (match-define (cons _ lut3-sym-state-reused)
     (ecp5:impl ecp5:config lut3-interface #:symbolic-state lut3-sym-state))
   (match-define (cons _ lut2-sym-state-reused)
     (ecp5:impl ecp5:config lut2-interface #:symbolic-state lut2-sym-state))
   (match-define (cons _ lut1-sym-state-reused)
     (ecp5:impl ecp5:config lut1-interface #:symbolic-state lut1-sym-state))
   (check-equal? lut4-sym-state-reused lut4-sym-state)
   (check-equal? lut3-sym-state-reused lut3-sym-state)
   (check-equal? lut2-sym-state-reused lut2-sym-state)
   (check-equal? lut1-sym-state-reused lut1-sym-state))

  ; ========================================================================== ;
  ; Test larger LUT implementations (> 4 inputs)                               ;
  ;                                                                            ;
  ; This test checks that ecp5:impl works correctly on LUT implementations     ;
  ; with 5 or more inputs                                                      ;
  ; ========================================================================== ;
  (test-begin
   (check-equal? (arch-config-primitives ecp5:config) (list ecp5:lut4 ecp5:l6mux21))
   ; ------------------------------------------------------------------------- ;
   ; Define inputs of different widths. Inputs are defined as integers 0..N.   ;
   ; This allows for easier testing and assertions but in practice these       ;
   ; should by symbolic/concrete bitvectors... in particular, these inputs     ;
   ; will lead to failures at interpretation time!                             ;
   ; ------------------------------------------------------------------------- ;
   (define inputs-5 (list 0 1 2 3 4))
   (define inputs-6 (list 0 1 2 3 4 5))
   ; ------------------------------------------------------------------------- ;
   ; Define lut interfaces of varying widths. These should all be implemented  ;
   ; with a Lattice LUT4 primitive (we test larger luts requiring multiple     ;
   ; LUT4 primitives below.                                                    ;
   ; ------------------------------------------------------------------------- ;
   (define lut5-interface (make-lut-interface 5 1 inputs-5))
   (define lut6-interface (make-lut-interface 6 1 inputs-6))
   ; ------------------------------------------------------------------------- ;
   ; Implement the above lut primitive interfaces.                             ;
   ; ------------------------------------------------------------------------- ;
   (match-define (cons lut5-prim lut5-sym-state)
     (ecp5:impl ecp5:config lut5-interface #:symbolic-state #f))
   (match-define (cons lut6-prim lut6-sym-state)
     (ecp5:impl ecp5:config lut6-interface #:symbolic-state #f))
   ; ------------------------------------------------------------------------- ;
   ; Test that these implementations are all the correct form.                 ;
   ; ------------------------------------------------------------------------- ;
   ; Destructure the lut5 primitive. We do this step by step:
   (match-let* ([(lr:primitive
                  'PFUMX
                  (lr:map _ (list '(ALUT BLUT C0) (list (lr:first lut-a) (lr:first lut-b) selector)))
                  '()) lut5-prim]
                [(lr:primitive 'LUT4
                               (lr:map _ (list '(A B C D) (list 1 2 3 4)))
                               (list (cons 'INIT sym-state-a))) lut-a]
                [(lr:primitive 'LUT4
                               (lr:map _ (list '(A B C D) (list 1 2 3 4)))
                               (list (cons 'INIT sym-state-b))) lut-b])
     (check-equal? 0 selector)
     (check-not-equal? sym-state-a sym-state-b)
     (check-true ((bitvector 16) sym-state-a))
     (check-true ((bitvector 16) sym-state-b)))
   ; Destructure the lut6 primitive. We do this step by step:
   (match-define (lr:primitive 'PFUMX
                               (lr:map _
                                       (list '(ALUT BLUT C0)
                                             (list (lr:first lut5-a) (lr:first lut5-b) selector-1)))
                               '())
     lut6-prim)
   ; Destructure second layer of PFUMXs. In this layer we bind lut4-a..lut4-d
   (match-define (lr:primitive 'PFUMX
                               (lr:map _
                                       (list '(ALUT BLUT C0)
                                             (list (lr:first lut4-a) (lr:first lut4-b) selector-2-a)))
                               '())
     lut5-a)
   (match-define (lr:primitive 'PFUMX
                               (lr:map _
                                       (list '(ALUT BLUT C0)
                                             (list (lr:first lut4-c) (lr:first lut4-d) selector-2-b)))
                               '())
     lut5-b)
   ; Destructure third layer of LUT4s. In this layer we bind
   ; sym-state-a..sym-state-d
   (match-define (lr:primitive 'LUT4
                               (lr:map _ (list '(A B C D) (list 2 3 4 5)))
                               (list (cons 'INIT sym-state-a)))
     lut4-a)
   (match-define (lr:primitive 'LUT4
                               (lr:map _ (list '(A B C D) (list 2 3 4 5)))
                               (list (cons 'INIT sym-state-b)))
     lut4-b)
   (match-define (lr:primitive 'LUT4
                               (lr:map _ (list '(A B C D) (list 2 3 4 5)))
                               (list (cons 'INIT sym-state-c)))
     lut4-c)
   (match-define (lr:primitive 'LUT4
                               (lr:map _ (list '(A B C D) (list 2 3 4 5)))
                               (list (cons 'INIT sym-state-d)))
     lut4-d)
   ; Commence the test!
   (check-equal? 0 selector-1)
   (check-equal? 1 selector-2-a)
   (check-equal? 1 selector-2-b)
   (check-not-equal? sym-state-a sym-state-b)
   (check-not-equal? sym-state-a sym-state-c)
   (check-not-equal? sym-state-a sym-state-d)
   (check-not-equal? sym-state-b sym-state-c)
   (check-not-equal? sym-state-b sym-state-d)
   (check-not-equal? sym-state-c sym-state-d)
   (check-true ((bitvector 16) sym-state-a))
   (check-true ((bitvector 16) sym-state-b))
   (check-true ((bitvector 16) sym-state-c))
   (check-true ((bitvector 16) sym-state-d))
   ; ------------------------------------------------------------------------- ;
   ; Test that the 'opaque' symbolic state values that are returned by         ;
   ; ecp5:impl are correct                                                     ;
   ; ------------------------------------------------------------------------- ;
   (check-match lut5-sym-state
                (list ; Second Layer Of MUX (mux 1)
                 '() ; mux state is always empty
                 (list (cons INIT (? (bitvector 16))))
                 (list (cons INIT (? (bitvector 16))))))
   (check-match
    lut6-sym-state
    (list '()
          (list '() (list (cons INIT (? (bitvector 16)))) (list (cons INIT (? (bitvector 16)))))
          (list '() (list (cons INIT (? (bitvector 16)))) (list (cons INIT (? (bitvector 16)))))))
   ; ------------------------------------------------------------------------- ;
   ; Test that symbolic states are reallocated correctly.                      ;
   ;                                                                           ;
   ; This involves redefining and re-destructuring the larger luts with and    ;
   ; without providing #:symbolic-state fields.                                ;
   ; ------------------------------------------------------------------------- ;
   (match-define (cons _ lut5-sym-state-fresh)
     (ecp5:impl ecp5:config lut5-interface #:symbolic-state #f))
   (match-define (cons _ lut6-sym-state-fresh)
     (ecp5:impl ecp5:config lut6-interface #:symbolic-state #f))
   (check-not-equal? lut5-sym-state lut5-sym-state-fresh)
   (check-not-equal? lut6-sym-state lut6-sym-state-fresh)
   ; ------------------------------------------------------------------------- ;
   ; Test that symbolic states are reused correctly.                           ;
   ; ------------------------------------------------------------------------- ;
   (match-define (cons _ lut5-sym-state-reuse)
     (ecp5:impl ecp5:config lut5-interface #:symbolic-state lut5-sym-state))
   (match-define (cons _ lut6-sym-state-reuse)
     (ecp5:impl ecp5:config lut6-interface #:symbolic-state lut6-sym-state))
   (check-equal? lut5-sym-state lut5-sym-state-reuse)
   (check-equal? lut6-sym-state lut6-sym-state-reuse))

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;;                         TEST CCU2C IMPLEMENTATIONS                       ;;
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ; the lut-with-carry-interface is defined in `primitive-interface.rkt`
  (test-begin (define carry4-2-interface (make-lut-with-carry-interface 2 2 (list 1 2 3 4 5)))
              (pretty-print carry4-2-interface)
              (define carry4-2-impl (get-interface-impl ecp5:config carry4-2-interface))
              (pretty-print carry4-2-impl)))
