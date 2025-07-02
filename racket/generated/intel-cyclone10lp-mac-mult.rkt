#lang rosette/safe
    (provide (rename-out [cyclone10lp_mac_mult intel-cyclone10lp-mac-mult] [cyclone10lp_mac_mult_initial intel-cyclone10lp-mac-mult-initial] [cyclone10lp_mac_mult_inputs_helper intel-cyclone10lp-mac-mult-inputs] [cyclone10lp_mac_mult_outputs_helper intel-cyclone10lp-mac-mult-outputs]))(struct
  cyclone10lp_mac_mult_Inputs
  (signb_clock
    signb
    signa_clock
    signa
    ena
    devpor
    devclrn
    datab_clock
    datab
    dataa_clock
    dataa
    clk
    aclr)
  #:transparent
  ; signb_clock (bitvector 1)
  ; signb (bitvector 1)
  ; signa_clock (bitvector 1)
  ; signa (bitvector 1)
  ; ena (bitvector 1)
  ; devpor (bitvector 1)
  ; devclrn (bitvector 1)
  ; datab_clock (bitvector 1)
  ; datab (bitvector 18)
  ; dataa_clock (bitvector 1)
  ; dataa (bitvector 18)
  ; clk (bitvector 1)
  ; aclr (bitvector 1)
)
(struct cyclone10lp_mac_mult_Outputs (dataout) #:transparent
  ; dataout (bitvector 36)
)
(struct
  cyclone10lp_mac_mult_State
  ($auto$clk2fflogic.cc_86_sample_control_edge$201
    $auto$clk2fflogic.cc_86_sample_control_edge$185
    $auto$clk2fflogic.cc_102_sample_data$197
    $auto$clk2fflogic.cc_102_sample_data$199
    $auto$clk2fflogic.cc_102_sample_data$181
    $auto$clk2fflogic.cc_102_sample_data$183
    $auto$clk2fflogic.cc_86_sample_control_edge$169
    $auto$clk2fflogic.cc_86_sample_control_edge$153
    $auto$clk2fflogic.cc_74_sample_control$207
    $auto$clk2fflogic.cc_74_sample_control$191
    $auto$clk2fflogic.cc_102_sample_data$165
    $auto$clk2fflogic.cc_102_sample_data$167
    $auto$clk2fflogic.cc_102_sample_data$149
    $auto$clk2fflogic.cc_102_sample_data$151
    $auto$clk2fflogic.cc_74_sample_control$175
    $auto$clk2fflogic.cc_74_sample_control$159)
  #:transparent
  ; $auto$clk2fflogic.cc_86_sample_control_edge$201 (bitvector 1)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$185 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$197 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$199 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$181 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$183 (bitvector 1)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$169 (bitvector 1)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$153 (bitvector 1)
  ; $auto$clk2fflogic.cc_74_sample_control$207 (bitvector 1)
  ; $auto$clk2fflogic.cc_74_sample_control$191 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$165 (bitvector 18)
  ; $auto$clk2fflogic.cc_102_sample_data$167 (bitvector 18)
  ; $auto$clk2fflogic.cc_102_sample_data$149 (bitvector 18)
  ; $auto$clk2fflogic.cc_102_sample_data$151 (bitvector 18)
  ; $auto$clk2fflogic.cc_74_sample_control$175 (bitvector 1)
  ; $auto$clk2fflogic.cc_74_sample_control$159 (bitvector 1)
)
(define
  (cyclone10lp_mac_mult_inputs_helper inputs)
  (cyclone10lp_mac_mult_Inputs
    (let
      (
        (assoc-result
          (assoc "signb_clock" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "signb" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "signa_clock" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "signa" inputs)))
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
          (assoc "datab_clock" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "datab" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "dataa_clock" inputs)))
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
  (cyclone10lp_mac_mult_outputs_helper outputs)
  (list
    (cons "dataout" (cyclone10lp_mac_mult_Outputs-dataout outputs))))
(define (cyclone10lp_mac_mult inputs state)
  (let ((signb_reg.clk (cyclone10lp_mac_mult_Inputs-clk inputs))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_95_sample_data$_signb_reg.q_tmp_sampled$196
      (cyclone10lp_mac_mult_State-$auto$clk2fflogic.cc_102_sample_data$197
        state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_95_sample_data$$flatten_signb_reg.$0_q_tmp_0_0__sampled$198
      (cyclone10lp_mac_mult_State-$auto$clk2fflogic.cc_102_sample_data$199
        state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_signb_reg.clk_sampled$200
      (cyclone10lp_mac_mult_State-$auto$clk2fflogic.cc_86_sample_control_edge$201
        state))) ; (bitvector 1)
  (let
    ((n4
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_signb_reg.clk_sampled$200
        signb_reg.clk))) ; (bitvector 2)
  (let (($auto$rtlil.cc_2974_Eqx$203 (bool->bitvector (bveq n4 (bv #b01 2))))) ; (bitvector 1)
  (let
    (($auto$rtlil.cc_3053_Mux$205
      (if
        (bitvector->bool $auto$rtlil.cc_2974_Eqx$203)
        $auto$clk2fflogic.cc_95_sample_data$$flatten_signb_reg.$0_q_tmp_0_0__sampled$198
        $auto$clk2fflogic.cc_95_sample_data$_signb_reg.q_tmp_sampled$196))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_69_sample_control$_signb_reg.aclr_sampled$206
      (cyclone10lp_mac_mult_State-$auto$clk2fflogic.cc_74_sample_control$207
        state))) ; (bitvector 1)
  (let
    (($auto$rtlil.cc_3053_Mux$209
      (if
        (bitvector->bool
          $auto$clk2fflogic.cc_69_sample_control$_signb_reg.aclr_sampled$206)
        (bv #b0 1)
        $auto$rtlil.cc_3053_Mux$205))) ; (bitvector 1)
  (let ((signb_reg.aclr (cyclone10lp_mac_mult_Inputs-aclr inputs))) ; (bitvector 1)
  (let
    ((signb_reg.q_tmp
      (if
        (bitvector->bool signb_reg.aclr)
        (bv #b0 1)
        $auto$rtlil.cc_3053_Mux$209))) ; (bitvector 1)
  (let ((signb (cyclone10lp_mac_mult_Inputs-signb inputs))) ; (bitvector 1)
  (let ((ena (cyclone10lp_mac_mult_Inputs-ena inputs))) ; (bitvector 1)
  (let
    (($flatten_signb_reg.$0_q_tmp_0_0_
      (if (bitvector->bool ena) signb signb_reg.q_tmp))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_95_sample_data$_signa_reg.q_tmp_sampled$180
      (cyclone10lp_mac_mult_State-$auto$clk2fflogic.cc_102_sample_data$181
        state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_95_sample_data$$flatten_signa_reg.$0_q_tmp_0_0__sampled$182
      (cyclone10lp_mac_mult_State-$auto$clk2fflogic.cc_102_sample_data$183
        state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_signa_reg.clk_sampled$184
      (cyclone10lp_mac_mult_State-$auto$clk2fflogic.cc_86_sample_control_edge$185
        state))) ; (bitvector 1)
  (let
    ((n19
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_signa_reg.clk_sampled$184
        signb_reg.clk))) ; (bitvector 2)
  (let (($auto$rtlil.cc_2974_Eqx$187 (bool->bitvector (bveq n19 (bv #b01 2))))) ; (bitvector 1)
  (let
    (($auto$rtlil.cc_3053_Mux$189
      (if
        (bitvector->bool $auto$rtlil.cc_2974_Eqx$187)
        $auto$clk2fflogic.cc_95_sample_data$$flatten_signa_reg.$0_q_tmp_0_0__sampled$182
        $auto$clk2fflogic.cc_95_sample_data$_signa_reg.q_tmp_sampled$180))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_69_sample_control$_signa_reg.aclr_sampled$190
      (cyclone10lp_mac_mult_State-$auto$clk2fflogic.cc_74_sample_control$191
        state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_117_mux$192$_Y
      (if
        (bitvector->bool
          $auto$clk2fflogic.cc_69_sample_control$_signa_reg.aclr_sampled$190)
        (bv #b0 1)
        $auto$rtlil.cc_3053_Mux$189))) ; (bitvector 1)
  (let
    ((signa_reg.q_tmp
      (if
        (bitvector->bool signb_reg.aclr)
        (bv #b0 1)
        $auto$clk2fflogic.cc_117_mux$192$_Y))) ; (bitvector 1)
  (let ((signa (cyclone10lp_mac_mult_Inputs-signa inputs))) ; (bitvector 1)
  (let
    (($flatten_signa_reg.$0_q_tmp_0_0_
      (if (bitvector->bool ena) signa signa_reg.q_tmp))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_95_sample_data$_datab_reg.dataout_tmp_sampled$164
      (cyclone10lp_mac_mult_State-$auto$clk2fflogic.cc_102_sample_data$165
        state))) ; (bitvector 18)
  (let
    (($auto$clk2fflogic.cc_95_sample_data$$flatten_datab_reg.$0_dataout_tmp_17_0__sampled$166
      (cyclone10lp_mac_mult_State-$auto$clk2fflogic.cc_102_sample_data$167
        state))) ; (bitvector 18)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_datab_reg.clk_sampled$168
      (cyclone10lp_mac_mult_State-$auto$clk2fflogic.cc_86_sample_control_edge$169
        state))) ; (bitvector 1)
  (let
    ((n30
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_datab_reg.clk_sampled$168
        signb_reg.clk))) ; (bitvector 2)
  (let (($auto$rtlil.cc_2974_Eqx$171 (bool->bitvector (bveq n30 (bv #b01 2))))) ; (bitvector 1)
  (let
    (($auto$rtlil.cc_3053_Mux$173
      (if
        (bitvector->bool $auto$rtlil.cc_2974_Eqx$171)
        $auto$clk2fflogic.cc_95_sample_data$$flatten_datab_reg.$0_dataout_tmp_17_0__sampled$166
        $auto$clk2fflogic.cc_95_sample_data$_datab_reg.dataout_tmp_sampled$164))) ; (bitvector 18)
  (let
    (($auto$clk2fflogic.cc_69_sample_control$_datab_reg.aclr_sampled$174
      (cyclone10lp_mac_mult_State-$auto$clk2fflogic.cc_74_sample_control$175
        state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_117_mux$176$_Y
      (if
        (bitvector->bool
          $auto$clk2fflogic.cc_69_sample_control$_datab_reg.aclr_sampled$174)
        (bv #b000000000000000000 18)
        $auto$rtlil.cc_3053_Mux$173))) ; (bitvector 18)
  (let
    ((datab_reg.dataout_tmp
      (if
        (bitvector->bool signb_reg.aclr)
        (bv #b000000000000000000 18)
        $auto$clk2fflogic.cc_117_mux$176$_Y))) ; (bitvector 18)
  (let ((datab (cyclone10lp_mac_mult_Inputs-datab inputs))) ; (bitvector 18)
  (let
    (($flatten_datab_reg.$eqx$_Users_gussmith_lakeroad_lakeroad_private_intel_cyclone10lp_cyclone10lp_mac_mult_modified_for_racket_import.v_305$112$_Y
      (bool->bitvector (bveq ena (bv #b1 1))))) ; (bitvector 1)
  (let
    (($flatten_datab_reg.$0_dataout_tmp_17_0_
      (if
        (bitvector->bool
          $flatten_datab_reg.$eqx$_Users_gussmith_lakeroad_lakeroad_private_intel_cyclone10lp_cyclone10lp_mac_mult_modified_for_racket_import.v_305$112$_Y)
        datab
        datab_reg.dataout_tmp))) ; (bitvector 18)
  (let
    (($auto$clk2fflogic.cc_95_sample_data$_dataa_reg.dataout_tmp_sampled$148
      (cyclone10lp_mac_mult_State-$auto$clk2fflogic.cc_102_sample_data$149
        state))) ; (bitvector 18)
  (let
    (($auto$clk2fflogic.cc_95_sample_data$$flatten_dataa_reg.$0_dataout_tmp_17_0__sampled$150
      (cyclone10lp_mac_mult_State-$auto$clk2fflogic.cc_102_sample_data$151
        state))) ; (bitvector 18)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_dataa_reg.clk_sampled$152
      (cyclone10lp_mac_mult_State-$auto$clk2fflogic.cc_86_sample_control_edge$153
        state))) ; (bitvector 1)
  (let
    ((n44
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_dataa_reg.clk_sampled$152
        signb_reg.clk))) ; (bitvector 2)
  (let (($auto$rtlil.cc_2974_Eqx$155 (bool->bitvector (bveq n44 (bv #b01 2))))) ; (bitvector 1)
  (let
    (($auto$rtlil.cc_3053_Mux$157
      (if
        (bitvector->bool $auto$rtlil.cc_2974_Eqx$155)
        $auto$clk2fflogic.cc_95_sample_data$$flatten_dataa_reg.$0_dataout_tmp_17_0__sampled$150
        $auto$clk2fflogic.cc_95_sample_data$_dataa_reg.dataout_tmp_sampled$148))) ; (bitvector 18)
  (let
    (($auto$clk2fflogic.cc_69_sample_control$_dataa_reg.aclr_sampled$158
      (cyclone10lp_mac_mult_State-$auto$clk2fflogic.cc_74_sample_control$159
        state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_117_mux$160$_Y
      (if
        (bitvector->bool
          $auto$clk2fflogic.cc_69_sample_control$_dataa_reg.aclr_sampled$158)
        (bv #b000000000000000000 18)
        $auto$rtlil.cc_3053_Mux$157))) ; (bitvector 18)
  (let
    ((dataa_reg.dataout_tmp
      (if
        (bitvector->bool signb_reg.aclr)
        (bv #b000000000000000000 18)
        $auto$clk2fflogic.cc_117_mux$160$_Y))) ; (bitvector 18)
  (let ((dataa (cyclone10lp_mac_mult_Inputs-dataa inputs))) ; (bitvector 18)
  (let
    (($flatten_dataa_reg.$eqx$_Users_gussmith_lakeroad_lakeroad_private_intel_cyclone10lp_cyclone10lp_mac_mult_modified_for_racket_import.v_305$112$_Y
      (bool->bitvector (bveq ena (bv #b1 1))))) ; (bitvector 1)
  (let
    (($flatten_dataa_reg.$0_dataout_tmp_17_0_
      (if
        (bitvector->bool
          $flatten_dataa_reg.$eqx$_Users_gussmith_lakeroad_lakeroad_private_intel_cyclone10lp_cyclone10lp_mac_mult_modified_for_racket_import.v_305$112$_Y)
        dataa
        dataa_reg.dataout_tmp))) ; (bitvector 18)
  (let ((dataa_clock (cyclone10lp_mac_mult_Inputs-dataa_clock inputs))) ; (bitvector 1)
  (let
    ((dataa_use_reg (if (bitvector->bool dataa_clock) (bv #b1 1) (bv #b0 1)))) ; (bitvector 1)
  (let
    ((idataa_int
      (if (bitvector->bool dataa_use_reg) dataa_reg.dataout_tmp dataa))) ; (bitvector 18)
  (let
    (($flatten_mac_multiply.$neg$_Users_gussmith_lakeroad_lakeroad_private_intel_cyclone10lp_cyclone10lp_mac_mult_modified_for_racket_import.v_209$94_Y
      (bvneg idataa_int))) ; (bitvector 18)
  (let ((signa_clock (cyclone10lp_mac_mult_Inputs-signa_clock inputs))) ; (bitvector 1)
  (let
    ((signa_use_reg (if (bitvector->bool signa_clock) (bv #b1 1) (bv #b0 1)))) ; (bitvector 1)
  (let
    ((isigna_int (if (bitvector->bool signa_use_reg) signa_reg.q_tmp signa))) ; (bitvector 1)
  (let
    (($flatten_mac_multiply.$not$_Users_gussmith_lakeroad_lakeroad_private_intel_cyclone10lp_cyclone10lp_mac_mult_modified_for_racket_import.v_206$85_Y
      (bvnot isigna_int))) ; (bitvector 1)
  (let ((n61 (extract 17 17 idataa_int))) ; (bitvector 1)
  (let
    (($flatten_mac_multiply.$not$_Users_gussmith_lakeroad_lakeroad_private_intel_cyclone10lp_cyclone10lp_mac_mult_modified_for_racket_import.v_206$86_Y
      (bvnot n61))) ; (bitvector 1)
  (let
    ((mac_multiply.ia_is_positive
      (bvor
        $flatten_mac_multiply.$not$_Users_gussmith_lakeroad_lakeroad_private_intel_cyclone10lp_cyclone10lp_mac_mult_modified_for_racket_import.v_206$85_Y
        $flatten_mac_multiply.$not$_Users_gussmith_lakeroad_lakeroad_private_intel_cyclone10lp_cyclone10lp_mac_mult_modified_for_racket_import.v_206$86_Y))) ; (bitvector 1)
  (let
    (($flatten_mac_multiply.$ternary$_Users_gussmith_lakeroad_lakeroad_private_intel_cyclone10lp_cyclone10lp_mac_mult_modified_for_racket_import.v_209$95$_Y
      (if
        (bitvector->bool mac_multiply.ia_is_positive)
        idataa_int
        $flatten_mac_multiply.$neg$_Users_gussmith_lakeroad_lakeroad_private_intel_cyclone10lp_cyclone10lp_mac_mult_modified_for_racket_import.v_209$94_Y))) ; (bitvector 18)
  (let
    ((n65
      (zero-extend
        $flatten_mac_multiply.$ternary$_Users_gussmith_lakeroad_lakeroad_private_intel_cyclone10lp_cyclone10lp_mac_mult_modified_for_racket_import.v_209$95$_Y
        (bitvector 36)))) ; (bitvector 36)
  (let ((datab_clock (cyclone10lp_mac_mult_Inputs-datab_clock inputs))) ; (bitvector 1)
  (let
    ((datab_use_reg (if (bitvector->bool datab_clock) (bv #b1 1) (bv #b0 1)))) ; (bitvector 1)
  (let
    ((idatab_int
      (if (bitvector->bool datab_use_reg) datab_reg.dataout_tmp datab))) ; (bitvector 18)
  (let
    (($flatten_mac_multiply.$neg$_Users_gussmith_lakeroad_lakeroad_private_intel_cyclone10lp_cyclone10lp_mac_mult_modified_for_racket_import.v_210$99_Y
      (bvneg idatab_int))) ; (bitvector 18)
  (let ((signb_clock (cyclone10lp_mac_mult_Inputs-signb_clock inputs))) ; (bitvector 1)
  (let
    ((signb_use_reg (if (bitvector->bool signb_clock) (bv #b1 1) (bv #b0 1)))) ; (bitvector 1)
  (let
    ((isignb_int (if (bitvector->bool signb_use_reg) signb_reg.q_tmp signb))) ; (bitvector 1)
  (let
    (($flatten_mac_multiply.$not$_Users_gussmith_lakeroad_lakeroad_private_intel_cyclone10lp_cyclone10lp_mac_mult_modified_for_racket_import.v_207$88_Y
      (bvnot isignb_int))) ; (bitvector 1)
  (let ((n74 (extract 17 17 idatab_int))) ; (bitvector 1)
  (let
    (($flatten_mac_multiply.$not$_Users_gussmith_lakeroad_lakeroad_private_intel_cyclone10lp_cyclone10lp_mac_mult_modified_for_racket_import.v_207$89_Y
      (bvnot n74))) ; (bitvector 1)
  (let
    ((mac_multiply.ib_is_positive
      (bvor
        $flatten_mac_multiply.$not$_Users_gussmith_lakeroad_lakeroad_private_intel_cyclone10lp_cyclone10lp_mac_mult_modified_for_racket_import.v_207$88_Y
        $flatten_mac_multiply.$not$_Users_gussmith_lakeroad_lakeroad_private_intel_cyclone10lp_cyclone10lp_mac_mult_modified_for_racket_import.v_207$89_Y))) ; (bitvector 1)
  (let
    (($flatten_mac_multiply.$ternary$_Users_gussmith_lakeroad_lakeroad_private_intel_cyclone10lp_cyclone10lp_mac_mult_modified_for_racket_import.v_210$100$_Y
      (if
        (bitvector->bool mac_multiply.ib_is_positive)
        idatab_int
        $flatten_mac_multiply.$neg$_Users_gussmith_lakeroad_lakeroad_private_intel_cyclone10lp_cyclone10lp_mac_mult_modified_for_racket_import.v_210$99_Y))) ; (bitvector 18)
  (let
    ((n78
      (zero-extend
        $flatten_mac_multiply.$ternary$_Users_gussmith_lakeroad_lakeroad_private_intel_cyclone10lp_cyclone10lp_mac_mult_modified_for_racket_import.v_210$100$_Y
        (bitvector 36)))) ; (bitvector 36)
  (let ((mac_multiply.iabsresult (bvmul n65 n78))) ; (bitvector 36)
  (let
    (($flatten_mac_multiply.$neg$_Users_gussmith_lakeroad_lakeroad_private_intel_cyclone10lp_cyclone10lp_mac_mult_modified_for_racket_import.v_214$104_Y
      (bvneg mac_multiply.iabsresult))) ; (bitvector 36)
  (let
    (($flatten_mac_multiply.$xor$_Users_gussmith_lakeroad_lakeroad_private_intel_cyclone10lp_cyclone10lp_mac_mult_modified_for_racket_import.v_214$102$_Y
      (bvxor mac_multiply.ia_is_positive mac_multiply.ib_is_positive))) ; (bitvector 1)
  (let
    (($flatten_mac_multiply.$auto$wreduce.cc_514_run$142
      (concat
        (bv #b0000000000000000000000000000000 31)
        $flatten_mac_multiply.$xor$_Users_gussmith_lakeroad_lakeroad_private_intel_cyclone10lp_cyclone10lp_mac_mult_modified_for_racket_import.v_214$102$_Y))) ; (bitvector 32)
  (let ((n84 (extract 0 0 $flatten_mac_multiply.$auto$wreduce.cc_514_run$142))) ; (bitvector 1)
  (let
    ((dataout
      (if
        (bitvector->bool n84)
        $flatten_mac_multiply.$neg$_Users_gussmith_lakeroad_lakeroad_private_intel_cyclone10lp_cyclone10lp_mac_mult_modified_for_racket_import.v_214$104_Y
        mac_multiply.iabsresult))) ; (bitvector 36)
  (cons
    (cyclone10lp_mac_mult_Outputs
      dataout ; dataout
    )
    (cyclone10lp_mac_mult_State
      signb_reg.clk ; $auto$clk2fflogic.cc:86:sample_control_edge$201
      signb_reg.clk ; $auto$clk2fflogic.cc:86:sample_control_edge$185
      signb_reg.q_tmp ; $auto$clk2fflogic.cc:102:sample_data$197
      $flatten_signb_reg.$0_q_tmp_0_0_ ; $auto$clk2fflogic.cc:102:sample_data$199
      signa_reg.q_tmp ; $auto$clk2fflogic.cc:102:sample_data$181
      $flatten_signa_reg.$0_q_tmp_0_0_ ; $auto$clk2fflogic.cc:102:sample_data$183
      signb_reg.clk ; $auto$clk2fflogic.cc:86:sample_control_edge$169
      signb_reg.clk ; $auto$clk2fflogic.cc:86:sample_control_edge$153
      signb_reg.aclr ; $auto$clk2fflogic.cc:74:sample_control$207
      signb_reg.aclr ; $auto$clk2fflogic.cc:74:sample_control$191
      datab_reg.dataout_tmp ; $auto$clk2fflogic.cc:102:sample_data$165
      $flatten_datab_reg.$0_dataout_tmp_17_0_ ; $auto$clk2fflogic.cc:102:sample_data$167
      dataa_reg.dataout_tmp ; $auto$clk2fflogic.cc:102:sample_data$149
      $flatten_dataa_reg.$0_dataout_tmp_17_0_ ; $auto$clk2fflogic.cc:102:sample_data$151
      signb_reg.aclr ; $auto$clk2fflogic.cc:74:sample_control$175
      signb_reg.aclr ; $auto$clk2fflogic.cc:74:sample_control$159
    ))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
  ))))))))
(define cyclone10lp_mac_mult_initial
  (cyclone10lp_mac_mult_State
    (bv #b1 1)
    (bv #b1 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b1 1)
    (bv #b1 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b000000000000000000 18)
    (bv #b000000000000000000 18)
    (bv #b000000000000000000 18)
    (bv #b000000000000000000 18)
    (bv #b0 1)
    (bv #b0 1)))
