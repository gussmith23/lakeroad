import tempfile
from verilog_to_racket import *
from pathlib import Path

PROJECT_ROOT = Path(__file__).parent.parent.parent.resolve()


def test_preprocess_and_flatten_verilog_sofa_frac_lut4():
    with tempfile.NamedTemporaryFile() as f:
        preprocess_and_flatten_verilog(
            [PROJECT_ROOT / "SOFA_modules" / "frac_lut4.v"],
            include_directories=[
                PROJECT_ROOT / "skywater-pdk-libs-sky130_fd_sc_hd" / "cells" / "or2",
                PROJECT_ROOT / "skywater-pdk-libs-sky130_fd_sc_hd" / "cells" / "buf",
                PROJECT_ROOT / "skywater-pdk-libs-sky130_fd_sc_hd" / "cells" / "mux2",
                PROJECT_ROOT / "skywater-pdk-libs-sky130_fd_sc_hd" / "cells" / "inv",
                PROJECT_ROOT
                / "skywater-pdk-libs-sky130_fd_sc_hd"
                / "models"
                / "udp_mux_2to1",
            ],
            # Note that None just means that the variable will be defined, but
            # won't have a value.
            defines={
                "NO_PRIMITIVES": None,
                "FUNCTIONAL": None,
                "SKY130_FD_SC_HD__UDP_MUX_2TO1_LAKEROAD_HACK": None,
            },
            top="frac_lut4",
            outfile=f.name,
        )

        assert "" != f.read().decode("utf-8")


def test_preprocess_and_flatten_verilog_xilinx_ultrascale_lut4():
    with tempfile.NamedTemporaryFile() as f:
        preprocess_and_flatten_verilog(
            [PROJECT_ROOT / "verilator_xilinx" / "LUT4.v"], top="LUT4", outfile=f.name
        )

        print(f.read().decode("utf-8"))
        exit(1)
