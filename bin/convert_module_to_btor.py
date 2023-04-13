import argparse
import subprocess
import tempfile
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
parser.add_argument(
    "--define",
    action="append",
    default=[],
    help="Variables to `define. Support may be buggy.",
)
parser.add_argument(
    "--remove-lines-with",
    action="append",
    default=[],
    help="Removes lines that contain the string.",
)
args = parser.parse_args()

if "LAKEROAD_DIR" not in os.environ:
    raise Exception("LAKEROAD_DIR must be set to base dir of Lakeroad.")

PYTHON_EXE = sys.executable

# Convert Verilog files.
converted_verilog_files = []
for filename in args.infile:
    converted_file = tempfile.NamedTemporaryFile(mode="r+", delete=False)
    out = subprocess.call(
        [
            PYTHON_EXE,
            str(
                pathlib.Path(os.environ["LAKEROAD_DIR"])
                / "bin"
                / "convert_params_to_inputs.py"
            ),
            "--remove_string",
            "--infile",
            filename,
            "--outfile",
            converted_file.name,
        ]
        + sum([["--define", v] for v in args.define], []),
        stderr=subprocess.DEVNULL,
    )

    assert out == 0

    # Cut out lines.
    lines = converted_file.readlines()
    converted_file.seek(0)
    for i in lines:
        if not any(pat in i for pat in args.remove_lines_with):
            converted_file.write(i)
    converted_file.truncate()

    converted_verilog_files.append(converted_file)


def yosys(script):
    subprocess.call(
        [
            "yosys",
            "-p",
            script,
        ],
        stdout=sys.stderr,
        check=True,
    )


read_cmd = "\n".join([f"read -sv {f.name}" for f in converted_verilog_files])

btorfile = tempfile.NamedTemporaryFile(mode="r+")

yosys(
    f"""
{read_cmd}
hierarchy -top {args.top}
prep
proc
flatten
clk2fflogic
write_verilog {args.verilog_outfile}
hierarchy -top {args.top}
write_btor {btorfile.name}
"""
)

args.outfile.write(btorfile.read())
