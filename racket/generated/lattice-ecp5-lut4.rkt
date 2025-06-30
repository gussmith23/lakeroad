#lang rosette/safe
    (provide (rename-out [LUT4 lattice-ecp5-lut4] [LUT4_initial lattice-ecp5-lut4-initial] [LUT4_inputs_helper lattice-ecp5-lut4-inputs] [LUT4_outputs_helper lattice-ecp5-lut4-outputs]))(struct LUT4_Inputs (init D C B A) #:transparent
  ; init (bitvector 16)
  ; D (bitvector 1)
  ; C (bitvector 1)
  ; B (bitvector 1)
  ; A (bitvector 1)
)
(struct LUT4_Outputs (Z) #:transparent
  ; Z (bitvector 1)
)
(struct LUT4_State () #:transparent)
(define
  (LUT4_inputs_helper inputs)
  (LUT4_Inputs
    (let
      (
        (assoc-result
          (assoc "init" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "D" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "C" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "B" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "A" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))))
(define
  (LUT4_outputs_helper outputs)
  (list
    (cons "Z" (LUT4_Outputs-Z outputs))))
(define (LUT4 inputs state)
  (let ((init (LUT4_Inputs-init inputs))) ; (bitvector 16)
  (let ((n1 (extract 7 0 init))) ; (bitvector 8)
  (let ((n2 (extract 15 8 init))) ; (bitvector 8)
  (let ((D (LUT4_Inputs-D inputs))) ; (bitvector 1)
  (let
    (($ternary$_Users_gussmith_lakeroad_modules_for_importing_lattice_ecp5_LUT4.v_7$1$_Y
      (if (bitvector->bool D) n2 n1))) ; (bitvector 8)
  (let
    ((n5
      (extract
        3
        0
        $ternary$_Users_gussmith_lakeroad_modules_for_importing_lattice_ecp5_LUT4.v_7$1$_Y))) ; (bitvector 4)
  (let
    ((n6
      (extract
        7
        4
        $ternary$_Users_gussmith_lakeroad_modules_for_importing_lattice_ecp5_LUT4.v_7$1$_Y))) ; (bitvector 4)
  (let ((C (LUT4_Inputs-C inputs))) ; (bitvector 1)
  (let
    (($ternary$_Users_gussmith_lakeroad_modules_for_importing_lattice_ecp5_LUT4.v_8$2$_Y
      (if (bitvector->bool C) n6 n5))) ; (bitvector 4)
  (let
    ((n9
      (extract
        1
        0
        $ternary$_Users_gussmith_lakeroad_modules_for_importing_lattice_ecp5_LUT4.v_8$2$_Y))) ; (bitvector 2)
  (let
    ((n10
      (extract
        3
        2
        $ternary$_Users_gussmith_lakeroad_modules_for_importing_lattice_ecp5_LUT4.v_8$2$_Y))) ; (bitvector 2)
  (let ((B (LUT4_Inputs-B inputs))) ; (bitvector 1)
  (let ((s1 (if (bitvector->bool B) n10 n9))) ; (bitvector 2)
  (let ((n13 (extract 0 0 s1))) ; (bitvector 1)
  (let ((n14 (extract 1 1 s1))) ; (bitvector 1)
  (let ((A (LUT4_Inputs-A inputs))) ; (bitvector 1)
  (let ((Z (if (bitvector->bool A) n14 n13))) ; (bitvector 1)
  (cons
    (LUT4_Outputs
      Z ; Z
    )
    (LUT4_State))))))))))))))))))))
(define LUT4_initial
  (LUT4_State))
