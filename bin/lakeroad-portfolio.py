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
from typing import List, Tuple
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
    "--bitwuzla-flag-set",
    type=str,
    help=(
        "Solver flag set to pass to bitwuzla. Each flag set (i.e. each"
        " separate instance of this flag) will generate a separate instance of"
        " bitwuzla. A flag set is a string of the form"
        ' "<key>=<value>,<key>=<value>,...". If no flag set is specified but'
        " the solver is enabled by its corresponding flag, there will be a"
        " single instance of the solver with no flags."
    ),
    default=[],
    action="append",
)
parser.add_argument(
    "--cvc5", action=argparse.BooleanOptionalAction, help="Use cvc5.", default=False
)
parser.add_argument(
    "--cvc5-flag-set",
    type=str,
    help=(
        "Solver flag set to pass to cvc5. Each flag set (i.e. each"
        " separate instance of this flag) will generate a separate instance of"
        " cvc5. A flag set is a string of the form"
        ' "<key>=<value>,<key>=<value>,...". If no flag set is specified but'
        " the solver is enabled by its corresponding flag, there will be a"
        " single instance of the solver with no flags."
    ),
    default=[],
    action="append",
)
parser.add_argument(
    "--stp", action=argparse.BooleanOptionalAction, help="Use stp.", default=False
)
parser.add_argument(
    "--yices-smt2", action=argparse.BooleanOptionalAction, help="Use yices2.", default=False
)
parser.add_argument(
    "--yices-smt2-flag-set",
    type=str,
    help=(
        "Solver flag set to pass to yices-smt2. Each flag set (i.e. each"
        " separate instance of this flag) will generate a separate instance of"
        " cvc5. A flag set is a string of the form"
        ' "<key>=<value>,<key>=<value>,...". If no flag set is specified but'
        " the solver is enabled by its corresponding flag, there will be a"
        " single instance of the solver with no flags."
    ),
    default=[],
    action="append",
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


def _parse_flag_set(flag_set: str) -> List[str]:
    """Parse a flag set.

    A flag set is a string of the form "<key>=<value>,<key>=<value>,...". This
    function parses a set into a list of strings of the form ["<key>=<value>",
    "<key>=<value>", ...].
    """
    return flag_set.split(",")


# Build list of solvers to run.
#
# A list of (solver, flag_set) tuples, where each flag_set is a list of strings
# of the form "<key>=<value>".
solvers_and_flag_sets = []
if args.bitwuzla:
    if len(args.bitwuzla_flag_set) == 0:
        solvers_and_flag_sets.append(("bitwuzla", []))
    else:
        solvers_and_flag_sets.extend(
            ("bitwuzla", _parse_flag_set(set)) for set in args.bitwuzla_flag_set
        )
if args.cvc5:
    if len(args.cvc5_flag_set) == 0:
        solvers_and_flag_sets.append(("cvc5", []))
    else:
        solvers_and_flag_sets.extend(
            ("cvc5", _parse_flag_set(set)) for set in args.cvc5_flag_set
        )
if args.boolector:
    solvers_and_flag_sets.append(("boolector", []))
if args.stp:
    solvers_and_flag_sets.append(("stp", []))
assert solvers_and_flag_sets != [], "Must specify at least one solver."


def start_with_solver(
    solver: str, flags: List[str] = []
) -> Tuple[psutil.Popen, tempfile.NamedTemporaryFile]:
    """Start Lakeroad main.rkt with the given solver and flags.

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
            *_make_solver_flag_lakeroad_args(flags),
            *rest,
        ],
        stdin=sys.stdin,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
    )
    return (process, outfile)


def _make_solver_flag_lakeroad_args(flags: List[str]) -> List[str]:
    """Prepends the --solver-flag flag before each value in a list."""
    out = []
    for flag in flags:
        out.append("--solver-flag")
        out.append(flag)
    return out


processes_and_files = list(map(lambda t: start_with_solver(*t), solvers_and_flag_sets))
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
