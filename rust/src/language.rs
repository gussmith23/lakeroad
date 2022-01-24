use crate::language::LanguageAnalysisData::*;
use egg::{define_language, Analysis, DidMerge, EGraph, Id};

define_language! {
    enum Language {
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
struct LanguageAnalysis;
#[derive(Debug, Clone, PartialEq)]
enum LanguageAnalysisData {
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

#[cfg(test)]
mod tests {
    use std::str::FromStr;

    use egg::RecExpr;

    use super::*;

    #[test]
    fn ceil_avg() {
        let mut egraph: EGraph<Language, LanguageAnalysis> = EGraph::default();

        let id = egraph.add_expr(
            &RecExpr::from_str("(- (| (var x 8) (var y 8)) (asr (^ (var x 8) (var y 8)) (const 1 8)))")
                .unwrap(),
        );

        match &egraph[id].data {
            Signal(8) => (),
            _ => panic!(),
        }
    }
}
