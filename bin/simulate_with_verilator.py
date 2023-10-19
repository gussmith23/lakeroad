"""Script and utilities for simulating with Verilator."""

import itertools
import logging
import os
from pathlib import Path
import random
import sys
from typing import List, Optional, Tuple, Union
import subprocess

MAX_NUM_TESTS = 2**18


def simulate_with_verilator(
    test_module_name: str,
    ground_truth_module_name: str,
    obj_dirpath: Union[str, Path],
    verilog_filepaths: List[Union[str, Path]],
    module_inputs: List[Tuple[str, int]],
    initiation_interval: int,
    testbench_sv_filepath: Union[str, Path],
    testbench_exe_filepath: Union[str, Path],
    testbench_inputs_filepath: Union[str, Path],
    testbench_stdout_log_filepath: Union[str, Path],
    testbench_stderr_log_filepath: Union[str, Path],
    makefile_filepath: Union[str, Path],
    module_outputs: List[Tuple[str, int]],
    clock_name: Optional[str] = None,
    include_dirs: List[Union[str, Path]] = [],
    extra_args: List[str] = [],
    max_num_tests=MAX_NUM_TESTS,
    ignore_missing_test_module_file: bool = False,
    expect_all_zero_outputs: bool = False,
):
    """

    Args:
      obj_dirpah: Path to obj_dir Verilator output directory.
      verilog_filepaths: Verilog files to compile with Verilator. These files
        should at least contain the Verilog code for the test and ground truth
        modules.
      module_inputs: List of tuples of the form (input_name, input_width). We
        assume inputs are the same between the two modules.
      testbench_{c,exe}_output_filepath: Filepath to write the testbench
        code/executable to.
      testbench_log_filepath: Filepath to write the testbench output to.
      ignore_missing_test_module_file: If True, we will not raise an exception
        if the test module file does not exist. This is our current hacky solution
        to handling the fact that Lakeroad doesn't always produce output.
      expect_all_zero_outputs: If True, we will expect that all outputs are
        always 0 on all inputs. This should almost always be False.
    """

    if ignore_missing_test_module_file and not all(
        [Path(path).exists() for path in verilog_filepaths]
    ):
        missing = list(filter(lambda path: not Path(path).exists(), verilog_filepaths))[0]
        logging.warning(
            f"Required Verilog file {missing} does not exist. " "Skipping simulation."
        )
        return

    obj_dirpath = Path(obj_dirpath)
    obj_dirpath.mkdir(parents=True, exist_ok=True)
    testbench_sv_filepath = Path(testbench_sv_filepath)
    testbench_sv_filepath.parent.mkdir(parents=True, exist_ok=True)
    testbench_exe_filepath = Path(testbench_exe_filepath)
    testbench_exe_filepath.parent.mkdir(parents=True, exist_ok=True)
    testbench_inputs_filepath = Path(testbench_inputs_filepath)
    testbench_inputs_filepath.parent.mkdir(parents=True, exist_ok=True)
    testbench_stdout_log_filepath = Path(testbench_stdout_log_filepath)
    testbench_stdout_log_filepath.parent.mkdir(parents=True, exist_ok=True)
    testbench_stderr_log_filepath = Path(testbench_stderr_log_filepath)
    testbench_stderr_log_filepath.parent.mkdir(parents=True, exist_ok=True)
    makefile_filepath = Path(makefile_filepath)
    makefile_filepath.parent.mkdir(parents=True, exist_ok=True)

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
            obj_dirpath=obj_dirpath,
            extra_verilator_args=" ".join(
                [str(path) for path in verilog_filepaths]
                + [f"-I{dir}" for dir in include_dirs]
                + extra_args
            ),
            testbench_filepath=testbench_sv_filepath,
        )
    )

    # Instantiate testbench template for our code.
    testbench_template_source = (
        Path(os.environ["LAKEROAD_DIR"]) / "misc" / "verilator_testbench.sv.template"
    ).read_text()
    testbench_source = testbench_template_source.format(
        test_module_name=test_module_name,
        ground_truth_module_name=ground_truth_module_name,
        test_module_port_list=",".join(
            [f".{name}({name})" for name, _ in module_inputs]
            + [f".{name}({name}_test)" for name, _ in module_outputs]
        )
        + (f",.{clock_name}({clock_name})" if clock_name else ""),
        ground_truth_module_port_list=",".join(
            [f".{name}({name})" for name, _ in module_inputs]
            + [f".{name}({name}_ground_truth)" for name, _ in module_outputs]
        )
        + (f",.{clock_name}({clock_name})" if clock_name else ""),
        input_output_declarations=" ".join(
            # Modules share inputs.
            [f"logic [{bw-1}:0] {name};" for (name, bw) in module_inputs]
            # Make a different output for each module.
            + [f"logic [{bw-1}:0] {name}_test;" for (name, bw) in module_outputs]
            + [
                f"logic [{bw-1}:0] {name}_ground_truth;"
                for (name, bw) in module_outputs
            ]
        )
        + (f"logic {clock_name};" if clock_name else ""),
        display_inputs=f"$display(\"Inputs: {', '.join([f'{name}=%d' for name, _ in module_inputs])}\", {', '.join([name for name, _ in module_inputs])});",
        display_outputs=f"$display(\"Expected outputs: {', '.join([f'{name}_ground_truth=%d' for name, _ in module_outputs])}\", {', '.join([f'{name}_ground_truth' for name, _ in module_outputs])});"
        + f"$display(\"  Actual outputs: {', '.join([f'{name}_test        =%d' for name, _ in module_outputs])}\", {', '.join([f'{name}_test' for name, _ in module_outputs])});",
        set_inputs=" ".join(
            f"{name}=inputs[{i}][{bw-1}:0];"
            for (i, (name, bw)) in enumerate(module_inputs)
        ),
        clear_clock=f"{clock_name}=1'b0;" if clock_name else "",
        set_clock=f"{clock_name}=1'b1;" if clock_name else "",
        check_outputs="("
        + " && ".join(
            [f"({name}_ground_truth=={name}_test)" for name, _ in module_outputs]
        )
        + ")",
        initiation_interval=initiation_interval,
        randomize_inputs=" ".join(
            f"inputs[{i}]=$urandom();" for i in range(len(module_inputs))
        ),
        outputs_reduced_by_or=f"({'|'.join(f'(|{name}_test)' for name, _ in module_outputs)})",
        expect_all_zero_outputs="1'b1" if expect_all_zero_outputs else "1'b0",
    )
    Path(testbench_sv_filepath).write_text(testbench_source)

    # Generate the input to the testbench.
    with testbench_inputs_filepath.open("w") as f:
        # We can expose this as an argument. You can use this to tune how long
        # the tests take, at the cost of test coverage.
        if 2 ** (sum([width for _, width in module_inputs])) > max_num_tests:
            # logging.warning(
            #     "Exhaustive testing space is too large, doing random testing."
            # )

            # Generate a random subset of the inputs.
            def generate_one():
                return [random.randint(0, 2**width - 1) for _, width in module_inputs]

            all_inputs = [generate_one() for _ in range(max_num_tests)]
        else:
            # Do exhaustive testing.
            all_inputs = list(
                itertools.product(*[range(2**width) for _, width in module_inputs])
            )
        print(f"{len(module_inputs)} {len(all_inputs)}", file=f)
        for one_set_of_inputs in all_inputs:
            print(" ".join([str(x) for x in one_set_of_inputs]), file=f)

    # --environment-overrides is a brute-force way to allow users to use CXX=...
    # to override the C++ compiler with an environment variable. Overriding
    # doesn't normally work due to the issues brought up here:
    # https://github.com/verilator/verilator/issues/4549
    proc = subprocess.run(
        ["make", "--environment-overrides", "--always-make", "-f", makefile_filepath], capture_output=True
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
        "--obj_dirpath",
        type=Path,
        help="Path where we will place the obj_dir folder produced by Verilator.",
        default=False,
    )
    parser.add_argument(
        "--verilog_filepath",
        type=Path,
        help=(
            "Filepath of Verilog file to compile with Verilator. At the very"
            " least, you should use this argument to specify the filepaths to"
            " the modules you're testing and the ground truth module."
        ),
        required=True,
        default=[],
        action="append",
    )
    parser.add_argument(
        "--test_module_name",
        type=str,
        help="Name of the module we're testing.",
        required=True,
    )
    parser.add_argument(
        "--ground_truth_module_name",
        type=str,
        help="Name of the ground truth module we're testing against.",
        required=True,
    )
    parser.add_argument(
        "--input_signal",
        type=str,
        help="Data input to the module we're testing, in the form <name>:<bitwidth>, e.g. a:16.",
        action="append",
        default=[],
    )
    parser.add_argument(
        "--clock_name",
        type=str,
        help="Name of the clock input to the module we're testing.",
        default=None,
    )
    parser.add_argument(
        "--initiation_interval",
        type=int,
        help="Initiation interval of the module we're testing.",
        default=0,
    )
    parser.add_argument(
        "--testbench_sv_filepath",
        type=Path,
        help="Filepath to write the testbench SystemVerilog code to.",
        # Note that mkstemp here will keep the file open, and thus not writeable
        # (e.g. when our Makefile tries to write the executable after
        # compilation.) So we use NamedTemporaryFile, get the name, and then
        # immediately drop the file so that the file gets deleted.
        default=tempfile.NamedTemporaryFile(suffix=".sv").name,
    )
    parser.add_argument(
        "--testbench_exe_filepath",
        type=Path,
        help="Filepath to write the testbench executable to.",
        default=tempfile.NamedTemporaryFile(suffix=".out").name,
    )
    parser.add_argument(
        "--testbench_inputs_filepath",
        type=Path,
        help="Filepath to write the testbench inputs to.",
        default=tempfile.NamedTemporaryFile(suffix=".txt").name,
    )
    parser.add_argument(
        "--testbench_stdout_log_filepath",
        type=Path,
        help="Filepath to write the testbench stdout to.",
        default=tempfile.NamedTemporaryFile(suffix=".stdout.log").name,
    )
    parser.add_argument(
        "--testbench_stderr_log_filepath",
        type=Path,
        help="Filepath to write the testbench stderr to.",
        default=tempfile.NamedTemporaryFile(suffix=".stderr.log").name,
    )
    parser.add_argument(
        "--makefile_filepath",
        type=Path,
        help="Filepath to write the makefile to.",
        default=tempfile.NamedTemporaryFile(suffix=".mk").name,
    )
    parser.add_argument(
        "--output_signal",
        type=str,
        help="Module output, in the form <name>:<bw>.",
        required=True,
        action="append",
        default=[],
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
    parser.add_argument(
        "--max_num_tests",
        type=int,
        help="Maximum number of tests to run. If this number is greater than the space of all points, testing will be non-exhaustive.",
        default=MAX_NUM_TESTS,
    )
    parser.add_argument(
        "--expect_all_zero_outputs",
        action=argparse.BooleanOptionalAction,
        default=False,
        help="Whether to expect that all outputs are always 0 on all inputs.",
    )

    args = parser.parse_args()

    # Handle the case where obj_dirpath is not specified.
    if args.obj_dirpath is False:
        tmp_dir = tempfile.TemporaryDirectory()
        args.obj_dirpath = tmp_dir.name

    # Parse something like <signal_name>:<bitwidth> into a tuple.
    parse_signal_str = lambda x: (str(x.split(":")[1]), int(x.split(":")[2]))

    simulate_with_verilator(
        test_module_name=args.test_module_name,
        ground_truth_module_name=args.ground_truth_module_name,
        obj_dirpath=args.obj_dirpath,
        verilog_filepaths=args.verilog_filepath,
        module_inputs=[parse_signal_str(i) for i in args.input_signal],
        clock_name=args.clock_name,
        initiation_interval=args.initiation_interval,
        testbench_sv_filepath=args.testbench_sv_filepath,
        testbench_exe_filepath=args.testbench_exe_filepath,
        testbench_inputs_filepath=args.testbench_inputs_filepath,
        testbench_stdout_log_filepath=args.testbench_stdout_log_filepath,
        testbench_stderr_log_filepath=args.testbench_stderr_log_filepath,
        makefile_filepath=args.makefile_filepath,
        module_outputs=[parse_signal_str(i) for i in args.output_signal],
        extra_args=args.verilator_extra_arg,
        max_num_tests=args.max_num_tests,
        expect_all_zero_outputs=args.expect_all_zero_outputs,
        include_dirs=args.verilator_include_dir,
    )
