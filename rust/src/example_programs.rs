#![cfg(test)]
//! Example Lakeroad programs.

use std::{collections::HashMap, fs::read_to_string, path::Path, str::FromStr};

use egg::RecExpr;
use walkdir::WalkDir;

use crate::language::Language;

type Program = RecExpr<Language>;

pub(crate) fn all_programs() -> HashMap<String, Program> {
    WalkDir::new(Path::new(env!("CARGO_MANIFEST_DIR")).join("lakeroad_programs"))
        .into_iter()
        .filter(|dir_entry| dir_entry.as_ref().unwrap().file_type().is_file())
        .filter(|dir_entry| {
            Path::new(dir_entry.as_ref().unwrap().file_name())
                .extension()
                .unwrap()
                == "lakeroad"
        })
        .map(|dir_entry| {
            let dir_entry = dir_entry.unwrap();
            (
                dir_entry
                    .path()
                    .file_stem()
                    .unwrap()
                    .to_str()
                    .unwrap()
                    .to_owned(),
                RecExpr::from_str(&read_to_string(dir_entry.path()).unwrap()).expect(&format!(
                    "Failed to parse the following text from file {:#?} as a Lakeroad program:\n{}",
                    dir_entry,
                    read_to_string(dir_entry.path()).unwrap()
                )),
            )
        })
        .collect()
}

#[cfg(test)]
mod tests {
    use std::{
        collections::HashSet,
        fs::read_to_string,
        path::Path,
        process::{Command, Stdio},
        str::FromStr,
    };

    use egg::{EGraph, RecExpr};
    use std::io::Write;
    use tempfile::{Builder, NamedTempFile, TempDir};

    use crate::language::{interpret, Language, LanguageAnalysis, Value};

    use super::all_programs;

    #[test]
    fn test_all_programs() {
        // This ensures all programs parse.
        let all_programs = all_programs();

        // Ensure the programs "type check", i.e. that the analysis is
        // constructed successfully.
        let mut egraph = EGraph::<_, LanguageAnalysis>::default();
        all_programs.values().for_each(|v| {
            egraph.add_expr(v);
        });

        // Ensure we're aware of all programs.
        assert_eq!(
            all_programs.keys().cloned().collect::<HashSet<_>>(),
            HashSet::from(
                // Add all filenames to this vector. Ensures that we're
                // successfully parsing all expected programs.
                vec![
                    "bithack_bithack1",
                    "bithack_bithack2",
                    "bithack_bithack3",
                    "bithack_ceil_avg",
                    "bithack_cycle",
                    "bithack_exchange",
                    "bithack_floor_avg",
                    "bithack_roundpower",
                    "permuter_4x4"
                ]
                .drain(..)
                .map(str::to_string)
                .collect::<HashSet<_>>()
            )
        );
    }

    /// Interpret our expression for the permuter and check that it matches on a
    /// few test cases.
    #[test]
    #[should_panic = "assertion failed: `(left == right)`"]
    fn interpret_permuter() {
        let expr: RecExpr<Language> = RecExpr::from_str(
            &read_to_string(
                Path::new(env!("CARGO_MANIFEST_DIR"))
                    .join("lakeroad_programs")
                    .join("permuter_4x4.lakeroad"),
            )
            .unwrap(),
        )
        .expect("Failed to parse permuter_4x4.lakeroad");

        let run_test = |din: u64, control: u64, dout_expected: u64| {
            assert_eq!(
                interpret(
                    &expr,
                    &vec![("din".to_owned(), din), ("control".to_owned(), control)]
                        .into_iter()
                        .collect(),
                    (expr.as_ref().len() - 1).try_into().unwrap(),
                ),
                Value::SignalValue(dout_expected)
            );
        };

        run_test(0xABCD, 0, 0xABCD);
        run_test(0xABCD, 1, 0xBADC);
        run_test(0xABCD, 2, 0xCDAB);
        run_test(0xABCD, 3, 0xDCBA);
    }

    #[test]
    fn test_permuter_4x4() -> Result<(), std::io::Error> {
        // Hilariously, Verilator silently fails if a cc file starts with a dot
        // (which named temp files do). So we prefix the file.
        let mut f = Builder::new()
            .prefix("testbench")
            .suffix(".cc")
            .tempfile()?;
        let verilator_dir = TempDir::new()?;
        writeln!(
            &mut f,
            "
#include <iostream>
#include <sstream>
#include <{header_dir}>

int main(int argc, char** argv) {{

    std::string line;
    while (std::getline(std::cin, line))
    {{
        // Get inputs and expected outputs.
        std::stringstream ss(line);
        int din, control, dout_expected;
        ss >> din >> control >> dout_expected;

        VerilatedContext *contextp = new VerilatedContext;
        contextp->commandArgs(argc, argv);
        Vpermuter_4x4_sim *top = new Vpermuter_4x4_sim{{contextp}};

        top->din = din;
        top->control = control;
        top->clk = 0;
        top->eval();
        top->clk = 1;
        top->eval();

        int dout_actual = top->dout;

        if (dout_actual != dout_expected) {{
            fprintf(stderr, \"din: 0x%x, control: 0x%x, dout_actual: 0x%x, dout_expected: 0x%x\\n\", din, control, dout_actual, dout_expected);
        }}
        assert(dout_actual == dout_expected);

        delete contextp;
    }}

  return 0;
}}
        ",
            header_dir = verilator_dir.path().join("Vpermuter_4x4_sim.h").display()
        )?;

        let executable = NamedTempFile::new()?;
        let output = Command::new("verilator")
            .arg("--cc")
            .arg("--exe")
            .arg("--build")
            .arg("-o")
            .arg(executable.path())
            .arg("--Mdir")
            .arg(verilator_dir.path())
            .arg(Path::new(env!("CARGO_MANIFEST_DIR")).join("verilog/permuter_4x4_sim.v"))
            .arg(f.path())
            .output()?;
        if !output.status.success() {
            panic!(
                "Failed to run verilator: {}",
                String::from_utf8(output.stderr).unwrap()
            );
        }

        let output = Command::new("chmod")
            .arg("+x")
            .arg(executable.path())
            .output()?;
        if !output.status.success() {
            panic!(
                "Failed to run chmod: {}",
                String::from_utf8(output.stderr).unwrap()
            );
        }

        let mut child = Command::new(executable.path())
            .stdin(Stdio::piped())
            .stdout(Stdio::piped())
            .spawn()?;
        let make_str = |din: i64, control: i64, dout: i64| format!("{} {} {}", din, control, dout);
        child.stdin.take().unwrap().write_all(
            [
                make_str(0, 0, 0),
                make_str(0xABCD, 0, 0xABCD),
                make_str(0xABCD, 1, 0xBADC),
                make_str(0xABCD, 2, 0xCDAB),
                make_str(0xABCD, 3, 0xDCBA),
            ]
            .join("\n")
            .as_bytes(),
        )?;

        let _expr: RecExpr<Language> = RecExpr::from_str(
            &read_to_string(
                Path::new(env!("CARGO_MANIFEST_DIR"))
                    .join("lakeroad_programs")
                    .join("permuter_4x4.lakeroad"),
            )
            .unwrap(),
        )
        .expect("Failed to parse permuter_4x4.lakeroad");

        let output = child.wait_with_output()?;
        if !output.status.success() {
            panic!(
                "Failed to run executable: {}",
                String::from_utf8(output.stderr).unwrap()
            );
        }

        Ok(())
    }
}
