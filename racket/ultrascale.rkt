#lang errortrace racket

(require rosette)

(provide interpret-ultrascale-plus-clb
         ultrascale-logical-to-physical-inputs
         ultrascale-logical-to-physical-inputs-with-mask
         ultrascale-plus-clb
         ultrascale-plus-lut6-2
         compile-clb-to-verilog)

; Contains the state for a LUT6_2.
; memory is the LUT's memory: (bitvector 64).
(struct ultrascale-plus-lut6-2 (memory))

; The output of a LUT is simply the bit at the entry pointed to by
; `inputs-a`, when interpreted as an integer.
; It's probably worth putting this somewhere more generally usable.
; LUTs must return only one bit. TODO: figure out how to return multiple bits while still using
; theory of bitvectors only. The old solution used theory of integers to index into the bitvector.
(define (lut memory inputs)
  (let* ([inputs (zero-extend inputs (bitvector (length (bitvector->bits memory))))])
    (bit 0 (bvlshr memory inputs))))

(module+ test
  (require rackunit)
  (check-equal? (lut (bv #b0110 4) (bv 0 1)) (bv #b0 1))
  (check-equal? (lut (bv #b0110 4) (bv 1 1)) (bv #b1 1))
  (check-equal? (lut (bv #b0110 4) (bv 2 2)) (bv #b1 1))
  (check-equal? (lut (bv #b0110 4) (bv 3 2)) (bv #b0 1)))

; LUT6_2 primitive described on page 37 of
; https://www.xilinx.com/support/documentation/user_guides/ug574-ultrascale-clb.pdf
;
; lut is the lut6-2 struct.
;
; inputs is a 6-bit bitvector, corresponding to I0 (LSB) through I5 (MSB) in figure 3-1.
;
; Returns the O5 and O6 signals.
(define (interpret-ultrascale-plus-lut6-2 lut6-2 inputs)
  (let* ([memory (ultrascale-plus-lut6-2-memory lut6-2)]
         [lut5-0 (lut (extract 63 32 memory) (extract 4 0 inputs))]
         [lut5-1 (lut (extract 31 0 memory) (extract 4 0 inputs))]
         [O6 (if (bitvector->bool (bit 5 inputs)) lut5-0 lut5-1)]
         [O5 lut5-1])
    (list O5 O6)))

(module+ test
  (require rackunit)
  (check-equal? (second (interpret-ultrascale-plus-lut6-2
                         (ultrascale-plus-lut6-2 (bv #x0000000000000008 64))
                         (bv 0 6)))
                (bv 0 1))
  (check-equal? (second (interpret-ultrascale-plus-lut6-2
                         (ultrascale-plus-lut6-2 (bv #x0000000000000008 64))
                         (bv 1 6)))
                (bv 0 1))
  (check-equal? (second (interpret-ultrascale-plus-lut6-2
                         (ultrascale-plus-lut6-2 (bv #x0000000000000008 64))
                         (bv 2 6)))
                (bv 0 1))
  (check-equal?
   (second (interpret-ultrascale-plus-lut6-2 (ultrascale-plus-lut6-2 (bv #x0000000000000008 64))
                                             (bv 3 6)))
   (bv 1 1)))

; Carry signals CO0..CO7 (aka MUXCY; carry output) in fig 2-4. Note that, to implement a mux with
; "if", the "then" and "else" clauses are in reverse order from the usual mux input order!
(define (carry-co s di prev-muxcy)
  (if (bitvector->bool s) prev-muxcy di))
; Carry signals O0..O7 (aka sum value) in Fig 2-4.
(define (carry-o s prev-muxcy)
  (bvxor s prev-muxcy))
; Wrapper to make things easier.
; Returns (carry0, muxcy)
(define (carry-layer outputs prev-muxcy)
  (match-let ([(list O5 O6) outputs]) (list (carry-o O6 prev-muxcy) (carry-co O6 O5 prev-muxcy))))

(define ultrascale-input-width 6)
(define ultrascale-output-width 2)

; Implementation translated from
; https://github.com/fredrequin/verilator_xilinx/blob/352de831223a65e8eca3f6abe5c11217863a9dd3/CARRY8.v
(define (interpret-ultrascale-plus-carry8 d s ci)
  (let* ([w_CO0 (if (bitvector->bool (bit 0 s)) ci (bit 0 d))]
         [w_CO1 (if (bitvector->bool (bit 1 s)) w_CO0 (bit 1 d))]
         [w_CO2 (if (bitvector->bool (bit 2 s)) w_CO1 (bit 2 d))]
         [w_CO3 (if (bitvector->bool (bit 3 s)) w_CO2 (bit 3 d))]
         [w_CO4 (if (bitvector->bool (bit 4 s)) w_CO3 (bit 4 d))]
         [w_CO5 (if (bitvector->bool (bit 5 s)) w_CO4 (bit 5 d))]
         [w_CO6 (if (bitvector->bool (bit 6 s)) w_CO5 (bit 6 d))]
         [w_CO7 (if (bitvector->bool (bit 7 s)) w_CO6 (bit 7 d))]
         [CO (concat w_CO7 w_CO6 w_CO5 w_CO4 w_CO3 w_CO2 w_CO1 w_CO0)]
         [O (bvxor s (concat w_CO6 w_CO5 w_CO4 w_CO3 w_CO2 w_CO1 w_CO0 ci))])
    (list O CO)))

; Defines the programmable state of an UltraScale+ CLB.
(struct ultrascale-plus-clb
        (lut-a lut-b
               lut-c
               lut-d
               lut-e
               lut-f
               lut-g
               lut-h
               mux-selector-a
               mux-selector-b
               mux-selector-c
               mux-selector-d
               mux-selector-e
               mux-selector-f
               mux-selector-g
               mux-selector-h))

; Returns the physical outputs of the CLB.
; TODO(@gussmith23) Rename to ultrascale-plus-clb.
(define (interpret-ultrascale-plus-clb clb
                                       cin
                                       lut-input-a
                                       lut-input-b
                                       lut-input-c
                                       lut-input-d
                                       lut-input-e
                                       lut-input-f
                                       lut-input-g
                                       lut-input-h)

  (match-let*
   ([(list a-o5 a-o6) (interpret-ultrascale-plus-lut6-2 (ultrascale-plus-clb-lut-a clb) lut-input-a)]
    [(list b-o5 b-o6) (interpret-ultrascale-plus-lut6-2 (ultrascale-plus-clb-lut-b clb) lut-input-b)]
    [(list c-o5 c-o6) (interpret-ultrascale-plus-lut6-2 (ultrascale-plus-clb-lut-c clb) lut-input-c)]
    [(list d-o5 d-o6) (interpret-ultrascale-plus-lut6-2 (ultrascale-plus-clb-lut-d clb) lut-input-d)]
    [(list e-o5 e-o6) (interpret-ultrascale-plus-lut6-2 (ultrascale-plus-clb-lut-e clb) lut-input-e)]
    [(list f-o5 f-o6) (interpret-ultrascale-plus-lut6-2 (ultrascale-plus-clb-lut-f clb) lut-input-f)]
    [(list g-o5 g-o6) (interpret-ultrascale-plus-lut6-2 (ultrascale-plus-clb-lut-g clb) lut-input-g)]
    [(list h-o5 h-o6) (interpret-ultrascale-plus-lut6-2 (ultrascale-plus-clb-lut-h clb) lut-input-h)]
    [(list carry-o carry-co)
     (interpret-ultrascale-plus-carry8 (concat h-o5 g-o5 f-o5 e-o5 d-o5 c-o5 b-o5 a-o5)
                                       (concat h-o6 g-o6 f-o6 e-o6 d-o6 c-o6 b-o6 a-o6)
                                       cin)]
    [(list carry-o0 carry-co0) (list (bit 0 carry-o) (bit 0 carry-co))]
    [(list carry-o1 carry-co1) (list (bit 1 carry-o) (bit 1 carry-co))]
    [(list carry-o2 carry-co2) (list (bit 2 carry-o) (bit 2 carry-co))]
    [(list carry-o3 carry-co3) (list (bit 3 carry-o) (bit 3 carry-co))]
    [(list carry-o4 carry-co4) (list (bit 4 carry-o) (bit 4 carry-co))]
    [(list carry-o5 carry-co5) (list (bit 5 carry-o) (bit 5 carry-co))]
    [(list carry-o6 carry-co6) (list (bit 6 carry-o) (bit 6 carry-co))]
    [(list carry-o7 carry-co7) (list (bit 7 carry-o) (bit 7 carry-co))]
    [mux-helper
     (lambda (o5 o6 carry selector)
       (assert (not (bveq selector (bv 3 2))))
       (if (bveq selector (bv 0 2))
           o5
           (if (bveq selector (bv 1 2))
               o6
               (if (bveq selector (bv 2 2)) carry (error "shouldn't hit this")))))]
    [a-mux-out (mux-helper a-o5 a-o6 carry-o0 (ultrascale-plus-clb-mux-selector-a clb))]
    [b-mux-out (mux-helper b-o5 b-o6 carry-o1 (ultrascale-plus-clb-mux-selector-b clb))]
    [c-mux-out (mux-helper c-o5 c-o6 carry-o2 (ultrascale-plus-clb-mux-selector-c clb))]
    [d-mux-out (mux-helper d-o5 d-o6 carry-o3 (ultrascale-plus-clb-mux-selector-d clb))]
    [e-mux-out (mux-helper e-o5 e-o6 carry-o4 (ultrascale-plus-clb-mux-selector-e clb))]
    [f-mux-out (mux-helper f-o5 f-o6 carry-o5 (ultrascale-plus-clb-mux-selector-f clb))]
    [g-mux-out (mux-helper g-o5 g-o6 carry-o6 (ultrascale-plus-clb-mux-selector-g clb))]
    [h-mux-out (mux-helper h-o5 h-o6 carry-o7 (ultrascale-plus-clb-mux-selector-h clb))])
   (concat h-mux-out g-mux-out f-mux-out e-mux-out d-mux-out c-mux-out b-mux-out a-mux-out)))

; A simple logical-to-physical inputs function, in which the first (least significant) bit of each
; logical input is mapped to LUT A (logical input 0 in the least significant place), the second bit is
; mapped to LUT B, etc.
(define (ultrascale-logical-to-physical-inputs logical-input-0
                                               logical-input-1
                                               logical-input-2
                                               logical-input-3
                                               logical-input-4
                                               logical-input-5)
  (let ([helper (lambda (idx)
                  (concat (extract idx idx logical-input-5)
                          (extract idx idx logical-input-4)
                          (extract idx idx logical-input-3)
                          (extract idx idx logical-input-2)
                          (extract idx idx logical-input-1)
                          (extract idx idx logical-input-0)))])
    (list (helper 0) (helper 1) (helper 2) (helper 3) (helper 4) (helper 5) (helper 6) (helper 7))))

; Same as above, but uses a symbolic mask which sets inputs to high when the bit is set to 1.
(define (ultrascale-logical-to-physical-inputs-with-mask mask inputs)
  (match-let*
   ([(list logical-input-0
           logical-input-1
           logical-input-2
           logical-input-3
           logical-input-4
           logical-input-5)
     inputs]
    [helper
     (lambda (idx)
       (concat (extract idx idx logical-input-5)
               (extract idx idx logical-input-4)
               (extract idx idx logical-input-3)
               (extract idx idx logical-input-2)
               (extract idx idx logical-input-1)
               (extract idx idx logical-input-0)))]
    [physical-inputs
     (list (helper 0) (helper 1) (helper 2) (helper 3) (helper 4) (helper 5) (helper 6) (helper 7))]
    [physical-inputs (apply concat physical-inputs)]
    ; mask is in the order (MSB left) [bit 5 of lut a, bit 4 of lut a, ...]
    [physical-inputs (bvor mask physical-inputs)]
    [physical-inputs
     (list (extract 47 42 physical-inputs)
           (extract 41 36 physical-inputs)
           (extract 35 30 physical-inputs)
           (extract 29 24 physical-inputs)
           (extract 23 18 physical-inputs)
           (extract 17 12 physical-inputs)
           (extract 11 6 physical-inputs)
           (extract 5 0 physical-inputs))])
   physical-inputs))

; A helper function which first creates symbolic variables for all of the programmable state of the
; LUT, and then calls the CLB function with the provided inputs.
(define (ultrascale-plus-clb-helper physical-inputs)

  ; The programmable state of the CLB.
  (define-symbolic* cin (bitvector 1))
  (define-symbolic* lut-memory-a (bitvector 64))
  (define-symbolic* lut-memory-b (bitvector 64))
  (define-symbolic* lut-memory-c (bitvector 64))
  (define-symbolic* lut-memory-d (bitvector 64))
  (define-symbolic* lut-memory-e (bitvector 64))
  (define-symbolic* lut-memory-f (bitvector 64))
  (define-symbolic* lut-memory-g (bitvector 64))
  (define-symbolic* lut-memory-h (bitvector 64))
  (define-symbolic* mux-selector-a (bitvector 2))
  (define-symbolic* mux-selector-b (bitvector 2))
  (define-symbolic* mux-selector-c (bitvector 2))
  (define-symbolic* mux-selector-d (bitvector 2))
  (define-symbolic* mux-selector-e (bitvector 2))
  (define-symbolic* mux-selector-f (bitvector 2))
  (define-symbolic* mux-selector-g (bitvector 2))
  (define-symbolic* mux-selector-h (bitvector 2))
  (assert (not (bveq mux-selector-a (bv 3 2))))
  (assert (not (bveq mux-selector-b (bv 3 2))))
  (assert (not (bveq mux-selector-c (bv 3 2))))
  (assert (not (bveq mux-selector-d (bv 3 2))))
  (assert (not (bveq mux-selector-e (bv 3 2))))
  (assert (not (bveq mux-selector-f (bv 3 2))))
  (assert (not (bveq mux-selector-g (bv 3 2))))
  (assert (not (bveq mux-selector-h (bv 3 2))))

  (values cin
          lut-memory-a
          lut-memory-b
          lut-memory-c
          lut-memory-d
          lut-memory-e
          lut-memory-f
          lut-memory-g
          lut-memory-h
          mux-selector-a
          mux-selector-b
          mux-selector-c
          mux-selector-d
          mux-selector-e
          mux-selector-f
          mux-selector-g
          mux-selector-h
          (apply interpret-ultrascale-plus-clb
                 cin
                 lut-memory-a
                 lut-memory-b
                 lut-memory-c
                 lut-memory-d
                 lut-memory-e
                 lut-memory-f
                 lut-memory-g
                 lut-memory-h
                 mux-selector-a
                 mux-selector-b
                 mux-selector-c
                 mux-selector-d
                 mux-selector-e
                 mux-selector-f
                 mux-selector-g
                 mux-selector-h
                 physical-inputs)))

; Compile a Rosette model of a UltraScale+ CLB to Verilog.
; Model: the model, containing the settings of all values.
; Everything else: the list of symbolic variables.
; TODO(@gussmith) Make more ergonomic.
(define (compile-clb-to-verilog module-name
                                model
                                cin
                                lut-memory-a
                                lut-memory-b
                                lut-memory-c
                                lut-memory-d
                                lut-memory-e
                                lut-memory-f
                                lut-memory-g
                                lut-memory-h
                                mux-selector-a
                                mux-selector-b
                                mux-selector-c
                                mux-selector-d
                                mux-selector-e
                                mux-selector-f
                                mux-selector-g
                                mux-selector-h
                                mask)

  (define (mux-codegen-helper v idx-str)
    (if (bveq v (bv 0 2))
        (format "_luts_O5[~a]" idx-str)
        (if (bveq v (bv 1 2))
            (format "_luts_O6[~a]" idx-str)
            (if (bveq v (bv 2 2)) (format "_O[~a]" idx-str) (error "shouldn't hit this")))))
  (define out
    (format
     #<<here-string-delimiter
module ~a(input_a, input_b, input_c, input_d, input_e, input_f, input_g, input_h, out);
  input [5:0] input_a;
  wire [5:0] input_a;
  input [5:0] input_b;
  wire [5:0] input_b;
  input [5:0] input_c;
  wire [5:0] input_c;
  input [5:0] input_d;
  wire [5:0] input_d;
  input [5:0] input_e;
  wire [5:0] input_e;
  input [5:0] input_f;
  wire [5:0] input_f;
  input [5:0] input_g;
  wire [5:0] input_g;
  input [5:0] input_h;
  wire [5:0] input_h;
  output [7:0] out;
  wire [7:0] out;
  wire [7:0] _luts_O5;
  wire [7:0] _luts_O6;
  wire [7:0] _O;
  wire [7:0] _CO;

  LUT6_2 #(
    .INIT(64'h~x)
  ) _LUT_A (
    .I5(~a),
    .I4(~a),
    .I3(~a),
    .I2(~a),
    .I1(~a),
    .I0(~a),
    .O5(_luts_O5[0]),
    .O6(_luts_O6[0])
  );
  LUT6_2 #(
    .INIT(64'h~x)
  ) _LUT_B (
    .I5(~a),
    .I4(~a),
    .I3(~a),
    .I2(~a),
    .I1(~a),
    .I0(~a),
    .O5(_luts_O5[1]),
    .O6(_luts_O6[1])
  );
  LUT6_2 #(
    .INIT(64'h~x)
  ) _LUT_C (
    .I5(~a),
    .I4(~a),
    .I3(~a),
    .I2(~a),
    .I1(~a),
    .I0(~a),
    .O5(_luts_O5[2]),
    .O6(_luts_O6[2])
  );
  LUT6_2 #(
    .INIT(64'h~x)
  ) _LUT_D (
    .I5(~a),
    .I4(~a),
    .I3(~a),
    .I2(~a),
    .I1(~a),
    .I0(~a),
    .O5(_luts_O5[3]),
    .O6(_luts_O6[3])
  );
  LUT6_2 #(
    .INIT(64'h~x)
  ) _LUT_E (
    .I5(~a),
    .I4(~a),
    .I3(~a),
    .I2(~a),
    .I1(~a),
    .I0(~a),
    .O5(_luts_O5[4]),
    .O6(_luts_O6[4])
  );
  LUT6_2 #(
    .INIT(64'h~x)
  ) _LUT_F (
    .I5(~a),
    .I4(~a),
    .I3(~a),
    .I2(~a),
    .I1(~a),
    .I0(~a),
    .O5(_luts_O5[5]),
    .O6(_luts_O6[5])
  );
  LUT6_2 #(
    .INIT(64'h~x)
  ) _LUT_G (
    .I5(~a),
    .I4(~a),
    .I3(~a),
    .I2(~a),
    .I1(~a),
    .I0(~a),
    .O5(_luts_O5[6]),
    .O6(_luts_O6[6])
  );
  LUT6_2 #(
    .INIT(64'h~x)
  ) _LUT_H (
    .I5(~a),
    .I4(~a),
    .I3(~a),
    .I2(~a),
    .I1(~a),
    .I0(~a),
    .O5(_luts_O5[7]),
    .O6(_luts_O6[7])
  );

  CARRY8 _CARRY (
    .CI_TOP(1'b0),
    .CI(~a),
    .DI(_luts_O5),
    .S(_luts_O6),
    .O(_O),
    .CO(_CO)
  );

  assign out[7] = ~a;
  assign out[6] = ~a;
  assign out[5] = ~a;
  assign out[4] = ~a;
  assign out[3] = ~a;
  assign out[2] = ~a;
  assign out[1] = ~a;
  assign out[0] = ~a;
endmodule

here-string-delimiter
     ; This comment prevents the autoformatter from breaking the here string.
     module-name
     (bitvector->natural (hash-ref model lut-memory-a))
     (if (bitvector->bool (bit 47 (hash-ref model mask))) "1'b1" "input_a[5]")
     (if (bitvector->bool (bit 46 (hash-ref model mask))) "1'b1" "input_a[4]")
     (if (bitvector->bool (bit 45 (hash-ref model mask))) "1'b1" "input_a[3]")
     (if (bitvector->bool (bit 44 (hash-ref model mask))) "1'b1" "input_a[2]")
     (if (bitvector->bool (bit 43 (hash-ref model mask))) "1'b1" "input_a[1]")
     (if (bitvector->bool (bit 42 (hash-ref model mask))) "1'b1" "input_a[0]")
     (bitvector->natural (hash-ref model lut-memory-b))
     (if (bitvector->bool (bit 41 (hash-ref model mask))) "1'b1" "input_b[5]")
     (if (bitvector->bool (bit 40 (hash-ref model mask))) "1'b1" "input_b[4]")
     (if (bitvector->bool (bit 39 (hash-ref model mask))) "1'b1" "input_b[3]")
     (if (bitvector->bool (bit 38 (hash-ref model mask))) "1'b1" "input_b[2]")
     (if (bitvector->bool (bit 37 (hash-ref model mask))) "1'b1" "input_b[1]")
     (if (bitvector->bool (bit 36 (hash-ref model mask))) "1'b1" "input_b[0]")
     (bitvector->natural (hash-ref model lut-memory-c))
     (if (bitvector->bool (bit 35 (hash-ref model mask))) "1'b1" "input_c[5]")
     (if (bitvector->bool (bit 34 (hash-ref model mask))) "1'b1" "input_c[4]")
     (if (bitvector->bool (bit 33 (hash-ref model mask))) "1'b1" "input_c[3]")
     (if (bitvector->bool (bit 32 (hash-ref model mask))) "1'b1" "input_c[2]")
     (if (bitvector->bool (bit 31 (hash-ref model mask))) "1'b1" "input_c[1]")
     (if (bitvector->bool (bit 30 (hash-ref model mask))) "1'b1" "input_c[0]")
     (bitvector->natural (hash-ref model lut-memory-d))
     (if (bitvector->bool (bit 29 (hash-ref model mask))) "1'b1" "input_d[5]")
     (if (bitvector->bool (bit 28 (hash-ref model mask))) "1'b1" "input_d[4]")
     (if (bitvector->bool (bit 27 (hash-ref model mask))) "1'b1" "input_d[3]")
     (if (bitvector->bool (bit 26 (hash-ref model mask))) "1'b1" "input_d[2]")
     (if (bitvector->bool (bit 25 (hash-ref model mask))) "1'b1" "input_d[1]")
     (if (bitvector->bool (bit 24 (hash-ref model mask))) "1'b1" "input_d[0]")
     (bitvector->natural (hash-ref model lut-memory-e))
     (if (bitvector->bool (bit 23 (hash-ref model mask))) "1'b1" "input_e[5]")
     (if (bitvector->bool (bit 22 (hash-ref model mask))) "1'b1" "input_e[4]")
     (if (bitvector->bool (bit 21 (hash-ref model mask))) "1'b1" "input_e[3]")
     (if (bitvector->bool (bit 20 (hash-ref model mask))) "1'b1" "input_e[2]")
     (if (bitvector->bool (bit 19 (hash-ref model mask))) "1'b1" "input_e[1]")
     (if (bitvector->bool (bit 18 (hash-ref model mask))) "1'b1" "input_e[0]")
     (bitvector->natural (hash-ref model lut-memory-f))
     (if (bitvector->bool (bit 17 (hash-ref model mask))) "1'b1" "input_f[5]")
     (if (bitvector->bool (bit 16 (hash-ref model mask))) "1'b1" "input_f[4]")
     (if (bitvector->bool (bit 15 (hash-ref model mask))) "1'b1" "input_f[3]")
     (if (bitvector->bool (bit 14 (hash-ref model mask))) "1'b1" "input_f[2]")
     (if (bitvector->bool (bit 13 (hash-ref model mask))) "1'b1" "input_f[1]")
     (if (bitvector->bool (bit 12 (hash-ref model mask))) "1'b1" "input_f[0]")
     (bitvector->natural (hash-ref model lut-memory-g))
     (if (bitvector->bool (bit 11 (hash-ref model mask))) "1'b1" "input_g[5]")
     (if (bitvector->bool (bit 10 (hash-ref model mask))) "1'b1" "input_g[4]")
     (if (bitvector->bool (bit 9 (hash-ref model mask))) "1'b1" "input_g[3]")
     (if (bitvector->bool (bit 8 (hash-ref model mask))) "1'b1" "input_g[2]")
     (if (bitvector->bool (bit 7 (hash-ref model mask))) "1'b1" "input_g[1]")
     (if (bitvector->bool (bit 6 (hash-ref model mask))) "1'b1" "input_g[0]")
     (bitvector->natural (hash-ref model lut-memory-h))
     (if (bitvector->bool (bit 5 (hash-ref model mask))) "1'b1" "input_h[5]")
     (if (bitvector->bool (bit 4 (hash-ref model mask))) "1'b1" "input_h[4]")
     (if (bitvector->bool (bit 3 (hash-ref model mask))) "1'b1" "input_h[3]")
     (if (bitvector->bool (bit 2 (hash-ref model mask))) "1'b1" "input_h[2]")
     (if (bitvector->bool (bit 1 (hash-ref model mask))) "1'b1" "input_h[1]")
     (if (bitvector->bool (bit 0 (hash-ref model mask))) "1'b1" "input_h[0]")
     ; Carry in.
     (if (bitvector->bool (hash-ref model cin)) "1'b1" "1'b0")
     ; Output assignment.
     ; TODO this isn't exactly right...
     (mux-codegen-helper (hash-ref model mux-selector-h) "7")
     (mux-codegen-helper (hash-ref model mux-selector-g) "6")
     (mux-codegen-helper (hash-ref model mux-selector-f) "5")
     (mux-codegen-helper (hash-ref model mux-selector-e) "4")
     (mux-codegen-helper (hash-ref model mux-selector-d) "3")
     (mux-codegen-helper (hash-ref model mux-selector-c) "2")
     (mux-codegen-helper (hash-ref model mux-selector-b) "1")
     (mux-codegen-helper (hash-ref model mux-selector-a) "0")))

  out)
