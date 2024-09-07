// RUN: outfile=$(mktemp)
// RUN: racket $LAKEROAD_DIR/bin/main.rkt \
// RUN:  --solver bitwuzla \
// RUN:  --verilog-module-filepath %s \
// RUN:  --architecture lattice-ecp5 \
// RUN:  --template dsp \
// RUN:  --out-format verilog \
// RUN:  --top-module-name top \
// RUN:  --verilog-module-out-signal p:16 \
// RUN:  --pipeline-depth 1 \
// RUN:  --clock-name clk \
// RUN:  --module-name test_module \
// RUN:  --input-signal a:16 \
// RUN:  --input-signal b:16 \
// RUN:  --input-signal c:16 \
// RUN:  --extra-cycles 3 \
// RUN:  --timeout 120 \
// RUN:  > $outfile
// RUN: FileCheck %s < $outfile
// RUN: if [ -z ${LAKEROAD_PRIVATE_DIR+x} ]; then \
// RUN:   echo "Warning: LAKEROAD_PRIVATE_DIR is not set. Skipping simulation."; \
// RUN:   exit 0; \
// RUN: else \
// RUN:   python3 $LAKEROAD_DIR/bin/simulate_with_verilator.py \
// RUN:    --test_module_name test_module \
// RUN:    --ground_truth_module_name top \
// RUN:    --max_num_tests=10000 \
// RUN:    --verilog_filepath $outfile \
// RUN:    --verilog_filepath %s \
// RUN:    --clock_name clk \
// RUN:    --pipeline_depth 1 \
// RUN:    --output_signal p:16 \
// RUN:    --input_signal a:16 \
// RUN:    --input_signal b:16 \
// RUN:    --input_signal c:16 \
// RUN:    --verilator_include_dir "$LAKEROAD_PRIVATE_DIR/lattice_ecp5/" \
// RUN:    --verilator_extra_arg='-Wno-CASEINCOMPLETE' \
// RUN:    --verilator_extra_arg='-Wno-IMPLICIT' \
// RUN:    --verilator_extra_arg='-Wno-PINMISSING' \
// RUN:    --verilator_extra_arg='-Wno-TIMESCALEMOD' \
// RUN:    --verilator_extra_arg='-Wno-UNOPTFLAT' \
// RUN:    --verilator_extra_arg='-Wno-WIDTH'; \
// RUN: fi

module top(input clk, input [15:0] a, b, c, output [15:0] p);

  reg [15:0] tmp0;

  always @ (posedge clk) begin
    tmp0 <= (a * b) | c;
  end

  assign p = tmp0;

endmodule

// CHECK: module test_module(a, b, c, clk, p);
// CHECK:   ALU54A #(
// CHECK:   MULT18X18C #(
// CHECK: endmodule