// RUN: outfile=$(mktemp)
// RUN: yosys -m "$LAKEROAD_DIR/yosys-plugin/lakeroad.so" -p " \
// RUN:  read_verilog %s; \
// RUN:  hierarchy -top in_module; \
// RUN:  lakeroad in_module; \
// RUN:  rename in_module out_module; \
// RUN:  write_verilog $outfile"
// RUN: FileCheck %s < $outfile

`include "example_test_using_include/impl.sv"

(* template = "dsp" *) 
(* architecture = "xilinx-ultrascale-plus" *) 
(* pipeline_depth = 0 *)
module in_module(
    (* data *)
    input [15:0] a, 
    (* data *)
    input [15:0] b, 
    (* out *)
    output [15:0] p);

    impl m(.a(a), .b(b), .o(p));
endmodule

// CHECK: module out_module(a, b, p);