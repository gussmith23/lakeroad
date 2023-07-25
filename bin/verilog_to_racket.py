#!/usr/bin/env python3
"""Convert a Verilog module to a Racket (Rosette) function.

This tool converts a Verilog module to Racket code---specifically, the generated
code will use our "signal" library, which is built on top of Rosette bitvectors.
Documentation for our "signal" library can be found in
`racket/stateful-design-experiment.rkt`.

For a module to be convertible with this tool, its parameters must be converted
to ports. For example, the following module:

module foo #(parameter param0=0) (input a, input b, output c);
    parameter param1 = 1; ...impl...
endmodule

should be converted to:

module foo (input a, input b, output c, input param0);
    input param1; ...impl...
endmodule

or:

module foo (input a, input b, output c, input param0, input param1);
    ...impl...
endmodule

This is due to the fact that Yosys converts parameters to constants upon
reading, whereas we need constants to be seen as variables.

A script for doing this conversion automatically can be found in
scripts/convert_params_to_ports.py---however, it is likely easier and safer to
do the conversion by hand.

Example invocation:
python3 verilog_to_racket.py     \\
    --infile mymodule.v          \\
    --top mymodule               \\
    --function-name out          \\
    --outfile mymodule.rkt       \\
    --infile othermodule.v       \\
    --include verilog_files_dir/ \\
    --define MYVAR

In this case, our module `mymodule` lives in `mymodule.v`. It includes files in
`verilog_files_dir/`. It also explicitly includes `othermodule.v`. If your
module *implicitly* depends on other modules---that is, it uses them without
`include-ing them, you can explicitly include those files by passing them in via
--infile, as we do here with othermodule.v. The resulting Racket/Rosette code
will be written to `mymodule.rkt`, in a function named `out`.

Preprocessor defines can be specified with --define.

TODO(@gussmith23): Support --define with values.
TODO(@gussmith23): Generate all outputs, return them in a list or map.
"""

import argparse
import sys
import verilog_to_racket
from pathlib import Path
from typing import Dict, Optional, Tuple, Union, List
import subprocess
import itertools
from tempfile import NamedTemporaryFile
import logging

StrOrPath = Union[str, Path]


def preprocess_flatten_convert_verilog(
    infiles: List[StrOrPath],
    top: str,
    function_name: str,
    include_directories: List[StrOrPath] = [],
    defines: Dict[str, Optional[str]] = {},
    check_for_not_derived: bool = True,
    parameters: Dict[str, Optional[str]] = {},
) -> str:
    """Preprocess, flatten, and convert Verilog to btor.

    Preprocess: run a Verilog preprocessor on the code.
    Flatten: flatten the code into a single module.
    Convert: convert the code to btor.

    Uses Yosys. Could use Icarus Verilog instead.

    Args:
        infiles: List of Verilog files.
        function_name: Name to give the function.

    Returns:
        Preprocessed Verilog code."""

    ## FIRST: Convert Verilog to btor.

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

    setparam_commands = [
        f"chparam -set {name} {val} {top}" for (name, val) in parameters.items()
    ]

    # Temporary btor and Verilog files.
    btorfile = NamedTemporaryFile()
    vfile = NamedTemporaryFile()

    yosys_commands = (
        read_verilog_commands
        + setparam_commands
        + [
            # -simcheck runs checks like -check, but also checks that there are no blackboxes.
            f"hierarchy -simcheck -top {top}",
            "prep",
            # Jannis Harder suggested this optimization to kill some remaining
            # undefined values from case statements/muxes.
            "pmuxtree; opt_muxtree",
            # I've gone back and forth on whether to use clk2fflogic or
            # async2sync here, and in the end, I'm 99% sure clk2fflogic is the
            # correct choice. I had thought that we couldn't use clk2fflogic for
            # importing the Intel DSP, but it turns out that was a mistake on my
            # end. More specifically, there were other modif
            # https://github.com/uwsampl/lakeroad/issues/238
            # https://github.com/uwsampl/lakeroad/issues/170
            "clk2fflogic",
            #"async2sync",
            #"dffunmap",
            # Does more optimization.
            "prep",
            f"write_btor {btorfile.name}",
            f"write_verilog -sv {vfile.name}",
        ]
    )

    try:
        cmd = [
            "yosys",
            "-p",
            "\n".join(yosys_commands),
        ]
        logging.info(f"Running command: {' '.join(cmd)}")
        subprocess.run(
            args=cmd,
            capture_output=True,
            check=True,
        )
    except subprocess.CalledProcessError as e:
        print("Yosys failed. stdout:", file=sys.stderr)
        print(e.stdout.decode("utf-8"), file=sys.stderr)
        print("stderr:", file=sys.stderr)
        print(e.stderr.decode("utf-8"), file=sys.stderr)
        print(f"Command: {' '.join(e.cmd)}", file=sys.stderr)
        raise e

    if check_for_not_derived:
        vfile.seek(0)
        vfile_contents = vfile.read().decode("utf-8")
        assert "not_derived" not in vfile_contents, "Found not_derived in output."

    ## SECOND: Convert the btor file to Racket.

    LAKEROAD_DIR = Path(__file__).parent.parent.resolve()
    BTOR_TO_RACKET_SCRIPT = LAKEROAD_DIR / "bin" / "btor_to_racket.rkt"

    try:
        cmd = [
            str(BTOR_TO_RACKET_SCRIPT),
            "--input-file",
            str(btorfile.name),
            function_name,
        ]
        logging.info(f"Running command: {' '.join(cmd)}")
        p = subprocess.run(
            args=cmd,
            capture_output=True,
            check=True,
        )
    except subprocess.CalledProcessError as e:
        print("btor_to_racket.rkt failed. stdout:", file=sys.stderr)
        print(e.stdout.decode("utf-8"), file=sys.stderr)
        print("stderr:", file=sys.stderr)
        print(e.stderr.decode("utf-8"), file=sys.stderr)
        raise e

    vfile.close()
    btorfile.close()

    return p.stdout.decode("utf-8")


if __name__ == "__main__":
    import os

    parser = argparse.ArgumentParser(
        description=__doc__, formatter_class=argparse.RawTextHelpFormatter
    )
    parser.add_argument(
        "--infile",
        type=argparse.FileType("r"),
        action="append",
        required=True,
        help=(
            "Verilog file containing module to convert. Please see the"
            " requirements for modules in the docstring."
        ),
    )
    parser.add_argument(
        "--outfile",
        type=argparse.FileType("w"),
        default=sys.stdout,
        help="File to write Racket/Rosette code to. When not set, writes to stdout.",
    )
    parser.add_argument("--top", type=str, required=True, help="Top module name.")
    parser.add_argument(
        "--function-name",
        type=str,
        required=True,
        help="Name to assign to the Rosette/Racket function generated.",
    )
    parser.add_argument(
        "--include",
        type=Path,
        default=[],
        action="append",
        help="Include directories needed by `include statements in the Verilog code.",
    )
    parser.add_argument(
        "--define",
        type=str,
        default=[],
        action="append",
        help="Variables to define for the preprocessor. Syntax: <name>=<val> or just <name>.",
    )
    parser.add_argument(
        "--parameter",
        type=str,
        default=[],
        action="append",
        help="Parameters to set on the top module. Syntax: <name>=<val> or just <name>.",
    )
    args = parser.parse_args()

    LOGLEVEL = os.environ.get("LOGLEVEL", "WARNING").upper()
    logging.basicConfig(level=LOGLEVEL)

    def split_define(define: str) -> Tuple[str, Optional[str]]:
        """Split a define string into a key and value.

        Args:
            define: String of the form <key>[=<val>].

        Returns:
            Tuple of (key, val). If val is not set, returns (key, None).
        """
        if "=" in define:
            key, val = define.split("=", 1)
            return key, val
        else:
            return define, None

    out = verilog_to_racket.preprocess_flatten_convert_verilog(
        infiles=[f.name for f in args.infile],
        top=args.top,
        function_name=args.function_name,
        check_for_not_derived=True,
        include_directories=args.include,
        defines={split_define(v)[0]: split_define(v)[1] for v in args.define},
        parameters={split_define(v)[0]: split_define(v)[1] for v in args.parameter},
    )

    print(out, file=args.outfile)
