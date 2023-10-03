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
    let (cost, _term_dag, _term) = match &report {
        Best {
            cost,
            termdag,
            term,
        } => (cost, termdag, term),
        _ => panic!("Expected [`Best`]"),
    };
    assert!(
        *cost < 100000000,
        "Cost >= 100000000. Presumably we extracted an Op."
    );
    assert!(*cost <= 1348, "Regression; last recorded best was 1348.");
    // dbg!(cost);
    // dbg!(_term_dag.to_string(_term));

    // Sanity checking my own understanding of egglog: the last term in the term
    // graph is usually the top-level term.
    assert_eq!(_term_dag.get(_term_dag.nodes.len()-1), *_term);
    dbg!(lakeroad_egglog::to_verilog(_term_dag, _term_dag.nodes.len()-1));
});
egglog_test!(typing, "tests/egglog_tests/typing.egg");
