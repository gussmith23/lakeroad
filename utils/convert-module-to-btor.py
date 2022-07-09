import argparse
import json
import subprocess
import re
import tempfile
import json
import sys

parser = argparse.ArgumentParser()
parser.add_argument("--infile", action="append")
parser.add_argument("--top")
parser.add_argument(
    "outfile", nargs="?", type=argparse.FileType("w"), default=sys.stdout
)

args = parser.parse_args()

parameter_line_pattern = re.compile(r"parameter (.*)=(.*)[;,]")

jsonfile = tempfile.NamedTemporaryFile()


def yosys(script):
    subprocess.call(["yosys", "-p", script])


print(args.infile)

read_cmd = "\n".join([f"read -sv {f}" for f in args.infile])

yosys(
    f"""
{read_cmd}
hierarchy -top {args.top}
flatten
write_json {jsonfile.name} 
"""
)

params_dict = json.load(jsonfile)["modules"][args.top]["parameter_default_values"]


chparam_commands = "\n".join(
    [f"chparam -set {k} 23 {args.top}" for k, _ in params_dict.items()]
)

btorfile = tempfile.NamedTemporaryFile(mode="r+")

yosys(
    f"""
{read_cmd}
hierarchy -top {args.top}
{chparam_commands}
flatten
write_verilog
hierarchy -top {args.top}
write_btor {btorfile.name}
"""
)

args.outfile.write(btorfile.read())
