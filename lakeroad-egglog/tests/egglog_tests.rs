use std::path::Path;

macro_rules! egglog_test {
    ($name:ident, $path:literal) => {
        #[test]
        fn $name() {
            let mut egraph = egglog::EGraph::default();
            egraph
                .parse_and_run_program(
                    &std::fs::read_to_string(Path::new(env!("CARGO_MANIFEST_DIR")).join($path))
                        .unwrap(),
                )
                .unwrap();
            // Uncomment to see SVGs.
            // let serialized = egraph.serialize_for_graphviz();
            // let svg_path = Path::new($path).with_extension("svg");
            // serialized.to_svg_file(svg_path).unwrap()
        }
    };
}

egglog_test!(test_1, "tests/egglog_tests/construct_sequential_cycle.egg");
egglog_test!(permuter, "tests/egglog_tests/permuter.egg");
egglog_test!(typing, "tests/egglog_tests/typing.egg");
