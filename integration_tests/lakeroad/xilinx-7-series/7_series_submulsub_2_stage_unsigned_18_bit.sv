// RUN: (racket $LAKEROAD_DIR/bin/main.rkt \
// RUN:  --solver stp \
// RUN:  --verilog-module-filepath %s \
// RUN:  --architecture xilinx-7-series \
// RUN:  --template dsp \
// RUN:  --out-format verilog \
// RUN:  --top-module-name top \
// RUN:  --verilog-module-out-signal out:18 \
// RUN:  --pipeline-depth 2 \
// RUN:  --clock-name clk \
// RUN:  --module-name out \
// RUN:  --input-signal 'a:(port a 18):18' \
// RUN:  --input-signal 'b:(port b 18):18' \
// RUN:  --input-signal 'c:(port c 18):18' \
// RUN:  --input-signal 'd:(port d 18):18' \
// RUN:  --timeout 120 \
// RUN:  --extra-cycles 3 \
// RUN: || true) \
// RUN: 2>&1 \
// RUN: | FileCheck %s 
// if [ -z ${LAKEROAD_PRIVATE_DIR+x} ]; then \
//   echo "Warning: LAKEROAD_PRIVATE_DIR is not set. Skipping simulation."; \
//   exit 0; \
// else \
//   python3 $LAKEROAD_DIR/bin/simulate_with_verilator.py \
//    --test_module_name out \
//    --ground_truth_module_name top \
//    --max_num_tests=10000 \
//    --verilog_filepath $outfile \
//    --verilog_filepath %s \
//    --clock_name clk \
//    --pipeline_depth 2 \
//    --output_signal out:18 \
//    --input_signal a:18 \
//    --input_signal b:18 \ 
//    --input_signal c:18 \ 
//    --input_signal d:18 \ 
//    --verilator_include_dir "$LAKEROAD_PRIVATE_DIR/DSP48E1/" \
//    --verilator_extra_arg='-DXIL_XECLIB' \
//    --verilator_extra_arg='-Wno-UNOPTFLAT' \
//    --verilator_extra_arg='-Wno-LATCH' \
//    --verilator_extra_arg='-Wno-WIDTH' \
//    --verilator_extra_arg='-Wno-STMTDLY' \
//    --verilator_extra_arg='-Wno-CASEX' \
//    --verilator_extra_arg='-Wno-TIMESCALEMOD' \
//    --verilator_extra_arg='-Wno-PINMISSING' \
//    --verilator_extra_arg='-Wno-COMBDLY' \
// 	 --verilator_extra_arg='-Wno-INITIALDLY' \
// 	 --verilator_extra_arg='-Wno-CASEINCOMPLETE'; \
// fi

(* use_dsp = "yes" *) module top(
	input  [17:0] a,
	input  [17:0] b,
	input  [17:0] c,
	input  [17:0] d,
	output [17:0] out,
	input clk);

	logic  [35:0] stage0;
	logic  [35:0] stage1;

	always @(posedge clk) begin
	stage0 <= ((d - a) * b) - c;
	stage1 <= stage0;
	end

	assign out = stage1;
endmodule

// CHECK: Synthesis Timeout
