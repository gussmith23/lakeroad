#lang rosette/safe
    (provide (rename-out [cyclone10lp_mac_out intel-cyclone10lp-mac-out] [cyclone10lp_mac_out_initial intel-cyclone10lp-mac-out-initial] [cyclone10lp_mac_out_inputs_helper intel-cyclone10lp-mac-out-inputs] [cyclone10lp_mac_out_outputs_helper intel-cyclone10lp-mac-out-outputs]))(struct
  cyclone10lp_mac_out_Inputs
  (output_clock ena devpor devclrn dataa clk aclr)
  #:transparent
  ; output_clock (bitvector 1)
  ; ena (bitvector 1)
  ; devpor (bitvector 1)
  ; devclrn (bitvector 1)
  ; dataa (bitvector 36)
  ; clk (bitvector 1)
  ; aclr (bitvector 1)
)
(struct cyclone10lp_mac_out_Outputs (dataout) #:transparent
  ; dataout (bitvector 36)
)
(struct
  cyclone10lp_mac_out_State
  ($auto$clk2fflogic.cc_86_sample_control_edge$95
    $auto$clk2fflogic.cc_102_sample_data$91
    $auto$clk2fflogic.cc_102_sample_data$93
    $auto$clk2fflogic.cc_74_sample_control$101)
  #:transparent
  ; $auto$clk2fflogic.cc_86_sample_control_edge$95 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$91 (bitvector 36)
  ; $auto$clk2fflogic.cc_102_sample_data$93 (bitvector 36)
  ; $auto$clk2fflogic.cc_74_sample_control$101 (bitvector 1)
)
(define
  (cyclone10lp_mac_out_inputs_helper inputs)
  (cyclone10lp_mac_out_Inputs
    (let
      (
        (assoc-result
          (assoc "output_clock" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "ena" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "devpor" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "devclrn" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "dataa" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "clk" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "aclr" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))))
(define
  (cyclone10lp_mac_out_outputs_helper outputs)
  (list
    (cons "dataout" (cyclone10lp_mac_out_Outputs-dataout outputs))))
(define (cyclone10lp_mac_out inputs state)
  (let ((clk (cyclone10lp_mac_out_Inputs-clk inputs))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_95_sample_data$_idataout_reg_sampled$90
      (cyclone10lp_mac_out_State-$auto$clk2fflogic.cc_102_sample_data$91 state))) ; (bitvector 36)
  (let
    (($auto$clk2fflogic.cc_95_sample_data$$0_idataout_reg_35_0__sampled$92
      (cyclone10lp_mac_out_State-$auto$clk2fflogic.cc_102_sample_data$93 state))) ; (bitvector 36)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_clk_sampled$94
      (cyclone10lp_mac_out_State-$auto$clk2fflogic.cc_86_sample_control_edge$95
        state))) ; (bitvector 1)
  (let
    ((n4
      (concat $auto$clk2fflogic.cc_81_sample_control_edge$_clk_sampled$94 clk))) ; (bitvector 2)
  (let (($auto$rtlil.cc_2974_Eqx$97 (bool->bitvector (bveq n4 (bv #b01 2))))) ; (bitvector 1)
  (let
    (($auto$rtlil.cc_3053_Mux$99
      (if
        (bitvector->bool $auto$rtlil.cc_2974_Eqx$97)
        $auto$clk2fflogic.cc_95_sample_data$$0_idataout_reg_35_0__sampled$92
        $auto$clk2fflogic.cc_95_sample_data$_idataout_reg_sampled$90))) ; (bitvector 36)
  (let
    (($auto$clk2fflogic.cc_69_sample_control$_aclr_sampled$100
      (cyclone10lp_mac_out_State-$auto$clk2fflogic.cc_74_sample_control$101
        state))) ; (bitvector 1)
  (let
    (($auto$rtlil.cc_3053_Mux$103
      (if
        (bitvector->bool
          $auto$clk2fflogic.cc_69_sample_control$_aclr_sampled$100)
        (bv #b000000000000000000000000000000000000 36)
        $auto$rtlil.cc_3053_Mux$99))) ; (bitvector 36)
  (let ((aclr (cyclone10lp_mac_out_Inputs-aclr inputs))) ; (bitvector 1)
  (let
    ((idataout_reg
      (if
        (bitvector->bool aclr)
        (bv #b000000000000000000000000000000000000 36)
        $auto$rtlil.cc_3053_Mux$103))) ; (bitvector 36)
  (let ((dataa (cyclone10lp_mac_out_Inputs-dataa inputs))) ; (bitvector 36)
  (let ((ena (cyclone10lp_mac_out_Inputs-ena inputs))) ; (bitvector 1)
  (let (($0_idataout_reg_35_0_ (if (bitvector->bool ena) dataa idataout_reg))) ; (bitvector 36)
  (let ((output_clock (cyclone10lp_mac_out_Inputs-output_clock inputs))) ; (bitvector 1)
  (let
    (($ternary$_Users_gussmith_lakeroad_lakeroad_private_intel_cyclone10lp_cyclone10lp_mac_mult_modified_for_racket_import.v_464$73$_Y
      (if (bitvector->bool output_clock) (bv #b1 1) (bv #b0 1)))) ; (bitvector 1)
  (let
    ((dataout
      (if
        (bitvector->bool
          $ternary$_Users_gussmith_lakeroad_lakeroad_private_intel_cyclone10lp_cyclone10lp_mac_mult_modified_for_racket_import.v_464$73$_Y)
        idataout_reg
        dataa))) ; (bitvector 36)
  (cons
    (cyclone10lp_mac_out_Outputs
      dataout ; dataout
    )
    (cyclone10lp_mac_out_State
      clk ; $auto$clk2fflogic.cc:86:sample_control_edge$95
      idataout_reg ; $auto$clk2fflogic.cc:102:sample_data$91
      $0_idataout_reg_35_0_ ; $auto$clk2fflogic.cc:102:sample_data$93
      aclr ; $auto$clk2fflogic.cc:74:sample_control$101
    ))))))))))))))))))))
(define cyclone10lp_mac_out_initial
  (cyclone10lp_mac_out_State
    (bv #b1 1)
    (bv #b000000000000000000000000000000000000 36)
    (bv #b000000000000000000000000000000000000 36)
    (bv #b0 1)))
