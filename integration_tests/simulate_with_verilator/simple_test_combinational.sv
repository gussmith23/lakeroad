// RUN: logfile=$(mktemp)
// RUN: python3 $LAKEROAD_DIR/bin/simulate_with_verilator.py \
// RUN:   --verilog_filepath %s \
// RUN:   --input_signal a:1 \
// RUN:   --input_signal b:1 \
// RUN:   --pipeline_depth 0 \
// RUN:   --output_signal c:1 \
// RUN:   --test_module_name test_module \
// RUN:   --ground_truth_module_name ground_truth_module \
// RUN:   --verilator_extra_arg="-Wno-MULTITOP" \
// RUN:   --testbench_stdout_log_filepath $logfile
// RUN: FileCheck %s < $logfile

module test_module(input a, input b, output c);
  assign c = a & b;
endmodule

module ground_truth_module(input a, input b, output c);
  assign c = ~(~a | ~b);
endmodule

// CHECK: num_inputs =           2, num_test_cases =           4
// CHECK: Inputs: a=0, b=0
// CHECK: Expected outputs: c_ground_truth=0
// CHECK:   Actual outputs: c_test        =0
// CHECK: Inputs: a=0, b=1
// CHECK: Expected outputs: c_ground_truth=0
// CHECK:   Actual outputs: c_test        =0
// CHECK: Inputs: a=1, b=0
// CHECK: Expected outputs: c_ground_truth=0
// CHECK:   Actual outputs: c_test        =0
// CHECK: Inputs: a=1, b=1
// CHECK: Expected outputs: c_ground_truth=1
// CHECK:   Actual outputs: c_test        =1