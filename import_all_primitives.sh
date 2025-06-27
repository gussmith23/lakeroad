#!/bin/bash
#
# Helper script which imports all primitives and writes their corresponding
# Racket to racket/generated/.


if [[ -z "${LAKEROAD_DIR}" ]]; then 
  echo "LAKEROAD_DIR is not set"
  exit 1
fi

# We save into $out and then echo $out into a file because just using > causes
# the .rkt file to be emptied out, which then causes Lakeroad's Racket files not
# to load. It's probably due to some incorrect chain of dependencies.

yosys -q -p "
  read_verilog $LAKEROAD_DIR/modules_for_importing/lattice_ecp5/CCU2C.v;
  write_functional_rosette -assoc-list-helpers" \
  | sed '1 a\
  (provide (rename-out CCU2C lattice-ecp5-ccu2c) (rename-out CCU2C_initial lattice-ecp5-ccu2c-initial) (rename-out CCU2C_inputs_helper lattice-ecp5-ccu2c-inputs) (rename-out CCU2C_outputs_helper lattice-ecp5-ccu2c-outputs))' \
> $LAKEROAD_DIR/racket/generated/lattice-ecp5-ccu2c.rkt

exit 1

out=$($LAKEROAD_DIR/bin/verilog_to_racket.py \
  --infile $LAKEROAD_DIR/modules_for_importing/lattice_ecp5/LUT2.v \
  --top LUT2 \
  --function-name lattice-ecp5-lut2 \
  | sed 's#(require (file.*#(require "../signal.rkt\")#' )
echo "$out" > $LAKEROAD_DIR/racket/generated/lattice-ecp5-lut2.rkt

out=$($LAKEROAD_DIR/bin/verilog_to_racket.py \
  --infile $LAKEROAD_DIR/modules_for_importing/lattice_ecp5/LUT4.v \
  --top LUT4 \
  --function-name lattice-ecp5-lut4 \
  | sed 's#(require (file.*#(require "../signal.rkt\")#' )
echo "$out" > $LAKEROAD_DIR/racket/generated/lattice-ecp5-lut4.rkt
  
out=$($LAKEROAD_DIR/bin/verilog_to_racket.py \
  --infile $LAKEROAD_DIR/modules_for_importing/SOFA/frac_lut4.v \
  --top frac_lut4 \
  --function-name sofa-frac-lut4 \
  --include $LAKEROAD_DIR/verilog/simulation/skywater \
  --define SKY130_FD_SC_HD__UDP_MUX_2TO1_LAKEROAD_HACK \
  --define NO_PRIMITIVES \
  --define FUNCTIONAL \
  | sed 's#(require (file.*#(require "../signal.rkt\")#' )
echo "$out" > $LAKEROAD_DIR/racket/generated/sofa-frac-lut4.rkt

out=$($LAKEROAD_DIR/bin/verilog_to_racket.py \
  --infile $LAKEROAD_DIR/modules_for_importing/xilinx_ultrascale_plus/CARRY8.v \
  --top CARRY8 \
  --function-name xilinx-ultrascale-plus-carry8 \
  | sed 's#(require (file.*#(require "../signal.rkt\")#' )
echo "$out" > $LAKEROAD_DIR/racket/generated/xilinx-ultrascale-plus-carry8.rkt

# Note: requires GNU sed. Install with Brew on Mac.
out=$("$LAKEROAD_DIR"/bin/verilog_to_racket.py \
  --infile "$LAKEROAD_DIR"/modules_for_importing/xilinx_ultrascale_plus/DSP48E2.v \
  --top DSP48E2 \
  --define XIL_XECLIB \
  --function-name xilinx-ultrascale-plus-dsp48e2 \
  | sed 's#(require (file.*#(require "../signal.rkt\")#' \
  | sed "s/constant 'unnamed-input-[[:digit:]]\+ (bitvector \([[:digit:]]\+\))/bv 0 \1/" )
echo "$out" > "$LAKEROAD_DIR"/racket/generated/xilinx-ultrascale-plus-dsp48e2.rkt

out=$($LAKEROAD_DIR/bin/verilog_to_racket.py \
  --infile $LAKEROAD_DIR/modules_for_importing/xilinx_ultrascale_plus/LUT6_2.v \
  --top LUT6_2 \
  --function-name xilinx-ultrascale-plus-lut6-2 \
  | sed 's#(require (file.*#(require "../signal.rkt\")#' )
echo "$out" > $LAKEROAD_DIR/racket/generated/xilinx-ultrascale-plus-lut6-2.rkt

out=$($LAKEROAD_DIR/bin/verilog_to_racket.py \
  --infile $LAKEROAD_DIR/modules_for_importing/xilinx_ultrascale_plus/LUT6.v \
  --top LUT6 \
  --function-name xilinx-ultrascale-plus-lut6 \
  | sed 's#(require (file.*#(require "../signal.rkt\")#' )
echo "$out" > $LAKEROAD_DIR/racket/generated/xilinx-ultrascale-plus-lut6.rkt

if [ -z ${LAKEROAD_PRIVATE_DIR+x} ]; then 
  echo "not importing modules as LAKEROAD_PRIVATE_DIR is not set"
else 
  out=$("$LAKEROAD_DIR"/bin/verilog_to_racket.py \
    --infile "$LAKEROAD_PRIVATE_DIR"/lattice_ecp5/modified_ALU54B.v \
    --top ALU54B \
    --function-name lattice-ecp5-alu54b \
    | sed 's#(require (file.*#(require "../signal.rkt\")#' )
  echo "$out" > "$LAKEROAD_DIR"/racket/generated/lattice-ecp5-alu54b.rkt

  out=$("$LAKEROAD_DIR"/bin/verilog_to_racket.py \
    --infile "$LAKEROAD_PRIVATE_DIR"/lattice_ecp5/ALU54A_modified_for_racket_import.v \
    --top ALU54A \
    --function-name lattice-ecp5-alu54a \
    | sed 's#(require (file.*#(require "../signal.rkt\")#' )
  echo "$out" > "$LAKEROAD_DIR"/racket/generated/lattice-ecp5-alu54a.rkt

  out=$("$LAKEROAD_DIR"/bin/verilog_to_racket.py \
    --infile "$LAKEROAD_PRIVATE_DIR"/lattice_ecp5/MULT18X18D_modified_for_racket_import.v \
    --top MULT18X18D \
    --function-name lattice-ecp5-mult18x18d \
    | sed 's#(require (file.*#(require "../signal.rkt\")#' )
  echo "$out" > "$LAKEROAD_DIR"/racket/generated/lattice-ecp5-mult18x18d.rkt

  out=$("$LAKEROAD_DIR"/bin/verilog_to_racket.py \
    --infile "$LAKEROAD_PRIVATE_DIR"/lattice_ecp5/MULT18X18C_modified_for_racket_import.v \
    --top MULT18X18C \
    --function-name lattice-ecp5-mult18x18c \
    | sed 's#(require (file.*#(require "../signal.rkt\")#' )
  echo "$out" > "$LAKEROAD_DIR"/racket/generated/lattice-ecp5-mult18x18c.rkt

  out=$("$LAKEROAD_DIR"/bin/verilog_to_racket.py \
    --infile "$LAKEROAD_PRIVATE_DIR"/intel_cyclone10lp/cyclone10lp_mac_mult_modified_for_racket_import.v \
    --top cyclone10lp_mac_mult \
    --function-name intel-cyclone10lp-mac-mult \
    | sed 's#(require (file.*#(require "../signal.rkt\")#' )
  echo "$out" > "$LAKEROAD_DIR"/racket/generated/intel-cyclone10lp-mac-mult.rkt

  out=$("$LAKEROAD_DIR"/bin/verilog_to_racket.py \
    --infile "$LAKEROAD_PRIVATE_DIR"/intel_cyclone10lp/cyclone10lp_mac_mult_modified_for_racket_import.v \
    --top cyclone10lp_mac_out \
    --function-name intel-cyclone10lp-mac-out \
    | sed 's#(require (file.*#(require "../signal.rkt\")#' )
  echo "$out" > "$LAKEROAD_DIR"/racket/generated/intel-cyclone10lp-mac-out.rkt

  out=$("$LAKEROAD_DIR"/bin/verilog_to_racket.py \
    --infile "$LAKEROAD_PRIVATE_DIR"/DSP48E1/DSP48E1_modified_for_racket_import.v \
    --top DSP48E1 \
    --function-name xilinx-7-series-dsp48e1 \
    | sed 's#(require (file.*#(require "../signal.rkt\")#' )
  echo "$out" > "$LAKEROAD_DIR"/racket/generated/xilinx-7-series-dsp48e1.rkt
fi