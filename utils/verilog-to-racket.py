#!/usr/bin/env python3
"""Convert a Verilog module to a Racket (Rosette) function."""

from pathlib import Path
from typing import Union, List
import subprocess


StrOrPath = Union[str, Path]


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


if __name__ == "__main__":
    import argparse
    import sys

    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--infile",
        nargs=1,
        type=argparse.FileType("r"),
        action="append",
        required=True,
    )
    parser.add_argument(
        "--outfile", nargs=1, type=argparse.FileType("w"), default=sys.stdout
    )
    parser.add_argument(
        "--top", nargs=1, type=str, required=True, help="Top module name."
    )
    args = parser.parse_args()

    verilog_to_racket(infiles=args.infile, top=args.top)
