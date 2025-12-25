#lang rosette/safe
    (provide (rename-out [CCU2C lattice-ecp5-ccu2c] [CCU2C_initial lattice-ecp5-ccu2c-initial] [CCU2C_inputs_helper lattice-ecp5-ccu2c-inputs] [CCU2C_outputs_helper lattice-ecp5-ccu2c-outputs]))(struct
  CCU2C_Inputs
  (INJECT1_1 INJECT1_0 INIT1 INIT0 D1 D0 CIN C1 C0 B1 B0 A1 A0)
  #:transparent
  ; INJECT1_1 (bitvector 1)
  ; INJECT1_0 (bitvector 1)
  ; INIT1 (bitvector 16)
  ; INIT0 (bitvector 16)
  ; D1 (bitvector 1)
  ; D0 (bitvector 1)
  ; CIN (bitvector 1)
  ; C1 (bitvector 1)
  ; C0 (bitvector 1)
  ; B1 (bitvector 1)
  ; B0 (bitvector 1)
  ; A1 (bitvector 1)
  ; A0 (bitvector 1)
)
(struct CCU2C_Outputs (S1 S0 COUT) #:transparent
  ; S1 (bitvector 1)
  ; S0 (bitvector 1)
  ; COUT (bitvector 1)
)
(struct CCU2C_State () #:transparent)
(define
  (CCU2C_inputs_helper inputs)
  (CCU2C_Inputs
    (let
      (
        (assoc-result
          (assoc "INJECT1_1" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "INJECT1_0" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "INIT1" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "INIT0" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "D1" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "D0" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CIN" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "C1" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "C0" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "B1" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "B0" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "A1" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "A0" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))))
(define
  (CCU2C_outputs_helper outputs)
  (list
    (cons "S1" (CCU2C_Outputs-S1 outputs))
    (cons "S0" (CCU2C_Outputs-S0 outputs))
    (cons "COUT" (CCU2C_Outputs-COUT outputs))))
(define (CCU2C inputs state)
  (let ((INIT1 (CCU2C_Inputs-INIT1 inputs))) ; (bitvector 16)
  (let ((n1 (extract 7 0 INIT1))) ; (bitvector 8)
  (let ((n2 (extract 15 8 INIT1))) ; (bitvector 8)
  (let ((D1 (CCU2C_Inputs-D1 inputs))) ; (bitvector 1)
  (let ((lut4_1.s3 (if (bitvector->bool D1) n2 n1))) ; (bitvector 8)
  (let ((n5 (extract 3 0 lut4_1.s3))) ; (bitvector 4)
  (let ((n6 (extract 7 4 lut4_1.s3))) ; (bitvector 4)
  (let ((C1 (CCU2C_Inputs-C1 inputs))) ; (bitvector 1)
  (let
    (($flatten_lut4_1.$ternary$_Users_gussmith_lakeroad_modules_for_importing_lattice_ecp5_LUT4.v_8$4$_Y
      (if (bitvector->bool C1) n6 n5))) ; (bitvector 4)
  (let
    ((n9
      (extract
        1
        0
        $flatten_lut4_1.$ternary$_Users_gussmith_lakeroad_modules_for_importing_lattice_ecp5_LUT4.v_8$4$_Y))) ; (bitvector 2)
  (let
    ((n10
      (extract
        3
        2
        $flatten_lut4_1.$ternary$_Users_gussmith_lakeroad_modules_for_importing_lattice_ecp5_LUT4.v_8$4$_Y))) ; (bitvector 2)
  (let ((B1 (CCU2C_Inputs-B1 inputs))) ; (bitvector 1)
  (let ((lut4_1.s1 (if (bitvector->bool B1) n10 n9))) ; (bitvector 2)
  (let ((n13 (extract 0 0 lut4_1.s1))) ; (bitvector 1)
  (let ((n14 (extract 1 1 lut4_1.s1))) ; (bitvector 1)
  (let ((A1 (CCU2C_Inputs-A1 inputs))) ; (bitvector 1)
  (let
    (($flatten_lut4_1.$ternary$_Users_gussmith_lakeroad_modules_for_importing_lattice_ecp5_LUT4.v_10$6$_Y
      (if (bitvector->bool A1) n14 n13))) ; (bitvector 1)
  (let ((INIT0 (CCU2C_Inputs-INIT0 inputs))) ; (bitvector 16)
  (let ((n18 (extract 7 0 INIT0))) ; (bitvector 8)
  (let ((n19 (extract 15 8 INIT0))) ; (bitvector 8)
  (let ((D0 (CCU2C_Inputs-D0 inputs))) ; (bitvector 1)
  (let ((lut4_0.s3 (if (bitvector->bool D0) n19 n18))) ; (bitvector 8)
  (let ((n22 (extract 3 0 lut4_0.s3))) ; (bitvector 4)
  (let ((n23 (extract 7 4 lut4_0.s3))) ; (bitvector 4)
  (let ((C0 (CCU2C_Inputs-C0 inputs))) ; (bitvector 1)
  (let
    (($flatten_lut4_0.$ternary$_Users_gussmith_lakeroad_modules_for_importing_lattice_ecp5_LUT4.v_8$4$_Y
      (if (bitvector->bool C0) n23 n22))) ; (bitvector 4)
  (let
    ((n26
      (extract
        1
        0
        $flatten_lut4_0.$ternary$_Users_gussmith_lakeroad_modules_for_importing_lattice_ecp5_LUT4.v_8$4$_Y))) ; (bitvector 2)
  (let
    ((n27
      (extract
        3
        2
        $flatten_lut4_0.$ternary$_Users_gussmith_lakeroad_modules_for_importing_lattice_ecp5_LUT4.v_8$4$_Y))) ; (bitvector 2)
  (let ((B0 (CCU2C_Inputs-B0 inputs))) ; (bitvector 1)
  (let ((lut4_0.s1 (if (bitvector->bool B0) n27 n26))) ; (bitvector 2)
  (let ((n30 (extract 0 0 lut4_0.s1))) ; (bitvector 1)
  (let ((n31 (extract 1 1 lut4_0.s1))) ; (bitvector 1)
  (let ((A0 (CCU2C_Inputs-A0 inputs))) ; (bitvector 1)
  (let
    (($flatten_lut4_0.$ternary$_Users_gussmith_lakeroad_modules_for_importing_lattice_ecp5_LUT4.v_10$6$_Y
      (if (bitvector->bool A0) n31 n30))) ; (bitvector 1)
  (let
    (($not$_Users_gussmith_lakeroad_modules_for_importing_lattice_ecp5_CCU2C.v_50$12_Y
      (bvnot
        $flatten_lut4_0.$ternary$_Users_gussmith_lakeroad_modules_for_importing_lattice_ecp5_LUT4.v_10$6$_Y))) ; (bitvector 1)
  (let ((n35 (extract 1 0 INIT0))) ; (bitvector 2)
  (let ((n36 (extract 3 2 INIT0))) ; (bitvector 2)
  (let
    (($flatten_lut2_0.$ternary$_Users_gussmith_lakeroad_modules_for_importing_lattice_ecp5_LUT2.v_7$1$_Y
      (if (bitvector->bool B0) n36 n35))) ; (bitvector 2)
  (let
    ((n38
      (extract
        0
        0
        $flatten_lut2_0.$ternary$_Users_gussmith_lakeroad_modules_for_importing_lattice_ecp5_LUT2.v_7$1$_Y))) ; (bitvector 1)
  (let
    ((n39
      (extract
        1
        1
        $flatten_lut2_0.$ternary$_Users_gussmith_lakeroad_modules_for_importing_lattice_ecp5_LUT2.v_7$1$_Y))) ; (bitvector 1)
  (let ((lut2_0.Z (if (bitvector->bool A0) n39 n38))) ; (bitvector 1)
  (let ((INJECT1_0 (CCU2C_Inputs-INJECT1_0 inputs))) ; (bitvector 1)
  (let ((gated_lut2_0 (if (bitvector->bool INJECT1_0) (bv #b0 1) lut2_0.Z))) ; (bitvector 1)
  (let
    (($and$_Users_gussmith_lakeroad_modules_for_importing_lattice_ecp5_CCU2C.v_50$13$_Y
      (bvand
        $not$_Users_gussmith_lakeroad_modules_for_importing_lattice_ecp5_CCU2C.v_50$12_Y
        gated_lut2_0))) ; (bitvector 1)
  (let ((CIN (CCU2C_Inputs-CIN inputs))) ; (bitvector 1)
  (let
    (($and$_Users_gussmith_lakeroad_modules_for_importing_lattice_ecp5_CCU2C.v_50$14$_Y
      (bvand
        $flatten_lut4_0.$ternary$_Users_gussmith_lakeroad_modules_for_importing_lattice_ecp5_LUT4.v_10$6$_Y
        CIN))) ; (bitvector 1)
  (let
    ((cout_0
      (bvor
        $and$_Users_gussmith_lakeroad_modules_for_importing_lattice_ecp5_CCU2C.v_50$13$_Y
        $and$_Users_gussmith_lakeroad_modules_for_importing_lattice_ecp5_CCU2C.v_50$14$_Y))) ; (bitvector 1)
  (let ((INJECT1_1 (CCU2C_Inputs-INJECT1_1 inputs))) ; (bitvector 1)
  (let
    (($ternary$_Users_gussmith_lakeroad_modules_for_importing_lattice_ecp5_CCU2C.v_69$17$_Y
      (if (bitvector->bool INJECT1_1) (bv #b0 1) cout_0))) ; (bitvector 1)
  (let
    ((S1
      (bvxor
        $flatten_lut4_1.$ternary$_Users_gussmith_lakeroad_modules_for_importing_lattice_ecp5_LUT4.v_10$6$_Y
        $ternary$_Users_gussmith_lakeroad_modules_for_importing_lattice_ecp5_CCU2C.v_69$17$_Y))) ; (bitvector 1)
  (let
    (($ternary$_Users_gussmith_lakeroad_modules_for_importing_lattice_ecp5_CCU2C.v_46$8$_Y
      (if (bitvector->bool INJECT1_0) (bv #b0 1) CIN))) ; (bitvector 1)
  (let
    ((S0
      (bvxor
        $flatten_lut4_0.$ternary$_Users_gussmith_lakeroad_modules_for_importing_lattice_ecp5_LUT4.v_10$6$_Y
        $ternary$_Users_gussmith_lakeroad_modules_for_importing_lattice_ecp5_CCU2C.v_46$8$_Y))) ; (bitvector 1)
  (let
    (($not$_Users_gussmith_lakeroad_modules_for_importing_lattice_ecp5_CCU2C.v_73$21_Y
      (bvnot
        $flatten_lut4_1.$ternary$_Users_gussmith_lakeroad_modules_for_importing_lattice_ecp5_LUT4.v_10$6$_Y))) ; (bitvector 1)
  (let ((n54 (extract 1 0 INIT1))) ; (bitvector 2)
  (let ((n55 (extract 3 2 INIT1))) ; (bitvector 2)
  (let
    (($flatten_lut2_1.$ternary$_Users_gussmith_lakeroad_modules_for_importing_lattice_ecp5_LUT2.v_7$1$_Y
      (if (bitvector->bool B1) n55 n54))) ; (bitvector 2)
  (let
    ((n57
      (extract
        0
        0
        $flatten_lut2_1.$ternary$_Users_gussmith_lakeroad_modules_for_importing_lattice_ecp5_LUT2.v_7$1$_Y))) ; (bitvector 1)
  (let
    ((n58
      (extract
        1
        1
        $flatten_lut2_1.$ternary$_Users_gussmith_lakeroad_modules_for_importing_lattice_ecp5_LUT2.v_7$1$_Y))) ; (bitvector 1)
  (let ((lut2_1.Z (if (bitvector->bool A1) n58 n57))) ; (bitvector 1)
  (let ((gated_lut2_1 (if (bitvector->bool INJECT1_1) (bv #b0 1) lut2_1.Z))) ; (bitvector 1)
  (let
    (($and$_Users_gussmith_lakeroad_modules_for_importing_lattice_ecp5_CCU2C.v_73$22$_Y
      (bvand
        $not$_Users_gussmith_lakeroad_modules_for_importing_lattice_ecp5_CCU2C.v_73$21_Y
        gated_lut2_1))) ; (bitvector 1)
  (let
    (($and$_Users_gussmith_lakeroad_modules_for_importing_lattice_ecp5_CCU2C.v_73$23$_Y
      (bvand
        $flatten_lut4_1.$ternary$_Users_gussmith_lakeroad_modules_for_importing_lattice_ecp5_LUT4.v_10$6$_Y
        cout_0))) ; (bitvector 1)
  (let
    ((COUT
      (bvor
        $and$_Users_gussmith_lakeroad_modules_for_importing_lattice_ecp5_CCU2C.v_73$22$_Y
        $and$_Users_gussmith_lakeroad_modules_for_importing_lattice_ecp5_CCU2C.v_73$23$_Y))) ; (bitvector 1)
  (cons
    (CCU2C_Outputs
      S1 ; S1
      S0 ; S0
      COUT ; COUT
    )
    (CCU2C_State))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
  ))
(define CCU2C_initial
  (CCU2C_State))
