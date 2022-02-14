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
                    "Failed to parse the following text as a Lakeroad program:\n{}",
                    read_to_string(dir_entry.path()).unwrap()
                )),
            )
        })
        .collect()
}

#[cfg(test)]
mod tests {
    use std::collections::HashSet;

    use egg::EGraph;

    use crate::language::LanguageAnalysis;

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
                ]
                .drain(..)
                .map(str::to_string)
                .collect::<HashSet<_>>()
            )
        );
    }
}
