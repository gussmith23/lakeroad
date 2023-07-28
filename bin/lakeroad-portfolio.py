#!/usr/bin/env python3
"""Run Lakeroad with a portfolio of solvers in parallel.

This script accepts the same flags as main.rkt, in addition to those detailed
below. 

Note that this script accepts -- as a separator between lakeroad-portfolio.py
flags and main.rkt flags, but it's not necessary.

This script will run Lakeroad with each solver in parallel, and return the
output of the first Lakeroad instance that finishes.

NOTE: This script uses one thread per solver.

NOTE: This script does not seem to work when run under tools like LLVM `lit`. I
suspect the problem is that such tools catch the signals that this script
attempts to listen for.
"""

import argparse
import psutil
import subprocess
import os
import pathlib
from typing import Tuple
import sys
import tempfile

parser = argparse.ArgumentParser(
    description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter
)
parser.add_argument(
    "--bitwuzla",
    action=argparse.BooleanOptionalAction,
    help="Use bitwuzla.",
    default=True,
)
parser.add_argument(
    "--cvc5", action=argparse.BooleanOptionalAction, help="Use cvc5.", default=True
)
parser.add_argument(
    "--out-filepath",
    help="Same as --out-filepath of Lakeroad main.rkt. This script steals this"
    " argument for its own purposes.",
    type=argparse.FileType("w"),
    default=sys.stdout,
)
args, rest = parser.parse_known_args()

# Process the "--" flag which marks the end of the flags for the script.
rest = rest[1:] if rest[0] == "--" else rest

# Build list of solvers to run.
solvers = []
if args.bitwuzla:
    solvers.append("bitwuzla")
if args.cvc5:
    solvers.append("cvc5")


def start_with_solver(solver: str) -> Tuple[psutil.Popen, tempfile.NamedTemporaryFile]:
    """Start Lakeroad main.rkt with the given solver.

    Returns pid and output file for a Lakeroad session started with the given
    solver."""
    outfile = tempfile.NamedTemporaryFile(mode="w", delete=False)
    process = psutil.Popen(
        [
            "racket",
            pathlib.Path(os.path.abspath(__file__)).parent / "main.rkt",
            "--solver",
            solver,
            "--out-filepath",
            outfile.name,
            *rest,
        ],
        stdin=sys.stdin,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
    )
    return (process, outfile)


processes_and_files = list(map(start_with_solver, solvers))
processes, files = zip(*processes_and_files)

# Maps pid to output file.
pid_to_file = {process.pid: outfile for (process, outfile) in processes_and_files}

gone, alive = psutil.wait_procs(processes)

# Kill processes that are still running.
for p in alive:
    p.kill()

# Get output of first solver that finished.
first_finished = gone[0]

# Write output on success.
if first_finished.returncode == 0:
    args.out_filepath.write(
        pathlib.Path(pid_to_file[first_finished.pid].name).read_text()
    )

# Close files.
for outfile in files:
    outfile.close()

# Mirror stderr, stdout, returncode.
sys.stderr.write(first_finished.stderr.read().decode("utf-8"))
sys.stdout.write(first_finished.stdout.read().decode("utf-8"))
sys.exit(first_finished.returncode)
