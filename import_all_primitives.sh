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

# Write a function
function convert_to_rosette_via_yosys {
  IN_FILEPATH=$1
  OUT_FILEPATH=$2
  IN_MODULE_NAME=$3
  OUT_FUNCTION_NAME=$4
  yosys -q -p "
    read_verilog -sv $IN_FILEPATH;
    hierarchy -check -top $IN_MODULE_NAME;
    prep;
    flatten;
    clk2fflogic;
    write_functional_rosette -assoc-list-helpers" \
    | sed "1 a\\
    (provide (rename-out [$IN_MODULE_NAME $OUT_FUNCTION_NAME] [""$IN_MODULE_NAME""_initial ""$OUT_FUNCTION_NAME""-initial] [""$IN_MODULE_NAME""_inputs_helper ""$OUT_FUNCTION_NAME""-inputs] [""$IN_MODULE_NAME""_outputs_helper ""$OUT_FUNCTION_NAME""-outputs]))" \
  > "$OUT_FILEPATH"
}

convert_to_rosette_via_yosys \
  $LAKEROAD_DIR/modules_for_importing/lattice_ecp5/CCU2C.v \
  $LAKEROAD_DIR/racket/generated/lattice-ecp5-ccu2c.rkt \
  CCU2C \
  lattice-ecp5-ccu2c

convert_to_rosette_via_yosys \
  $LAKEROAD_DIR/modules_for_importing/lattice_ecp5/LUT2.v \
  $LAKEROAD_DIR/racket/generated/lattice-ecp5-lut2.rkt \
  LUT2 \
  lattice-ecp5-lut2

convert_to_rosette_via_yosys \
  $LAKEROAD_DIR/modules_for_importing/lattice_ecp5/LUT4.v \
  $LAKEROAD_DIR/racket/generated/lattice-ecp5-lut4.rkt \
  LUT4 \
  lattice-ecp5-lut4
  
# TODO(@gussmith23): get this working
# out=$($LAKEROAD_DIR/bin/verilog_to_racket.py \
#   --infile $LAKEROAD_DIR/modules_for_importing/SOFA/frac_lut4.v \
#   --top frac_lut4 \
#   --function-name sofa-frac-lut4 \
#   --include $LAKEROAD_DIR/verilog/simulation/skywater \
#   --define SKY130_FD_SC_HD__UDP_MUX_2TO1_LAKEROAD_HACK \
#   --define NO_PRIMITIVES \
#   --define FUNCTIONAL \
#   | sed 's#(require (file.*#(require "../signal.rkt\")#' )
# echo "$out" > $LAKEROAD_DIR/racket/generated/sofa-frac-lut4.rkt

convert_to_rosette_via_yosys \
  $LAKEROAD_DIR/modules_for_importing/xilinx_ultrascale_plus/CARRY8.v \
  $LAKEROAD_DIR/racket/generated/xilinx-ultrascale-plus-carry8.rkt \
  CARRY8 \
  xilinx-ultrascale-plus-carry8

convert_to_rosette_via_yosys \
  $LAKEROAD_DIR/modules_for_importing/xilinx_ultrascale_plus/DSP48E2.v \
  $LAKEROAD_DIR/racket/generated/xilinx-ultrascale-plus-dsp48e2.rkt \
  DSP48E2 \
  xilinx-ultrascale-plus-dsp48e2

convert_to_rosette_via_yosys \
  $LAKEROAD_DIR/modules_for_importing/xilinx_ultrascale_plus/LUT6_2.v \
  $LAKEROAD_DIR/racket/generated/xilinx-ultrascale-plus-lut6-2.rkt \
  LUT6_2 \
  xilinx-ultrascale-plus-lut6-2

convert_to_rosette_via_yosys \
  $LAKEROAD_DIR/modules_for_importing/xilinx_ultrascale_plus/LUT6.v \
  $LAKEROAD_DIR/racket/generated/xilinx-ultrascale-plus-lut6.rkt \
  LUT6 \
  xilinx-ultrascale-plus-lut6

if [ -z ${LAKEROAD_PRIVATE_DIR+x} ]; then 
  echo "not importing modules as LAKEROAD_PRIVATE_DIR is not set"
else 
  convert_to_rosette_via_yosys \
    "$LAKEROAD_PRIVATE_DIR"/lattice_ecp5/modified_ALU54B.v \
    "$LAKEROAD_DIR"/racket/generated/lattice-ecp5-alu54b.rkt \
    ALU54B \
    lattice-ecp5-alu54b

  convert_to_rosette_via_yosys \
    "$LAKEROAD_PRIVATE_DIR"/lattice_ecp5/ALU54A_modified_for_racket_import.v \
    "$LAKEROAD_DIR"/racket/generated/lattice-ecp5-alu54a.rkt \
    ALU54A \
    lattice-ecp5-alu54a

  convert_to_rosette_via_yosys \
    "$LAKEROAD_PRIVATE_DIR"/lattice_ecp5/MULT18X18D_modified_for_racket_import.v \
    "$LAKEROAD_DIR"/racket/generated/lattice-ecp5-mult18x18d.rkt \
    MULT18X18D \
    lattice-ecp5-mult18x18d
  
  convert_to_rosette_via_yosys \
    "$LAKEROAD_PRIVATE_DIR"/lattice_ecp5/MULT18X18C_modified_for_racket_import.v \
    "$LAKEROAD_DIR"/racket/generated/lattice-ecp5-mult18x18c.rkt \
    MULT18X18C \
    lattice-ecp5-mult18x18c

  convert_to_rosette_via_yosys \
    "$LAKEROAD_PRIVATE_DIR"/intel_cyclone10lp/cyclone10lp_mac_mult_modified_for_racket_import.v \
    "$LAKEROAD_DIR"/racket/generated/intel-cyclone10lp-mac-mult.rkt \
    cyclone10lp_mac_mult \
    intel-cyclone10lp-mac-mult

  convert_to_rosette_via_yosys \
    "$LAKEROAD_PRIVATE_DIR"/intel_cyclone10lp/cyclone10lp_mac_mult_modified_for_racket_import.v \
    "$LAKEROAD_DIR"/racket/generated/intel-cyclone10lp-mac-out.rkt \
    cyclone10lp_mac_out \
    intel-cyclone10lp-mac-out

  convert_to_rosette_via_yosys \
    "$LAKEROAD_PRIVATE_DIR"/DSP48E1/DSP48E1_modified_for_racket_import.v \
    "$LAKEROAD_DIR"/racket/generated/xilinx-7-series-dsp48e1.rkt \
    DSP48E1 \
    xilinx-7-series-dsp48e1
fi