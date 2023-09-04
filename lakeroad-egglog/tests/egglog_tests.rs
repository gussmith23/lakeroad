use std::path::Path;

macro_rules! egglog_test {
    ($name:ident, $path:literal) => {
        #[test]
        fn $name() {
            egglog::EGraph::default()
                .parse_and_run_program(
                    &std::fs::read_to_string(Path::new(env!("CARGO_MANIFEST_DIR")).join($path))
                        .unwrap(),
                )
                .unwrap();
        }
    };
}

egglog_test!(test_1, "tests/egglog_tests/construct_sequential_cycle.egg");
egglog_test!(permuter, "tests/egglog_tests/permuter.egg");
egglog_test!(typing, "tests/egglog_tests/typing.egg");
