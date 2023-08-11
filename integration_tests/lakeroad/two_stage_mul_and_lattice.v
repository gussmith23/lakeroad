// RUN: outfile=$(mktemp)
// RUN: (racket $LAKEROAD_DIR/bin/main.rkt \
// RUN:  --solver bitwuzla \
// RUN:  --verilog-module-filepath %s \
// RUN:  --architecture lattice-ecp5 \
// RUN:  --template dsp \
// RUN:  --out-format verilog \
// RUN:  --top-module-name top \
// RUN:  --verilog-module-out-signal p:16 \
// RUN:  --initiation-interval 2 \
// RUN:  --clock-name clk \
// RUN:  --module-name top \
// RUN:  --input-signal a:16 \
// RUN:  --input-signal b:16 \
// RUN:  --input-signal c:16 \
// RUN:  --timeout 90 \
// RUN: || true) \
// RUN:  > $outfile \
// RUN: 2>&1
// RUN: FileCheck %s < $outfile
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
//    --clock_name clk \
//    --initiation_interval 2 \
//    --output_signal_name p \
//    --input_signal a:16 \
//    --input_signal b:16 \
//    --input_signal c:16 \
//    --verilator_include_dir "$LAKEROAD_PRIVATE_DIR/lattice_ecp5/" \
//    --verilator_extra_arg='-Wno-CASEINCOMPLETE' \
//    --verilator_extra_arg='-Wno-IMPLICIT' \
//    --verilator_extra_arg='-Wno-PINMISSING' \
//    --verilator_extra_arg='-Wno-TIMESCALEMOD' \
//    --verilator_extra_arg='-Wno-UNOPTFLAT' \
// --testbench_stdout_log_filepath tmp.txt \
//    --verilator_extra_arg='-Wno-WIDTH'; \
// fi

module top(input clk, input [15:0] a, b, c, output [15:0] p);

  reg [15:0] tmp0, tmp1;

  always @ (posedge clk) begin
    tmp0 <= (a * b) & c;
    tmp1 <= tmp0;
  end

  assign p = tmp1;

endmodule

// CHECK: Synthesis Timeout
