#lang rosette/safe
    (provide (rename-out [CARRY8 xilinx-ultrascale-plus-carry8] [CARRY8_initial xilinx-ultrascale-plus-carry8-initial] [CARRY8_inputs_helper xilinx-ultrascale-plus-carry8-inputs] [CARRY8_outputs_helper xilinx-ultrascale-plus-carry8-outputs]))(struct CARRY8_Inputs (S DI CI_TOP CI CARRY_TYPE) #:transparent
  ; S (bitvector 8)
  ; DI (bitvector 8)
  ; CI_TOP (bitvector 1)
  ; CI (bitvector 1)
  ; CARRY_TYPE (bitvector 1)
)
(struct CARRY8_Outputs (O CO) #:transparent
  ; O (bitvector 8)
  ; CO (bitvector 8)
)
(struct CARRY8_State () #:transparent)
(define
  (CARRY8_inputs_helper inputs)
  (CARRY8_Inputs
    (let
      (
        (assoc-result
          (assoc "S" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "DI" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CI_TOP" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CI" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CARRY_TYPE" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))))
(define
  (CARRY8_outputs_helper outputs)
  (list
    (cons "O" (CARRY8_Outputs-O outputs))
    (cons "CO" (CARRY8_Outputs-CO outputs))))
(define (CARRY8 inputs state)
  (let ((S (CARRY8_Inputs-S inputs))) ; (bitvector 8)
  (let ((CI (CARRY8_Inputs-CI inputs))) ; (bitvector 1)
  (let ((DI (CARRY8_Inputs-DI inputs))) ; (bitvector 8)
  (let ((n3 (extract 0 0 DI))) ; (bitvector 1)
  (let ((n4 (extract 0 0 S))) ; (bitvector 1)
  (let
    (($ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_CARRY8.v_31$1$_Y
      (if (bitvector->bool n4) CI n3))) ; (bitvector 1)
  (let
    ((n6
      (concat
        $ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_CARRY8.v_31$1$_Y
        CI))) ; (bitvector 2)
  (let ((n7 (extract 1 1 DI))) ; (bitvector 1)
  (let ((n8 (extract 1 1 S))) ; (bitvector 1)
  (let
    (($ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_CARRY8.v_32$2$_Y
      (if
        (bitvector->bool n8)
        $ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_CARRY8.v_31$1$_Y
        n7))) ; (bitvector 1)
  (let
    ((n10
      (concat
        $ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_CARRY8.v_32$2$_Y
        n6))) ; (bitvector 3)
  (let ((n11 (extract 2 2 DI))) ; (bitvector 1)
  (let ((n12 (extract 2 2 S))) ; (bitvector 1)
  (let
    (($ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_CARRY8.v_33$3$_Y
      (if
        (bitvector->bool n12)
        $ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_CARRY8.v_32$2$_Y
        n11))) ; (bitvector 1)
  (let
    ((n14
      (concat
        $ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_CARRY8.v_33$3$_Y
        n10))) ; (bitvector 4)
  (let ((n15 (extract 3 3 DI))) ; (bitvector 1)
  (let ((n16 (extract 3 3 S))) ; (bitvector 1)
  (let
    (($ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_CARRY8.v_34$4$_Y
      (if
        (bitvector->bool n16)
        $ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_CARRY8.v_33$3$_Y
        n15))) ; (bitvector 1)
  (let ((CI_TOP (CARRY8_Inputs-CI_TOP inputs))) ; (bitvector 1)
  (let ((CARRY_TYPE (CARRY8_Inputs-CARRY_TYPE inputs))) ; (bitvector 1)
  (let
    (($ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_CARRY8.v_35$6$_Y
      (if
        (bitvector->bool CARRY_TYPE)
        CI_TOP
        $ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_CARRY8.v_34$4$_Y))) ; (bitvector 1)
  (let
    ((n21
      (concat
        $ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_CARRY8.v_35$6$_Y
        n14))) ; (bitvector 5)
  (let ((n22 (extract 4 4 DI))) ; (bitvector 1)
  (let ((n23 (extract 4 4 S))) ; (bitvector 1)
  (let
    (($ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_CARRY8.v_36$7$_Y
      (if
        (bitvector->bool n23)
        $ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_CARRY8.v_35$6$_Y
        n22))) ; (bitvector 1)
  (let
    ((n25
      (concat
        $ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_CARRY8.v_36$7$_Y
        n21))) ; (bitvector 6)
  (let ((n26 (extract 5 5 DI))) ; (bitvector 1)
  (let ((n27 (extract 5 5 S))) ; (bitvector 1)
  (let
    (($ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_CARRY8.v_37$8$_Y
      (if
        (bitvector->bool n27)
        $ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_CARRY8.v_36$7$_Y
        n26))) ; (bitvector 1)
  (let
    ((n29
      (concat
        $ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_CARRY8.v_37$8$_Y
        n25))) ; (bitvector 7)
  (let ((n30 (extract 6 6 DI))) ; (bitvector 1)
  (let ((n31 (extract 6 6 S))) ; (bitvector 1)
  (let
    (($ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_CARRY8.v_38$9$_Y
      (if
        (bitvector->bool n31)
        $ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_CARRY8.v_37$8$_Y
        n30))) ; (bitvector 1)
  (let
    ((n33
      (concat
        $ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_CARRY8.v_38$9$_Y
        n29))) ; (bitvector 8)
  (let ((O (bvxor S n33))) ; (bitvector 8)
  (let
    ((n35
      (concat
        $ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_CARRY8.v_32$2$_Y
        $ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_CARRY8.v_31$1$_Y))) ; (bitvector 2)
  (let
    ((n36
      (concat
        $ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_CARRY8.v_33$3$_Y
        n35))) ; (bitvector 3)
  (let
    ((n37
      (concat
        $ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_CARRY8.v_34$4$_Y
        n36))) ; (bitvector 4)
  (let
    ((n38
      (concat
        $ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_CARRY8.v_36$7$_Y
        n37))) ; (bitvector 5)
  (let
    ((n39
      (concat
        $ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_CARRY8.v_37$8$_Y
        n38))) ; (bitvector 6)
  (let
    ((n40
      (concat
        $ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_CARRY8.v_38$9$_Y
        n39))) ; (bitvector 7)
  (let ((n41 (extract 7 7 DI))) ; (bitvector 1)
  (let ((n42 (extract 7 7 S))) ; (bitvector 1)
  (let
    (($ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_CARRY8.v_39$10$_Y
      (if
        (bitvector->bool n42)
        $ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_CARRY8.v_38$9$_Y
        n41))) ; (bitvector 1)
  (let
    ((CO
      (concat
        $ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_CARRY8.v_39$10$_Y
        n40))) ; (bitvector 8)
  (cons
    (CARRY8_Outputs
      O ; O
      CO ; CO
    )
    (CARRY8_State))))))))))))))))))))))))))))))))))))))))))))))))
(define CARRY8_initial
  (CARRY8_State))
