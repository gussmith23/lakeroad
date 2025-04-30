// See xilinx_ultrascale_plus_wide_add.v for more documentation.
// Same demo, but using Yosys annotations.

// The plugin expects a "lakeroad" command to be available in the PATH, or for
// the LAKEROAD environment variable to be set to a command that runs the
// lakeroad-portfolio.py script.
// RUN: LAKEROAD="python $LAKEROAD_DIR/bin/lakeroad-portfolio.py" \
// RUN: yosys -m "$LAKEROAD_DIR/yosys-plugin/lakeroad.so" -p " \
// RUN:  read_verilog %s; \
// RUN:  hierarchy -top top; \
// RUN:  lakeroad top; \
// RUN:  write_verilog" \
// RUN: | FileCheck %s

(* solvers = "cvc5" *)
(* architecture = "xilinx-ultrascale-plus" *)
(* template = "dsp" *)
(* pipeline_depth = 0 *)
// Unfortunately, Yosys/Verilog does not support specifying attributes multiple
// times. Thus, here, we dump all the input signals in a single attribute.
// NOTE: Make sure you wrap expressions in single quotes, otherwise you will get
// an error from Lakeroad, as the input signal expressions will be broken up
// by the shell.
(* extra_input_signal_flags = "--input-signal 'a:(extract 47 18 (port a 48)):30' --input-signal 'b:(extract 17 0 (port a 48)):18' --input-signal 'c:(port b 48):48'" *)
module top(
  // Note: no (* data *) attributes on a and b, as we need more complex
  // input_signal annotations for them above.
  input [47:0] a, 
  input [47:0] b, 
  (* out *)
  output [47:0] out
);
  assign out = a + b;
endmodule

// CHECK: module top(a, b, out);
// CHECK:   DSP48E2 #(
// CHECK: endmodule
