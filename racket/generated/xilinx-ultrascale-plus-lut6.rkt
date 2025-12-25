#lang rosette/safe
    (provide (rename-out [LUT6 xilinx-ultrascale-plus-lut6] [LUT6_initial xilinx-ultrascale-plus-lut6-initial] [LUT6_inputs_helper xilinx-ultrascale-plus-lut6-inputs] [LUT6_outputs_helper xilinx-ultrascale-plus-lut6-outputs]))(struct LUT6_Inputs (INIT I5 I4 I3 I2 I1 I0) #:transparent
  ; INIT (bitvector 64)
  ; I5 (bitvector 1)
  ; I4 (bitvector 1)
  ; I3 (bitvector 1)
  ; I2 (bitvector 1)
  ; I1 (bitvector 1)
  ; I0 (bitvector 1)
)
(struct LUT6_Outputs (O) #:transparent
  ; O (bitvector 1)
)
(struct LUT6_State () #:transparent)
(define
  (LUT6_inputs_helper inputs)
  (LUT6_Inputs
    (let
      (
        (assoc-result
          (assoc "INIT" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "I5" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "I4" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "I3" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "I2" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "I1" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "I0" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))))
(define
  (LUT6_outputs_helper outputs)
  (list
    (cons "O" (LUT6_Outputs-O outputs))))
(define (LUT6 inputs state)
  (let ((INIT (LUT6_Inputs-INIT inputs))) ; (bitvector 64)
  (let ((n2 (extract 7 0 INIT))) ; (bitvector 8)
  (let ((I2 (LUT6_Inputs-I2 inputs))) ; (bitvector 1)
  (let ((n5 (concat I2 (bv #b00 2)))) ; (bitvector 3)
  (let ((n6 (bvlshr n2 (zero-extend n5 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$194_Y
      (extract 0 0 n6))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_105$191$_Y
      (bool->bitvector (bveq I2 (bv #b1 1))))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_105$192$_Y
      (bool->bitvector (bveq I2 (bv #b0 1))))) ; (bitvector 1)
  (let
    (($logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_105$193_Y
      (bvor
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_105$191$_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_105$192$_Y))) ; (bitvector 1)
  (let ((n14 (concat I2 (bv #b01 2)))) ; (bitvector 3)
  (let ((n15 (bvlshr n2 (zero-extend n14 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$195_Y
      (extract 0 0 n15))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_106$196$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$194_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$195_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_105$197$_Y
      (bvand
        $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_105$193_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_106$196$_Y))) ; (bitvector 1)
  (let ((n20 (concat I2 (bv #b10 2)))) ; (bitvector 3)
  (let ((n21 (bvlshr n2 (zero-extend n20 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$199_Y
      (extract 0 0 n21))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_107$200$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$194_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$199_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_105$201$_Y
      (bvand
        $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_105$197$_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_107$200$_Y))) ; (bitvector 1)
  (let ((n26 (concat I2 (bv #b11 2)))) ; (bitvector 3)
  (let ((n27 (bvlshr n2 (zero-extend n26 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$203_Y
      (extract 0 0 n27))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_108$204$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$194_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$203_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_105$205$_Y
      (bvand
        $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_105$201$_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_108$204$_Y))) ; (bitvector 1)
  (let
    (($procmux$2243$_Y
      (if
        (bitvector->bool
          $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_105$205$_Y)
        $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$194_Y
        (bv #b0 1)))) ; (bitvector 1)
  (let ((I1 (LUT6_Inputs-I1 inputs))) ; (bitvector 1)
  (let ((n33 (concat I1 (bv #b0 1)))) ; (bitvector 2)
  (let ((n34 (zero-extend n33 (bitvector 3)))) ; (bitvector 3)
  (let ((n35 (bvlshr n2 (zero-extend n34 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$177_Y
      (extract 0 0 n35))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_100$174$_Y
      (bool->bitvector (bveq I1 (bv #b1 1))))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_100$175$_Y
      (bool->bitvector (bveq I1 (bv #b0 1))))) ; (bitvector 1)
  (let
    (($logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_100$176_Y
      (bvor
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_100$174$_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_100$175$_Y))) ; (bitvector 1)
  (let ((n40 (concat I1 (bv #b1 1)))) ; (bitvector 2)
  (let ((n41 (zero-extend n40 (bitvector 3)))) ; (bitvector 3)
  (let ((n42 (bvlshr n2 (zero-extend n41 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$178_Y
      (extract 0 0 n42))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_101$179$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$177_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$178_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_100$180$_Y
      (bvand
        $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_100$176_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_101$179$_Y))) ; (bitvector 1)
  (let ((n46 (concat I1 (bv #b0 1)))) ; (bitvector 2)
  (let ((n47 (concat (bv #b1 1) n46))) ; (bitvector 3)
  (let ((n48 (bvlshr n2 (zero-extend n47 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$182_Y
      (extract 0 0 n48))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_102$183$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$177_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$182_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_100$184$_Y
      (bvand
        $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_100$180$_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_102$183$_Y))) ; (bitvector 1)
  (let ((n52 (concat I1 (bv #b1 1)))) ; (bitvector 2)
  (let ((n53 (concat (bv #b1 1) n52))) ; (bitvector 3)
  (let ((n54 (bvlshr n2 (zero-extend n53 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$186_Y
      (extract 0 0 n54))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_103$187$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$177_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$186_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_100$188$_Y
      (bvand
        $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_100$184$_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_103$187$_Y))) ; (bitvector 1)
  (let
    (($procmux$2273$_Y
      (if
        (bitvector->bool
          $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_100$188$_Y)
        $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$177_Y
        $procmux$2243$_Y))) ; (bitvector 1)
  (let ((I0 (LUT6_Inputs-I0 inputs))) ; (bitvector 1)
  (let ((n60 (zero-extend I0 (bitvector 3)))) ; (bitvector 3)
  (let ((n61 (bvlshr n2 (zero-extend n60 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$160_Y
      (extract 0 0 n61))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_95$157$_Y
      (bool->bitvector (bveq I0 (bv #b1 1))))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_95$158$_Y
      (bool->bitvector (bveq I0 (bv #b0 1))))) ; (bitvector 1)
  (let
    (($logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_95$159_Y
      (bvor
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_95$157$_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_95$158$_Y))) ; (bitvector 1)
  (let ((n66 (concat (bv #b1 1) I0))) ; (bitvector 2)
  (let ((n67 (zero-extend n66 (bitvector 3)))) ; (bitvector 3)
  (let ((n68 (bvlshr n2 (zero-extend n67 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$161_Y
      (extract 0 0 n68))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_96$162$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$160_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$161_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_95$163$_Y
      (bvand
        $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_95$159_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_96$162$_Y))) ; (bitvector 1)
  (let ((n72 (concat (bv #b10 2) I0))) ; (bitvector 3)
  (let ((n73 (bvlshr n2 (zero-extend n72 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$165_Y
      (extract 0 0 n73))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_97$166$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$160_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$165_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_95$167$_Y
      (bvand
        $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_95$163$_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_97$166$_Y))) ; (bitvector 1)
  (let ((n77 (concat (bv #b11 2) I0))) ; (bitvector 3)
  (let ((n78 (bvlshr n2 (zero-extend n77 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$169_Y
      (extract 0 0 n78))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_98$170$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$160_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$169_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_95$171$_Y
      (bvand
        $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_95$167$_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_98$170$_Y))) ; (bitvector 1)
  (let
    (($procmux$2300$_Y
      (if
        (bitvector->bool
          $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_95$171$_Y)
        $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$160_Y
        $procmux$2273$_Y))) ; (bitvector 1)
  (let ((n83 (concat I1 (bv #b0 1)))) ; (bitvector 2)
  (let ((n84 (concat I2 n83))) ; (bitvector 3)
  (let ((n85 (bvlshr n2 (zero-extend n84 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$151_Y
      (extract 0 0 n85))) ; (bitvector 1)
  (let
    (($xor$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_82$110_Y
      (bvxor I2 I1))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_92$147$_Y
      (bool->bitvector
        (bveq
          $xor$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_82$110_Y
          (bv #b1 1))))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_92$149$_Y
      (bool->bitvector
        (bveq
          $xor$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_82$110_Y
          (bv #b0 1))))) ; (bitvector 1)
  (let
    (($logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_92$150_Y
      (bvor
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_92$147$_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_92$149$_Y))) ; (bitvector 1)
  (let ((n91 (concat I1 (bv #b1 1)))) ; (bitvector 2)
  (let ((n92 (concat I2 n91))) ; (bitvector 3)
  (let ((n93 (bvlshr n2 (zero-extend n92 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$152_Y
      (extract 0 0 n93))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_93$153$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$151_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$152_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_92$154$_Y
      (bvand
        $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_92$150_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_93$153$_Y))) ; (bitvector 1)
  (let
    (($procmux$2324$_Y
      (if
        (bitvector->bool
          $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_92$154$_Y)
        $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$151_Y
        $procmux$2300$_Y))) ; (bitvector 1)
  (let ((n98 (concat (bv #b0 1) I0))) ; (bitvector 2)
  (let ((n99 (concat I2 n98))) ; (bitvector 3)
  (let ((n100 (bvlshr n2 (zero-extend n99 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$140_Y
      (extract 0 0 n100))) ; (bitvector 1)
  (let
    (($xor$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_89$135_Y
      (bvxor I2 I0))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_89$136$_Y
      (bool->bitvector
        (bveq
          $xor$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_89$135_Y
          (bv #b1 1))))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_89$138$_Y
      (bool->bitvector
        (bveq
          $xor$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_89$135_Y
          (bv #b0 1))))) ; (bitvector 1)
  (let
    (($logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_89$139_Y
      (bvor
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_89$136$_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_89$138$_Y))) ; (bitvector 1)
  (let ((n106 (concat (bv #b1 1) I0))) ; (bitvector 2)
  (let ((n107 (concat I2 n106))) ; (bitvector 3)
  (let ((n108 (bvlshr n2 (zero-extend n107 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$141_Y
      (extract 0 0 n108))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_90$142$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$140_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$141_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_89$143$_Y
      (bvand
        $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_89$139_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_90$142$_Y))) ; (bitvector 1)
  (let
    (($procmux$2345$_Y
      (if
        (bitvector->bool
          $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_89$143$_Y)
        $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$140_Y
        $procmux$2324$_Y))) ; (bitvector 1)
  (let ((n113 (concat I1 I0))) ; (bitvector 2)
  (let ((n114 (zero-extend n113 (bitvector 3)))) ; (bitvector 3)
  (let ((n115 (bvlshr n2 (zero-extend n114 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$129_Y
      (extract 0 0 n115))) ; (bitvector 1)
  (let
    (($xor$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_116$38_Y
      (bvxor I0 I1))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_86$125$_Y
      (bool->bitvector
        (bveq
          $xor$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_116$38_Y
          (bv #b1 1))))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_86$127$_Y
      (bool->bitvector
        (bveq
          $xor$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_116$38_Y
          (bv #b0 1))))) ; (bitvector 1)
  (let
    (($logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_86$128_Y
      (bvor
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_86$125$_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_86$127$_Y))) ; (bitvector 1)
  (let ((n121 (concat I1 I0))) ; (bitvector 2)
  (let ((n122 (concat (bv #b1 1) n121))) ; (bitvector 3)
  (let ((n123 (bvlshr n2 (zero-extend n122 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$130_Y
      (extract 0 0 n123))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_87$131$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$129_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$130_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_86$132$_Y
      (bvand
        $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_86$128_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_87$131$_Y))) ; (bitvector 1)
  (let
    (($procmux$2363$_Y
      (if
        (bitvector->bool
          $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_86$132$_Y)
        $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$129_Y
        $procmux$2345$_Y))) ; (bitvector 1)
  (let ((n128 (extract 0 0 INIT))) ; (bitvector 1)
  (let
    (($reduce_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_84$119_Y
      (apply bvor (bitvector->bits n2)))) ; (bitvector 1)
  (let
    (($not$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_84$120_Y
      (bvnot
        $reduce_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_84$119_Y))) ; (bitvector 1)
  (let
    (($reduce_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_84$121_Y
      (apply bvand (bitvector->bits n2)))) ; (bitvector 1)
  (let
    (($logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_84$122$_Y
      (bvor
        $not$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_84$120_Y
        $reduce_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_84$121_Y))) ; (bitvector 1)
  (let
    (($procmux$2378$_Y
      (if
        (bitvector->bool
          $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_84$122$_Y)
        n128
        $procmux$2363$_Y))) ; (bitvector 1)
  (let ((n134 (concat I1 I0))) ; (bitvector 2)
  (let ((n135 (concat I2 n134))) ; (bitvector 3)
  (let ((n136 (bvlshr n2 (zero-extend n135 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$118_Y
      (extract 0 0 n136))) ; (bitvector 1)
  (let
    (($xor$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_82$111_Y
      (bvxor
        $xor$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_82$110_Y
        I0))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_82$112$_Y
      (bool->bitvector
        (bveq
          $xor$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_82$111_Y
          (bv #b1 1))))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_82$115$_Y
      (bool->bitvector
        (bveq
          $xor$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_82$111_Y
          (bv #b0 1))))) ; (bitvector 1)
  (let
    (($logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_82$116$_Y
      (bvor
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_82$112$_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_82$115$_Y))) ; (bitvector 1)
  (let
    (($procmux$2390$_Y
      (if
        (bitvector->bool
          $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_82$116$_Y)
        $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$118_Y
        $procmux$2378$_Y))) ; (bitvector 1)
  (let
    (($reduce_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_118$79_Y
      (apply bvor (bitvector->bits INIT)))) ; (bitvector 1)
  (let
    (($not$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_118$80_Y
      (bvnot
        $reduce_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_118$79_Y))) ; (bitvector 1)
  (let
    (($reduce_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_118$81_Y
      (apply bvand (bitvector->bits INIT)))) ; (bitvector 1)
  (let
    (($logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_118$82$_Y
      (bvor
        $not$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_118$80_Y
        $reduce_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_118$81_Y))) ; (bitvector 1)
  (let
    (($procmux$2393$_Y
      (if
        (bitvector->bool
          $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_118$82$_Y)
        (bv #b0 1)
        $procmux$2390$_Y))) ; (bitvector 1)
  (let
    (($xor$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_116$39$_Y
      (bvxor
        $xor$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_116$38_Y
        I2))) ; (bitvector 1)
  (let ((I3 (LUT6_Inputs-I3 inputs))) ; (bitvector 1)
  (let
    (($xor$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_116$40$_Y
      (bvxor
        $xor$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_116$39$_Y
        I3))) ; (bitvector 1)
  (let ((I4 (LUT6_Inputs-I4 inputs))) ; (bitvector 1)
  (let
    (($xor$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_116$41$_Y
      (bvxor
        $xor$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_116$40$_Y
        I4))) ; (bitvector 1)
  (let ((I5 (LUT6_Inputs-I5 inputs))) ; (bitvector 1)
  (let
    (($xor$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_116$42_Y
      (bvxor
        $xor$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_116$41$_Y
        I5))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_116$43$_Y
      (bool->bitvector
        (bveq
          $xor$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_116$42_Y
          (bv #b0 1))))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_116$49$_Y
      (bool->bitvector
        (bveq
          $xor$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_116$42_Y
          (bv #b1 1))))) ; (bitvector 1)
  (let
    (($logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_116$50$_Y
      (bvor
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_116$43$_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_116$49$_Y))) ; (bitvector 1)
  (let
    (($3_lut_mux8_f$func$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_128$1.$result_0_0_$117
      (if
        (bitvector->bool
          $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_116$50$_Y)
        (bv #b0 1)
        $procmux$2393$_Y))) ; (bitvector 1)
  (let ((n159 (extract 15 8 INIT))) ; (bitvector 8)
  (let ((n160 (bvlshr n159 (zero-extend n5 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$292_Y
      (extract 0 0 n160))) ; (bitvector 1)
  (let ((n162 (bvlshr n159 (zero-extend n14 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$293_Y
      (extract 0 0 n162))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_106$294$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$292_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$293_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_105$295$_Y
      (bvand
        $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_105$193_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_106$294$_Y))) ; (bitvector 1)
  (let ((n166 (bvlshr n159 (zero-extend n20 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$297_Y
      (extract 0 0 n166))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_107$298$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$292_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$297_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_105$299$_Y
      (bvand
        $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_105$295$_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_107$298$_Y))) ; (bitvector 1)
  (let ((n170 (bvlshr n159 (zero-extend n26 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$301_Y
      (extract 0 0 n170))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_108$302$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$292_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$301_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_105$303$_Y
      (bvand
        $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_105$299$_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_108$302$_Y))) ; (bitvector 1)
  (let
    (($procmux$2087$_Y
      (if
        (bitvector->bool
          $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_105$303$_Y)
        $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$292_Y
        (bv #b0 1)))) ; (bitvector 1)
  (let ((n175 (zero-extend n33 (bitvector 3)))) ; (bitvector 3)
  (let ((n176 (bvlshr n159 (zero-extend n175 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$275_Y
      (extract 0 0 n176))) ; (bitvector 1)
  (let ((n178 (zero-extend n40 (bitvector 3)))) ; (bitvector 3)
  (let ((n179 (bvlshr n159 (zero-extend n178 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$276_Y
      (extract 0 0 n179))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_101$277$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$275_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$276_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_100$278$_Y
      (bvand
        $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_100$176_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_101$277$_Y))) ; (bitvector 1)
  (let ((n183 (bvlshr n159 (zero-extend n47 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$280_Y
      (extract 0 0 n183))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_102$281$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$275_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$280_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_100$282$_Y
      (bvand
        $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_100$278$_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_102$281$_Y))) ; (bitvector 1)
  (let ((n187 (bvlshr n159 (zero-extend n53 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$284_Y
      (extract 0 0 n187))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_103$285$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$275_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$284_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_100$286$_Y
      (bvand
        $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_100$282$_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_103$285$_Y))) ; (bitvector 1)
  (let
    (($procmux$2117$_Y
      (if
        (bitvector->bool
          $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_100$286$_Y)
        $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$275_Y
        $procmux$2087$_Y))) ; (bitvector 1)
  (let ((n192 (zero-extend I0 (bitvector 3)))) ; (bitvector 3)
  (let ((n193 (bvlshr n159 (zero-extend n192 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$258_Y
      (extract 0 0 n193))) ; (bitvector 1)
  (let ((n195 (zero-extend n66 (bitvector 3)))) ; (bitvector 3)
  (let ((n196 (bvlshr n159 (zero-extend n195 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$259_Y
      (extract 0 0 n196))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_96$260$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$258_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$259_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_95$261$_Y
      (bvand
        $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_95$159_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_96$260$_Y))) ; (bitvector 1)
  (let ((n200 (bvlshr n159 (zero-extend n72 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$263_Y
      (extract 0 0 n200))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_97$264$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$258_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$263_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_95$265$_Y
      (bvand
        $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_95$261$_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_97$264$_Y))) ; (bitvector 1)
  (let ((n204 (bvlshr n159 (zero-extend n77 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$267_Y
      (extract 0 0 n204))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_98$268$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$258_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$267_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_95$269$_Y
      (bvand
        $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_95$265$_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_98$268$_Y))) ; (bitvector 1)
  (let
    (($procmux$2144$_Y
      (if
        (bitvector->bool
          $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_95$269$_Y)
        $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$258_Y
        $procmux$2117$_Y))) ; (bitvector 1)
  (let ((n209 (bvlshr n159 (zero-extend n84 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$249_Y
      (extract 0 0 n209))) ; (bitvector 1)
  (let ((n211 (bvlshr n159 (zero-extend n92 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$250_Y
      (extract 0 0 n211))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_93$251$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$249_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$250_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_92$252$_Y
      (bvand
        $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_92$150_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_93$251$_Y))) ; (bitvector 1)
  (let
    (($procmux$2168$_Y
      (if
        (bitvector->bool
          $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_92$252$_Y)
        $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$249_Y
        $procmux$2144$_Y))) ; (bitvector 1)
  (let ((n216 (bvlshr n159 (zero-extend n99 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$238_Y
      (extract 0 0 n216))) ; (bitvector 1)
  (let ((n218 (bvlshr n159 (zero-extend n107 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$239_Y
      (extract 0 0 n218))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_90$240$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$238_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$239_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_89$241$_Y
      (bvand
        $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_89$139_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_90$240$_Y))) ; (bitvector 1)
  (let
    (($procmux$2189$_Y
      (if
        (bitvector->bool
          $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_89$241$_Y)
        $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$238_Y
        $procmux$2168$_Y))) ; (bitvector 1)
  (let ((n223 (zero-extend n113 (bitvector 3)))) ; (bitvector 3)
  (let ((n224 (bvlshr n159 (zero-extend n223 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$227_Y
      (extract 0 0 n224))) ; (bitvector 1)
  (let ((n226 (bvlshr n159 (zero-extend n122 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$228_Y
      (extract 0 0 n226))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_87$229$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$227_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$228_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_86$230$_Y
      (bvand
        $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_86$128_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_87$229$_Y))) ; (bitvector 1)
  (let
    (($procmux$2207$_Y
      (if
        (bitvector->bool
          $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_86$230$_Y)
        $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$227_Y
        $procmux$2189$_Y))) ; (bitvector 1)
  (let ((n231 (extract 8 8 INIT))) ; (bitvector 1)
  (let
    (($reduce_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_84$217_Y
      (apply bvor (bitvector->bits n159)))) ; (bitvector 1)
  (let
    (($not$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_84$218_Y
      (bvnot
        $reduce_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_84$217_Y))) ; (bitvector 1)
  (let
    (($reduce_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_84$219_Y
      (apply bvand (bitvector->bits n159)))) ; (bitvector 1)
  (let
    (($logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_84$220$_Y
      (bvor
        $not$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_84$218_Y
        $reduce_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_84$219_Y))) ; (bitvector 1)
  (let
    (($procmux$2222$_Y
      (if
        (bitvector->bool
          $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_84$220$_Y)
        n231
        $procmux$2207$_Y))) ; (bitvector 1)
  (let ((n237 (bvlshr n159 (zero-extend n135 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$216_Y
      (extract 0 0 n237))) ; (bitvector 1)
  (let
    (($procmux$2234$_Y
      (if
        (bitvector->bool
          $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_82$116$_Y)
        $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$216_Y
        $procmux$2222$_Y))) ; (bitvector 1)
  (let
    (($procmux$2237$_Y
      (if
        (bitvector->bool
          $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_118$82$_Y)
        (bv #b0 1)
        $procmux$2234$_Y))) ; (bitvector 1)
  (let
    (($procmux$2240$_Y
      (if
        (bitvector->bool
          $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_116$50$_Y)
        (bv #b0 1)
        $procmux$2237$_Y))) ; (bitvector 1)
  (let
    ((n242
      (concat
        $procmux$2240$_Y
        $3_lut_mux8_f$func$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_128$1.$result_0_0_$117))) ; (bitvector 2)
  (let ((n243 (extract 23 16 INIT))) ; (bitvector 8)
  (let ((n244 (bvlshr n243 (zero-extend n5 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$390_Y
      (extract 0 0 n244))) ; (bitvector 1)
  (let ((n246 (bvlshr n243 (zero-extend n14 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$391_Y
      (extract 0 0 n246))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_106$392$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$390_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$391_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_105$393$_Y
      (bvand
        $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_105$193_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_106$392$_Y))) ; (bitvector 1)
  (let ((n250 (bvlshr n243 (zero-extend n20 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$395_Y
      (extract 0 0 n250))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_107$396$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$390_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$395_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_105$397$_Y
      (bvand
        $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_105$393$_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_107$396$_Y))) ; (bitvector 1)
  (let ((n254 (bvlshr n243 (zero-extend n26 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$399_Y
      (extract 0 0 n254))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_108$400$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$390_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$399_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_105$401$_Y
      (bvand
        $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_105$397$_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_108$400$_Y))) ; (bitvector 1)
  (let
    (($procmux$1931$_Y
      (if
        (bitvector->bool
          $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_105$401$_Y)
        $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$390_Y
        (bv #b0 1)))) ; (bitvector 1)
  (let ((n259 (zero-extend n33 (bitvector 3)))) ; (bitvector 3)
  (let ((n260 (bvlshr n243 (zero-extend n259 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$373_Y
      (extract 0 0 n260))) ; (bitvector 1)
  (let ((n262 (zero-extend n40 (bitvector 3)))) ; (bitvector 3)
  (let ((n263 (bvlshr n243 (zero-extend n262 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$374_Y
      (extract 0 0 n263))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_101$375$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$373_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$374_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_100$376$_Y
      (bvand
        $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_100$176_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_101$375$_Y))) ; (bitvector 1)
  (let ((n267 (bvlshr n243 (zero-extend n47 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$378_Y
      (extract 0 0 n267))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_102$379$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$373_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$378_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_100$380$_Y
      (bvand
        $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_100$376$_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_102$379$_Y))) ; (bitvector 1)
  (let ((n271 (bvlshr n243 (zero-extend n53 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$382_Y
      (extract 0 0 n271))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_103$383$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$373_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$382_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_100$384$_Y
      (bvand
        $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_100$380$_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_103$383$_Y))) ; (bitvector 1)
  (let
    (($procmux$1961$_Y
      (if
        (bitvector->bool
          $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_100$384$_Y)
        $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$373_Y
        $procmux$1931$_Y))) ; (bitvector 1)
  (let ((n276 (zero-extend I0 (bitvector 3)))) ; (bitvector 3)
  (let ((n277 (bvlshr n243 (zero-extend n276 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$356_Y
      (extract 0 0 n277))) ; (bitvector 1)
  (let ((n279 (zero-extend n66 (bitvector 3)))) ; (bitvector 3)
  (let ((n280 (bvlshr n243 (zero-extend n279 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$357_Y
      (extract 0 0 n280))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_96$358$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$356_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$357_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_95$359$_Y
      (bvand
        $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_95$159_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_96$358$_Y))) ; (bitvector 1)
  (let ((n284 (bvlshr n243 (zero-extend n72 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$361_Y
      (extract 0 0 n284))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_97$362$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$356_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$361_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_95$363$_Y
      (bvand
        $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_95$359$_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_97$362$_Y))) ; (bitvector 1)
  (let ((n288 (bvlshr n243 (zero-extend n77 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$365_Y
      (extract 0 0 n288))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_98$366$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$356_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$365_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_95$367$_Y
      (bvand
        $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_95$363$_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_98$366$_Y))) ; (bitvector 1)
  (let
    (($procmux$1988$_Y
      (if
        (bitvector->bool
          $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_95$367$_Y)
        $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$356_Y
        $procmux$1961$_Y))) ; (bitvector 1)
  (let ((n293 (bvlshr n243 (zero-extend n84 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$347_Y
      (extract 0 0 n293))) ; (bitvector 1)
  (let ((n295 (bvlshr n243 (zero-extend n92 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$348_Y
      (extract 0 0 n295))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_93$349$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$347_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$348_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_92$350$_Y
      (bvand
        $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_92$150_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_93$349$_Y))) ; (bitvector 1)
  (let
    (($procmux$2012$_Y
      (if
        (bitvector->bool
          $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_92$350$_Y)
        $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$347_Y
        $procmux$1988$_Y))) ; (bitvector 1)
  (let ((n300 (bvlshr n243 (zero-extend n99 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$336_Y
      (extract 0 0 n300))) ; (bitvector 1)
  (let ((n302 (bvlshr n243 (zero-extend n107 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$337_Y
      (extract 0 0 n302))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_90$338$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$336_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$337_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_89$339$_Y
      (bvand
        $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_89$139_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_90$338$_Y))) ; (bitvector 1)
  (let
    (($procmux$2033$_Y
      (if
        (bitvector->bool
          $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_89$339$_Y)
        $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$336_Y
        $procmux$2012$_Y))) ; (bitvector 1)
  (let ((n307 (zero-extend n113 (bitvector 3)))) ; (bitvector 3)
  (let ((n308 (bvlshr n243 (zero-extend n307 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$325_Y
      (extract 0 0 n308))) ; (bitvector 1)
  (let ((n310 (bvlshr n243 (zero-extend n122 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$326_Y
      (extract 0 0 n310))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_87$327$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$325_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$326_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_86$328$_Y
      (bvand
        $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_86$128_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_87$327$_Y))) ; (bitvector 1)
  (let
    (($procmux$2051$_Y
      (if
        (bitvector->bool
          $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_86$328$_Y)
        $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$325_Y
        $procmux$2033$_Y))) ; (bitvector 1)
  (let ((n315 (extract 16 16 INIT))) ; (bitvector 1)
  (let
    (($reduce_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_84$315_Y
      (apply bvor (bitvector->bits n243)))) ; (bitvector 1)
  (let
    (($not$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_84$316_Y
      (bvnot
        $reduce_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_84$315_Y))) ; (bitvector 1)
  (let
    (($reduce_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_84$317_Y
      (apply bvand (bitvector->bits n243)))) ; (bitvector 1)
  (let
    (($logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_84$318$_Y
      (bvor
        $not$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_84$316_Y
        $reduce_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_84$317_Y))) ; (bitvector 1)
  (let
    (($procmux$2066$_Y
      (if
        (bitvector->bool
          $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_84$318$_Y)
        n315
        $procmux$2051$_Y))) ; (bitvector 1)
  (let ((n321 (bvlshr n243 (zero-extend n135 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$314_Y
      (extract 0 0 n321))) ; (bitvector 1)
  (let
    (($procmux$2078$_Y
      (if
        (bitvector->bool
          $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_82$116$_Y)
        $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$314_Y
        $procmux$2066$_Y))) ; (bitvector 1)
  (let
    (($procmux$2081$_Y
      (if
        (bitvector->bool
          $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_118$82$_Y)
        (bv #b0 1)
        $procmux$2078$_Y))) ; (bitvector 1)
  (let
    (($procmux$2084$_Y
      (if
        (bitvector->bool
          $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_116$50$_Y)
        (bv #b0 1)
        $procmux$2081$_Y))) ; (bitvector 1)
  (let ((n326 (concat $procmux$2084$_Y n242))) ; (bitvector 3)
  (let ((n327 (extract 31 24 INIT))) ; (bitvector 8)
  (let ((n328 (bvlshr n327 (zero-extend n5 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$488_Y
      (extract 0 0 n328))) ; (bitvector 1)
  (let ((n330 (bvlshr n327 (zero-extend n14 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$489_Y
      (extract 0 0 n330))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_106$490$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$488_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$489_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_105$491$_Y
      (bvand
        $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_105$193_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_106$490$_Y))) ; (bitvector 1)
  (let ((n334 (bvlshr n327 (zero-extend n20 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$493_Y
      (extract 0 0 n334))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_107$494$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$488_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$493_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_105$495$_Y
      (bvand
        $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_105$491$_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_107$494$_Y))) ; (bitvector 1)
  (let ((n338 (bvlshr n327 (zero-extend n26 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$497_Y
      (extract 0 0 n338))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_108$498$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$488_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$497_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_105$499$_Y
      (bvand
        $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_105$495$_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_108$498$_Y))) ; (bitvector 1)
  (let
    (($procmux$1775$_Y
      (if
        (bitvector->bool
          $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_105$499$_Y)
        $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$488_Y
        (bv #b0 1)))) ; (bitvector 1)
  (let ((n343 (zero-extend n33 (bitvector 3)))) ; (bitvector 3)
  (let ((n344 (bvlshr n327 (zero-extend n343 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$471_Y
      (extract 0 0 n344))) ; (bitvector 1)
  (let ((n346 (zero-extend n40 (bitvector 3)))) ; (bitvector 3)
  (let ((n347 (bvlshr n327 (zero-extend n346 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$472_Y
      (extract 0 0 n347))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_101$473$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$471_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$472_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_100$474$_Y
      (bvand
        $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_100$176_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_101$473$_Y))) ; (bitvector 1)
  (let ((n351 (bvlshr n327 (zero-extend n47 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$476_Y
      (extract 0 0 n351))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_102$477$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$471_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$476_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_100$478$_Y
      (bvand
        $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_100$474$_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_102$477$_Y))) ; (bitvector 1)
  (let ((n355 (bvlshr n327 (zero-extend n53 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$480_Y
      (extract 0 0 n355))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_103$481$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$471_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$480_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_100$482$_Y
      (bvand
        $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_100$478$_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_103$481$_Y))) ; (bitvector 1)
  (let
    (($procmux$1805$_Y
      (if
        (bitvector->bool
          $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_100$482$_Y)
        $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$471_Y
        $procmux$1775$_Y))) ; (bitvector 1)
  (let ((n360 (zero-extend I0 (bitvector 3)))) ; (bitvector 3)
  (let ((n361 (bvlshr n327 (zero-extend n360 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$454_Y
      (extract 0 0 n361))) ; (bitvector 1)
  (let ((n363 (zero-extend n66 (bitvector 3)))) ; (bitvector 3)
  (let ((n364 (bvlshr n327 (zero-extend n363 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$455_Y
      (extract 0 0 n364))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_96$456$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$454_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$455_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_95$457$_Y
      (bvand
        $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_95$159_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_96$456$_Y))) ; (bitvector 1)
  (let ((n368 (bvlshr n327 (zero-extend n72 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$459_Y
      (extract 0 0 n368))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_97$460$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$454_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$459_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_95$461$_Y
      (bvand
        $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_95$457$_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_97$460$_Y))) ; (bitvector 1)
  (let ((n372 (bvlshr n327 (zero-extend n77 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$463_Y
      (extract 0 0 n372))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_98$464$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$454_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$463_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_95$465$_Y
      (bvand
        $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_95$461$_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_98$464$_Y))) ; (bitvector 1)
  (let
    (($procmux$1832$_Y
      (if
        (bitvector->bool
          $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_95$465$_Y)
        $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$454_Y
        $procmux$1805$_Y))) ; (bitvector 1)
  (let ((n377 (bvlshr n327 (zero-extend n84 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$445_Y
      (extract 0 0 n377))) ; (bitvector 1)
  (let ((n379 (bvlshr n327 (zero-extend n92 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$446_Y
      (extract 0 0 n379))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_93$447$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$445_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$446_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_92$448$_Y
      (bvand
        $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_92$150_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_93$447$_Y))) ; (bitvector 1)
  (let
    (($procmux$1856$_Y
      (if
        (bitvector->bool
          $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_92$448$_Y)
        $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$445_Y
        $procmux$1832$_Y))) ; (bitvector 1)
  (let ((n384 (bvlshr n327 (zero-extend n99 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$434_Y
      (extract 0 0 n384))) ; (bitvector 1)
  (let ((n386 (bvlshr n327 (zero-extend n107 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$435_Y
      (extract 0 0 n386))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_90$436$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$434_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$435_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_89$437$_Y
      (bvand
        $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_89$139_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_90$436$_Y))) ; (bitvector 1)
  (let
    (($procmux$1877$_Y
      (if
        (bitvector->bool
          $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_89$437$_Y)
        $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$434_Y
        $procmux$1856$_Y))) ; (bitvector 1)
  (let ((n391 (zero-extend n113 (bitvector 3)))) ; (bitvector 3)
  (let ((n392 (bvlshr n327 (zero-extend n391 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$423_Y
      (extract 0 0 n392))) ; (bitvector 1)
  (let ((n394 (bvlshr n327 (zero-extend n122 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$424_Y
      (extract 0 0 n394))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_87$425$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$423_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$424_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_86$426$_Y
      (bvand
        $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_86$128_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_87$425$_Y))) ; (bitvector 1)
  (let
    (($procmux$1895$_Y
      (if
        (bitvector->bool
          $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_86$426$_Y)
        $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$423_Y
        $procmux$1877$_Y))) ; (bitvector 1)
  (let ((n399 (extract 24 24 INIT))) ; (bitvector 1)
  (let
    (($reduce_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_84$413_Y
      (apply bvor (bitvector->bits n327)))) ; (bitvector 1)
  (let
    (($not$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_84$414_Y
      (bvnot
        $reduce_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_84$413_Y))) ; (bitvector 1)
  (let
    (($reduce_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_84$415_Y
      (apply bvand (bitvector->bits n327)))) ; (bitvector 1)
  (let
    (($logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_84$416$_Y
      (bvor
        $not$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_84$414_Y
        $reduce_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_84$415_Y))) ; (bitvector 1)
  (let
    (($procmux$1910$_Y
      (if
        (bitvector->bool
          $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_84$416$_Y)
        n399
        $procmux$1895$_Y))) ; (bitvector 1)
  (let ((n405 (bvlshr n327 (zero-extend n135 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$412_Y
      (extract 0 0 n405))) ; (bitvector 1)
  (let
    (($procmux$1922$_Y
      (if
        (bitvector->bool
          $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_82$116$_Y)
        $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$412_Y
        $procmux$1910$_Y))) ; (bitvector 1)
  (let
    (($procmux$1925$_Y
      (if
        (bitvector->bool
          $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_118$82$_Y)
        (bv #b0 1)
        $procmux$1922$_Y))) ; (bitvector 1)
  (let
    (($procmux$1928$_Y
      (if
        (bitvector->bool
          $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_116$50$_Y)
        (bv #b0 1)
        $procmux$1925$_Y))) ; (bitvector 1)
  (let ((n410 (concat $procmux$1928$_Y n326))) ; (bitvector 4)
  (let ((n411 (extract 39 32 INIT))) ; (bitvector 8)
  (let ((n412 (bvlshr n411 (zero-extend n5 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$586_Y
      (extract 0 0 n412))) ; (bitvector 1)
  (let ((n414 (bvlshr n411 (zero-extend n14 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$587_Y
      (extract 0 0 n414))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_106$588$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$586_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$587_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_105$589$_Y
      (bvand
        $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_105$193_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_106$588$_Y))) ; (bitvector 1)
  (let ((n418 (bvlshr n411 (zero-extend n20 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$591_Y
      (extract 0 0 n418))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_107$592$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$586_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$591_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_105$593$_Y
      (bvand
        $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_105$589$_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_107$592$_Y))) ; (bitvector 1)
  (let ((n422 (bvlshr n411 (zero-extend n26 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$595_Y
      (extract 0 0 n422))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_108$596$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$586_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$595_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_105$597$_Y
      (bvand
        $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_105$593$_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_108$596$_Y))) ; (bitvector 1)
  (let
    (($procmux$1619$_Y
      (if
        (bitvector->bool
          $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_105$597$_Y)
        $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$586_Y
        (bv #b0 1)))) ; (bitvector 1)
  (let ((n427 (zero-extend n33 (bitvector 3)))) ; (bitvector 3)
  (let ((n428 (bvlshr n411 (zero-extend n427 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$569_Y
      (extract 0 0 n428))) ; (bitvector 1)
  (let ((n430 (zero-extend n40 (bitvector 3)))) ; (bitvector 3)
  (let ((n431 (bvlshr n411 (zero-extend n430 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$570_Y
      (extract 0 0 n431))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_101$571$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$569_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$570_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_100$572$_Y
      (bvand
        $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_100$176_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_101$571$_Y))) ; (bitvector 1)
  (let ((n435 (bvlshr n411 (zero-extend n47 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$574_Y
      (extract 0 0 n435))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_102$575$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$569_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$574_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_100$576$_Y
      (bvand
        $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_100$572$_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_102$575$_Y))) ; (bitvector 1)
  (let ((n439 (bvlshr n411 (zero-extend n53 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$578_Y
      (extract 0 0 n439))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_103$579$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$569_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$578_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_100$580$_Y
      (bvand
        $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_100$576$_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_103$579$_Y))) ; (bitvector 1)
  (let
    (($procmux$1649$_Y
      (if
        (bitvector->bool
          $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_100$580$_Y)
        $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$569_Y
        $procmux$1619$_Y))) ; (bitvector 1)
  (let ((n444 (zero-extend I0 (bitvector 3)))) ; (bitvector 3)
  (let ((n445 (bvlshr n411 (zero-extend n444 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$552_Y
      (extract 0 0 n445))) ; (bitvector 1)
  (let ((n447 (zero-extend n66 (bitvector 3)))) ; (bitvector 3)
  (let ((n448 (bvlshr n411 (zero-extend n447 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$553_Y
      (extract 0 0 n448))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_96$554$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$552_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$553_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_95$555$_Y
      (bvand
        $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_95$159_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_96$554$_Y))) ; (bitvector 1)
  (let ((n452 (bvlshr n411 (zero-extend n72 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$557_Y
      (extract 0 0 n452))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_97$558$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$552_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$557_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_95$559$_Y
      (bvand
        $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_95$555$_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_97$558$_Y))) ; (bitvector 1)
  (let ((n456 (bvlshr n411 (zero-extend n77 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$561_Y
      (extract 0 0 n456))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_98$562$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$552_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$561_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_95$563$_Y
      (bvand
        $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_95$559$_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_98$562$_Y))) ; (bitvector 1)
  (let
    (($procmux$1676$_Y
      (if
        (bitvector->bool
          $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_95$563$_Y)
        $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$552_Y
        $procmux$1649$_Y))) ; (bitvector 1)
  (let ((n461 (bvlshr n411 (zero-extend n84 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$543_Y
      (extract 0 0 n461))) ; (bitvector 1)
  (let ((n463 (bvlshr n411 (zero-extend n92 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$544_Y
      (extract 0 0 n463))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_93$545$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$543_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$544_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_92$546$_Y
      (bvand
        $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_92$150_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_93$545$_Y))) ; (bitvector 1)
  (let
    (($procmux$1700$_Y
      (if
        (bitvector->bool
          $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_92$546$_Y)
        $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$543_Y
        $procmux$1676$_Y))) ; (bitvector 1)
  (let ((n468 (bvlshr n411 (zero-extend n99 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$532_Y
      (extract 0 0 n468))) ; (bitvector 1)
  (let ((n470 (bvlshr n411 (zero-extend n107 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$533_Y
      (extract 0 0 n470))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_90$534$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$532_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$533_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_89$535$_Y
      (bvand
        $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_89$139_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_90$534$_Y))) ; (bitvector 1)
  (let
    (($procmux$1721$_Y
      (if
        (bitvector->bool
          $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_89$535$_Y)
        $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$532_Y
        $procmux$1700$_Y))) ; (bitvector 1)
  (let ((n475 (zero-extend n113 (bitvector 3)))) ; (bitvector 3)
  (let ((n476 (bvlshr n411 (zero-extend n475 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$521_Y
      (extract 0 0 n476))) ; (bitvector 1)
  (let ((n478 (bvlshr n411 (zero-extend n122 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$522_Y
      (extract 0 0 n478))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_87$523$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$521_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$522_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_86$524$_Y
      (bvand
        $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_86$128_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_87$523$_Y))) ; (bitvector 1)
  (let
    (($procmux$1739$_Y
      (if
        (bitvector->bool
          $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_86$524$_Y)
        $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$521_Y
        $procmux$1721$_Y))) ; (bitvector 1)
  (let ((n483 (extract 32 32 INIT))) ; (bitvector 1)
  (let
    (($reduce_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_84$511_Y
      (apply bvor (bitvector->bits n411)))) ; (bitvector 1)
  (let
    (($not$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_84$512_Y
      (bvnot
        $reduce_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_84$511_Y))) ; (bitvector 1)
  (let
    (($reduce_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_84$513_Y
      (apply bvand (bitvector->bits n411)))) ; (bitvector 1)
  (let
    (($logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_84$514$_Y
      (bvor
        $not$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_84$512_Y
        $reduce_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_84$513_Y))) ; (bitvector 1)
  (let
    (($procmux$1754$_Y
      (if
        (bitvector->bool
          $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_84$514$_Y)
        n483
        $procmux$1739$_Y))) ; (bitvector 1)
  (let ((n489 (bvlshr n411 (zero-extend n135 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$510_Y
      (extract 0 0 n489))) ; (bitvector 1)
  (let
    (($procmux$1766$_Y
      (if
        (bitvector->bool
          $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_82$116$_Y)
        $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$510_Y
        $procmux$1754$_Y))) ; (bitvector 1)
  (let
    (($procmux$1769$_Y
      (if
        (bitvector->bool
          $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_118$82$_Y)
        (bv #b0 1)
        $procmux$1766$_Y))) ; (bitvector 1)
  (let
    (($procmux$1772$_Y
      (if
        (bitvector->bool
          $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_116$50$_Y)
        (bv #b0 1)
        $procmux$1769$_Y))) ; (bitvector 1)
  (let ((n494 (concat $procmux$1772$_Y n410))) ; (bitvector 5)
  (let ((n495 (extract 47 40 INIT))) ; (bitvector 8)
  (let ((n496 (bvlshr n495 (zero-extend n5 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$684_Y
      (extract 0 0 n496))) ; (bitvector 1)
  (let ((n498 (bvlshr n495 (zero-extend n14 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$685_Y
      (extract 0 0 n498))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_106$686$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$684_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$685_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_105$687$_Y
      (bvand
        $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_105$193_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_106$686$_Y))) ; (bitvector 1)
  (let ((n502 (bvlshr n495 (zero-extend n20 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$689_Y
      (extract 0 0 n502))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_107$690$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$684_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$689_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_105$691$_Y
      (bvand
        $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_105$687$_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_107$690$_Y))) ; (bitvector 1)
  (let ((n506 (bvlshr n495 (zero-extend n26 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$693_Y
      (extract 0 0 n506))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_108$694$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$684_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$693_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_105$695$_Y
      (bvand
        $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_105$691$_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_108$694$_Y))) ; (bitvector 1)
  (let
    (($procmux$1463$_Y
      (if
        (bitvector->bool
          $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_105$695$_Y)
        $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$684_Y
        (bv #b0 1)))) ; (bitvector 1)
  (let ((n511 (zero-extend n33 (bitvector 3)))) ; (bitvector 3)
  (let ((n512 (bvlshr n495 (zero-extend n511 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$667_Y
      (extract 0 0 n512))) ; (bitvector 1)
  (let ((n514 (zero-extend n40 (bitvector 3)))) ; (bitvector 3)
  (let ((n515 (bvlshr n495 (zero-extend n514 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$668_Y
      (extract 0 0 n515))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_101$669$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$667_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$668_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_100$670$_Y
      (bvand
        $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_100$176_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_101$669$_Y))) ; (bitvector 1)
  (let ((n519 (bvlshr n495 (zero-extend n47 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$672_Y
      (extract 0 0 n519))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_102$673$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$667_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$672_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_100$674$_Y
      (bvand
        $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_100$670$_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_102$673$_Y))) ; (bitvector 1)
  (let ((n523 (bvlshr n495 (zero-extend n53 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$676_Y
      (extract 0 0 n523))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_103$677$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$667_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$676_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_100$678$_Y
      (bvand
        $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_100$674$_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_103$677$_Y))) ; (bitvector 1)
  (let
    (($procmux$1493$_Y
      (if
        (bitvector->bool
          $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_100$678$_Y)
        $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$667_Y
        $procmux$1463$_Y))) ; (bitvector 1)
  (let ((n528 (zero-extend I0 (bitvector 3)))) ; (bitvector 3)
  (let ((n529 (bvlshr n495 (zero-extend n528 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$650_Y
      (extract 0 0 n529))) ; (bitvector 1)
  (let ((n531 (zero-extend n66 (bitvector 3)))) ; (bitvector 3)
  (let ((n532 (bvlshr n495 (zero-extend n531 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$651_Y
      (extract 0 0 n532))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_96$652$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$650_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$651_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_95$653$_Y
      (bvand
        $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_95$159_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_96$652$_Y))) ; (bitvector 1)
  (let ((n536 (bvlshr n495 (zero-extend n72 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$655_Y
      (extract 0 0 n536))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_97$656$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$650_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$655_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_95$657$_Y
      (bvand
        $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_95$653$_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_97$656$_Y))) ; (bitvector 1)
  (let ((n540 (bvlshr n495 (zero-extend n77 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$659_Y
      (extract 0 0 n540))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_98$660$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$650_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$659_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_95$661$_Y
      (bvand
        $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_95$657$_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_98$660$_Y))) ; (bitvector 1)
  (let
    (($procmux$1520$_Y
      (if
        (bitvector->bool
          $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_95$661$_Y)
        $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$650_Y
        $procmux$1493$_Y))) ; (bitvector 1)
  (let ((n545 (bvlshr n495 (zero-extend n84 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$641_Y
      (extract 0 0 n545))) ; (bitvector 1)
  (let ((n547 (bvlshr n495 (zero-extend n92 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$642_Y
      (extract 0 0 n547))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_93$643$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$641_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$642_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_92$644$_Y
      (bvand
        $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_92$150_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_93$643$_Y))) ; (bitvector 1)
  (let
    (($procmux$1544$_Y
      (if
        (bitvector->bool
          $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_92$644$_Y)
        $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$641_Y
        $procmux$1520$_Y))) ; (bitvector 1)
  (let ((n552 (bvlshr n495 (zero-extend n99 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$630_Y
      (extract 0 0 n552))) ; (bitvector 1)
  (let ((n554 (bvlshr n495 (zero-extend n107 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$631_Y
      (extract 0 0 n554))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_90$632$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$630_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$631_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_89$633$_Y
      (bvand
        $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_89$139_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_90$632$_Y))) ; (bitvector 1)
  (let
    (($procmux$1565$_Y
      (if
        (bitvector->bool
          $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_89$633$_Y)
        $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$630_Y
        $procmux$1544$_Y))) ; (bitvector 1)
  (let ((n559 (zero-extend n113 (bitvector 3)))) ; (bitvector 3)
  (let ((n560 (bvlshr n495 (zero-extend n559 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$619_Y
      (extract 0 0 n560))) ; (bitvector 1)
  (let ((n562 (bvlshr n495 (zero-extend n122 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$620_Y
      (extract 0 0 n562))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_87$621$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$619_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$620_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_86$622$_Y
      (bvand
        $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_86$128_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_87$621$_Y))) ; (bitvector 1)
  (let
    (($procmux$1583$_Y
      (if
        (bitvector->bool
          $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_86$622$_Y)
        $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$619_Y
        $procmux$1565$_Y))) ; (bitvector 1)
  (let ((n567 (extract 40 40 INIT))) ; (bitvector 1)
  (let
    (($reduce_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_84$609_Y
      (apply bvor (bitvector->bits n495)))) ; (bitvector 1)
  (let
    (($not$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_84$610_Y
      (bvnot
        $reduce_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_84$609_Y))) ; (bitvector 1)
  (let
    (($reduce_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_84$611_Y
      (apply bvand (bitvector->bits n495)))) ; (bitvector 1)
  (let
    (($logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_84$612$_Y
      (bvor
        $not$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_84$610_Y
        $reduce_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_84$611_Y))) ; (bitvector 1)
  (let
    (($procmux$1598$_Y
      (if
        (bitvector->bool
          $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_84$612$_Y)
        n567
        $procmux$1583$_Y))) ; (bitvector 1)
  (let ((n573 (bvlshr n495 (zero-extend n135 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$608_Y
      (extract 0 0 n573))) ; (bitvector 1)
  (let
    (($procmux$1610$_Y
      (if
        (bitvector->bool
          $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_82$116$_Y)
        $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$608_Y
        $procmux$1598$_Y))) ; (bitvector 1)
  (let
    (($procmux$1613$_Y
      (if
        (bitvector->bool
          $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_118$82$_Y)
        (bv #b0 1)
        $procmux$1610$_Y))) ; (bitvector 1)
  (let
    (($procmux$1616$_Y
      (if
        (bitvector->bool
          $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_116$50$_Y)
        (bv #b0 1)
        $procmux$1613$_Y))) ; (bitvector 1)
  (let ((n578 (concat $procmux$1616$_Y n494))) ; (bitvector 6)
  (let ((n579 (extract 55 48 INIT))) ; (bitvector 8)
  (let ((n580 (bvlshr n579 (zero-extend n5 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$782_Y
      (extract 0 0 n580))) ; (bitvector 1)
  (let ((n582 (bvlshr n579 (zero-extend n14 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$783_Y
      (extract 0 0 n582))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_106$784$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$782_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$783_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_105$785$_Y
      (bvand
        $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_105$193_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_106$784$_Y))) ; (bitvector 1)
  (let ((n586 (bvlshr n579 (zero-extend n20 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$787_Y
      (extract 0 0 n586))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_107$788$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$782_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$787_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_105$789$_Y
      (bvand
        $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_105$785$_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_107$788$_Y))) ; (bitvector 1)
  (let ((n590 (bvlshr n579 (zero-extend n26 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$791_Y
      (extract 0 0 n590))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_108$792$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$782_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$791_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_105$793$_Y
      (bvand
        $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_105$789$_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_108$792$_Y))) ; (bitvector 1)
  (let
    (($procmux$1307$_Y
      (if
        (bitvector->bool
          $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_105$793$_Y)
        $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$782_Y
        (bv #b0 1)))) ; (bitvector 1)
  (let ((n595 (zero-extend n33 (bitvector 3)))) ; (bitvector 3)
  (let ((n596 (bvlshr n579 (zero-extend n595 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$765_Y
      (extract 0 0 n596))) ; (bitvector 1)
  (let ((n598 (zero-extend n40 (bitvector 3)))) ; (bitvector 3)
  (let ((n599 (bvlshr n579 (zero-extend n598 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$766_Y
      (extract 0 0 n599))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_101$767$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$765_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$766_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_100$768$_Y
      (bvand
        $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_100$176_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_101$767$_Y))) ; (bitvector 1)
  (let ((n603 (bvlshr n579 (zero-extend n47 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$770_Y
      (extract 0 0 n603))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_102$771$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$765_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$770_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_100$772$_Y
      (bvand
        $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_100$768$_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_102$771$_Y))) ; (bitvector 1)
  (let ((n607 (bvlshr n579 (zero-extend n53 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$774_Y
      (extract 0 0 n607))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_103$775$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$765_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$774_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_100$776$_Y
      (bvand
        $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_100$772$_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_103$775$_Y))) ; (bitvector 1)
  (let
    (($procmux$1337$_Y
      (if
        (bitvector->bool
          $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_100$776$_Y)
        $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$765_Y
        $procmux$1307$_Y))) ; (bitvector 1)
  (let ((n612 (zero-extend I0 (bitvector 3)))) ; (bitvector 3)
  (let ((n613 (bvlshr n579 (zero-extend n612 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$748_Y
      (extract 0 0 n613))) ; (bitvector 1)
  (let ((n615 (zero-extend n66 (bitvector 3)))) ; (bitvector 3)
  (let ((n616 (bvlshr n579 (zero-extend n615 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$749_Y
      (extract 0 0 n616))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_96$750$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$748_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$749_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_95$751$_Y
      (bvand
        $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_95$159_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_96$750$_Y))) ; (bitvector 1)
  (let ((n620 (bvlshr n579 (zero-extend n72 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$753_Y
      (extract 0 0 n620))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_97$754$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$748_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$753_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_95$755$_Y
      (bvand
        $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_95$751$_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_97$754$_Y))) ; (bitvector 1)
  (let ((n624 (bvlshr n579 (zero-extend n77 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$757_Y
      (extract 0 0 n624))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_98$758$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$748_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$757_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_95$759$_Y
      (bvand
        $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_95$755$_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_98$758$_Y))) ; (bitvector 1)
  (let
    (($procmux$1364$_Y
      (if
        (bitvector->bool
          $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_95$759$_Y)
        $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$748_Y
        $procmux$1337$_Y))) ; (bitvector 1)
  (let ((n629 (bvlshr n579 (zero-extend n84 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$739_Y
      (extract 0 0 n629))) ; (bitvector 1)
  (let ((n631 (bvlshr n579 (zero-extend n92 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$740_Y
      (extract 0 0 n631))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_93$741$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$739_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$740_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_92$742$_Y
      (bvand
        $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_92$150_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_93$741$_Y))) ; (bitvector 1)
  (let
    (($procmux$1388$_Y
      (if
        (bitvector->bool
          $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_92$742$_Y)
        $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$739_Y
        $procmux$1364$_Y))) ; (bitvector 1)
  (let ((n636 (bvlshr n579 (zero-extend n99 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$728_Y
      (extract 0 0 n636))) ; (bitvector 1)
  (let ((n638 (bvlshr n579 (zero-extend n107 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$729_Y
      (extract 0 0 n638))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_90$730$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$728_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$729_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_89$731$_Y
      (bvand
        $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_89$139_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_90$730$_Y))) ; (bitvector 1)
  (let
    (($procmux$1409$_Y
      (if
        (bitvector->bool
          $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_89$731$_Y)
        $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$728_Y
        $procmux$1388$_Y))) ; (bitvector 1)
  (let ((n643 (zero-extend n113 (bitvector 3)))) ; (bitvector 3)
  (let ((n644 (bvlshr n579 (zero-extend n643 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$717_Y
      (extract 0 0 n644))) ; (bitvector 1)
  (let ((n646 (bvlshr n579 (zero-extend n122 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$718_Y
      (extract 0 0 n646))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_87$719$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$717_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$718_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_86$720$_Y
      (bvand
        $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_86$128_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_87$719$_Y))) ; (bitvector 1)
  (let
    (($procmux$1427$_Y
      (if
        (bitvector->bool
          $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_86$720$_Y)
        $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$717_Y
        $procmux$1409$_Y))) ; (bitvector 1)
  (let ((n651 (extract 48 48 INIT))) ; (bitvector 1)
  (let
    (($reduce_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_84$707_Y
      (apply bvor (bitvector->bits n579)))) ; (bitvector 1)
  (let
    (($not$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_84$708_Y
      (bvnot
        $reduce_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_84$707_Y))) ; (bitvector 1)
  (let
    (($reduce_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_84$709_Y
      (apply bvand (bitvector->bits n579)))) ; (bitvector 1)
  (let
    (($logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_84$710$_Y
      (bvor
        $not$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_84$708_Y
        $reduce_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_84$709_Y))) ; (bitvector 1)
  (let
    (($procmux$1442$_Y
      (if
        (bitvector->bool
          $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_84$710$_Y)
        n651
        $procmux$1427$_Y))) ; (bitvector 1)
  (let ((n657 (bvlshr n579 (zero-extend n135 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$706_Y
      (extract 0 0 n657))) ; (bitvector 1)
  (let
    (($procmux$1454$_Y
      (if
        (bitvector->bool
          $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_82$116$_Y)
        $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$706_Y
        $procmux$1442$_Y))) ; (bitvector 1)
  (let
    (($procmux$1457$_Y
      (if
        (bitvector->bool
          $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_118$82$_Y)
        (bv #b0 1)
        $procmux$1454$_Y))) ; (bitvector 1)
  (let
    (($procmux$1460$_Y
      (if
        (bitvector->bool
          $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_116$50$_Y)
        (bv #b0 1)
        $procmux$1457$_Y))) ; (bitvector 1)
  (let ((n662 (concat $procmux$1460$_Y n578))) ; (bitvector 7)
  (let ((n663 (extract 63 56 INIT))) ; (bitvector 8)
  (let ((n664 (bvlshr n663 (zero-extend n5 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$880_Y
      (extract 0 0 n664))) ; (bitvector 1)
  (let ((n666 (bvlshr n663 (zero-extend n14 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$881_Y
      (extract 0 0 n666))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_106$882$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$880_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$881_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_105$883$_Y
      (bvand
        $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_105$193_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_106$882$_Y))) ; (bitvector 1)
  (let ((n670 (bvlshr n663 (zero-extend n20 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$885_Y
      (extract 0 0 n670))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_107$886$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$880_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$885_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_105$887$_Y
      (bvand
        $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_105$883$_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_107$886$_Y))) ; (bitvector 1)
  (let ((n674 (bvlshr n663 (zero-extend n26 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$889_Y
      (extract 0 0 n674))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_108$890$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$880_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$889_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_105$891$_Y
      (bvand
        $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_105$887$_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_108$890$_Y))) ; (bitvector 1)
  (let
    (($procmux$1151$_Y
      (if
        (bitvector->bool
          $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_105$891$_Y)
        $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$880_Y
        (bv #b0 1)))) ; (bitvector 1)
  (let ((n679 (zero-extend n33 (bitvector 3)))) ; (bitvector 3)
  (let ((n680 (bvlshr n663 (zero-extend n679 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$863_Y
      (extract 0 0 n680))) ; (bitvector 1)
  (let ((n682 (zero-extend n40 (bitvector 3)))) ; (bitvector 3)
  (let ((n683 (bvlshr n663 (zero-extend n682 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$864_Y
      (extract 0 0 n683))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_101$865$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$863_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$864_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_100$866$_Y
      (bvand
        $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_100$176_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_101$865$_Y))) ; (bitvector 1)
  (let ((n687 (bvlshr n663 (zero-extend n47 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$868_Y
      (extract 0 0 n687))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_102$869$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$863_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$868_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_100$870$_Y
      (bvand
        $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_100$866$_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_102$869$_Y))) ; (bitvector 1)
  (let ((n691 (bvlshr n663 (zero-extend n53 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$872_Y
      (extract 0 0 n691))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_103$873$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$863_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$872_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_100$874$_Y
      (bvand
        $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_100$870$_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_103$873$_Y))) ; (bitvector 1)
  (let
    (($procmux$1181$_Y
      (if
        (bitvector->bool
          $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_100$874$_Y)
        $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$863_Y
        $procmux$1151$_Y))) ; (bitvector 1)
  (let ((n696 (zero-extend I0 (bitvector 3)))) ; (bitvector 3)
  (let ((n697 (bvlshr n663 (zero-extend n696 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$846_Y
      (extract 0 0 n697))) ; (bitvector 1)
  (let ((n699 (zero-extend n66 (bitvector 3)))) ; (bitvector 3)
  (let ((n700 (bvlshr n663 (zero-extend n699 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$847_Y
      (extract 0 0 n700))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_96$848$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$846_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$847_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_95$849$_Y
      (bvand
        $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_95$159_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_96$848$_Y))) ; (bitvector 1)
  (let ((n704 (bvlshr n663 (zero-extend n72 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$851_Y
      (extract 0 0 n704))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_97$852$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$846_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$851_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_95$853$_Y
      (bvand
        $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_95$849$_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_97$852$_Y))) ; (bitvector 1)
  (let ((n708 (bvlshr n663 (zero-extend n77 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$855_Y
      (extract 0 0 n708))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_98$856$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$846_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$855_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_95$857$_Y
      (bvand
        $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_95$853$_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_98$856$_Y))) ; (bitvector 1)
  (let
    (($procmux$1208$_Y
      (if
        (bitvector->bool
          $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_95$857$_Y)
        $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$846_Y
        $procmux$1181$_Y))) ; (bitvector 1)
  (let ((n713 (bvlshr n663 (zero-extend n84 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$837_Y
      (extract 0 0 n713))) ; (bitvector 1)
  (let ((n715 (bvlshr n663 (zero-extend n92 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$838_Y
      (extract 0 0 n715))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_93$839$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$837_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$838_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_92$840$_Y
      (bvand
        $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_92$150_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_93$839$_Y))) ; (bitvector 1)
  (let
    (($procmux$1232$_Y
      (if
        (bitvector->bool
          $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_92$840$_Y)
        $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$837_Y
        $procmux$1208$_Y))) ; (bitvector 1)
  (let ((n720 (bvlshr n663 (zero-extend n99 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$826_Y
      (extract 0 0 n720))) ; (bitvector 1)
  (let ((n722 (bvlshr n663 (zero-extend n107 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$827_Y
      (extract 0 0 n722))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_90$828$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$826_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$827_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_89$829$_Y
      (bvand
        $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_89$139_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_90$828$_Y))) ; (bitvector 1)
  (let
    (($procmux$1253$_Y
      (if
        (bitvector->bool
          $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_89$829$_Y)
        $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$826_Y
        $procmux$1232$_Y))) ; (bitvector 1)
  (let ((n727 (zero-extend n113 (bitvector 3)))) ; (bitvector 3)
  (let ((n728 (bvlshr n663 (zero-extend n727 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$815_Y
      (extract 0 0 n728))) ; (bitvector 1)
  (let ((n730 (bvlshr n663 (zero-extend n122 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$816_Y
      (extract 0 0 n730))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_87$817$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$815_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$816_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_86$818$_Y
      (bvand
        $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_86$128_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_87$817$_Y))) ; (bitvector 1)
  (let
    (($procmux$1271$_Y
      (if
        (bitvector->bool
          $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_86$818$_Y)
        $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$815_Y
        $procmux$1253$_Y))) ; (bitvector 1)
  (let ((n735 (extract 56 56 INIT))) ; (bitvector 1)
  (let
    (($reduce_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_84$805_Y
      (apply bvor (bitvector->bits n663)))) ; (bitvector 1)
  (let
    (($not$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_84$806_Y
      (bvnot
        $reduce_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_84$805_Y))) ; (bitvector 1)
  (let
    (($reduce_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_84$807_Y
      (apply bvand (bitvector->bits n663)))) ; (bitvector 1)
  (let
    (($logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_84$808$_Y
      (bvor
        $not$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_84$806_Y
        $reduce_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_84$807_Y))) ; (bitvector 1)
  (let
    (($procmux$1286$_Y
      (if
        (bitvector->bool
          $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_84$808$_Y)
        n735
        $procmux$1271$_Y))) ; (bitvector 1)
  (let ((n741 (bvlshr n663 (zero-extend n135 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$804_Y
      (extract 0 0 n741))) ; (bitvector 1)
  (let
    (($procmux$1298$_Y
      (if
        (bitvector->bool
          $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_82$116$_Y)
        $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$804_Y
        $procmux$1286$_Y))) ; (bitvector 1)
  (let
    (($procmux$1301$_Y
      (if
        (bitvector->bool
          $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_118$82$_Y)
        (bv #b0 1)
        $procmux$1298$_Y))) ; (bitvector 1)
  (let
    (($procmux$1304$_Y
      (if
        (bitvector->bool
          $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_116$50$_Y)
        (bv #b0 1)
        $procmux$1301$_Y))) ; (bitvector 1)
  (let ((n746 (concat $procmux$1304$_Y n662))) ; (bitvector 8)
  (let ((n747 (concat I5 (bv #b00 2)))) ; (bitvector 3)
  (let ((n748 (bvlshr n746 (zero-extend n747 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$978_Y
      (extract 0 0 n748))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_105$975$_Y
      (bool->bitvector (bveq I5 (bv #b1 1))))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_105$976$_Y
      (bool->bitvector (bveq I5 (bv #b0 1))))) ; (bitvector 1)
  (let
    (($logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_105$977_Y
      (bvor
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_105$975$_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_105$976$_Y))) ; (bitvector 1)
  (let ((n753 (concat I5 (bv #b01 2)))) ; (bitvector 3)
  (let ((n754 (bvlshr n746 (zero-extend n753 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$979_Y
      (extract 0 0 n754))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_106$980$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$978_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$979_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_105$981$_Y
      (bvand
        $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_105$977_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_106$980$_Y))) ; (bitvector 1)
  (let ((n758 (concat I5 (bv #b10 2)))) ; (bitvector 3)
  (let ((n759 (bvlshr n746 (zero-extend n758 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$983_Y
      (extract 0 0 n759))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_107$984$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$978_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$983_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_105$985$_Y
      (bvand
        $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_105$981$_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_107$984$_Y))) ; (bitvector 1)
  (let ((n763 (concat I5 (bv #b11 2)))) ; (bitvector 3)
  (let ((n764 (bvlshr n746 (zero-extend n763 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$987_Y
      (extract 0 0 n764))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_108$988$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$978_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$987_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_105$989$_Y
      (bvand
        $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_105$985$_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_108$988$_Y))) ; (bitvector 1)
  (let
    (($10_lut_mux8_f$func$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_121$9.$result_0_0_$990
      (if
        (bitvector->bool
          $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_105$989$_Y)
        $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$978_Y
        (bv #b0 1)))) ; (bitvector 1)
  (let ((n769 (concat I4 (bv #b0 1)))) ; (bitvector 2)
  (let ((n770 (zero-extend n769 (bitvector 3)))) ; (bitvector 3)
  (let ((n771 (bvlshr n746 (zero-extend n770 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$961_Y
      (extract 0 0 n771))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_100$958$_Y
      (bool->bitvector (bveq I4 (bv #b1 1))))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_100$959$_Y
      (bool->bitvector (bveq I4 (bv #b0 1))))) ; (bitvector 1)
  (let
    (($logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_100$960_Y
      (bvor
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_100$958$_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_100$959$_Y))) ; (bitvector 1)
  (let ((n776 (concat I4 (bv #b1 1)))) ; (bitvector 2)
  (let ((n777 (zero-extend n776 (bitvector 3)))) ; (bitvector 3)
  (let ((n778 (bvlshr n746 (zero-extend n777 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$962_Y
      (extract 0 0 n778))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_101$963$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$961_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$962_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_100$964$_Y
      (bvand
        $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_100$960_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_101$963$_Y))) ; (bitvector 1)
  (let ((n782 (concat I4 (bv #b0 1)))) ; (bitvector 2)
  (let ((n783 (concat (bv #b1 1) n782))) ; (bitvector 3)
  (let ((n784 (bvlshr n746 (zero-extend n783 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$966_Y
      (extract 0 0 n784))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_102$967$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$961_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$966_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_100$968$_Y
      (bvand
        $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_100$964$_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_102$967$_Y))) ; (bitvector 1)
  (let ((n788 (concat I4 (bv #b1 1)))) ; (bitvector 2)
  (let ((n789 (concat (bv #b1 1) n788))) ; (bitvector 3)
  (let ((n790 (bvlshr n746 (zero-extend n789 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$970_Y
      (extract 0 0 n790))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_103$971$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$961_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$970_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_100$972$_Y
      (bvand
        $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_100$968$_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_103$971$_Y))) ; (bitvector 1)
  (let
    (($procmux$1025$_Y
      (if
        (bitvector->bool
          $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_100$972$_Y)
        $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$961_Y
        $10_lut_mux8_f$func$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_121$9.$result_0_0_$990))) ; (bitvector 1)
  (let ((n795 (zero-extend I3 (bitvector 3)))) ; (bitvector 3)
  (let ((n796 (bvlshr n746 (zero-extend n795 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$944_Y
      (extract 0 0 n796))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_95$941$_Y
      (bool->bitvector (bveq I3 (bv #b1 1))))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_95$942$_Y
      (bool->bitvector (bveq I3 (bv #b0 1))))) ; (bitvector 1)
  (let
    (($logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_95$943_Y
      (bvor
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_95$941$_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_95$942$_Y))) ; (bitvector 1)
  (let ((n801 (concat (bv #b1 1) I3))) ; (bitvector 2)
  (let ((n802 (zero-extend n801 (bitvector 3)))) ; (bitvector 3)
  (let ((n803 (bvlshr n746 (zero-extend n802 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$945_Y
      (extract 0 0 n803))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_96$946$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$944_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$945_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_95$947$_Y
      (bvand
        $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_95$943_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_96$946$_Y))) ; (bitvector 1)
  (let ((n807 (concat (bv #b10 2) I3))) ; (bitvector 3)
  (let ((n808 (bvlshr n746 (zero-extend n807 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$949_Y
      (extract 0 0 n808))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_97$950$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$944_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$949_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_95$951$_Y
      (bvand
        $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_95$947$_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_97$950$_Y))) ; (bitvector 1)
  (let ((n812 (concat (bv #b11 2) I3))) ; (bitvector 3)
  (let ((n813 (bvlshr n746 (zero-extend n812 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$953_Y
      (extract 0 0 n813))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_98$954$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$944_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$953_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_95$955$_Y
      (bvand
        $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_95$951$_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_98$954$_Y))) ; (bitvector 1)
  (let
    (($procmux$1052$_Y
      (if
        (bitvector->bool
          $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_95$955$_Y)
        $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$944_Y
        $procmux$1025$_Y))) ; (bitvector 1)
  (let ((n818 (concat I4 (bv #b0 1)))) ; (bitvector 2)
  (let ((n819 (concat I5 n818))) ; (bitvector 3)
  (let ((n820 (bvlshr n746 (zero-extend n819 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$935_Y
      (extract 0 0 n820))) ; (bitvector 1)
  (let
    (($xor$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_82$894_Y
      (bvxor I5 I4))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_92$931$_Y
      (bool->bitvector
        (bveq
          $xor$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_82$894_Y
          (bv #b1 1))))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_92$933$_Y
      (bool->bitvector
        (bveq
          $xor$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_82$894_Y
          (bv #b0 1))))) ; (bitvector 1)
  (let
    (($logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_92$934_Y
      (bvor
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_92$931$_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_92$933$_Y))) ; (bitvector 1)
  (let ((n826 (concat I4 (bv #b1 1)))) ; (bitvector 2)
  (let ((n827 (concat I5 n826))) ; (bitvector 3)
  (let ((n828 (bvlshr n746 (zero-extend n827 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$936_Y
      (extract 0 0 n828))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_93$937$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$935_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$936_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_92$938$_Y
      (bvand
        $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_92$934_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_93$937$_Y))) ; (bitvector 1)
  (let
    (($procmux$1076$_Y
      (if
        (bitvector->bool
          $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_92$938$_Y)
        $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$935_Y
        $procmux$1052$_Y))) ; (bitvector 1)
  (let ((n833 (concat (bv #b0 1) I3))) ; (bitvector 2)
  (let ((n834 (concat I5 n833))) ; (bitvector 3)
  (let ((n835 (bvlshr n746 (zero-extend n834 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$924_Y
      (extract 0 0 n835))) ; (bitvector 1)
  (let
    (($xor$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_89$919_Y
      (bvxor I5 I3))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_89$920$_Y
      (bool->bitvector
        (bveq
          $xor$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_89$919_Y
          (bv #b1 1))))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_89$922$_Y
      (bool->bitvector
        (bveq
          $xor$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_89$919_Y
          (bv #b0 1))))) ; (bitvector 1)
  (let
    (($logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_89$923_Y
      (bvor
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_89$920$_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_89$922$_Y))) ; (bitvector 1)
  (let ((n841 (concat (bv #b1 1) I3))) ; (bitvector 2)
  (let ((n842 (concat I5 n841))) ; (bitvector 3)
  (let ((n843 (bvlshr n746 (zero-extend n842 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$925_Y
      (extract 0 0 n843))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_90$926$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$924_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$925_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_89$927$_Y
      (bvand
        $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_89$923_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_90$926$_Y))) ; (bitvector 1)
  (let
    (($procmux$1097$_Y
      (if
        (bitvector->bool
          $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_89$927$_Y)
        $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$924_Y
        $procmux$1076$_Y))) ; (bitvector 1)
  (let ((n848 (concat I4 I3))) ; (bitvector 2)
  (let ((n849 (zero-extend n848 (bitvector 3)))) ; (bitvector 3)
  (let ((n850 (bvlshr n746 (zero-extend n849 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$913_Y
      (extract 0 0 n850))) ; (bitvector 1)
  (let
    (($xor$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_86$908_Y
      (bvxor I4 I3))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_86$909$_Y
      (bool->bitvector
        (bveq
          $xor$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_86$908_Y
          (bv #b1 1))))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_86$911$_Y
      (bool->bitvector
        (bveq
          $xor$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_86$908_Y
          (bv #b0 1))))) ; (bitvector 1)
  (let
    (($logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_86$912_Y
      (bvor
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_86$909$_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_86$911$_Y))) ; (bitvector 1)
  (let ((n856 (concat I4 I3))) ; (bitvector 2)
  (let ((n857 (concat (bv #b1 1) n856))) ; (bitvector 3)
  (let ((n858 (bvlshr n746 (zero-extend n857 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$914_Y
      (extract 0 0 n858))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_87$915$_Y
      (bool->bitvector
        (bveq
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$913_Y
          $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$914_Y)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_86$916$_Y
      (bvand
        $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_86$912_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_87$915$_Y))) ; (bitvector 1)
  (let
    (($procmux$1115$_Y
      (if
        (bitvector->bool
          $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_86$916$_Y)
        $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$913_Y
        $procmux$1097$_Y))) ; (bitvector 1)
  (let
    (($reduce_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_84$903_Y
      (apply bvor (bitvector->bits n746)))) ; (bitvector 1)
  (let
    (($not$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_84$904_Y
      (bvnot
        $reduce_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_84$903_Y))) ; (bitvector 1)
  (let
    (($reduce_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_84$905_Y
      (apply bvand (bitvector->bits n746)))) ; (bitvector 1)
  (let
    (($logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_84$906$_Y
      (bvor
        $not$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_84$904_Y
        $reduce_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_84$905_Y))) ; (bitvector 1)
  (let
    (($procmux$1130$_Y
      (if
        (bitvector->bool
          $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_84$906$_Y)
        $3_lut_mux8_f$func$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_128$1.$result_0_0_$117
        $procmux$1115$_Y))) ; (bitvector 1)
  (let ((n868 (concat I4 I3))) ; (bitvector 2)
  (let ((n869 (concat I5 n868))) ; (bitvector 3)
  (let ((n870 (bvlshr n746 (zero-extend n869 (bitvector 8))))) ; (bitvector 8)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$902_Y
      (extract 0 0 n870))) ; (bitvector 1)
  (let
    (($xor$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_82$895_Y
      (bvxor
        $xor$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_82$894_Y
        I3))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_82$896$_Y
      (bool->bitvector
        (bveq
          $xor$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_82$895_Y
          (bv #b1 1))))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_82$899$_Y
      (bool->bitvector
        (bveq
          $xor$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_82$895_Y
          (bv #b0 1))))) ; (bitvector 1)
  (let
    (($logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_82$900$_Y
      (bvor
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_82$896$_Y
        $eqx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_82$899$_Y))) ; (bitvector 1)
  (let
    (($procmux$1142$_Y
      (if
        (bitvector->bool
          $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_82$900$_Y)
        $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$902_Y
        $procmux$1130$_Y))) ; (bitvector 1)
  (let
    (($procmux$2399$_Y
      (if
        (bitvector->bool
          $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_118$82$_Y)
        n128
        $procmux$1142$_Y))) ; (bitvector 1)
  (let ((n878 (concat I1 I0))) ; (bitvector 2)
  (let ((n879 (concat I2 n878))) ; (bitvector 3)
  (let ((n880 (concat I3 n879))) ; (bitvector 4)
  (let ((n881 (concat I4 n880))) ; (bitvector 5)
  (let ((n882 (concat I5 n881))) ; (bitvector 6)
  (let ((n883 (bvlshr INIT (zero-extend n882 (bitvector 64))))) ; (bitvector 64)
  (let
    (($shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$78_Y
      (extract 0 0 n883))) ; (bitvector 1)
  (let
    ((O
      (if
        (bitvector->bool
          $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_116$50$_Y)
        $shiftx$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_LUT6.v_0$78_Y
        $procmux$2399$_Y))) ; (bitvector 1)
  (cons
    (LUT6_Outputs
      O ; O
    )
    (LUT6_State)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
  ))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
  ))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
  ))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
  ))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
  ))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
  ))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
  ))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
  ))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
  ))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
  ))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
  )))))))))))))))))))))))))))))))))))))
(define LUT6_initial
  (LUT6_State))
