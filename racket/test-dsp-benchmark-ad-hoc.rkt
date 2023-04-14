;;; This is a handwritten test that tests one of our DSP benchmarks (once it's been imported into
;;; Racket via the Verilog to Racket script.) This was useful for figuring out what was needed to get
;;; real designs to map to DSPs via Lakeroad.
#lang racket
(require rackunit
         rosette
         "signal.rkt"
         "sketches.rkt"
         (prefix-in lr: "language.rkt")
         "architecture-description.rkt"
         "synthesize.rkt"
         "generated/xilinx-ultrascale-plus-dsp48e2.rkt")

(define to-synthesize
  (λ (#:clk (clk (bv->signal (constant (quote clk) (bitvector 1))))
      #:scale (scale (bv->signal (constant (quote scale) (bitvector 16))))
      #:val (val (bv->signal (constant (quote val) (bitvector 16)))))
    (let* ([merged-input-state-hash (list)]
           [init-hash
            (append (list (cons (quote state38) (bv 1 (bitvector 1))))
                    (append (list (cons (quote state28) (bv 1 (bitvector 1))))
                            (append (list (cons (quote state20) (bv 1 (bitvector 1))))
                                    (append (list (cons (quote state10) (bv 1 (bitvector 1))))
                                            (list)))))]
           [btor1 (bitvector 1)]
           [btor2 clk]
           [merged-input-state-hash (append merged-input-state-hash (signal-state clk))]
           [btor3 (bitvector 16)]
           [btor4 scale]
           [merged-input-state-hash (append merged-input-state-hash (signal-state scale))]
           [btor5 val]
           [merged-input-state-hash (append merged-input-state-hash (signal-state val))]
           [btor6 (bitvector 32)]
           [btor7 (let* ([state-value
                          (cond
                            [(assoc-has-key? merged-input-state-hash (quote state7))
                             (bv->signal (assoc-ref merged-input-state-hash (quote state7)))]
                            [(assoc-has-key? init-hash (quote state7))
                             (bv->signal (assoc-ref init-hash (quote state7)))]
                            [else
                             (bv->signal
                              ((lambda ()
                                 (log-warning
                                  "Getting default value of 0 for bitvector, this may be a bad idea!")
                                 (bv 0 32))))])])
                    (when (not (signal? state-value))
                      (error "Expected signal"))
                    state-value)]
           [btor8 (let* ([state-value
                          (cond
                            [(assoc-has-key? merged-input-state-hash (quote state8))
                             (bv->signal (assoc-ref merged-input-state-hash (quote state8)))]
                            [(assoc-has-key? init-hash (quote state8))
                             (bv->signal (assoc-ref init-hash (quote state8)))]
                            [else
                             (bv->signal
                              ((lambda ()
                                 (log-warning
                                  "Getting default value of 0 for bitvector, this may be a bad idea!")
                                 (bv 0 32))))])])
                    (when (not (signal? state-value))
                      (error "Expected signal"))
                    state-value)]
           [btor9 (bv->signal (bv 1 (bitvector 1)))]
           [btor10
            (let* ([state-value
                    (cond
                      [(assoc-has-key? merged-input-state-hash (quote state10))
                       (bv->signal (assoc-ref merged-input-state-hash (quote state10)))]
                      [(assoc-has-key? init-hash (quote state10))
                       (bv->signal (assoc-ref init-hash (quote state10)))]
                      [else
                       (bv->signal
                        ((lambda ()
                           (log-warning
                            "Getting default value of 0 for bitvector, this may be a bad idea!")
                           (bv 0 1))))])])
              (when (not (signal? state-value))
                (error "Expected signal"))
              state-value)]
           [btor12 (bitvector 2)]
           [btor13 (signal (concat (signal-value btor2) (signal-value btor10)) (list))]
           [btor14 (bv->signal (bv 2 (bitvector 2)))]
           [btor15 (signal (bool->bitvector (bveq (signal-value btor13) (signal-value btor14)))
                           (list))]
           [btor16 (if (bitvector->bool (signal-value btor15)) btor8 btor7)]
           [btor18
            (let* ([state-value
                    (cond
                      [(assoc-has-key? merged-input-state-hash (quote state18))
                       (bv->signal (assoc-ref merged-input-state-hash (quote state18)))]
                      [(assoc-has-key? init-hash (quote state18))
                       (bv->signal (assoc-ref init-hash (quote state18)))]
                      [else
                       (bv->signal
                        ((lambda ()
                           (log-warning
                            "Getting default value of 0 for bitvector, this may be a bad idea!")
                           (bv 0 16))))])])
              (when (not (signal? state-value))
                (error "Expected signal"))
              state-value)]
           [btor19
            (let* ([state-value
                    (cond
                      [(assoc-has-key? merged-input-state-hash (quote state19))
                       (bv->signal (assoc-ref merged-input-state-hash (quote state19)))]
                      [(assoc-has-key? init-hash (quote state19))
                       (bv->signal (assoc-ref init-hash (quote state19)))]
                      [else
                       (bv->signal
                        ((lambda ()
                           (log-warning
                            "Getting default value of 0 for bitvector, this may be a bad idea!")
                           (bv 0 16))))])])
              (when (not (signal? state-value))
                (error "Expected signal"))
              state-value)]
           [btor20
            (let* ([state-value
                    (cond
                      [(assoc-has-key? merged-input-state-hash (quote state20))
                       (bv->signal (assoc-ref merged-input-state-hash (quote state20)))]
                      [(assoc-has-key? init-hash (quote state20))
                       (bv->signal (assoc-ref init-hash (quote state20)))]
                      [else
                       (bv->signal
                        ((lambda ()
                           (log-warning
                            "Getting default value of 0 for bitvector, this may be a bad idea!")
                           (bv 0 1))))])])
              (when (not (signal? state-value))
                (error "Expected signal"))
              state-value)]
           [btor22 (signal (concat (signal-value btor2) (signal-value btor20)) (list))]
           [btor23 (signal (bool->bitvector (bveq (signal-value btor22) (signal-value btor14)))
                           (list))]
           [btor24 (if (bitvector->bool (signal-value btor23)) btor19 btor18)]
           [btor25 (bv->signal (sign-extend (signal-value btor24) (bitvector 32)) btor24)]
           [btor26
            (let* ([state-value
                    (cond
                      [(assoc-has-key? merged-input-state-hash (quote state26))
                       (bv->signal (assoc-ref merged-input-state-hash (quote state26)))]
                      [(assoc-has-key? init-hash (quote state26))
                       (bv->signal (assoc-ref init-hash (quote state26)))]
                      [else
                       (bv->signal
                        ((lambda ()
                           (log-warning
                            "Getting default value of 0 for bitvector, this may be a bad idea!")
                           (bv 0 16))))])])
              (when (not (signal? state-value))
                (error "Expected signal"))
              state-value)]
           [btor27
            (let* ([state-value
                    (cond
                      [(assoc-has-key? merged-input-state-hash (quote state27))
                       (bv->signal (assoc-ref merged-input-state-hash (quote state27)))]
                      [(assoc-has-key? init-hash (quote state27))
                       (bv->signal (assoc-ref init-hash (quote state27)))]
                      [else
                       (bv->signal
                        ((lambda ()
                           (log-warning
                            "Getting default value of 0 for bitvector, this may be a bad idea!")
                           (bv 0 16))))])])
              (when (not (signal? state-value))
                (error "Expected signal"))
              state-value)]
           [btor28
            (let* ([state-value
                    (cond
                      [(assoc-has-key? merged-input-state-hash (quote state28))
                       (bv->signal (assoc-ref merged-input-state-hash (quote state28)))]
                      [(assoc-has-key? init-hash (quote state28))
                       (bv->signal (assoc-ref init-hash (quote state28)))]
                      [else
                       (bv->signal
                        ((lambda ()
                           (log-warning
                            "Getting default value of 0 for bitvector, this may be a bad idea!")
                           (bv 0 1))))])])
              (when (not (signal? state-value))
                (error "Expected signal"))
              state-value)]
           [btor30 (signal (concat (signal-value btor2) (signal-value btor28)) (list))]
           [btor31 (signal (bool->bitvector (bveq (signal-value btor30) (signal-value btor14)))
                           (list))]
           [btor32 (if (bitvector->bool (signal-value btor31)) btor27 btor26)]
           [btor33 (bv->signal (sign-extend (signal-value btor32) (bitvector 32)) btor32)]
           [btor34 (signal (bvmul (signal-value btor25) (signal-value btor33)) (list))]
           [btor35 (bv->signal (zero-extend (signal-value btor34) (bitvector 32)) btor34)]
           [btor36
            (let* ([state-value
                    (cond
                      [(assoc-has-key? merged-input-state-hash (quote state36))
                       (bv->signal (assoc-ref merged-input-state-hash (quote state36)))]
                      [(assoc-has-key? init-hash (quote state36))
                       (bv->signal (assoc-ref init-hash (quote state36)))]
                      [else
                       (bv->signal
                        ((lambda ()
                           (log-warning
                            "Getting default value of 0 for bitvector, this may be a bad idea!")
                           (bv 0 32))))])])
              (when (not (signal? state-value))
                (error "Expected signal"))
              state-value)]
           [btor37
            (let* ([state-value
                    (cond
                      [(assoc-has-key? merged-input-state-hash (quote state37))
                       (bv->signal (assoc-ref merged-input-state-hash (quote state37)))]
                      [(assoc-has-key? init-hash (quote state37))
                       (bv->signal (assoc-ref init-hash (quote state37)))]
                      [else
                       (bv->signal
                        ((lambda ()
                           (log-warning
                            "Getting default value of 0 for bitvector, this may be a bad idea!")
                           (bv 0 32))))])])
              (when (not (signal? state-value))
                (error "Expected signal"))
              state-value)]
           [btor38
            (let* ([state-value
                    (cond
                      [(assoc-has-key? merged-input-state-hash (quote state38))
                       (bv->signal (assoc-ref merged-input-state-hash (quote state38)))]
                      [(assoc-has-key? init-hash (quote state38))
                       (bv->signal (assoc-ref init-hash (quote state38)))]
                      [else
                       (bv->signal
                        ((lambda ()
                           (log-warning
                            "Getting default value of 0 for bitvector, this may be a bad idea!")
                           (bv 0 1))))])])
              (when (not (signal? state-value))
                (error "Expected signal"))
              state-value)]
           [btor40 (signal (concat (signal-value btor2) (signal-value btor38)) (list))]
           [btor41 (signal (bool->bitvector (bveq (signal-value btor40) (signal-value btor14)))
                           (list))]
           [btor42 (if (bitvector->bool (signal-value btor41)) btor37 btor36)]
           [btor43 (bv->signal (zero-extend (signal-value btor42) (bitvector 32)) btor42)]
           [btor44 (bv->signal (zero-extend (signal-value btor32) (bitvector 16)) btor32)]
           [btor45 (bv->signal (zero-extend (signal-value btor24) (bitvector 16)) btor24)])
      (list (cons (quote dout)
                  (signal
                   (signal-value btor16)
                   (append
                    (list (cons (quote state38) (signal-value btor2)))
                    (append
                     (list (cons (quote state37) (signal-value btor34)))
                     (append
                      (list (cons (quote state36) (signal-value btor42)))
                      (append
                       (list (cons (quote state28) (signal-value btor2)))
                       (append
                        (list (cons (quote state27) (signal-value btor4)))
                        (append
                         (list (cons (quote state26) (signal-value btor32)))
                         (append
                          (list (cons (quote state20) (signal-value btor2)))
                          (append
                           (list (cons (quote state19) (signal-value btor5)))
                           (append
                            (list (cons (quote state18) (signal-value btor24)))
                            (append (list (cons (quote state10) (signal-value btor2)))
                                    (append (list (cons (quote state8) (signal-value btor42)))
                                            (append (list (cons (quote state7) (signal-value btor16)))
                                                    (list)))))))))))))))))))

(define lr-expr
  (first (single-dsp-sketch-generator (xilinx-ultrascale-plus-architecture-description)
                                      #:out-width 32
                                      #:clk-input (cons (lr:var "clk" 1) 1)
                                      #:data-inputs (list (cons (lr:var "scale" 16) 16)
                                                          (cons (lr:var "val" 16) 16)))))

(define (make-env clk scale val)
  (list (cons "clk" (bv->signal clk))
        (cons "scale" (bv->signal scale))
        (cons "val" (bv->signal val))))

(define-symbolic a b (bitvector 16))
(define env
  (list (make-env (bv 0 1) a b)
        (make-env (bv 1 1) a b)
        (make-env (bv 0 1) (bv 0 16) (bv 0 16))
        (make-env (bv 1 1) (bv 0 16) (bv 0 16))
        (make-env (bv 0 1) (bv 0 16) (bv 0 16))
        (make-env (bv 1 1) (bv 0 16) (bv 0 16))))

(test-not-false "Lakeroad synthesizes design to DSP"
                (rosette-synthesize
                 (compose (lambda (v) (assoc-ref v 'dout)) to-synthesize)
                 lr-expr
                 (list a b)
                 #:bv-sequential env
                 #:lr-sequential env
                 #:module-semantics (list (cons (cons "DSP48E2" "../verilator_unisims/DSP48E2.v")
                                                xilinx-ultrascale-plus-dsp48e2))))
