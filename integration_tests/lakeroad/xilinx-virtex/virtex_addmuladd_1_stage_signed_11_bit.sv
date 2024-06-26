// RUN: outfile=$(mktemp)
// RUN: racket $LAKEROAD_DIR/bin/main.rkt \
// RUN:  --solver bitwuzla \
// RUN:  --verilog-module-filepath %s \
// RUN:  --architecture xilinx-virtex \
// RUN:  --template dsp \
// RUN:  --out-format verilog \
// RUN:  --top-module-name top \
// RUN:  --verilog-module-out-signal out:11 \
// RUN:  --pipeline-depth 3 \
// RUN:  --clock-name clk \
// RUN:  --module-name top \
// RUN:  --input-signal a:11 \
// RUN:  --input-signal b:11 \
// RUN:  --input-signal c:11 \
// RUN:  --input-signal d:11 \
// RUN:  --timeout 120 \
// RUN:  --extra-cycles 3 \
// RUN:  > $outfile
// RUN: FileCheck %s < $outfile
//  if [ -z ${LAKEROAD_PRIVATE_DIR+x} ]; then \
//    echo "Warning: LAKEROAD_PRIVATE_DIR is not set. Skipping simulation."; \
//    exit 0; \
//  else \
//    python3 $LAKEROAD_DIR/bin/simulate_with_verilator.py \
//     --use_random_intermediate_inputs \
//     --seed=23 \
//     --max_num_tests=10000 \
//     --verilog_filepath $outfile \
//     --verilog_filepath %s \
//     --clock_name clk \
//     --pipeline_depth 1 \
//     --output_signal_name out \
//     --input_signal a:11 \
//     --input_signal b:11 \
//     --input_signal c:11 \
//     --input_signal d:11 \
//     --verilator_include_dir "$LAKEROAD_PRIVATE_DIR/DSP48E2/" \
//     --verilator_extra_arg='-DXIL_XECLIB' \
//     --verilator_extra_arg='-Wno-UNOPTFLAT' \
//     --verilator_extra_arg='-Wno-LATCH' \
//     --verilator_extra_arg='-Wno-WIDTH' \
//     --verilator_extra_arg='-Wno-STMTDLY' \
//     --verilator_extra_arg='-Wno-CASEX' \
//     --verilator_extra_arg='-Wno-TIMESCALEMOD' \
//     --verilator_extra_arg='-Wno-PINMISSING'; \
//     --verilator_extra_arg='-Wno-COMBDLY' \
//  	 --verilator_extra_arg='-Wno-INITIALDLY' \
//  	 --verilator_extra_arg='-Wno-CASEINCOMPLETE'; \
//  fi


(* use_dsp = "yes" *) module top(
	input signed [10:0] a,
	input signed [10:0] b,
	input signed [10:0] c,
	input signed [10:0] d,
	output [10:0] out,
	input clk);

	logic signed [21:0] stage0;

	always @(posedge clk) begin
	stage0 <= ((d + a) * b) + c;

	end

	assign out = stage0;
endmodule

// CHECK: module top(a, b, c, clk, d, out); 
