from verilog_to_racket import *
from pathlib import Path

PROJECT_ROOT = Path(__file__).parent.parent.parent.resolve()


def test_preprocess_and_flatten_verilog():
    out = preprocess_and_flatten_verilog(
        ["/Users/gus/lakeroad/SOFA_modules/frac_lut4.v"],
        [
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
    )

    assert out != ""
