#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

"$SCRIPT_DIR/../bin/lakeroad" \
 --bitwuzla --stp --yices --cvc5 \
 --verilog-module-filepath "$SCRIPT_DIR/verilog/lattice_ecp5_2stage_muland_unsigned_16bit.sv" \
 --architecture lattice-ecp5 \
 --template dsp \
 --out-format verilog \
 --top-module-name top \
 --verilog-module-out-signal p:16 \
 --pipeline-depth 2 \
 --clock-name clk \
 --module-name test_module \
 --input-signal 'a:(port a 16):16' \
 --input-signal 'b:(port b 16):16' \
 --input-signal 'c:(port c 16):16' \
 --timeout 90 \
 --extra-cycles 3
