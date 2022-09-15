"""Convert params to inputs.

May not work if a file has multiple module definitions. Doing this with regex
only gets us so far...if we need something more robust, we may want
Verible/sv-parser/some other tool.
"""

import argparse
import sys
import re

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

file_content = args.infile.read()
out = file_content

# Matches `ifdef ... `endif
# https://regex101.com/r/ThnFQc/1
ifdef_pat = re.compile(r"`ifdef.*?`endif", re.DOTALL)
ifndef_pat = re.compile(r"`ifndef.*?`endif", re.DOTALL)

# Matches clauses inside an `ifdef ... `endif (and also ifndef)
# https://regex101.com/r/O7D1cL/1
ifdef_clauses_pat = re.compile(
    r"(?P<type>(`ifdef)|(`ifndef)|(`else)|(`elsif)) ?(?P<cond>\w+)?(?P<body>.*?)(?=(`endif)|(`else)|(`elsif))",
    re.DOTALL,
)


def _remove_ifdef(match):
    block = match.group(0)
    for match in ifdef_clauses_pat.finditer(match.group(0)):
        if match.group("type") == "`else":
            print("Hit else clause of ifdef {}.".format(block), file=sys.stderr)
            return match.group("body")
        if match.group("cond") in args.define:
            print(
                "Hit clause of ifdef {} where {} is defined.".format(
                    block, match.group("cond")
                ),
                file=sys.stderr,
            )
            return match.group("body")
    print(
        "Did not hit any clause of ifdef at {}.".format(block),
        file=sys.stderr,
    )
    return ""


def _remove_ifndef(match):
    block = match.group(0)
    for match in ifdef_clauses_pat.finditer(match.group(0)):
        if match.group("type") == "`else":
            print("Hit else clause of ifndef {}.".format(block), file=sys.stderr)
            return match.group("body")
        if match.group("cond") not in args.define:
            print(
                "Hit clause of ifndef {} where {} is not defined.".format(
                    block, match.group("cond")
                ),
                file=sys.stderr,
            )
            return match.group("body")
    print(
        "Did not hit any clause of ifndef at {}.".format(block),
        file=sys.stderr,
    )
    return ""


out = ifdef_pat.sub(_remove_ifdef, out)
out = ifndef_pat.sub(_remove_ifndef, out)

# Matches parameter definition statements of the form parameter id=val, ... ;
# https://regex101.com/r/SFahSC/1
# Specially designed to avoid catastrophic backtracking.
parameter_def_stmt_pat = re.compile(
    r"""parameter\s*(?=(?P<tmp>((?P<identifier>[\[\]\:\s\w]+?)\s*=\s*(?P<value>['\"\w]+),?)))(?P=tmp)*;""",
    re.DOTALL,
)

params = {}


def _remove_param_def_stmt(match):
    """Remove parameter defintiion statement, and store the id/value."""
    for match in re.finditer(
        r"""((parameter )?(?P<identifier>[\[\]\:\s\w]+?)\s*=\s*(?P<value>['\"\w]+),?)""",
        match.group(0),
    ):
        assert match.group("identifier") not in params
        params[match.group("identifier")] = match.group("value")

    return ""


out = parameter_def_stmt_pat.sub(_remove_param_def_stmt, out)


# https://regex101.com/r/0hGxC6/1
module_pat = re.compile(
    r"(module\s+\w+\s*)(#\((?P<params>.*?)\)\s*)?\((?P<ports>.*?)\)\s*;", re.DOTALL
)

# Collect params from #(...) block.
for match in module_pat.finditer(out):
    # Find <id> = <val> statements...
    if match.group("params"):
        for match in re.finditer(
            r"""(parameter (?P<identifier>[\[\]\:\s\w]+?)\s*=\s*(?P<value>['\"\w]+),?)""",
            match.group("params"),
        ):
            assert match.group("identifier") not in params
            params[match.group("identifier")] = match.group("value")


new_inputs = ", ".join(f"input {id}" for (id, _) in params.items())


def _modify_module_definition(match):
    return match.expand(r"\1 (\g<ports>, " + new_inputs + ");")


out = module_pat.sub(_modify_module_definition, out)

# Matches module instantiations that use parameters.
# https://regex101.com/r/uo8dGR/1
parameterized_module_pattern = re.compile(
    r"(^.*)(#\((.*)\))( \w.*\(.*)\);.*$", re.MULTILINE
)

# In module instantiations that use parameters, move the parameters into port definitions.
out = parameterized_module_pattern.sub(
    lambda match: match.expand(r"\1 \4, \3);"),
    out,
)

if args.remove_string:
    out = re.sub("string", "", out)

args.outfile.write(out)
