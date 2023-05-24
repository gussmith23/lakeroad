"""Script and utilities for simulating with Verilator."""

import itertools
import logging
import os
from pathlib import Path
import random
import sys
from typing import List, Tuple, Union
import subprocess


def simulate_with_verilator(
    obj_dir_dir: Union[str, Path],
    test_module_filepath: Union[str, Path],
    ground_truth_module_filepath: Union[str, Path],
    module_inputs: List[Tuple[str, int]],
    clock_name: str,
    initiation_interval: int,
    testbench_cc_filepath: Union[str, Path],
    testbench_exe_filepath: Union[str, Path],
    testbench_inputs_filepath: Union[str, Path],
    testbench_stdout_log_filepath: Union[str, Path],
    testbench_stderr_log_filepath: Union[str, Path],
    makefile_filepath: Union[str, Path],
    output_signal: str,
    include_dirs: List[Union[str, Path]] = [],
    extra_args: List[str] = [],
):
    """

    Args:
      obj_dir_dir: Directory where we will store obj_dirs produced by Verilator.
      test_module_filepath: Filepath of Verilog file which serves as the module
        we're testing.
      ground_truth_module_filepath: Filepath of Verilog file which serves as the
        ground truth module.
      module_inputs: List of tuples of the form (input_name, input_width). We
        assume inputs are the same between the two modules.
      testbench_{c,exe}_output_filepath: Filepath to write the testbench
        code/executable to.
      testbench_log_filepath: Filepath to write the testbench output to.
    """

    # Instantiate Makefile template for our code.
    if "VERILATOR_INCLUDE_DIR" not in os.environ:
        raise Exception(
            "VERILATOR_INCLUDE_DIR environment variable must be set to the "
            "directory where Verilator's include directory is located."
        )
    if "LAKEROAD_DIR" not in os.environ:
        raise Exception(
            "LAKEROAD_DIR environment variable must be set to the "
            "directory where Lakeroad is located."
        )
    makefile_filepath = Path(makefile_filepath)
    makefile_filepath.write_text(
        (Path(os.environ["LAKEROAD_DIR"]) / "misc" / "verilator.mk.template")
        .read_text()
        .format(
            testbench_exe_filepath=testbench_exe_filepath,
            testbench_inputs_filepath=testbench_inputs_filepath,
            test_module_obj_dirpath=Path(obj_dir_dir) / "test_module",
            ground_truth_module_obj_dirpath=Path(obj_dir_dir) / "ground_truth_module",
            test_module_verilog_filepath=test_module_filepath,
            ground_truth_module_verilog_filepath=ground_truth_module_filepath,
            test_module_extra_verilator_args=" ".join(
                [f"-I{dir}" for dir in include_dirs] + extra_args
            ),
            ground_truth_module_extra_verilator_args=" ".join(
                [f"-I{dir}" for dir in include_dirs] + extra_args
            ),
            testbench_filepath=testbench_cc_filepath,
            verilator_include_dir=os.environ["VERILATOR_INCLUDE_DIR"],
        )
    )

    # Instantiate testbench template for our code.
    testbench_template_source = (
        Path(os.environ["LAKEROAD_DIR"]) / "misc" / "verilator_testbench.cc.template"
    ).read_text()
    testbench_source = testbench_template_source.format(
        num_inputs=len(module_inputs),
        test_module_header_filepath=(
            Path(obj_dir_dir) / "test_module" / "Vtest_module.h"
        ),
        ground_truth_module_header_filepath=(
            Path(obj_dir_dir) / "ground_truth_module" / "Vground_truth_module.h"
        ),
        set_module_inputs_body=" ".join(
            [
                f"module->{name}=inputs[{i}];"
                for i, (name, _) in enumerate(module_inputs)
            ]
        ),
        set_module_clock_body=f"module->{clock_name}=clock;",
        initiation_interval=initiation_interval,
        output_signal=output_signal,
    )
    Path(testbench_cc_filepath).write_text(testbench_source)

    # Generate the input to the testbench.
    with testbench_inputs_filepath.open("w") as f:
        # We can expose this as an argument. You can use this to tune how long
        # the tests take, at the cost of test coverage.
        MAX_NUM_TESTS = 2**18
        if 2 ** (sum([width for _, width in module_inputs])) > MAX_NUM_TESTS:
            logging.warning(
                "Exhaustive testing space is too large, doing random testing."
            )
            # Generate a random subset of the inputs.
            def generate_one():
                return [random.randint(0, 2**width - 1) for _, width in module_inputs]

            all_inputs = [generate_one() for _ in range(MAX_NUM_TESTS)]
        else:
            # Do exhaustive testing.
            all_inputs = list(
                itertools.product(*[range(2**width) for _, width in module_inputs])
            )
        print(f"{len(module_inputs)} {len(all_inputs)}", file=f)
        for one_set_of_inputs in all_inputs:
            print(" ".join([str(x) for x in one_set_of_inputs]), file=f)

    proc = subprocess.run(
        ["make", "--always-make", "-f", makefile_filepath], capture_output=True
    )
    Path(testbench_stdout_log_filepath).write_bytes(proc.stdout)
    Path(testbench_stderr_log_filepath).write_bytes(proc.stderr)
    if proc.returncode != 0:
        print(proc.stderr.decode("utf-8"), file=sys.stderr)

    # Error if failed.
    proc.check_returncode()


if __name__ == "__main__":
    import argparse
    import tempfile

    parser = argparse.ArgumentParser()

    parser.add_argument(
        "--obj_dir_dir",
        type=Path,
        help="Directory where we will store obj_dirs produced by Verilator.",
        default=tempfile.gettempdir(),
    )
    parser.add_argument(
        "--test_module_filepath",
        type=Path,
        help="Filepath of Verilog file which serves as the module we're testing.",
        required=True,
    )
    parser.add_argument(
        "--ground_truth_module_filepath",
        type=Path,
        help="Filepath of Verilog file which serves as the ground truth module.",
        required=True,
    )
    parser.add_argument(
        "--input",
        type=str,
        help="Data input to the module we're testing, in the form <name>:<bitwidth>, e.g. a:16.",
        action="append",
        default=[],
    )
    parser.add_argument(
        "--clock_name",
        type=str,
        help="Name of the clock input to the module we're testing.",
    )
    parser.add_argument(
        "--initiation_interval",
        type=int,
        help="Initiation interval of the module we're testing.",
        default=0,
    )
    parser.add_argument(
        "--testbench_cc_filepath",
        type=Path,
        help="Filepath to write the testbench C++ code to.",
        default=tempfile.mkstemp()[1],
    )
    parser.add_argument(
        "--testbench_exe_filepath",
        type=Path,
        help="Filepath to write the testbench executable to.",
        default=tempfile.mkstemp()[1],
    )
    parser.add_argument(
        "--testbench_inputs_filepath",
        type=Path,
        help="Filepath to write the testbench inputs to.",
        default=tempfile.mkstemp()[1],
    )
    parser.add_argument(
        "--testbench_stdout_log_filepath",
        type=Path,
        help="Filepath to write the testbench stdout to.",
        default=tempfile.mkstemp()[1],
    )
    parser.add_argument(
        "--testbench_stderr_log_filepath",
        type=Path,
        help="Filepath to write the testbench stderr to.",
        default=tempfile.mkstemp()[1],
    )
    parser.add_argument(
        "--makefile_filepath",
        type=Path,
        help="Filepath to write the makefile to.",
        default=tempfile.mkstemp()[1],
    )
    parser.add_argument(
        "--output_signal",
        type=str,
        help="Name of the output signal of the module we're testing. In the form <name>:<bitwidth>, e.g. out:16.",
        required=True,
    )
    parser.add_argument(
        "--verilator_include_dir",
        type=Path,
        help="Directories to pass to Verilator as include directories.",
        action="append",
        default=[],
    )
    parser.add_argument(
        "--verilator_extra_arg",
        type=str,
        help="Extra argument to pass to Verilator.",
        action="append",
        default=[],
    )

    args = parser.parse_args()

    # Parse something like <signal_name>:<bitwidth> into a tuple.
    parse_signal_str = lambda x: (str(x.split(":")), int(x.split(":")[1]))

    simulate_with_verilator(
        obj_dir_dir=args.obj_dir_dir,
        test_module_filepath=args.test_module_filepath,
        ground_truth_module_filepath=args.ground_truth_module_filepath,
        module_inputs=[parse_signal_str(i) for i in args.input],
        clock_name=args.clock_name,
        initiation_interval=args.initiation_interval,
        testbench_cc_filepath=args.testbench_cc_filepath,
        testbench_exe_filepath=args.testbench_exe_filepath,
        testbench_inputs_filepath=args.testbench_inputs_filepath,
        testbench_stdout_log_filepath=args.testbench_stdout_log_filepath,
        testbench_stderr_log_filepath=args.testbench_stderr_log_filepath,
        makefile_filepath=args.makefile_filepath,
        output_signal=parse_signal_str(args.output_signal),
        include_dirs=args.verilator_include_dir,
        extra_args=args.verilator_extra_arg,
    )
