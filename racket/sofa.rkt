#lang racket

;;; Architecture for the high-density family of SOFA FPGAs, described here:
;;; https://skywater-openfpga.readthedocs.io/en/latest/device/hd_fpga/

(provide interpret-sofa
         compile-sofa)

(require "lut.rkt"
         rosette
         "comp-json.rkt")

(define (interpret-sofa interpreter expr)
  (match expr
    [`(sofa-lut4 ,sram ,inputs) (interpret-sofa-lut4 sram (interpreter inputs))]))

(define (compile-sofa compile get-bits add-cell add-netname add-parameter-default-value expr)
  (match expr
    [`(sofa-lut4 ,sram ,inputs)
     (define lut4-out (get-bits 1))
     (add-netname 'lut4-out lut4-out)
     (define lut4-cell (make-sofa-lut4 sram (compile inputs) lut4-out))
     (add-cell 'lut4 lut4-cell)

     lut4-out]))

;;; Simplified model of a SOFA LUT4 based on the code here:
;;; https://github.com/lnis-uofu/SOFA/blob/e508bdd9056639101993f84a215ab10354659ad6/FPGA1212_SOFA_HD_PNR/FPGA1212_SOFA_HD_Verilog/SRC/sub_module/luts.v
(define (interpret-sofa-lut4 init inputs)
  (error "todo"))

;;; Compile simplified LUT4.
;;;
;;; in: list of 4 bit ids. LUT inputs.
;;;
;;; sram: list of 16 bit ids. LUT memory (I think.)
;;;
;;; lut4-out: list of 1 bit id. LUT output.
(define (make-sofa-lut4 sram in lut4-out)
  (make-cell
   "frac_lut4"
   (make-cell-port-directions (list 'in 'sram 'sram_inv 'mode 'mode_inv) (list 'lut3_out 'lut4_out))
   (make-cell-connections 'in
                          in
                          'sram
                          sram
                          'sram_inv
                          (make-list 16 0)
                          'mode
                          '(0)
                          'mode-inv
                          '(0)
                          'lut3_out
                          '(0 0)
                          'lut4-out
                          lut4-out)))

(module+ test
  (require rackunit)

  (check-not-exn (lambda () (make-sofa-lut4 '(0 0 0 0) (make-list 16 0) '(0)))))
