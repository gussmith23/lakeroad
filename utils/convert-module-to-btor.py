import argparse
import json
import subprocess
import re
import tempfile
import json
import sys
import os
import pathlib

parser = argparse.ArgumentParser()
parser.add_argument("--infile", action="append")
parser.add_argument("--top", required=True)
parser.add_argument(
    "--outfile", nargs="?", type=argparse.FileType("w"), default=sys.stdout
)
parser.add_argument(
    "--verilog_outfile",
    nargs="?",
    default=os.devnull,
    help="Write converted, flattened Verilog file out, for debugging.",
)
args = parser.parse_args()

if "LAKEROAD_DIR" not in os.environ:
    raise Exception("LAKEROAD_DIR must be set to base dir of Lakeroad.")

PYTHON_EXE = sys.executable

# Convert Verilog files.
converted_verilog_files = []
for filename in args.infile:
    converted_file = tempfile.NamedTemporaryFile()
    subprocess.call(
        [
            PYTHON_EXE,
            str(
                pathlib.Path(os.environ["LAKEROAD_DIR"])
                / "utils"
                / "convert-params-to-inputs.py"
            ),
            "--remove_string",
            "--infile",
            filename,
            "--outfile",
            converted_file.name,
        ]
    )
    converted_verilog_files.append(converted_file)


def yosys(script):
    subprocess.call(
        [
            "yosys",
            "-p",
            script,
        ],
        stdout=sys.stderr,
    )


read_cmd = "\n".join([f"read -sv {f.name}" for f in converted_verilog_files])

btorfile = tempfile.NamedTemporaryFile(mode="r+")

yosys(
    f"""
{read_cmd}
hierarchy -top {args.top}
proc
flatten
write_verilog {args.verilog_outfile}
hierarchy -top {args.top}
write_btor {btorfile.name}
"""
)

args.outfile.write(btorfile.read())
