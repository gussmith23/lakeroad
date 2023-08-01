// RUN: outfile=$(mktemp)
// RUN: racket $LAKEROAD_DIR/bin/main.rkt \
// RUN:  --solver cvc5 \
// RUN:  --verilog-module-filepath %s \
// RUN:  --architecture lattice-ecp5 \
// RUN:  --template dsp \
// RUN:  --out-format verilog \
// RUN:  --top-module-name top \
// RUN:  --verilog-module-out-signal p:16 \
// RUN:  --initiation-interval 1 \
// RUN:  --clock-name clk \
// RUN:  --module-name out \
// RUN:  --input-signal a:16 \
// RUN:  --input-signal b:16 \
// RUN:  --input-signal c:16 \
// RUN:  > $outfile
// RUN: FileCheck %s < $outfile
// RUN: if [ -z ${LAKEROAD_PRIVATE_DIR+x} ]; then \
// RUN:   echo "Warning: LAKEROAD_PRIVATE_DIR is not set. Skipping simulation."; \
// RUN:   exit 0; \
// RUN: else \
// RUN:   python $LAKEROAD_DIR/bin/simulate_with_verilator.py \
// RUN:    --max_num_tests=10000 \
// RUN:    --test_module_filepath $outfile \
// RUN:    --ground_truth_module_filepath %s \
// RUN:    --clock_name clk \
// RUN:    --initiation_interval 1 \
// RUN:    --output_signal_name p \
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

// CHECK: module out(a, b, c, clk, p);
// CHECK:   ALU54A #(
// CHECK:   MULT18X18C #(
// CHECK: endmodule