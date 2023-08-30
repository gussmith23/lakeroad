// RUN: outfile=$(mktemp)
// RUN: (racket $LAKEROAD_DIR/bin/main.rkt \
// RUN:  --solver cvc5 \
// RUN:  --verilog-module-filepath %s \
// RUN:  --architecture xilinx-ultrascale-plus \
// RUN:  --template dsp \
// RUN:  --out-format verilog \
// RUN:  --top-module-name top \
// RUN:  --verilog-module-out-signal out:13 \
// RUN:  --initiation-interval 0 \
// RUN:  --module-name top \
// RUN:  --input-signal a:13 \
// RUN:  --input-signal b:13 \
// RUN:  --input-signal c:13 \
// RUN:  --timeout 90 \
// RUN:  || true) \
// RUN:  > $outfile \
// RUN:  2>&1
// FileCheck %s < $outfile
// if [ -z ${LAKEROAD_PRIVATE_DIR+x} ]; then \
//   echo "Warning: LAKEROAD_PRIVATE_DIR is not set. Skipping simulation."; \
//   exit 0; \
// else \
//   python $LAKEROAD_DIR/bin/simulate_with_verilator.py \
//    --use_random_intermediate_inputs \
//    --seed=23 \
//    --max_num_tests=10000 \
//    --test_module_filepath $outfile \
//    --ground_truth_module_filepath %s \
//    --initiation_interval 0 \
//    --output_signal_name out \
//    --input_signal a:13 \
//    --input_signal b:13 \
//    --input_signal c:13 \
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
	input  [12:0] a,
	input  [12:0] b,
	input  [12:0] c,
	output [12:0] out,
	input clk);

	assign out = (a * b) + c;
endmodule

// CHECK: Synthesis Timeout
