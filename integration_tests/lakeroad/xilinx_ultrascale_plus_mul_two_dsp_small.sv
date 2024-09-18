// RUN: outfile=$(mktemp)
// RUN: racket $LAKEROAD_DIR/bin/main.rkt \
// RUN:  --solver bitwuzla \
// RUN:  --verilog-module-filepath %s \
// RUN:  --architecture xilinx-ultrascale-plus \
// RUN:  --template experimental-two-dsp \
// RUN:  --out-format verilog \
// RUN:  --top-module-name mul \
// RUN:  --verilog-module-out-signal out:16 \
// RUN:  --pipeline-depth 0 \
// RUN:  --module-name top \
// RUN:  --input-signal 'a:(port b 8):8' \
// RUN:  --input-signal 'b:(port a 8):8' \
// RUN:  --timeout 90 \
// RUN:  --extra-cycles 3 \
// RUN: > $outfile
// RUN: FileCheck %s < $outfile
// RUN: if [ -z ${LAKEROAD_PRIVATE_DIR+x} ]; then \
// RUN:   echo "Warning: LAKEROAD_PRIVATE_DIR is not set. Skipping simulation."; \
// RUN:   exit 0; \
// RUN: else \
// RUN:   python3 $LAKEROAD_DIR/bin/simulate_with_verilator.py \
// RUN:    --test_module_name top \
// RUN:    --ground_truth_module_name mul \
// RUN:    --max_num_tests=10000 \
// RUN:    --verilog_filepath $outfile \
// RUN:    --verilog_filepath %s \
// RUN:    --pipeline_depth 0 \
// RUN:    --output_signal out:31 \
// RUN:    --input_signal a:8 \
// RUN:    --input_signal b:8 \
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


module mul(input [7:0] a, input [7:0] b, output [15:0] out);
  assign out = a * b;
endmodule

// CHECK: module top(a, b, out);
// CHECK:   DSP48E2 #(
// CHECK:   DSP48E2 #(