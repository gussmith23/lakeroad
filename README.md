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
- Verilator, ideally 4.228 or later
- Boolector, which can be built from source from <https://github.com/Boolector/boolector>
- Yosys

Please see the [Dockerfile](./Dockerfile)
  for a complete listing of all
  dependencies.
