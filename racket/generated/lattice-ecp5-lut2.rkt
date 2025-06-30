#lang rosette/safe
    (provide (rename-out [LUT2 lattice-ecp5-lut2] [LUT2_initial lattice-ecp5-lut2-initial] [LUT2_inputs_helper lattice-ecp5-lut2-inputs] [LUT2_outputs_helper lattice-ecp5-lut2-outputs]))(struct LUT2_Inputs (init B A) #:transparent
  ; init (bitvector 4)
  ; B (bitvector 1)
  ; A (bitvector 1)
)
(struct LUT2_Outputs (Z) #:transparent
  ; Z (bitvector 1)
)
(struct LUT2_State () #:transparent)
(define
  (LUT2_inputs_helper inputs)
  (LUT2_Inputs
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
  (LUT2_outputs_helper outputs)
  (list
    (cons "Z" (LUT2_Outputs-Z outputs))))
(define (LUT2 inputs state)
  (let ((init (LUT2_Inputs-init inputs))) ; (bitvector 4)
  (let ((n1 (extract 1 0 init))) ; (bitvector 2)
  (let ((n2 (extract 3 2 init))) ; (bitvector 2)
  (let ((B (LUT2_Inputs-B inputs))) ; (bitvector 1)
  (let
    (($ternary$_Users_gussmith_lakeroad_modules_for_importing_lattice_ecp5_LUT2.v_7$1$_Y
      (if (bitvector->bool B) n2 n1))) ; (bitvector 2)
  (let
    ((n5
      (extract
        0
        0
        $ternary$_Users_gussmith_lakeroad_modules_for_importing_lattice_ecp5_LUT2.v_7$1$_Y))) ; (bitvector 1)
  (let
    ((n6
      (extract
        1
        1
        $ternary$_Users_gussmith_lakeroad_modules_for_importing_lattice_ecp5_LUT2.v_7$1$_Y))) ; (bitvector 1)
  (let ((A (LUT2_Inputs-A inputs))) ; (bitvector 1)
  (let ((Z (if (bitvector->bool A) n6 n5))) ; (bitvector 1)
  (cons
    (LUT2_Outputs
      Z ; Z
    )
    (LUT2_State))))))))))))
(define LUT2_initial
  (LUT2_State))
