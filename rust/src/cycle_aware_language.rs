use std::{fmt::Display, str::FromStr};

use egg::*;

define_language! {
    /// See the documentation in language.rs.
    ///
    /// This is the same language, but made cycle-aware.
    ///
    /// The returned values are Signals, as defined in my Racket Lakeroad part 1
    /// experiments. Signals are conceptually tuples with type (bitvector,
    /// HashMap<String, bitvector>). The first value represents the actual value
    /// of the signal, while the second value represents the current state in
    /// the context in which the signal exists.
    pub enum Language {

        // (var name: String bitwidth: Num) -> Expr
        "var" = Var([Id; 2]),

        // (const val: Num bitwidth: Num) -> Expr
        "const" = Const([Id; 2]),

        // Operator application for expressions.
        //
        // (unop op: Op bitwidth: Num arg: Expr) -> Expr
        "unop" = UnOp([Id; 3]),
        // (binop op: Op bitwidth: Num arg0,arg1: Expr) -> Expr
        "binop" = BinOp([Id; 4]),

        // (apply instr: Instr args: List of Exprs) -> Expr
        "apply" = Apply([Id; 2]),

        // Hole.
        // (hole bitwidth: Num) -> AST
        "hole" = Hole([Id; 1]),

        // Operator application for ASTs.
        //
        // (unop-ast op: Op bitwidth: Num arg: AST) -> AST
        "unop-ast" = UnOpAst([Id; 3]),
        // (binop-ast op: Op bitwidth: Num arg0,arg1: AST) -> AST
        "binop-ast" = BinOpAst([Id; 4]),

        "list" = List(Box<[Id]>),

        // (concat l0: List l1: List) -> List
        "concat" = Concat([Id;2]),

        // Canonicalizes a list of args.
        // (canonicalize (list args...: Expr))
        //   gets rewritten to (canonical-args ids...: Num)
        "canonicalize" = Canonicalize([Id; 1]),

        // Canonical args are simply a list of natural numbers, starting with 0
        // and increasing by 1 (but allowing repetitions of previously-seen
        // numbers.)
        // Canonical args are paired with an AST to construct an instruction.
        "canonical-args" = CanonicalArgs(Box<[Id]>),

        // (instr ast: AST canonical-args: List) -> Instr
        // An instruction.
        // For example, the instruction
        // (instr (binop and 8 (hole 8) (hole 8)) (canonical-args 0 1))
        // represents an AND instruction whose two holes are filled with two
        // different variables, e.g. (and x y), while
        // (instr (binop and 8 (hole 8) (hole 8)) (canonical-args 0 0))
        // represents an AND instruction whose two holes are filled with the
        // same variable, e.g. (and x x).
        "instr" = Instr([Id; 2]),

        Op(Op),
        Num(i64),
        String(String),
    }
}

#[derive(PartialEq, Debug, Eq, PartialOrd, Ord, Hash, Clone)]
pub enum Op {
    And,
    Or,
    Not,
    Sub,
    Xor,
    Asr,
    Eq,
    Neg,
    Lsr,
    Add,
}
impl Display for Op {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        write!(
            f,
            "{}",
            match self {
                Op::And => "and",
                Op::Or => "or",
                Op::Not => "not",
                Op::Sub => "sub",
                Op::Xor => "xor",
                Op::Asr => "asr",
                Op::Eq => "eq",
                Op::Neg => "neg",
                Op::Lsr => "lsr",
                Op::Add => "add",
            }
        )
    }
}
impl FromStr for Op {
    type Err = ();

    fn from_str(s: &str) -> Result<Self, Self::Err> {
        match s {
            "and" => Ok(Op::And),
            "or" => Ok(Op::Or),
            "not" => Ok(Op::Not),
            "sub" => Ok(Op::Sub),
            "xor" => Ok(Op::Xor),
            "asr" => Ok(Op::Asr),
            "eq" => Ok(Op::Eq),
            "neg" => Ok(Op::Neg),
            "lsr" => Ok(Op::Lsr),
            "add" => Ok(Op::Add),
            _ => Err(()),
        }
    }
}

pub enum LanguageAnalysisData {
    /// A signal is a value of 
    Signal(usize, Hash),
    _String(String),
    Num(i64),
    Op(Op),
    List(Box<[Id]>),
    /// An instruction. The usize represents its output bitwidth.
    Instr(usize),
    Empty,
}
impl Analysis<Language> for LanguageAnalysis {
    type Data = LanguageAnalysisData;

    fn make(egraph: &EGraph<Language, Self>, enode: &Language) -> Self::Data {
        match enode {
            &Language::Instr([ast_id, canonical_args_id]) => {
                match (&egraph[ast_id].data, &egraph[canonical_args_id].data) {
                    (Signal(v), Empty) => Instr(*v),
                    _ => panic!(),
                }
            }
            &Language::Canonicalize([list_id]) => match &egraph[list_id].data {
                List(_) => Empty,
                _ => panic!(),
            },
            Language::CanonicalArgs(ids) => {
                ids.iter().for_each(|v| match &egraph[*v].data {
                    Num(_) => (),
                    _ => panic!(),
                });
                Empty
            }
            Language::Var([.., bitwidth_id]) | Language::Const([.., bitwidth_id]) => {
                match &egraph[*bitwidth_id].data {
                    &Num(v) => {
                        assert!(v > 0, "expect bitwidths to be positive");
                        Signal(v as usize)
                    }
                    _ => panic!(),
                }
            }
            Language::Num(v) => Num(*v),
            Language::String(v) => _String(v.clone()),
            &Language::BinOp([op_id, bitwidth_id, a_id, b_id])
            | &Language::BinOpAst([op_id, bitwidth_id, a_id, b_id]) => {
                match (
                    &egraph[op_id].data,
                    &egraph[bitwidth_id].data,
                    &egraph[a_id].data,
                    &egraph[b_id].data,
                ) {
                    (Op(_), Num(bitwidth), Signal(a_bitwidth), Signal(b_bitwidth)) => {
                        assert_eq!(a_bitwidth, b_bitwidth, "bitwidths must match");
                        assert_eq!(*a_bitwidth, *bitwidth as usize, "bitwidths must match");
                        Signal(*bitwidth as usize)
                    }
                    _ => panic!("types don't check; is {:?} an op?", egraph[op_id]),
                }
            }
            &Language::UnOp([op_id, bitwidth_id, arg_id])
            | &Language::UnOpAst([op_id, bitwidth_id, arg_id]) => {
                match (
                    &egraph[op_id].data,
                    &egraph[bitwidth_id].data,
                    &egraph[arg_id].data,
                ) {
                    (Op(_), Num(out_bitwidth), Signal(arg_bitwidth)) => {
                        assert_eq!(
                            *arg_bitwidth, *out_bitwidth as usize,
                            "bitwidths must match"
                        );
                        Signal(*out_bitwidth as usize)
                    }
                    _ => panic!("types don't check; is {:?} an op?", egraph[op_id]),
                }
            }
            Language::Op(op) => Op(op.clone()),
            &Language::Hole([bw_id]) => match &egraph[bw_id].data {
                Num(v) => Signal(*v as usize),
                _ => panic!(),
            },
            Language::List(ids) => List(ids.clone()),
            &Language::Concat([a_id, b_id]) => match (&egraph[a_id].data, &egraph[b_id].data) {
                (List(a), List(b)) => List(
                    a.iter()
                        .chain(b.iter())
                        .cloned()
                        .collect::<Vec<_>>()
                        .into_boxed_slice(),
                ),
                _ => panic!(),
            },
            &Language::Apply([instr_id, _args_id]) => match &egraph[instr_id].data {
                Instr(v) => Signal(*v),
                other @ _ => panic!("Expected instruction, found:\n{:#?}", other),
            },
        }
    }

    fn merge(&mut self, a: &mut Self::Data, b: Self::Data) -> egg::DidMerge {
        assert_eq!(*a, b);
        DidMerge(false, false)
    }
}