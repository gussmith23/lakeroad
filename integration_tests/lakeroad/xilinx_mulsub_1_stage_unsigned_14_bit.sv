// RUN: outfile=$(mktemp)
// RUN: (racket $LAKEROAD_DIR/bin/main.rkt \
// RUN:  --solver bitwuzla \
// RUN:  --verilog-module-filepath %s \
// RUN:  --architecture xilinx-ultrascale-plus \
// RUN:  --template dsp \
// RUN:  --out-format verilog \
// RUN:  --top-module-name top \
// RUN:  --verilog-module-out-signal out:14 \
// RUN:  --initiation-interval 1 \
// RUN:  --clock-name clk \
// RUN:  --module-name top \
// RUN:  --input-signal a:14 \
// RUN:  --input-signal b:14 \
// RUN:  --input-signal c:14 \
// RUN:  --timeout 90 \
// RUN:  || true) \
// RUN:  > $outfile \
// RUN:  2>&1
// RUN: FileCheck %s < $outfile
// if [ -z ${LAKEROAD_PRIVATE_DIR+x} ]; then \
//   echo "Warning: LAKEROAD_PRIVATE_DIR is not set. Skipping simulation."; \
//   exit 0; \
// else \
//   python3 $LAKEROAD_DIR/bin/simulate_with_verilator.py \
//    --use_random_intermediate_inputs \
//    --seed=23 \
//    --max_num_tests=10000 \
//    --test_module_filepath $outfile \
//    --ground_truth_module_filepath %s \
//    --clock_name clk \
//    --initiation_interval 1 \
//    --output_signal_name out \
//    --input_signal a:14 \
//    --input_signal b:14 \
//    --input_signal c:14 \
//    --verilator_include_dir "$LAKEROAD_PRIVATE_DIR/DSP48E2/" \
//    --verilator_extra_arg='-DXIL_XECLIB' \
//    --verilator_extra_arg='-Wno-UNOPTFLAT' \
//    --verilator_extra_arg='-Wno-LATCH' \
//    --verilator_extra_arg='-Wno-WIDTH' \
//    --verilator_extra_arg='-Wno-STMTDLY' \
//    --verilator_extra_arg='-Wno-CASEX' \
//    --verilator_extra_arg='-Wno-TIMESCALEMOD' \
//    --verilator_extra_arg='-Wno-PINMISSING'; \
// fi

(* use_dsp = "yes" *) module top(
	input  [13:0] a,
	input  [13:0] b,
	input  [13:0] c,
	output [13:0] out,
	input clk);

	logic  [27:0] stage0;

	always @(posedge clk) begin
	stage0 <= (a * b) - c;

	end

	assign out = stage0;
endmodule

// CHECK: Synthesis Timeout
