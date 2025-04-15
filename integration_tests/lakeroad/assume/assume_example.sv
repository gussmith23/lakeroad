// In this example, we demonstrate the use of `--assume` flags to pass useful
// assumptions to Lakeroad. Imagine we are trying to implement the module in
// this file. Generally, a multiplication of this size couldn't be implemented
// on a single DSP. However, imagine we know we that the inputs `a` and `b` will
// never be larger than 16 bits. We can use the `--input-signal` flag to slice
// out the lower 16 bits of `a` and `b` and pass them to the DSP. However,
// Lakeroad will still fail to synthesize! Why? Well, Lakeroad is trying to
// find a DSP configuration that is equivalent to the the input design on all
// inputs. Consider an input where `a` and `b` are values greater than 16 bits;
// the DSP only gets the lower 16 bits of each input, so the output of the DSP 
// will not match the output of this input design (which directly multiplies `a`
// and `b`). To fix this, we must give Lakeroad the additional information we
// have about `a` and `b`, which we do via `assume` statements.
//
// RUN: racket $LAKEROAD_DIR/bin/main.rkt \
// RUN:  --solver cvc5 \
// RUN:  --verilog-module-filepath %s \
// RUN:  --architecture xilinx-ultrascale-plus \
// RUN:  --template dsp \
// RUN:  --out-format verilog \
// RUN:  --top-module-name top \
// RUN:  --pipeline-depth 1 \
// RUN:  --clock-name clk \
// RUN:  --module-name test_module \
// RUN:  --input-signal 'a:(extract 15 0 (port a 32)):16' \
// RUN:  --input-signal 'b:(extract 15 0 (port b 32)):16' \
// RUN:  --assume '(bvule (port a 32) (bv 65535 32))' \
// RUN:  --assume '(bvule (port b 32) (bv 65535 32))' \
// RUN:  --verilog-module-out-signal out:32 \
// RUN:  --extra-cycles 3 \
// RUN:  --timeout 120 \
// RUN: | FileCheck %s

(* use_dsp = "yes" *) module top(
		input  [31:0] a,
		input  [31:0] b,
		output [31:0] out,
		input clk);
		logic  [31:0] stage0;
	always @(posedge clk) begin
	  stage0 <= a * b;
	end
	assign out = stage0;
endmodule

// CHECK: module test_module(a, b, clk, out);
// CHECK:   DSP48E2 #(
// CHECK: endmodule
