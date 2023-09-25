use egglog::ExtractReport::*;
use std::path::Path;

macro_rules! egglog_test {
    ($name:ident, $path:literal) => {
        egglog_test!($name, $path, egraph, {});
    };
    ($name:ident, $path:literal, $egraph_ident:ident, $after:block) => {
        #[test]
        fn $name() {
            let mut $egraph_ident = egglog::EGraph::default();
            $egraph_ident
                .parse_and_run_program(
                    &std::fs::read_to_string(Path::new(env!("CARGO_MANIFEST_DIR")).join($path))
                        .unwrap(),
                )
                .unwrap();
            // Uncomment to see SVGs, or add the following lines to your $after.
            // let serialized = $egraph_ident.serialize_for_graphviz();
            // let svg_path = Path::new($path).with_extension("svg");
            // serialized.to_svg_file(svg_path).unwrap();

            $after
        }
    };
}

egglog_test!(test_1, "tests/egglog_tests/construct_sequential_cycle.egg");
egglog_test!(permuter, "tests/egglog_tests/permuter.egg", egraph, {
    // TODO(@gussmith23): Remove this.
    let serialized = egraph.serialize_for_graphviz();
    let svg_path = Path::new("tmp.svg");
    serialized.to_svg_file(svg_path).unwrap();

    let report = egraph
        .get_extract_report()
        .as_ref()
        .expect("no extract report");
    let cost = match report {
        &Best { cost, .. } => cost,
        _ => panic!("Expected [`Best`]"),
    };
    assert!(
        cost < 100000000,
        "Cost >= 100000000. Presumably we extracted an Op."
    );
    dbg!(cost);
});
egglog_test!(typing, "tests/egglog_tests/typing.egg");
