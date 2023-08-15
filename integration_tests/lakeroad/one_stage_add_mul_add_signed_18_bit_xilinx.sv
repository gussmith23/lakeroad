// RUN: outfile=$(mktemp)
// RUN: racket $LAKEROAD_DIR/bin/main.rkt \
// RUN:  --verilog-module-filepath %s \
// RUN:  --architecture xilinx-ultrascale-plus \
// RUN:  --template dsp \
// RUN:  --out-format verilog \
// RUN:  --top-module-name top \
// RUN:  --verilog-module-out-signal out:18 \
// RUN:  --initiation-interval 1 \
// RUN:  --clock-name clk \
// RUN:  --module-name top \
// RUN:  --input-signal a:18 \
// RUN:  --input-signal b:18 \
// RUN:  --input-signal c:18 \
// RUN:  --input-signal d:18 \
// RUN: > $outfile
// RUN: cat $outfile
// RUN: FileCheck %s < $outfile
// RUN: if [ -z ${LAKEROAD_PRIVATE_DIR+x} ]; then \
// RUN:   echo "Warning: LAKEROAD_PRIVATE_DIR is not set. Skipping simulation."; \
// RUN:   exit 0; \
// RUN: else \
// RUN:   python3 $LAKEROAD_DIR/bin/simulate_with_verilator.py \
// RUN:    --max_num_tests=10000 \
// RUN:    --test_module_filepath $outfile \
// RUN:    --ground_truth_module_filepath %s \
// RUN:    --clock_name clk \
// RUN:    --initiation_interval 1 \
// RUN:    --output_signal_name out \
// RUN:    --input_signal a:18 \
// RUN:    --input_signal b:18 \
// RUN:    --input_signal c:18 \
// RUN:    --input_signal d:18 \
// RUN:    --verilator_include_dir "$LAKEROAD_PRIVATE_DIR/DSP48E2/" \
// RUN:    --verilator_extra_arg='-DXIL_XECLIB' \
// RUN:    --verilator_extra_arg='-Wno-UNOPTFLAT' \
// RUN:    --verilator_extra_arg='-Wno-LATCH' \
// RUN:    --verilator_extra_arg='-Wno-WIDTH' \
// RUN:    --verilator_extra_arg='-Wno-STMTDLY' \
// RUN:    --verilator_extra_arg='-Wno-CASEX' \
// RUN:    --verilator_extra_arg='-Wno-TIMESCALEMOD' \
// RUN:    --verilator_extra_arg='-Wno-PINMISSING'; \
// RUN: fi

(* use_dsp = "yes" *) module top(
	input signed [17:0] a,
	input signed [17:0] b,
	input signed [17:0] c,
	input signed [17:0] d,
	output [17:0] out,
	input clk);

	logic signed [35:0] stage0;

	always @(posedge clk) begin
	stage0 <= ((d + a) * b) + c;

	end

	assign out = stage0;
endmodule

// CHECK: module top(a, b, c, clk, d, out);
// CHECK:   DSP48E2 #(
// CHECK: endmodule
