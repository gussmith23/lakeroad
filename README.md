# lakeroad

Lakeroad
  is a synthesizer
  for FPGAs.
Given a description
  of an FPGA's resources,
  it can synthesize
  FPGA configurations
  (e.g. LUT programmings)
  to implement high-level programs
  (e.g. 8-bit add with carry).

## Dependencies

- LLVM
  - set `LLVM_CONFIG` to the location of your `llvm-config` binary, e.g. `/usr/local/Cellar/llvm/15.0.3/bin/llvm-config`
- `lit` test runner, which can be installed with `pip install lit`
- Racket, plus Racket packages (installable via `raco pkg install`):
  - `rosette`
  - `json`
  - `yaml`
- Verilator, ideally 4.228 or later
- Boolector, which can be built from source from <https://github.com/Boolector/boolector>
- Yosys

Please see the [Dockerfile](./Dockerfile)
  for a complete listing of all
  dependencies.

## Environment Variables

- `LAKEROAD_DIR`
- `LAKEROAD_PRIVATE_DIR`
- `VERILATOR_INCLUDE_DIR`
- `LLVM_CONFIG`

## Testing in Lakeroad

[`run-tests.sh`](./run-tests.sh) is the primary script
  for running tests.
We have three sources of tests at the moment:

- Rust tests within the (dormant) Lakeroad Rust crate.
- Racket tests within the Lakeroad Racket implementation.
- Integration tests in [`./integration_tests/`](./integration_tests/).

Ideally, we should aim to do most of our testing
  via *integration tests:*
  tests which test Lakeroad from the outside,
  only running commands that users can run.
We use the LLVM testing tool `FileCheck`
  to build our integration tests, and another LLVM tool,
  `lit`,
  to run them.
FileCheck tests take the form of a file to be compiled
  using Lakeroad or some other tool within Lakeroad.
FileCheck tests can be written in any language;
  in Lakeroad's case, they're generally writte in Verilog,
  representing a Verilog file to be compiled
  with Lakeroad.
At the top of the file are generally commands
  for how to compile the file and how to execute
  FileCheck on the result.
At the bottom of the file are syntactic checks
  to perform on the results.

An example of what Lakeroad integration tests will
  often look like:

```verilog
// RUN: racket $LAKEROAD_DIR/bin/main.rkt \
// RUN:  --verilog-module-filepath %s \
// RUN:  --architecture xilinx-ultrascale-plus \
// RUN:  --template dsp \
// RUN:  --out-format verilog \
// RUN:  --top-module-name three_stage_multiplier \
// RUN:  --verilog-module-out-signal p:16 \
// RUN:  --initiation-interval 3 \
// RUN:  --clock-name clk \
// RUN:  --module-name out \
// RUN:  --input-signal a:16 \
// RUN:  --input-signal b:16 \
// RUN: | FileCheck %s

module three_stage_multiplier(input clk, input [15:0] a, b, output [15:0] p);

  reg [15:0] tmp0, tmp1, out;

  always @ (posedge clk) begin
    ...

endmodule

// CHECK: module out(a, b, clk, p);
// CHECK:   wire [47:0] P_0;
// CHECK:   input [15:0] a;
// CHECK:   wire [15:0] a;
// CHECK: ...
```

When generating tests, it can often be useful
  to replace the following line:

```verilog
// RUN: | FileCheck %s
```

With this:

```verilog
// RUN: | awk '{print "// CHECK: " $0}' >> %s
```

Which will automatically take the output of the tool
  and append it to the end of the file
  with ``// CHECK: ` as a prefix.

## Notes for Mac

Mac users with an old version of `gcc`/`g++` (i.e. `clang`/`clang++`)
  as their default compiler
  will need to install a newer `clang++`
  via `brew install llvm`,
  and then ensure that `clang++` is used
  when running tests.
This can be done by setting
  `CXX` as follows:

```sh
CXX=/usr/local/Cellar/llvm/16.0.3/bin/clang++ lit -v integration_tests/lakeroad/presubaddor_2_stage_unsigned_10_bit.sv
```

TODO(@gussmith23): this is unintuitive and not user-friendly.
