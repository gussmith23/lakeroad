use egglog::{
    ast::{parse::ExprParser, Expr},
    ArcSort,
    ExtractReport::*,
    TermDag, Value,
};
use log::warn;
use std::{collections::HashMap, path::Path};

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

fn create_rewrites(
    egraph: &egglog::EGraph,
    value: &Value,
    sort: &ArcSort,
    num_rewrites: i64,
    replacement_map: &HashMap<Expr, Expr>,
) {
    // I want to find the "expr" in the egraph, where "expr" isn't actually an
    // expression for now, but instead just a let-bound name e.g. "lut6out".
    // Seems like there should be a way to get these definitions. I guess part
    // of the point of the egraph is that the name will just point to an eclass,
    // not a specific expression. We'll still need to extract. This is where
    // we can do interesting things. Whatever we extract will act as the LHS of
    // the rewrite. So if we can extract multiple things, we'll get multiple
    // LHSs. For now we just need to get a single one extracting.

    /// Extract a random term from the egraph at the given value.
    fn extract_random(egraph: &egglog::EGraph, value: &Value, sort: &ArcSort, _seed: i64) -> Expr {
        warn!("This function currently always returns the same expr.");
        let mut termdag = TermDag::default();
        let (_size, extracted) = egraph.extract(*value, &mut termdag, &sort);
        termdag.term_to_expr(&extracted)
    }

    // Get a bunch of random exprs that will serve as the left hand sides of the
    // rewrite. Sort and dedup to remove duplciates.
    let mut exprs: Vec<_> = (0..num_rewrites)
        .map(|seed| extract_random(egraph, value, sort, seed))
        .collect();
    exprs.sort();
    exprs.dedup();

    if exprs.len() < num_rewrites.try_into().unwrap() {
        warn!(
            "Expected {} exprs to turn into rewrites, but only got {}; there \
               must have been duplicates. In the future we can add a retry \
               mechanism.",
            num_rewrites,
            exprs.len()
        );
    }

    for expr in &exprs {
        println!("{}", expr);
    }

    // Replace requested expressions with other expressions. This allows us to,
    // for example, replace the LUT memory input(s) with symbolic solvable
    // expressions, in the case of a LUT expression. This replacement isn't
    // checked for correctness.
    fn replace_in_expr(expr: Expr, replacement_map: &HashMap<Expr, Expr>) -> Expr {
        expr.map(&mut |expr| {
            if replacement_map.contains_key(expr) {
                replacement_map[expr].clone()
            } else {
                expr.clone()
            }
        })
    }

    let exprs: Vec<_> = exprs
        .iter()
        .map(|expr| replace_in_expr(expr.clone(), replacement_map))
        .collect();

    for expr in &exprs {
        println!("{}", expr);
    }
    // let rewrites = [make_rewrite(/*LHS*/ lhs_expr, /* RHS */ expr) for lhs_expr in exprs];

    // Or remove duplicate expressions before the previous step.
    // let rewrites = remove_duplicates(rewrites);
}

egglog_test!(agilex_alm, "tests/egglog_tests/agilex_alm.egg", egraph, {
    let (sort, value) = egraph
        .eval_expr(&egglog::ast::Expr::Var("lut6out".into()), None, true)
        .unwrap();
    create_rewrites(
        &egraph,
        &value,
        &sort,
        1,
        &vec![
            (
                ExprParser::new().parse("(Var \"a\" 1)").unwrap(),
                Expr::Var("a".into()),
            ),
            (
                ExprParser::new().parse("(Var \"b\" 1)").unwrap(),
                Expr::Var("b".into()),
            ),
            (
                ExprParser::new().parse("(Var \"c0\" 1)").unwrap(),
                Expr::Var("c0".into()),
            ),
            (
                ExprParser::new().parse("(Var \"c1\" 1)").unwrap(),
                Expr::Var("c1".into()),
            ),
            (
                ExprParser::new().parse("(Var \"d0\" 1)").unwrap(),
                Expr::Var("d0".into()),
            ),
            (
                ExprParser::new().parse("(Var \"d1\" 1)").unwrap(),
                Expr::Var("d1".into()),
            ),
            (
                ExprParser::new().parse("(Var \"e\" 1)").unwrap(),
                Expr::Var("e".into()),
            ),
            (
                ExprParser::new().parse("(Var \"f\" 1)").unwrap(),
                Expr::Var("f".into()),
            ),
            (
                ExprParser::new().parse("(Var \"lut4_g0_mem\" 16)").unwrap(),
                ExprParser::new()
                    .parse("(Symbolic \"lut4_g0_mem\" 16)")
                    .unwrap(),
            ),
            (
                ExprParser::new().parse("(Var \"lut4_p0_mem\" 16)").unwrap(),
                ExprParser::new()
                    .parse("(Symbolic \"lut4_p0_mem\" 16)")
                    .unwrap(),
            ),
            (
                ExprParser::new().parse("(Var \"lut4_g1_mem\" 16)").unwrap(),
                ExprParser::new()
                    .parse("(Symbolic \"lut4_g1_mem\" 16)")
                    .unwrap(),
            ),
            (
                ExprParser::new().parse("(Var \"lut4_p1_mem\" 16)").unwrap(),
                ExprParser::new()
                    .parse("(Symbolic \"lut4_p1_mem\" 16)")
                    .unwrap(),
            ),
        ]
        .into_iter()
        .collect(),
    );
});

egglog_test!(half_adder, "tests/egglog_tests/half_adder.egg");

#[test]
fn antiunify() {
    let mut egraph = egglog::EGraph::default();
    lakeroad_egglog::import_lakeroad(&mut egraph);

    egraph
        .parse_and_run_program(
            r#"
(let out (debruijnify (vec-of (Var "x" 8) (Var "y" 16))))
(check (= out (vec-of 0 1)))
(let out2 (debruijnify (vec-of (Var "x" 8) (Var "y" 16) (Var "x" 8) (Var "z" 1) (Var "y" 16))))
(check (= out2 (vec-of 0 1 0 2 1)))

(let const (Op0 (BV 23 8)))
(run enumerate-modules 1)
(check 
 (= 
  const
  ; The (vec-pop (vec-of ...)) thing is a hack, should be removable in the future.
  (apply (MakeModule (Op0_ (BV 23 8)) (vec-pop (vec-of 0))) (vec-pop (vec-of (Var "unused" 0))))))


(let not (Op1 (Not) (Var "x" 8)))
(run enumerate-modules 1)
(check
 (=
  not
  (apply (MakeModule (Op1_ (Not) (Hole)) (vec-of 0)) (vec-of (Var "x" 8)))))

(let notnot (Op1 (Not) (Op1 (Not) (Var "x" 8))))
(run enumerate-modules 1)  
(check
 (=
  notnot
  (apply (MakeModule (Op1_ (Not) (Op1_ (Not) (Hole))) (vec-of 0)) (vec-of (Var "x" 8)))))

(let and (Op2 (And) (Var "x" 8) (Var "y" 8)))
(run enumerate-modules 1)
(check
 (=
  and
  (apply (MakeModule (Op2_ (And) (Hole) (Hole)) (vec-of 0 1)) (vec-of (Var "x" 8) (Var "y" 8)))))

(let orand (Op2 (Or) and and))
(run enumerate-modules 1)
(check
 (= 
  orand
  (apply (MakeModule (Op2_ (Or) (Op2_ (And) (Hole) (Hole)) (Hole)) (vec-of 0 1 2)) (vec-of (Var "x" 8) (Var "y" 8) and ))))
(check
 (= 
  orand
  (apply (MakeModule (Op2_ (Or) (Hole) (Op2_ (And) (Hole) (Hole))) (vec-of 0 1 2)) (vec-of and (Var "x" 8) (Var "y" 8)))))
(check
 (= 
  orand
  (apply (MakeModule (Op2_ (Or) (Op2_ (And) (Hole) (Hole)) (Op2_ (And) (Hole) (Hole))) (vec-of 0 1 0 1)) (vec-of (Var "x" 8) (Var "y" 8) (Var "x" 8) (Var "y" 8)))))
    "#,
        )
        .unwrap();

    // let serialized = egraph.serialize_for_graphviz(true);
    // let svg_path = Path::new("tmp").with_extension("svg");
    // serialized.to_svg_file(svg_path).unwrap();
}
