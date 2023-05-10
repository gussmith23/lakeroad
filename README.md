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

## Writing Integration Tests

Ideally, we should aim to do most of our testing
  via *integration tests:*
  tests which test Lakeroad from the outside,
  only running commands that users can run.

We use the LLVM testing tool `FileCheck`
  to build our integration tests, and another LLVM tool,
  `lit`,
  to run them.

```verilog
// RUN: | awk '{print "// CHECK: " $0}' >> %s
```
