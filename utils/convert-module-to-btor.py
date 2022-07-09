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
parser.add_argument("--top")
parser.add_argument(
    "--outfile", nargs="?", type=argparse.FileType("w"), default=sys.stdout
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
    subprocess.call(["yosys", "-p", script])


read_cmd = "\n".join([f"read -sv {f.name}" for f in converted_verilog_files])

btorfile = tempfile.NamedTemporaryFile(mode="r+")

yosys(
    f"""
{read_cmd}
hierarchy -top {args.top}
flatten
write_verilog
hierarchy -top {args.top}
write_btor {btorfile.name}
"""
)

args.outfile.write(btorfile.read())
