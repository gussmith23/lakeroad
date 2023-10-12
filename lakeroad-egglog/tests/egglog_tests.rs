use egglog::{ExtractReport::*, Value};
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
    let serialized = egraph.serialize_for_graphviz(false);
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
    dbg!(_term_dag.to_string(_term));

    // Sanity checking my own understanding of egglog: the last term in the term
    // graph is usually the top-level term.
    assert_eq!(_term_dag.get(_term_dag.nodes.len() - 1), *_term);
    println!(
        "{}",
        lakeroad_egglog::to_verilog(_term_dag, _term_dag.nodes.len() - 1)
    );
});
egglog_test!(typing, "tests/egglog_tests/typing.egg");

fn create_rewrites(egraph: &egglog::EGraph, expr: &str, num_rewrites: i64) {

    // I want to find the "expr" in the egraph, where "expr" isn't actually an
    // expression for now, but instead just a let-bound name e.g. "lut6out".
    // Seems like there should be a way to get these definitions. I guess part
    // of the point of the egraph is that the name will just point to an eclass,
    // not a specific expression. We'll still need to extract. This is where
    // we can do interesting things. Whatever we extract will act as the LHS of
    // the rewrite. So if we can extract multiple things, we'll get multiple
    // LHSs. For now we just need to get a single one extracting.

    // Or something like this.
    // let equivalent_exprs = [extract_random(egraph, expr, seed) for seed in random_list_of_seeds(num_rewrites)];

    fn extract_random(egraph: &egglog::EGraph, expr: &str, seed: i64) {
    }

    // let rewrites = [make_rewrite(/*LHS*/ lhs_expr, /* RHS */ expr) for lhs_expr in equivalent_exprs];

    // let rewrites = remove_duplicates(rewrites);
}

egglog_test!(agilex_alm, "tests/egglog_tests/agilex_alm.egg", egraph, {

    dbg!(create_rewrites(&egraph, "lut6out", 1));
});
