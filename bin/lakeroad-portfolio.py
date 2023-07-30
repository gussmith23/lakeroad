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
import itertools
import psutil
import subprocess
import os
import pathlib
from typing import Tuple
import sys
import tempfile


# These are set in main.rkt.
SYNTH_SUCCESS_CODE = 0
SYNTH_FAILURE_CODE = 25
SYNTH_TIMEOUT_CODE = 26

parser = argparse.ArgumentParser(
    description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter
)
parser.add_argument(
    "--bitwuzla",
    action=argparse.BooleanOptionalAction,
    help="Use bitwuzla.",
    default=False,
)
parser.add_argument(
    "--cvc5", action=argparse.BooleanOptionalAction, help="Use cvc5.", default=False
)
parser.add_argument(
    "--seed",
    action="append",
    help="Seed for solvers. The script will spawn one instance of each solver with the given seed.",
    default=[0],
)
parser.add_argument(
    "--boolector",
    action=argparse.BooleanOptionalAction,
    help="Use boolector.",
    default=False,
)
parser.add_argument(
    "--out-filepath",
    help=(
        "Same as --out-filepath of Lakeroad main.rkt. This script steals this"
        " argument for its own purposes."
    ),
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
if args.boolector:
    solvers.append("boolector")
assert solvers != [], "Must specify at least one solver."

# Remove duplicates from seed list.
args.seed = list(set(args.seed))

def start_with_solver(
    solver: str, seed: int
) -> Tuple[psutil.Popen, tempfile.NamedTemporaryFile]:
    """Start Lakeroad main.rkt with the given solver and seed.

    Returns pid and output file for a Lakeroad session started with the given
    solver."""
    outfile = tempfile.NamedTemporaryFile(mode="w", delete=False)
    process = psutil.Popen(
        [
            "racket",
            pathlib.Path(os.path.abspath(__file__)).parent / "main.rkt",
            "--solver",
            solver,
            "--seed",
            str(seed),
            "--out-filepath",
            outfile.name,
            *rest,
        ],
        stdin=sys.stdin,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
    )
    return (process, outfile)


processes_and_files = list(
    map(lambda t: start_with_solver(*t), itertools.product(solvers, args.seed))
)
processes, files = zip(*processes_and_files)

# Maps pid to output file.
pid_to_file = {process.pid: outfile for (process, outfile) in processes_and_files}


def _terminate_remaining_processes(p):
    for p in processes:
        if psutil.pid_exists(p.pid):
            p.terminate()


gone, alive = psutil.wait_procs(processes, callback=_terminate_remaining_processes)
assert alive == [], "All processes should have terminated."

# We prioritize which of the processes' output to return in the following order:
# 1. Synthesis success
# 2. Synthesis failure
# 3. Timeout
# 4. Other
returncodes = [p.returncode for p in gone]
if SYNTH_SUCCESS_CODE in returncodes:
    proc = gone[returncodes.index(SYNTH_SUCCESS_CODE)]
elif SYNTH_FAILURE_CODE in returncodes:
    proc = gone[returncodes.index(SYNTH_FAILURE_CODE)]
elif SYNTH_TIMEOUT_CODE in returncodes:
    proc = gone[returncodes.index(SYNTH_TIMEOUT_CODE)]
else:
    proc = gone[0]

# Write output on success.
if proc.returncode == SYNTH_SUCCESS_CODE:
    args.out_filepath.write(pathlib.Path(pid_to_file[proc.pid].name).read_text())

# Close files.
for outfile in files:
    outfile.close()

# Mirror stderr, stdout, returncode.
sys.stderr.write(proc.stderr.read().decode("utf-8"))
sys.stdout.write(proc.stdout.read().decode("utf-8"))
sys.exit(proc.returncode)
