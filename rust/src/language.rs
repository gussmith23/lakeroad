use std::{
    collections::{HashMap, HashSet},
    fmt::Display,
    io::Write,
    process::{Command, Stdio},
    str::FromStr,
};

use crate::language::LanguageAnalysisData::*;
use egg::{
    define_language, rewrite, Analysis, Applier, AstSize, DidMerge, EGraph, Extractor, Id,
    Language as LanguageTrait, Pattern, RecExpr, Rewrite, Searcher, Subst, Var,
};
use rand::prelude::IteratorRandom;
use rayon::prelude::*;

define_language! {
    /// Expressions (Exprs) in our language can be constructed two ways: first,
    /// by directly constructing an expression by combining `var`s and `const`s
    /// with `unop` and `binop` operator applications. They can also be
    /// indirectly constructed by `apply`ing instructions onto arguments, which
    /// are themselves expressions. The intention behind having these two
    /// methods is so that we can ingest programs in the first form (which is
    /// easy to compile to or to write by hand) and then rewrite to the second
    /// form, which is harder to write but is useful for enumerating the space
    /// of possible instructions in the ISA.
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
        // Ternary operator.
        // (op3 op: Op bitwidth: Num arg0,arg1,arg2: Expr) -> Expr
        "op3" = Op3([Id; 5]),

        // (apply instr: Instr args: List of Exprs) -> Expr
        "apply" = Apply([Id; 2]),

        // Hole.
        // (hole type: HoleType) -> AST
        "hole" = Hole([Id; 1]),

        // Operator application for ASTs.
        //
        // (unop-ast op: Op bitwidth: Num arg: AST) -> AST
        "unop-ast" = UnOpAst([Id; 3]),
        // (binop-ast op: Op bitwidth: Num arg0,arg1: AST) -> AST
        "binop-ast" = BinOpAst([Id; 4]),
        // (op3-ast op: Op bitwidth: Num arg0,arg1,arg2: AST) -> AST
        "op3-ast" = Op3Ast([Id; 5]),

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


        // Bitwidth-typed hole. (hole-type-bw bw: Num) -> HoleType
        "hole-type-bw" = TypeBw([Id; 1]),
        "hole-type-num" = TypeNum,

        Op(Op),
        Num(i64),
        String(String),
    }
}

#[derive(Debug, Clone, PartialEq)]
pub enum HoleType {
    Bw(usize),
    Num,
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
    If,
    Concat,
    Extract,
    ZeroExtend,
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
                Op::If => "if",
                Op::Concat => "concat",
                Op::Extract => "extract",
                Op::ZeroExtend => "zero-extend",
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
            "if" => Ok(Op::If),
            "concat" => Ok(Op::Concat),
            "extract" => Ok(Op::Extract),
            "zero-extend" => Ok(Op::ZeroExtend),
            _ => Err(()),
        }
    }
}

// The type of ASTs.
#[derive(Debug, Clone, PartialEq)]
pub enum Ast {
    Signal(usize),
    Num,
}

#[derive(Default)]
pub struct LanguageAnalysis;
#[derive(Debug, Clone, PartialEq)]
pub enum LanguageAnalysisData {
    /// A function which takes the arguments represented by the vector and
    /// returns the type indicated by the second argument.
    Function {
        args: HashMap<String, usize>,
        ret: usize,
    },

    // Represents a signal with the given bitwidth.
    Signal(usize),
    _String(String),
    Num(i64),
    Op(Op),
    List(Box<[Id]>),
    /// An instruction. The usize represents its output bitwidth.
    Instr(usize),
    Empty,
    HoleType(HoleType),
    Ast(Ast),
}

impl LanguageAnalysisData {
    pub fn get_signal(&self) -> usize {
        match self {
            LanguageAnalysisData::Signal(v) => *v,
            _ => panic!(),
        }
    }
    pub fn get_num(&self) -> i64 {
        match self {
            LanguageAnalysisData::Num(v) => *v,
            _ => panic!(),
        }
    }
    pub fn get_ast_signal_type(&self) -> usize {
        match self {
            LanguageAnalysisData::Ast(a) => match a {
                Ast::Signal(v) => *v,
                _ => panic!(),
            },
            _ => panic!(),
        }
    }
    pub fn is_ast_num_type(&self) -> bool {
        matches!(self, LanguageAnalysisData::Ast(Ast::Num))
    }

    pub fn get_list(&self) -> &[Id] {
        match self {
            LanguageAnalysisData::List(v) => v,
            _ => panic!(),
        }
    }
}

impl Analysis<Language> for LanguageAnalysis {
    type Data = LanguageAnalysisData;

    fn make(egraph: &EGraph<Language, Self>, enode: &Language) -> Self::Data {
        match enode {
            &Language::TypeBw([bitwidth_id]) => match &egraph[bitwidth_id].data {
                Num(v) => LanguageAnalysisData::HoleType(HoleType::Bw(*v as usize)),
                _ => panic!(),
            },
            &Language::TypeNum => LanguageAnalysisData::HoleType(HoleType::Num),
            &Language::Instr([ast_id, canonical_args_id]) => {
                match (&egraph[ast_id].data, &egraph[canonical_args_id].data) {
                    (Ast(Ast::Signal(v)), Empty) => Ast(Ast::Signal(*v)),
                    (Ast(Ast::Num), Empty) => Ast(Ast::Num),
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
            &Language::Op3([op_id, bitwidth_id, a_id, b_id, c_id]) => {
                match (
                    &egraph[op_id].data,
                    &egraph[bitwidth_id].data,
                    &egraph[a_id].data,
                    &egraph[b_id].data,
                    &egraph[c_id].data,
                ) {
                    (Op(op), Num(bitwidth), arg0, arg1, arg2) => {
                        match op {
                            Op::If => {
                                let c_bitwidth = arg0.get_signal();
                                let t_bitwidth = arg1.get_signal();
                                let f_bitwidth = arg2.get_signal();
                                // This may not always be the case.
                                assert_eq!(c_bitwidth, 1, "condition must be 1 bit");
                                assert_eq!(t_bitwidth, f_bitwidth, "bitwidths of branches match");
                                assert_eq!(t_bitwidth, *bitwidth as usize);
                            }
                            Op::Extract => {
                                let high_val = arg0.get_num();
                                let low_val = arg1.get_num();
                                let in_bitwidth = arg2.get_signal();
                                assert!(high_val < in_bitwidth.try_into().unwrap());
                                assert!(high_val >= low_val);
                                assert!(low_val >= 0);
                                assert_eq!(bitwidth, &(high_val - low_val + 1));
                            }
                            _ => panic!("{:?} is not a ternary op", op),
                        }
                        Signal(*bitwidth as usize)
                    }
                    _ => panic!(
                        "types don't check when unpacking {:?}; is {:?} an op?",
                        (
                            &egraph[op_id].data,
                            &egraph[bitwidth_id].data,
                            &egraph[a_id].data,
                            &egraph[b_id].data,
                            &egraph[c_id].data,
                        ),
                        egraph[op_id]
                    ),
                }
            }
            &Language::Op3Ast([op_id, bitwidth_id, a_id, b_id, c_id]) => {
                match (
                    &egraph[op_id].data,
                    &egraph[bitwidth_id].data,
                    &egraph[a_id].data,
                    &egraph[b_id].data,
                    &egraph[c_id].data,
                ) {
                    (Op(op), Num(bitwidth), arg0, arg1, arg2) => {
                        match op {
                            Op::If => {
                                let c_bitwidth = arg0.get_ast_signal_type();
                                let t_bitwidth = arg1.get_ast_signal_type();
                                let f_bitwidth = arg2.get_ast_signal_type();
                                // This may not always be the case.
                                assert_eq!(c_bitwidth, 1, "condition must be 1 bit");
                                assert_eq!(t_bitwidth, f_bitwidth, "bitwidths of branches match");
                                assert_eq!(t_bitwidth, *bitwidth as usize);
                            }
                            Op::Extract => {
                                assert!(arg0.is_ast_num_type());
                                assert!(arg1.is_ast_num_type());
                            }
                            _ => panic!("{:?} is not a ternary op", op),
                        }
                        Ast(Ast::Signal(*bitwidth as usize))
                    }
                    _ => panic!(
                        "types don't check when unpacking {:?}; is {:?} an op?",
                        (
                            &egraph[op_id].data,
                            &egraph[bitwidth_id].data,
                            &egraph[a_id].data,
                            &egraph[b_id].data,
                            &egraph[c_id].data,
                        ),
                        egraph[op_id]
                    ),
                }
            }
            &Language::BinOp([op_id, bitwidth_id, a_id, b_id])
            | &Language::BinOpAst([op_id, bitwidth_id, a_id, b_id]) => {
                match (
                    &egraph[op_id].data,
                    &egraph[bitwidth_id].data,
                    &egraph[a_id].data,
                    &egraph[b_id].data,
                ) {
                    (Op(_), Num(bitwidth), Signal(_a_bitwidth), Signal(_b_bitwidth)) => {
                        // These aren't true anymore. But will it break things to comment this out?
                        //assert_eq!(a_bitwidth, b_bitwidth, "bitwidths must match");
                        //assert_eq!(*a_bitwidth, *bitwidth as usize, "bitwidths must match");
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
                HoleType(t) => match t {
                    HoleType::Bw(bw) => Ast(Ast::Signal(*bw as usize)),
                    HoleType::Num => Ast(Ast::Num),
                },
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
            &Language::Apply([instr_id, args_id]) => match &egraph[instr_id].data {
                Ast(Ast::Signal(v)) => Signal(*v),
                // The implementation of Num is a bit weird. Basically, we're
                // re-inferring the value of the number by looking at the value
                // of the arg. I'm not convinced that's correct.
                //
                // I.e., if we have a program:
                // 23
                // we can abstract it to (in simplified syntax):
                // (apply (ast (num)) (list 23))
                // and then we can re-infere the value of the number by looking
                // at the value in the list.
                Ast(Ast::Num) => {
                    assert_eq!(egraph[args_id].data.get_list().len(), 1);
                    Num(egraph[egraph[args_id].data.get_list()[0]].data.get_num())
                }
                _ => panic!(),
            },
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
        Language::Num(_) => None,
        Language::String(_) => None,
        Language::Apply(_) => todo!(),
        Language::BinOp([op_id, bw_id, a_id, b_id])
            if matches!(&expr[op_id], Language::Op(Op::Eq)) =>
        {
            Some(format!(
                "(bool->bitvector (bveq {a} {b}) (bitvector {bw}))",
                a = to_racket_helper(expr, a_id, map).unwrap(),
                b = to_racket_helper(expr, b_id, map).unwrap(),
                bw = match &expr[bw_id] {
                    Language::Num(v) => v,
                    _ => panic!(),
                }
            ))
        }
        Language::BinOp([op_id, _bw_id, a_id, b_id]) => Some(format!(
            "({op} {a} {b})",
            op = match &expr[op_id] {
                Language::Op(op) => match op {
                    Op::And => "bvand",
                    Op::Or => "bvor",
                    Op::Sub => "bvsub",
                    Op::Xor => "bvxor",
                    Op::Asr => "bvashr",
                    Op::Lsr => "bvlshr",
                    Op::Eq => unreachable!("Should be implemented above."),
                    _ => todo!("{}", op),
                },
                _ => panic!(),
            },
            a = to_racket_helper(expr, a_id, map).unwrap(),
            b = to_racket_helper(expr, b_id, map).unwrap()
        )),
        Language::UnOp([op_id, _bw_id, arg_id]) => Some(format!(
            "({op} {a})",
            op = match &expr[op_id] {
                Language::Op(op) => match op {
                    Op::Not => "bvnot",
                    Op::Neg => "bvneg",
                    _ => todo!("{}", op),
                },
                _ => panic!(),
            },
            a = to_racket_helper(expr, arg_id, map).unwrap(),
        )),
        Language::Hole(_) => todo!(),
        Language::BinOpAst(_) => todo!(),
        Language::UnOpAst(_) => todo!(),
        Language::List(_) => todo!(),
        Language::Concat(_) => todo!(),
        Language::Op(_) => todo!(),
        Language::Op3(_) => todo!(),
        Language::TypeBw(_) => todo!(),
        Language::TypeNum => todo!(),
        Language::Op3Ast(_) => todo!(),
        Language::CanonicalArgs(_) | Language::Canonicalize(_) | Language::Instr(_) => panic!(),
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
    cmd.arg("../racket/attempt-to-synthesize.rkt");
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

/// Represents a place where either a hole or an AST will be introduced, when
/// generating an AST.
enum HoleOrAst {
    Hole(Var),
    Ast { ast: Var, args: Var },
}
struct RenameThisApplier {
    arity: usize,
    hole_or_asts: Vec<HoleOrAst>,
}

impl Applier<Language, LanguageAnalysis> for RenameThisApplier {
    fn apply_one(
        &self,
        egraph: &mut EGraph<Language, LanguageAnalysis>,
        eclass: Id,
        subst: &egg::Subst,
        searcher_ast: Option<&egg::PatternAst<Language>>,
        rule_name: egg::Symbol,
    ) -> Vec<Id> {
        let ast_op_str = match self.arity {
            3 => "op3-ast",
            2 => "binop-ast",
            1 => "unop-ast",
            _ => todo!(),
        };

        let mut hole_or_asts_str = String::new();
        let mut args_strs: Vec<String> = Vec::new();

        for hole_or_ast in &self.hole_or_asts {
            match hole_or_ast {
                HoleOrAst::Hole(var) => {
                    let hole_type_str = match egraph[subst[*var]].data {
                        Signal(bw) => format!("(hole-type-bw {bw})"),
                        Num(_) => "(hole-type-num)".into(),
                        _ => panic!(),
                    };
                    hole_or_asts_str.push_str(&format!(" (hole {})", hole_type_str));
                    args_strs.push(format!(" (list {})", var.to_string()).to_owned());
                }
                HoleOrAst::Ast { ast, args } => {
                    hole_or_asts_str.push_str(format!(" {}", ast.to_string().as_str()).as_str());
                    args_strs.push(format!(" {}", args.to_string()));
                }
            }
        }

        let mut concat_str = String::new();
        for (i, args_str) in args_strs.iter().enumerate() {
            if i < args_strs.len() - 1 {
                concat_str.push_str(&format!("(concat {args_str} "));
            } else {
                concat_str.push_str(args_str);
            }
        }
        concat_str.push_str(&")".repeat(args_strs.len() - 1));

        format!(
            "(apply 
                  (instr
                   ({ast_op_str} ?op ?bw {hole_or_asts_str})
                   (canonicalize {concat_str}))
                  {concat_str})",
        )
        .parse::<Pattern<Language>>()
        .unwrap()
        .apply_one(egraph, eclass, subst, searcher_ast, rule_name)
    }
}

pub fn introduce_hole_var() -> Rewrite<Language, LanguageAnalysis> {
    rewrite!("introduce-hole-var";
                "(var ?a ?bw)" =>
                "(apply (instr (hole (hole-type-bw ?bw)) (canonicalize (list (var ?a ?bw)))) (list (var ?a ?bw)))")
}

pub fn introduce_hole_num() -> Rewrite<Language, LanguageAnalysis> {
    rewrite!("introduce-hole-num";
        "?a" =>
        "(apply (instr (hole (hole-type-num)) (canonicalize (list ?a))) (list ?a))"
    if move |egraph: &mut EGraph<Language, LanguageAnalysis>, _, subst: &Subst| match &egraph[subst["?a".parse().unwrap()]].data {
        LanguageAnalysisData::Num(_) => true,
        _ => false,
    })
}

// This shouldn't be called fusion. Or, more specifically, the next two rewrites
// are also fusion in different forms. So only labeling this rewrite as fusion
// is misleading.
pub fn fuse_op() -> Rewrite<Language, LanguageAnalysis> {
    rewrite!("fuse-op";
                "(binop ?op ?bw
                  (apply (instr ?ast0 ?canonical-args0) ?args0)
                  (apply (instr ?ast1 ?canonical-args1) ?args1))" => 
                {RenameThisApplier{
        arity: 2,
        hole_or_asts: vec![
            HoleOrAst::Ast {
                ast: "?ast0".parse().unwrap(),
                args: "?args0".parse().unwrap(),
            },
            HoleOrAst::Ast {
                ast: "?ast1".parse().unwrap(),
                args: "?args1".parse().unwrap(),
            },
        ],
    }})
}

pub fn introduce_hole_op_left() -> Rewrite<Language, LanguageAnalysis> {
    rewrite!("introduce-hole-op-left";
                "(binop ?op ?bw
                  ?left
                  (apply (instr ?ast1 ?canonical-args1) ?args1))" => 
                {RenameThisApplier{
        arity: 2,
        hole_or_asts: vec![
            HoleOrAst::Hole("?left".parse().unwrap()),
            HoleOrAst::Ast {
                ast: "?ast1".parse().unwrap(),
                args: "?args1".parse().unwrap(),
            },
        ],
    }})
}

pub fn introduce_hole_op_right() -> Rewrite<Language, LanguageAnalysis> {
    rewrite!("introduce-hole-op-right";
                "(binop ?op ?bw
                  (apply (instr ?ast0 ?canonical-args0) ?args0)
                  ?right)" => 
                {RenameThisApplier{
        arity: 2,
        hole_or_asts: vec![
            HoleOrAst::Ast {
                ast: "?ast0".parse().unwrap(),
                args: "?args0".parse().unwrap(),
            },
            HoleOrAst::Hole("?right".parse().unwrap()),
        ],
    }})
}

pub fn introduce_hole_op_both() -> Rewrite<Language, LanguageAnalysis> {
    rewrite!("introduce-hole-op-both";
                "(binop ?op ?bw
                  ?a
                  ?b)" => 
                {RenameThisApplier{
        arity: 2,
        hole_or_asts: vec![
            HoleOrAst::Hole("?a".parse().unwrap()),
            HoleOrAst::Hole("?b".parse().unwrap()),
        ],
    }})
}

pub fn unary0() -> Rewrite<Language, LanguageAnalysis> {
    rewrite!("unary0";
                "(unop ?op ?bw (apply (instr ?ast ?canonical-args) ?args))" =>
                {RenameThisApplier{
        arity: 1,
        hole_or_asts: vec![
            HoleOrAst::Ast {
                ast: "?ast".parse().unwrap(),
                args: "?args".parse().unwrap(),
            },
        ],
    }})
}

pub fn unary1() -> Rewrite<Language, LanguageAnalysis> {
    rewrite!("unary1";
            "(unop ?op ?bw ?v)" =>
            {RenameThisApplier{
    arity: 1,
    hole_or_asts: vec![
        HoleOrAst::Hole("?v".parse().unwrap()),]}
            })
}

pub fn ternary0() -> Rewrite<Language, LanguageAnalysis> {
    rewrite!("ternary0";
    "(op3 ?op ?bw ?arg0 ?arg1 ?arg2)" =>
    {
        RenameThisApplier{
            arity: 3,
            hole_or_asts: vec![
                HoleOrAst::Hole("?arg0".parse().unwrap()),
                HoleOrAst::Hole("?arg1".parse().unwrap()),
                HoleOrAst::Hole("?arg2".parse().unwrap()),
            ]
        }
    })
}
pub fn ternary1() -> Rewrite<Language, LanguageAnalysis> {
    rewrite!("ternary1";
    "(op3 ?op ?bw ?arg0 ?arg1 (apply (instr ?ast2 ?canonical-args2) ?args2))" =>
    {
        RenameThisApplier{
            arity: 3,
            hole_or_asts: vec![
                HoleOrAst::Hole("?arg0".parse().unwrap()),
                HoleOrAst::Hole("?arg1".parse().unwrap()),
                HoleOrAst::Ast{ast: "?ast2".parse().unwrap(), args: "?args2".parse().unwrap()}
            ]
        }
    })
}

pub fn ternary2() -> Rewrite<Language, LanguageAnalysis> {
    rewrite!("ternary2";
    "(op3 ?op ?bw ?arg0 (apply (instr ?ast1 ?canonical-args1) ?args1) ?arg2)" =>
    {
        RenameThisApplier{
            arity: 3,
            hole_or_asts: vec![
                HoleOrAst::Hole("?arg0".parse().unwrap()),
                HoleOrAst::Ast{ast: "?ast1".parse().unwrap(), args: "?args1".parse().unwrap()},
                HoleOrAst::Hole("?arg2".parse().unwrap()),
            ]
        }
    })
}

pub fn ternary3() -> Rewrite<Language, LanguageAnalysis> {
    rewrite!("ternary3";
    "(op3 ?op ?bw ?arg0 (apply (instr ?ast1 ?canonical-args1) ?args1) (apply (instr ?ast2 ?canonical-args2) ?args2))" =>
    {
        RenameThisApplier{
            arity: 3,
            hole_or_asts: vec![
                HoleOrAst::Hole("?arg0".parse().unwrap()),
                HoleOrAst::Ast{ast: "?ast1".parse().unwrap(), args: "?args1".parse().unwrap()},
                HoleOrAst::Ast{ast: "?ast2".parse().unwrap(), args: "?args2".parse().unwrap()},
            ]
        }
    })
}

pub fn ternary4() -> Rewrite<Language, LanguageAnalysis> {
    rewrite!("ternary4";
    "(op3 ?op ?bw (apply (instr ?ast0 ?canonical-args0) ?args0) ?arg1 ?arg2)" =>
    {
        RenameThisApplier{
            arity: 3,
            hole_or_asts: vec![
                HoleOrAst::Ast{ast: "?ast0".parse().unwrap(), args: "?args0".parse().unwrap()},
                HoleOrAst::Hole("?arg1".parse().unwrap()),
                HoleOrAst::Hole("?arg2".parse().unwrap()),
            ]
        }
    })
}

pub fn ternary5() -> Rewrite<Language, LanguageAnalysis> {
    rewrite!("ternary5";
    "(op3 ?op ?bw (apply (instr ?ast0 ?canonical-args0) ?args0) ?arg1 (apply (instr ?ast2 ?canonical-args2) ?args2))" =>
    {
        RenameThisApplier{
            arity: 3,
            hole_or_asts: vec![
                HoleOrAst::Ast{ast: "?ast0".parse().unwrap(), args: "?args0".parse().unwrap()},
                HoleOrAst::Hole("?arg1".parse().unwrap()),
                HoleOrAst::Ast{ast: "?ast2".parse().unwrap(), args: "?args2".parse().unwrap()},
            ]
        }
    })
}

pub fn ternary6() -> Rewrite<Language, LanguageAnalysis> {
    rewrite!("ternary6";
    "(op3 ?op ?bw (apply (instr ?ast0 ?canonical-args0) ?args0) (apply (instr ?ast1 ?canonical-args1) ?args1) ?arg2)" =>
    {
        RenameThisApplier{
            arity: 3,
            hole_or_asts: vec![
                HoleOrAst::Ast{ast: "?ast0".parse().unwrap(), args: "?args0".parse().unwrap()},
                HoleOrAst::Ast{ast: "?ast1".parse().unwrap(), args: "?args1".parse().unwrap()},
                HoleOrAst::Hole("?arg2".parse().unwrap()),
            ]
        }
    })
}

pub fn ternary7() -> Rewrite<Language, LanguageAnalysis> {
    rewrite!("ternary7";
    "(op3 ?op ?bw (apply (instr ?ast0 ?canonical-args0) ?args0) (apply (instr ?ast1 ?canonical-args1) ?args1) (apply (instr ?ast2 ?canonical-args2) ?args2))" =>
    {
        RenameThisApplier{
            arity: 3,
            hole_or_asts: vec![
                HoleOrAst::Ast{ast: "?ast0".parse().unwrap(), args: "?args0".parse().unwrap()},
                HoleOrAst::Ast{ast: "?ast1".parse().unwrap(), args: "?args1".parse().unwrap()},
                HoleOrAst::Ast{ast: "?ast2".parse().unwrap(), args: "?args2".parse().unwrap()},
            ]
        }
    })
}

pub fn canonicalize() -> Rewrite<Language, LanguageAnalysis> {
    struct Impl(Var);
    impl Applier<Language, LanguageAnalysis> for Impl {
        fn apply_one(
            &self,
            egraph: &mut EGraph<Language, LanguageAnalysis>,
            eclass: Id,
            subst: &egg::Subst,
            _searcher_ast: Option<&egg::PatternAst<Language>>,
            _rule_name: egg::Symbol,
        ) -> Vec<Id> {
            let ids = match &egraph[subst[self.0]].data {
                List(v) => v.clone(),
                _ => panic!(),
            };

            let mut next = 0;
            let mut map = HashMap::new();
            for id in ids.iter() {
                if !map.contains_key(id) {
                    map.insert(id, next);
                    next += 1;
                }
            }

            let new_list = ids
                .iter()
                .cloned()
                .map(|id| egraph.add(crate::language::Language::Num(*map.get(&id).unwrap())))
                .collect::<Vec<_>>();

            let canonical_args_id = egraph.add(crate::language::Language::CanonicalArgs(
                new_list.into_boxed_slice(),
            ));

            egraph.union(eclass, canonical_args_id);

            vec![eclass, canonical_args_id]
        }
    }

    rewrite!("canonicalize";
                "(canonicalize ?list)" => { Impl("?list".parse().unwrap()) })
}

pub fn find_isa_instructions(
    egraph: &EGraph<Language, LanguageAnalysis>,
) -> Vec<(Id, RecExpr<Language>)> {
    let mut out = Vec::default();
    let ast_var: Var = "?ast".parse().unwrap();
    let canonical_args_var: Var = "?canonical-args".parse().unwrap();
    let extractor = Extractor::new(egraph, AstSize);
    for search_match in format!(
        "(instr {} {})",
        ast_var.to_string(),
        canonical_args_var.to_string()
    )
    .parse::<Pattern<_>>()
    .unwrap()
    .search(egraph)
    {
        //
        let (_, expr) = extractor.find_best(search_match.eclass);
        out.push((search_match.eclass, expr));

        // I'm not sure if either of these will always be true. For now it's
        // simpler to assume they are true and then deal with it when they're
        // not. Basically, we're assuming that every (instr ?ast ?args) instance
        // is unique. If these fail, it probably means that instructions were
        // proven to be equivalent, which is actually cool and good but I just
        // haven't thought about what to do in that case. Do we just take one
        // instruction? Whatever we do, we'll need to make a more informed
        // decision.
        // assert_eq!(search_match.substs.len(), 1);
        // assert_eq!(egraph[search_match.eclass].nodes.len(), 1);
        // for subst in search_match.substs {
        //     let ast_id = subst[ast_var];
        //     let canonical_args_id = subst[canonical_args_var];
        //     out.push((
        //         search_match.eclass,
        //         extract_ast(egraph, ast_id, canonical_args_id),
        //     ));
        // }
    }

    out
}

pub fn simplify_concat() -> Rewrite<Language, LanguageAnalysis> {
    struct Impl {
        list0: Var,
        list1: Var,
    }
    impl Applier<Language, LanguageAnalysis> for Impl {
        fn apply_one(
            &self,
            egraph: &mut EGraph<Language, LanguageAnalysis>,
            eclass: Id,
            subst: &egg::Subst,
            _searcher_ast: Option<&egg::PatternAst<Language>>,
            _rule_name: egg::Symbol,
        ) -> Vec<Id> {
            let (ids0, ids1) = match (
                &egraph[subst[self.list0]].data,
                &egraph[subst[self.list1]].data,
            ) {
                (List(ids0), List(ids1)) => (ids0.clone(), ids1.clone()),
                _ => panic!(),
            };
            let new_list_id = egraph.add(Language::List([ids0, ids1].concat().into_boxed_slice()));
            egraph.union(eclass, new_list_id);

            vec![eclass, new_list_id]
        }
    }
    let list0: Var = "?list0".parse().unwrap();
    let list1: Var = "?list1".parse().unwrap();
    rewrite!("simplify-concat";
                { format!("(concat {} {})", list0.to_string(), list1.to_string()).parse::<Pattern<_>>().unwrap() }
                =>
                { Impl { list0, list1}})
}

pub fn explore_new(egraph: &EGraph<Language, LanguageAnalysis>, _id: Id) -> HashMap<Id, bool> {
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

pub fn instr_appears_in_program(
    egraph: &EGraph<Language, LanguageAnalysis>,
    instr_id: Id,
    program_root: Id,
) -> bool {
    let mut worklist: HashSet<Id> = HashSet::new();
    worklist.insert(program_root);
    let mut visited: HashSet<Id> = HashSet::new();

    while !worklist.is_empty() {
        // Get next Id and remove it from the worklist.
        let this = *worklist.iter().next().unwrap();
        assert!(worklist.remove(&this));
        assert!(visited.insert(this));

        if this == instr_id {
            return true;
        }

        for enode in &egraph[this].nodes {
            let ids = match enode {
                Language::Const(ids)
                | Language::Var(ids)
                | Language::Instr(ids)
                | Language::Concat(ids)
                | Language::Apply(ids) => ids.to_vec(),
                Language::UnOp(ids) | Language::UnOpAst(ids) => ids.to_vec(),
                Language::BinOp(ids) | Language::BinOpAst(ids) => ids.to_vec(),
                Language::Op3(ids) | Language::Op3Ast(ids) => ids.to_vec(),
                Language::Canonicalize(ids) | Language::Hole(ids) | Language::TypeBw(ids) => {
                    ids.to_vec()
                }
                Language::CanonicalArgs(ids) | Language::List(ids) => ids.to_vec(),
                Language::TypeNum | Language::Op(_) | Language::Num(_) | Language::String(_) => {
                    vec![]
                }
            };

            worklist.extend(ids.iter().filter(|id| !visited.contains(id)));
        }
    }

    false
}

/// Extract a random implementation of an expression in an egraph.
/// Only extracts (apply ...) nodes.
/// If an eclass contains a var node, the var variant is automatically
/// extracted.
fn extract_random(egraph: &EGraph<Language, LanguageAnalysis>, id: Id) -> RecExpr<Language> {
    let new_nodes = egraph
        .classes()
        .filter_map(|eclass| {
            // Important: if an eclass contains a var, automatically select
            // the var. This prevents infinite loops where we select
            // (var x) = (apply (instr (hole) _) [(var x)])
            // = (apply (instr (hole) _) [(apply (instr (hole) _) [(var x)])])
            if let Some(var_node) = eclass.nodes.iter().find(|l| match l {
                Language::Var(_) => true,
                _ => false,
            }) {
                return Some((eclass.id, var_node.clone()));
            }
            let tmp = eclass
                .nodes
                .iter()
                .enumerate()
                //.filter(|(i, _)| enodes_to_filter.contains(&(eclass.id, *i)))
                .filter(|(_, l)| match l {
                    Language::Var(_) => true,
                    Language::Const(_) => true,
                    Language::UnOp(_) => false,
                    Language::BinOp(_) => false,
                    Language::Op3(_) => false,
                    Language::Apply(_) => true,
                    Language::Hole(_) => true,
                    Language::UnOpAst(_) => true,
                    Language::BinOpAst(_) => true,
                    Language::Op3Ast(_) => true,
                    Language::List(_) => true,
                    Language::Concat(_) => true,
                    Language::Canonicalize(_) => false,
                    Language::CanonicalArgs(_) => true,
                    Language::Instr(_) => true,
                    Language::Op(_) => true,
                    Language::Num(_) => true,
                    Language::String(_) => true,
                    Language::TypeBw(_) => true,
                    Language::TypeNum => true,
                })
                .choose(&mut rand::thread_rng())
                .map(|(_, node)| (eclass.id, node.clone()));
            if tmp.is_none() {
                println!("eclass empty after filtering: {:?}", eclass);
            }
            tmp
        })
        .collect::<HashMap<_, _>>();

    let mut out = RecExpr::default();
    fn _recursively_build(
        id: Id,
        in_expr: &HashMap<Id, Language>,
        out_expr: &mut RecExpr<Language>,
        egraph: &EGraph<Language, LanguageAnalysis>,
    ) -> Option<Id> {
        if !in_expr.contains_key(&egraph.find(id)) {
            return None;
        }
        let mut new_node = in_expr.get(&egraph.find(id)).unwrap().clone();
        let new_ids = new_node
            .children()
            .iter()
            .map(|id| _recursively_build(*id, in_expr, out_expr, egraph))
            .collect::<Vec<_>>();
        if new_ids.iter().any(Option::is_none) {
            return None;
        }
        new_node
            .children_mut()
            .iter_mut()
            .enumerate()
            .for_each(|(i, id)| *id = new_ids[i].unwrap());

        Some(out_expr.add(new_node))
    }
    _recursively_build(egraph.find(id), &new_nodes, &mut out, egraph);

    out
}

/// Randomly sample implementations of the program and count how many times the
/// requested instruction appears. enodes_to_filter are (eclass id, enode index)
/// pairs indicating enodes to filter out. Currently we pass in the results of
/// find_cycles.
///
/// This currently doesn't work. I'd like to get it working, but it's requiring
/// a lot more effort than I originally thought. I thought there'd be a simple
/// way to do this...
pub fn sample_instr_in_program(
    egraph: &EGraph<Language, LanguageAnalysis>,
    instr: &RecExpr<Language>,
    program_root: Id,
    num_samples: usize,
) -> usize {
    let mut count = 0;

    for _ in 0..num_samples {
        let expr = extract_random(egraph, program_root);

        let mut egraph = EGraph::<_, LanguageAnalysis>::default();
        egraph.add_expr(&expr);
        egraph.rebuild();

        if let Some(_) = egraph.lookup_expr(&instr) {
            count += 1;
        }
    }

    count
}

/// Possible values that come of interpreting a Lakeroad expression.
#[derive(PartialEq, Debug, Clone)]
pub enum Value {
    String(String),
    /// (value, width)
    SignalValue(u64, usize),
    Num(i64),
    Op(Op),
}
impl Value {
    fn get_string(&self) -> String {
        match self {
            Value::String(s) => s.clone(),
            _ => panic!(),
        }
    }
    pub fn get_signal_value(&self) -> (u64, usize) {
        match self {
            Value::SignalValue(v, width) => (*v, *width),
            _ => panic!(),
        }
    }
    fn get_num(&self) -> i64 {
        match self {
            Value::Num(v) => *v,
            _ => panic!("unexpected value: {:?}", self),
        }
    }
    fn get_op(&self) -> Op {
        match self {
            Value::Op(op) => op.clone(),
            _ => panic!("unexpected value: {:?}", self),
        }
    }
}

pub fn interpret(expr: &RecExpr<Language>, env: &HashMap<String, u64>, id: Id) -> Value {
    /// "Clean" a value by masking off the bits that are outside the width.
    fn clean(v: u64, width: usize) -> u64 {
        v & ((1 << width) - 1)
    }
    match &expr[id] {
        Language::Var([name_id, bitwidth_id]) => {
            let name = interpret(expr, env, *name_id).get_string();
            let bitwidth = interpret(expr, env, *bitwidth_id).get_num();
            Value::SignalValue(
                env.get(&name.to_string()).unwrap().clone() & ((1 << bitwidth) - 1),
                bitwidth.try_into().unwrap(),
            )
        }
        Language::Const([value_id, bitwidth_id]) => {
            let value = interpret(expr, env, *value_id).get_num();
            assert!(
                value >= 0,
                "using negative values here will lead to headaches in the interpreter"
            );
            let bitwidth = interpret(expr, env, *bitwidth_id).get_num();
            Value::SignalValue(
                (value & ((1 << bitwidth) - 1)).try_into().unwrap(),
                bitwidth.try_into().unwrap(),
            )
        }
        Language::UnOp(_) => todo!(),
        Language::BinOp([op_id, bitwidth_id, arg0_id, arg1_id]) => {
            let op = interpret(expr, env, *op_id).get_op();
            let bitwidth = interpret(expr, env, *bitwidth_id).get_num();
            assert!(bitwidth <= 64, "bitwidth too large for interpreter");
            let arg0 = interpret(expr, env, *arg0_id);
            let arg1 = interpret(expr, env, *arg1_id);

            match op {
                Op::And => todo!(),
                Op::Or => todo!(),
                Op::Not => todo!(),
                Op::Sub => todo!(),
                Op::Xor => todo!(),
                Op::Asr => todo!(),
                Op::Eq => {
                    assert_eq!(bitwidth, 1, "expect eq result bitwidth to be 1");
                    Value::SignalValue(
                        if arg0.get_signal_value() == arg1.get_signal_value() {
                            1
                        } else {
                            0
                        },
                        1,
                    )
                }
                Op::Neg => todo!(),
                Op::Lsr => todo!(),
                Op::Add => todo!(),
                Op::If => todo!(),
                Op::Concat => {
                    let (arg0, arg0_bw) = arg0.get_signal_value();
                    let (arg1, arg1_bw) = arg1.get_signal_value();
                    let arg0 = clean(arg0, arg0_bw);
                    let arg1 = clean(arg1, arg1_bw);
                    assert!(arg0_bw + arg1_bw <= 64, "concat too large for interpreter");
                    Value::SignalValue((arg0 << arg1_bw) | arg1, arg0_bw + arg1_bw)
                }
                Op::Extract => todo!(),
                Op::ZeroExtend => todo!(),
            }
        }
        Language::Op3([op_id, bitwidth_id, arg0_id, arg1_id, arg2_id]) => {
            let op = interpret(expr, env, *op_id).get_op();
            let _bitwidth = interpret(expr, env, *bitwidth_id).get_num();
            let arg0 = interpret(expr, env, *arg0_id);
            let arg1 = interpret(expr, env, *arg1_id);
            let arg2 = interpret(expr, env, *arg2_id);

            match op {
                Op::ZeroExtend => todo!(),
                Op::And => todo!(),
                Op::Or => todo!(),
                Op::Not => todo!(),
                Op::Sub => todo!(),
                Op::Xor => todo!(),
                Op::Asr => todo!(),
                Op::Eq => todo!(),
                Op::Neg => todo!(),
                Op::Lsr => todo!(),
                Op::Add => todo!(),
                Op::If => {
                    if arg0.get_signal_value().0 > 0 {
                        arg1
                    } else {
                        arg2
                    }
                }
                Op::Concat => todo!(),
                Op::Extract => {
                    let top = arg0.get_num();
                    let bottom = arg1.get_num();
                    assert!(top > bottom, "top must be greater than bottom");
                    let (value, value_bw) = arg2.get_signal_value();
                    assert!(
                        top < value_bw.try_into().unwrap(),
                        "top must be less than bitwidth"
                    );
                    assert!(top >= 0);
                    assert!(bottom >= 0);
                    assert!(bottom < value_bw.try_into().unwrap());
                    Value::SignalValue(
                        (value >> bottom) & ((1 << (top - bottom + 1)) - 1),
                        (top - bottom + 1).try_into().unwrap(),
                    )
                }
            }
        }
        Language::Apply(_) => todo!(),
        Language::Hole(_) => todo!(),
        Language::UnOpAst(_) => todo!(),
        Language::BinOpAst(_) => todo!(),
        Language::Op3Ast(_) => todo!(),
        Language::List(_) => todo!(),
        Language::Concat(_) => todo!(),
        Language::Canonicalize(_) => todo!(),
        Language::CanonicalArgs(_) => todo!(),
        Language::Instr(_) => todo!(),
        Language::TypeBw(_) => todo!(),
        Language::TypeNum => todo!(),
        Language::Op(op) => Value::Op(op.clone()),
        Language::Num(v) => Value::Num(*v),
        Language::String(v) => Value::String(v.clone()),
    }
}

#[cfg(test)]
mod tests {
    use std::str::FromStr;

    use egg::{RecExpr, Runner};

    use crate::example_programs;

    use super::*;

    #[test]
    fn ceil_avg() {
        let mut egraph: EGraph<Language, LanguageAnalysis> = EGraph::default();

        let id = egraph.add_expr(
            &RecExpr::from_str(
            "(binop sub 8 (binop or 8 (var x 8) (var y 8)) (binop asr 8 (binop xor 8 (var x 8) (var y 8)) (const 1 8)))",
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
            "(binop sub 8 (binop or 8 (var x 8) (var y 8)) (binop asr 8 (binop xor 8 (var x 8) (var y 8)) (const 1 8)))",
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
            "(binop sub 8 (binop or 8 (var x 8) (var y 8)) (binop asr 8 (binop xor 8 (var x 8) (var y 8)) (const 1 8)))",
        )
        .unwrap();

        let (expr, map) = to_racket(expr, (expr.as_ref().len() - 1).into());

        assert!(!call_racket(expr.unwrap(), &map));
    }

    #[test_log::test]
    fn test_canonicalize() {
        let mut egraph: EGraph<Language, LanguageAnalysis> = EGraph::default();
        let id = egraph.add_expr(&RecExpr::from_str("(canonicalize (list 1 3 2 3))").unwrap());

        let runner = Runner::default()
            .with_egraph(egraph)
            .run(&vec![canonicalize()]);

        "(canonical-args 0 1 2 1)"
            .parse::<Pattern<_>>()
            .unwrap()
            .search_eclass(&runner.egraph, id)
            .unwrap();
    }

    #[test_log::test]
    fn test_extract_random() {
        let mut egraph: EGraph<Language, LanguageAnalysis> = EGraph::default();

        // https://github.com/mangpo/chlorophyll/tree/master/examples/bithack
        // Bithack 1.
        let bithack1_id = egraph.add_expr(
            &RecExpr::from_str(
                "
(binop sub 8 (var x 8) (binop and 8 (var x 8) (var y 8)))
",
            )
            .unwrap(),
        );

        extract_random(&egraph, bithack1_id);
    }

    #[test_log::test]
    fn test_sample_instr_in_program() {
        let mut egraph: EGraph<Language, LanguageAnalysis> = EGraph::default();

        // https://github.com/mangpo/chlorophyll/tree/master/examples/bithack
        // Bithack 1.
        let _bithack1_id = egraph.add_expr(
            &RecExpr::from_str(
                "
(binop sub 8 (var x 8) (binop and 8 (var x 8) (var y 8)))
",
            )
            .unwrap(),
        );
        // Bithack 2.
        let _bithack2_id = egraph.add_expr(
            &RecExpr::from_str(
                "
(unop not 8 (binop sub 8 (var x 8) (var y 8)))
",
            )
            .unwrap(),
        );
        // Bithack 3.
        let _bithack3_id = egraph.add_expr(
            &RecExpr::from_str(
                "
(binop xor 8 (binop xor 8 (var x 8) (var y 8)) (binop and 8 (var x 8) (var y 8)))
",
            )
            .unwrap(),
        );

        let runner = Runner::default().with_egraph(egraph).run(&vec![
            introduce_hole_var(),
            fuse_op(),
            introduce_hole_op_both(),
            introduce_hole_op_left(),
            introduce_hole_op_right(),
            simplify_concat(),
            unary0(),
            unary1(),
            canonicalize(),
        ]);

        let and_instr =
            RecExpr::from_str("(instr (binop-ast and 8 (hole 8) (hole 8)) (canonical-args 0 1))")
                .unwrap();
        let sub_instr =
            RecExpr::from_str("(instr (binop-ast sub 8 (hole 8) (hole 8)) (canonical-args 0 1))")
                .unwrap();
        println!(
            "And appears: {} times",
            sample_instr_in_program(&runner.egraph, &and_instr, _bithack1_id, 1000)
        );
        println!(
            "Sub appears: {} times",
            sample_instr_in_program(&runner.egraph, &sub_instr, _bithack1_id, 1000)
        );
    }

    #[test_log::test]
    fn explore_many_programs() {
        let mut egraph: EGraph<Language, LanguageAnalysis> = EGraph::default();
        let mut ids = Vec::new();
        for (_, program) in example_programs::all_programs() {
            ids.push(egraph.add_expr(&program));
        }

        let runner = Runner::default()
            .with_egraph(egraph)
            .with_iter_limit(300)
            .run(&vec![
                introduce_hole_var(),
                fuse_op(),
                introduce_hole_op_both(),
                introduce_hole_op_left(),
                introduce_hole_op_right(),
                simplify_concat(),
                unary0(),
                unary1(),
                canonicalize(),
            ]);

        runner.print_report();

        // Ensure everything gets canonicalized. If you get errors in
        // extract_ast, it may be because not everything got canonicalized.
        let runner = Runner::default()
            .with_egraph(runner.egraph)
            .with_node_limit(1000000)
            .run(&vec![canonicalize()]);

        runner.print_report();

        let potential_isa_instrs: Vec<_> = find_isa_instructions(&runner.egraph);
        println!("{} potential ISA instructions.", potential_isa_instrs.len());

        // Each ID is one of the input programs; each instruction is a potential instruction.
        // histogram[id][instr] = number of times instr appears in a random impl of the program.
        let mut histogram: Vec<Vec<usize>> = vec![vec![0; potential_isa_instrs.len()]; ids.len()];

        const NUM_SAMPLES: usize = 10;

        for (id_i, id) in ids.iter().enumerate() {
            // TODO this is a hack.
            if extract_random(&runner.egraph, *id).as_ref().is_empty() {
                continue;
            }
            for _ in 0..NUM_SAMPLES {
                let mut tmp_egr: EGraph<Language, LanguageAnalysis> = EGraph::default();
                let mut random_impl = extract_random(&runner.egraph, *id);
                while random_impl.as_ref().is_empty() {
                    random_impl = extract_random(&runner.egraph, *id);
                }
                tmp_egr.add_expr(&random_impl);
                tmp_egr.rebuild();

                for (instr_i, (_, instr)) in potential_isa_instrs.iter().enumerate() {
                    //println!("is\n{}\nin\n{}", instr.pretty(80), random_impl.pretty(80));
                    if matches!(tmp_egr.lookup_expr(&instr), Some(_)) {
                        histogram[id_i][instr_i] = histogram[id_i][instr_i] + 1;
                    }
                }
            }
        }

        let mut histogram: Vec<_> = potential_isa_instrs
            .iter()
            .enumerate()
            .map(|(instr_i, (_, instr))| {
                let count = histogram
                    .iter()
                    .map(|l| l[instr_i])
                    .reduce(|a, b| a + b)
                    .unwrap();
                (instr, count)
            })
            .collect();
        histogram.sort_by_key(|v| v.1);
        println!("Top 25 most frequent instructions:");
        for (instr, count) in &histogram[histogram.len() - 25..] {
            println!(
                "Instruction\n{}\nappears {} times.",
                instr.pretty(1000),
                count
            );
        }
        panic!();
    }

    #[macro_export]
    macro_rules! interpreter_test {
        ($test_name:ident, $lakeroad_expr:expr, $env:expr, $expected:expr) => {
            #[test]
            fn $test_name() {
                let lakeroad_expr = $lakeroad_expr;
                let env = $env;
                let expected = $expected;
                let actual = interpret(
                    &lakeroad_expr,
                    &env,
                    (lakeroad_expr.as_ref().len() - 1).try_into().unwrap(),
                );
                assert_eq!(actual, expected);
            }
        };
    }

    interpreter_test!(
        test_interpret_var,
        "(var x 8)".parse().unwrap(),
        vec![("x".to_owned(), 0x12)].into_iter().collect(),
        Value::SignalValue(0x12, 8)
    );

    interpreter_test!(
        test_permuter_case_1,
        "(binop concat
         16
         (binop concat 8 (op3 extract 4 11 8 (var din 16)) (op3 extract 4 15 12 (var din 16)))
         (binop concat 8 (op3 extract 4 3 0 (var din 16)) (op3 extract 4 7 4 (var din 16))))"
            .parse()
            .unwrap(),
        vec![("din".to_owned(), 0xABCD)].into_iter().collect(),
        Value::SignalValue(0xBADC, 16)
    );

    interpreter_test!(
        test_extract_0,
        "(op3 extract 4 15 12 (var din 16))".parse().unwrap(),
        vec![("din".to_owned(), 0xABCD)].into_iter().collect(),
        Value::SignalValue(0xA, 4)
    );

    interpreter_test!(
        test_extract_1,
        "(op3 extract 4 11 8 (var din 16))".parse().unwrap(),
        vec![("din".to_owned(), 0xABCD)].into_iter().collect(),
        Value::SignalValue(0xB, 4)
    );

    interpreter_test!(
        test_extract_2,
        "(op3 extract 4 7 4 (var din 16))".parse().unwrap(),
        vec![("din".to_owned(), 0xABCD)].into_iter().collect(),
        Value::SignalValue(0xC, 4)
    );

    interpreter_test!(
        test_extract_3,
        "(op3 extract 4 3 0 (var din 16))".parse().unwrap(),
        vec![("din".to_owned(), 0xABCD)].into_iter().collect(),
        Value::SignalValue(0xD, 4)
    );

    /// Takes an initial expression and some rewrites to run. Runs checks on the
    /// resulting egraph.
    ///
    /// - initial_exprs: a Vector of RecExprs to add to the egraph initially.
    /// - rewrites: a Vector of rewrites to run on the egraph.
    /// - check_fn: a function that takes an egraph, plus a vector of the ids of
    ///   the initial exprs, and performs assertions.
    macro_rules! egraph_test {
        ($(#[$meta:meta])* $test_name:ident, $initial_exprs:expr, $rewrites:expr, $check_fn:expr) => {
            $(#[$meta])*
            #[test]
            fn $test_name() {
                let mut egraph = EGraph::<Language, LanguageAnalysis>::default();
                let ids: Vec<Id> = $initial_exprs
                    .iter()
                    .map(|expr| egraph.add_expr(&expr))
                    .collect();
                egraph.rebuild();
                let runner = Runner::default()
                    .with_egraph(egraph)
                    .with_node_limit(1000000)
                    .run(&$rewrites);
                $check_fn(runner.egraph, ids);
            }
        };
    }

    egraph_test!(
        test_ternary0,
        vec!["(op3 extract 4 15 12 (var din 16))".parse().unwrap(),],
        vec![ternary0(), canonicalize()],
        |egraph, ids: Vec<Id>| {
            assert!("(apply (instr (op3-ast extract 4 (hole hole-type-num) (hole hole-type-num) (hole (hole-type-bw 16))) (canonical-args 0 1 2)) ?args)".parse::<Pattern<_>>().unwrap().search_eclass(&egraph, ids[0]).is_some());
        }
    );

    // Panics because the third argument must be converted into an AST for the rewrite to fire.
    egraph_test!(
        #[should_panic = "assertion failed: \\\"(apply (instr (op3-ast"]
        test_ternary1_fail,
        vec!["(op3 extract 4 15 12 (var din 16))".parse().unwrap(),],
        vec![ternary1(), canonicalize()],
        |egraph, ids: Vec<Id>| {
            assert!("(apply (instr (op3-ast extract 4 (hole hole-type-num) (hole hole-type-num) (hole (hole-type-bw 16))) (canonical-args 0 1 2)) ?args)".parse::<Pattern<_>>().unwrap().search_eclass(&egraph, ids[0]).is_some());
        }
    );

    egraph_test!(
        test_ternary1,
        vec!["(op3 extract 4 15 12 (var din 16))".parse().unwrap(),],
        vec![introduce_hole_var(), ternary1(), canonicalize()],
        |egraph, ids: Vec<Id>| {
            assert!("(apply (instr (op3-ast extract 4 (hole hole-type-num) (hole hole-type-num) (hole (hole-type-bw 16))) (canonical-args 0 1 2)) ?args)".parse::<Pattern<_>>().unwrap().search_eclass(&egraph, ids[0]).is_some());
        }
    );

    egraph_test!(
        test_introduce_hole_num,
        vec!["23".parse().unwrap(),],
        vec![introduce_hole_num(), canonicalize()],
        |egraph, ids: Vec<Id>| {
            assert!(
                "(apply (instr (hole (hole-type-num)) (canonical-args 0)) (list 23))"
                    .parse::<Pattern<_>>()
                    .unwrap()
                    .search_eclass(&egraph, ids[0])
                    .is_some()
            );
        }
    );

    // Panics because the second argument must be converted into an AST for the rewrite to fire.
    egraph_test!(
        #[should_panic = "assertion failed: \\\"(apply (instr (op3-ast"]
        test_ternary2_fail,
        vec!["(op3 extract 4 15 12 (var din 16))".parse().unwrap(),],
        vec![ternary2(), canonicalize()],
        |egraph, ids: Vec<Id>| {
            assert!("(apply (instr (op3-ast extract 4 (hole hole-type-num) (hole hole-type-num) (hole (hole-type-bw 16))) (canonical-args 0 1 2)) ?args)".parse::<Pattern<_>>().unwrap().search_eclass(&egraph, ids[0]).is_some());
        }
    );

    egraph_test!(
        test_ternary2,
        vec!["(op3 extract 4 15 12 (var din 16))".parse().unwrap(),],
        vec![introduce_hole_num(), ternary2(), canonicalize()],
        |egraph, ids: Vec<Id>| {
            assert!("(apply (instr (op3-ast extract 4 (hole hole-type-num) (hole hole-type-num) (hole (hole-type-bw 16))) (canonical-args 0 1 2)) ?args)".parse::<Pattern<_>>().unwrap().search_eclass(&egraph, ids[0]).is_some());
        }
    );

    // Panics because the second and third arguments must be converted into an
    // AST for the rewrite to fire.
    egraph_test!(
        #[should_panic = "assertion failed: \\\"(apply (instr (op3-ast"]
        test_ternary3_fail,
        vec!["(op3 extract 4 15 12 (var din 16))".parse().unwrap(),],
        vec![ternary3(), canonicalize()],
        |egraph, ids: Vec<Id>| {
            assert!("(apply (instr (op3-ast extract 4 (hole hole-type-num) (hole hole-type-num) (hole (hole-type-bw 16))) (canonical-args 0 1 2)) ?args)".parse::<Pattern<_>>().unwrap().search_eclass(&egraph, ids[0]).is_some());
        }
    );

    egraph_test!(
        test_ternary3,
        vec!["(op3 extract 4 15 12 (var din 16))".parse().unwrap(),],
        vec![
            introduce_hole_num(),
            introduce_hole_var(),
            ternary3(),
            canonicalize()
        ],
        |egraph, ids: Vec<Id>| {
            assert!("(apply (instr (op3-ast extract 4 (hole hole-type-num) (hole hole-type-num) (hole (hole-type-bw 16))) (canonical-args 0 1 2)) ?args)".parse::<Pattern<_>>().unwrap().search_eclass(&egraph, ids[0]).is_some());
        }
    );

    egraph_test!(
        test_ternary4,
        vec!["(op3 extract 4 15 12 (var din 16))".parse().unwrap(),],
        vec![
            introduce_hole_num(),
            introduce_hole_var(),
            ternary4(),
            canonicalize()
        ],
        |egraph, ids: Vec<Id>| {
            assert!("(apply (instr (op3-ast extract 4 (hole hole-type-num) (hole hole-type-num) (hole (hole-type-bw 16))) (canonical-args 0 1 2)) ?args)".parse::<Pattern<_>>().unwrap().search_eclass(&egraph, ids[0]).is_some());
        }
    );

    egraph_test!(
        test_ternary5,
        vec!["(op3 extract 4 15 12 (var din 16))".parse().unwrap(),],
        vec![
            introduce_hole_num(),
            introduce_hole_var(),
            ternary5(),
            canonicalize()
        ],
        |egraph, ids: Vec<Id>| {
            assert!("(apply (instr (op3-ast extract 4 (hole hole-type-num) (hole hole-type-num) (hole (hole-type-bw 16))) (canonical-args 0 1 2)) ?args)".parse::<Pattern<_>>().unwrap().search_eclass(&egraph, ids[0]).is_some());
        }
    );

    egraph_test!(
        test_ternary6,
        vec!["(op3 extract 4 15 12 (var din 16))".parse().unwrap(),],
        vec![
            introduce_hole_num(),
            introduce_hole_var(),
            ternary6(),
            canonicalize()
        ],
        |egraph, ids: Vec<Id>| {
            assert!("(apply (instr (op3-ast extract 4 (hole hole-type-num) (hole hole-type-num) (hole (hole-type-bw 16))) (canonical-args 0 1 2)) ?args)".parse::<Pattern<_>>().unwrap().search_eclass(&egraph, ids[0]).is_some());
        }
    );

    egraph_test!(
        test_ternary7,
        vec!["(op3 extract 4 15 12 (var din 16))".parse().unwrap(),],
        vec![
            introduce_hole_num(),
            introduce_hole_var(),
            ternary7(),
            canonicalize()
        ],
        |egraph, ids: Vec<Id>| {
            assert!("(apply (instr (op3-ast extract 4 (hole hole-type-num) (hole hole-type-num) (hole (hole-type-bw 16))) (canonical-args 0 1 2)) ?args)".parse::<Pattern<_>>().unwrap().search_eclass(&egraph, ids[0]).is_some());
        }
    );
}
