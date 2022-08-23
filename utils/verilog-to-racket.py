"""Converts a Verilog module to a Racket (Rosette) function."""
import argparse

parser = argparse.ArgumentParser()
parser.add_argument(
    "--infile", nargs="?", type=argparse.FileType("r"), default=sys.stdin
)
parser.add_argument(
    "--outfile", nargs="?", type=argparse.FileType("w"), default=sys.stdout
)
parser.add_argument(
    "--define",
    default=[],
    action="append",
    help="Variables to `define. Support may be buggy.",
)
parser.add_argument(
    "--remove_string",
    action=argparse.BooleanOptionalAction,
    help="Remove `string` types. Seems to be necessary for Yosys.",
)
args = parser.parse_args()
