use std::{
    collections::HashMap,
    io::Write,
    process::{Command, Stdio},
};

use crate::language::LanguageAnalysisData::*;
use egg::{define_language, Analysis, AstSize, DidMerge, EGraph, Extractor, Id, RecExpr};
use rayon::prelude::*;

define_language! {
    pub enum Language {
        // (var <name: String> <bitwidth: Num>)
        "var" = Var([Id; 2]),
        // (const <val: Num> <bitwidth: Num>)
        "const" = Const([Id; 2]),

        // (<op> a b)
        "+" = Add([Id; 2]),
        "-" = Sub([Id; 2]),
        "|" = Or([Id; 2]),
        "&" = And([Id; 2]),
        "^" = Xor([Id; 2]),

        // (asr a <c: Const>)
        // We only support shifting by a constant for now.
        "asr" = AlgebraicShiftRight([Id; 2]),

        Num(i64),
        String(String),
    }
}

#[derive(Default)]
pub struct LanguageAnalysis;
#[derive(Debug, Clone, PartialEq)]
pub enum LanguageAnalysisData {
    // Represents a signal with the given bitwidth.
    Signal(usize),
    _String(String),
    Num(i64),
}
impl Analysis<Language> for LanguageAnalysis {
    type Data = LanguageAnalysisData;

    fn make(egraph: &EGraph<Language, Self>, enode: &Language) -> Self::Data {
        match enode {
            Language::Var([.., bitwidth_id]) | Language::Const([.., bitwidth_id]) => {
                match &egraph[*bitwidth_id].data {
                    &Num(v) => {
                        assert!(v > 0, "expect bitwidths to be positive");
                        Signal(v as usize)
                    }
                    _ => panic!(),
                }
            }
            Language::Add([a_id, b_id])
            | Language::Sub([a_id, b_id])
            | Language::Or([a_id, b_id])
            | Language::And([a_id, b_id])
            | Language::Xor([a_id, b_id])
            | Language::AlgebraicShiftRight([a_id, b_id]) => {
                match (&egraph[*a_id].data, &egraph[*b_id].data) {
                    (Signal(a_bitwidth), Signal(b_bitwidth)) => {
                        assert_eq!(a_bitwidth, b_bitwidth, "bitwidths must match");
                        Signal(*a_bitwidth)
                    }
                    _ => panic!(),
                }
            }
            Language::Num(v) => Num(*v),
            Language::String(v) => _String(v.clone()),
        }
    }

    fn merge(&mut self, a: &mut Self::Data, b: Self::Data) -> egg::DidMerge {
        assert_eq!(*a, b);
        DidMerge(false, false)
    }
}

/// Returns the string representing the Racket expression, and a map mapping
/// symbol names to their bitwidths.
pub fn to_racket(expr: &RecExpr<Language>, id: Id) -> (Option<String>, HashMap<String, usize>) {
    let mut map = HashMap::default();
    let racket_string = to_racket_helper(expr, id, &mut map);
    (racket_string, map)
}

fn to_racket_helper(
    expr: &RecExpr<Language>,
    id: Id,
    map: &mut HashMap<String, usize>,
) -> Option<String> {
    match expr[id] {
        Language::Var([name_id, bw_id]) => match (&expr[name_id], &expr[bw_id]) {
            (Language::String(v), Language::Num(bw)) => {
                map.insert(v.clone(), (*bw).try_into().unwrap());
                Some(v.clone())
            }
            _ => panic!(),
        },
        Language::Const([val_id, bitwidth_id]) => Some(format!(
            "(bv {val} {bitwidth})",
            val = match &expr[val_id] {
                Language::Num(v) => v.clone(),
                _ => panic!(),
            },
            bitwidth = match expr[bitwidth_id] {
                Language::Num(v) => v.clone(),
                _ => panic!(),
            },
        )),
        Language::Add([a_id, b_id])
        | Language::Sub([a_id, b_id])
        | Language::Or([a_id, b_id])
        | Language::And([a_id, b_id])
        | Language::Xor([a_id, b_id])
        | Language::AlgebraicShiftRight([a_id, b_id]) => Some(format!(
            "({op} {a} {b})",
            op = match expr[id] {
                Language::Add(_) => "bvadd",
                Language::Sub(_) => "bvsub",
                Language::Or(_) => "bvor",
                Language::And(_) => "bvand",
                Language::Xor(_) => "bvxor",
                Language::AlgebraicShiftRight(_) => "bvashr",
                _ => unreachable!(),
            },
            a = to_racket_helper(expr, a_id, map).unwrap(),
            b = to_racket_helper(expr, b_id, map).unwrap()
        )),
        Language::Num(_) => None,
        Language::String(_) => None,
    }
}

pub fn call_racket(expr: String, map: &HashMap<String, usize>) -> bool {
    let full_expr = format!(
        "
    (begin
        {defines}
        (define (f {args}) {expr})
        f)",
        defines = map
            .iter()
            .map(|(k, v)| { format!("(define-symbolic {} (bitvector {}))", k, v) })
            .collect::<Vec<_>>()
            .join("\n"),
        args = map
            .keys()
            .into_iter()
            .cloned()
            .collect::<Vec<_>>()
            .join(" "),
        expr = expr,
    );

    let mut cmd = Command::new("racket");
    cmd.arg("-tm");
    cmd.arg("../racket/test.rkt");
    cmd.stdin(Stdio::piped());
    cmd.stdout(Stdio::piped());
    cmd.stderr(Stdio::piped());
    let mut proc = cmd.spawn().ok().expect("Failed to spawn process");
    proc.stdin
        .as_mut()
        .unwrap()
        .write_all(full_expr.as_bytes())
        .unwrap();
    let output = proc.wait_with_output().unwrap();

    output.status.success()
}

pub fn explore(egraph: &EGraph<Language, LanguageAnalysis>, _id: Id) -> HashMap<Id, bool> {
    let extractor = Extractor::new(egraph, AstSize);
    let out: HashMap<Id, bool> = egraph
        .classes()
        .par_bridge()
        .map(|eclass| {
            let (_, expr) = extractor.find_best(eclass.id);
            let (racket_expr, map) = to_racket(&expr, (expr.as_ref().len() - 1).into());
            if racket_expr.is_none() {
                println!("Not attempting to synthesize:\n{}", expr.pretty(80));
                (eclass.id, false)
            } else {
                println!("Attempting to synthesize:\n{}", expr.pretty(80),);
                let result = call_racket(racket_expr.unwrap(), &map);
                (eclass.id, result)
            }
        })
        .collect();

    println!("ISA:");
    for (k, v) in out.iter() {
        if *v {
            println!("{}", extractor.find_best(*k).1.pretty(80))
        }
    }

    out
}

#[cfg(test)]
mod tests {
    use std::str::FromStr;

    use egg::RecExpr;

    use super::*;

    #[test]
    fn ceil_avg() {
        let mut egraph: EGraph<Language, LanguageAnalysis> = EGraph::default();

        let id = egraph.add_expr(
            &RecExpr::from_str(
                "(- (| (var x 8) (var y 8)) (asr (^ (var x 8) (var y 8)) (const 1 8)))",
            )
            .unwrap(),
        );

        match &egraph[id].data {
            Signal(8) => (),
            _ => panic!(),
        }
    }

    #[test]
    fn ceil_avg_to_racket() {
        let expr = &RecExpr::from_str(
            "(- (| (var x 8) (var y 8)) (asr (^ (var x 8) (var y 8)) (const 1 8)))",
        )
        .unwrap();

        let (expr, map) = to_racket(expr, (expr.as_ref().len() - 1).into());
        assert_eq!(*map.get("x").unwrap(), 8);
        assert_eq!(*map.get("y").unwrap(), 8);
        assert_eq!(
            expr.unwrap(),
            "(bvsub (bvor x y) (bvashr (bvxor x y) (bv 1 8)))"
        );
    }

    #[test]
    fn ceil_avg_to_racket_call_racket() {
        let expr = &RecExpr::from_str(
            "(- (| (var x 8) (var y 8)) (asr (^ (var x 8) (var y 8)) (const 1 8)))",
        )
        .unwrap();

        let (expr, map) = to_racket(expr, (expr.as_ref().len() - 1).into());

        assert!(!call_racket(expr.unwrap(), &map));
    }

    #[test]
    fn ceil_avg_explore() {
        let mut egraph: EGraph<Language, LanguageAnalysis> = EGraph::default();

        let id = egraph.add_expr(
            &RecExpr::from_str(
                "(- (| (var x 8) (var y 8)) (asr (^ (var x 8) (var y 8)) (const 1 8)))",
            )
            .unwrap(),
        );

        explore(&egraph, id);
    }
}
