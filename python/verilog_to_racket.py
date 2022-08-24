"""Utilities for converting from Verilog to Racket."""

from pathlib import Path
from typing import Dict, Optional, Union, List
import subprocess
import itertools

StrOrPath = Union[str, Path]


def preprocess_and_flatten_verilog(
    infiles: List[StrOrPath],
    top: str,
    outfile: StrOrPath,
    include_directories: List[StrOrPath] = [],
    defines: Dict[str, Optional[str]] = {},
    check_for_not_derived: bool = True,
) -> None:
    """Preprocess and flatten Verilog in preparation for importing.

    Uses Yosys. Could use Icarus Verilog instead.

    Args:
        infiles: List of Verilog files to preprocess.

    Returns:
        Preprocessed Verilog code."""

    # Produces a string "-I <dir> -I <dir> ..." for each directory in include_directories.
    include_flags = " ".join(
        [f"-I {include_directory}" for include_directory in include_directories]
    )

    # Produces a string "-D <key>[=<val>] ..." for each define in defines.
    define_flags = " ".join(
        itertools.chain(
            *[
                ["-D", f"{k}={v}" if v is not None else f"{k}"]
                for (k, v) in defines.items()
            ]
        )
    )

    read_verilog_commands = [
        f"read_verilog -sv {include_flags} {define_flags} {infile}"
        for infile in infiles
    ]

    yosys_commands = read_verilog_commands + [
        # -simcheck runs checks like -check, but aslso checks that there are no blackboxes.
        f"hierarchy -simcheck -top {top}",
        "flatten",
        "proc",
        f"write_verilog -sv {outfile}",
    ]

    p = subprocess.run(
        args=[
            "yosys",
            "-p",
            "\n".join(yosys_commands),
        ],
        check=True,
        capture_output=True,
    )
    p.check_returncode()

    if check_for_not_derived:
        assert "not_derived" not in p.stdout.decode(
            "utf-8"
        ), "Found not_derived in output."
        assert "not_derived" not in p.stderr.decode(
            "utf-8"
        ), "Found not_derived in output."


def verilog_to_racket(infiles: List[StrOrPath], top: str) -> str:
    """Convert a Verilog module to a Racket (Rosette) function.

    Args:
        infiles: List of Verilog files needed to do conversion.
        top: Name of the top module."""
    subprocess.call(
        args=[
            "python3",
            Path(__file__).parent / "convert-module-to-btor.py",
            "--top",
            top,
        ]
    )
