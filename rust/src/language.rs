use std::{
    collections::HashMap,
    fmt::Display,
    io::Write,
    process::{Command, Stdio},
    str::FromStr,
};

use crate::language::LanguageAnalysisData::*;
use egg::{
    define_language, rewrite, Analysis, Applier, AstSize, DidMerge, EGraph, Extractor, Id, Pattern,
    RecExpr, Rewrite, Searcher, Var,
};
use rand::{distributions::Alphanumeric, Rng};
use rayon::prelude::*;

define_language! {
    pub enum Language {

        // (apply <f: func> <identifier: String> <value: concrete>)
        "apply" = Apply([Id; 3]),

        // (apply-new <ast: hole, or ops eventually leading to holes>
        //            <args: list>)
        "apply-new" = ApplyNew([Id; 2]),

        // (placeholder <name: String> <bitwidth: Num>)
        "placeholder" = Placeholder([Id; 2]),

        // Unary operator.
        // (unop <op: Op> <bitwidth: Num> <arg>)
        "unop" = UnOp([Id; 3]),

        // Binary operator.
        // (binop <op: Op> <bitwidth: Num> <arg0> <arg1>)
        "binop" = BinOp([Id; 4]),

        // Hole.
        // (hole <bitwidth: int>)
        "hole" = Hole([Id; 1]),

        "list" = List(Box<[Id]>),

        "concat" = Concat([Id;2]),

        // (<op> a b)
        "+'" = AddNew([Id; 2]),
        "-'" = SubNew([Id; 2]),
        "|'" = OrNew([Id; 2]),
        "&'" = AndNew([Id; 2]),
        "^'" = XorNew([Id; 2]),
        "asr'" = AlgebraicShiftRightNew([Id; 2]),

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
            _ => Err(()),
        }
    }
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
}
fn merge_args(
    args0: &HashMap<String, usize>,
    args1: &HashMap<String, usize>,
) -> HashMap<String, usize> {
    let mut out = args0.clone();
    for (name, bitwidth) in args1 {
        if out.contains_key(name) {
            assert_eq!(out[name], *bitwidth);
        } else {
            out.insert(name.clone(), *bitwidth);
        }
    }
    out
}
impl Analysis<Language> for LanguageAnalysis {
    type Data = LanguageAnalysisData;

    fn make(egraph: &EGraph<Language, Self>, enode: &Language) -> Self::Data {
        match enode {
            &Language::Placeholder([name_id, bitwidth_id]) => {
                let (name, bitwidth) = match (&egraph[name_id].data, &egraph[bitwidth_id].data) {
                    (_String(name), Num(bitwidth)) => (name, bitwidth),
                    _ => panic!(),
                };
                Function {
                    args: vec![(name.clone(), *bitwidth as usize)].drain(..).collect(),
                    ret: *bitwidth as usize,
                }
            }
            &Language::AddNew([a_id, b_id])
            | &Language::SubNew([a_id, b_id])
            | &Language::OrNew([a_id, b_id])
            | &Language::AndNew([a_id, b_id])
            | &Language::XorNew([a_id, b_id])
            | &Language::AlgebraicShiftRightNew([a_id, b_id]) => {
                match (&egraph[a_id].data, &egraph[b_id].data) {
                    (
                        Function {
                            args: args0,
                            ret: ret0,
                        },
                        Function {
                            args: args1,
                            ret: ret1,
                        },
                    ) => {
                        assert_eq!(ret0, ret1, "bitwidths must match");
                        Function {
                            args: merge_args(args0, args1),
                            ret: *ret0,
                        }
                    }
                    _ => panic!(),
                }
            }
            &Language::Apply([f_id, identifier_id, value_id]) => match (
                &egraph[f_id].data,
                &egraph[identifier_id].data,
                &egraph[value_id].data,
            ) {
                (Function { args, ret }, _String(identifier), Signal(arg_bitwidth)) => {
                    let mut args = args.clone();
                    assert!(!args.is_empty());
                    assert!(args.contains_key(identifier));
                    assert_eq!(args[identifier] /* bw of placeholder */, *arg_bitwidth);
                    args.remove(identifier).unwrap();

                    if args.is_empty() {
                        // Function is fully applied! Return a concrete value.
                        Signal(*ret)
                    } else {
                        // Function isn't yet fully applied; return a new Function.
                        Function { args, ret: *ret }
                    }
                }
                (
                    Function {
                        args: args0,
                        ret: ret0,
                    },
                    _String(identifier),
                    Function {
                        args: args1,
                        ret: ret1,
                    },
                ) => {
                    // Here, we're replacing a placeholder in a function with
                    // another function. To do so, we need to make sure that the
                    // function's return is the same as the placeholder. Then,
                    // we "prepend" the args0 list with the args1 list. This can
                    // be achieved by removing the first arg of args0 to make
                    // args0', and then merging args1 and args0' (in that
                    // order.)
                    assert!(!args0.is_empty());
                    assert_eq!(args0[identifier], *ret1);
                    // TODO(@gussmith23) Unnecessary copying.
                    let mut args0_new = args0.clone();
                    args0_new.remove(identifier).unwrap();
                    let args = merge_args(&args0_new, args1);

                    Function { args, ret: *ret0 }
                }
                _ => panic!(),
            },

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
            &Language::BinOp([op_id, bitwidth_id, a_id, b_id]) => {
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
            &Language::UnOp([op_id, bitwidth_id, arg_id]) => {
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
            &Language::ApplyNew([ast_id, _args_id]) => match &egraph[ast_id].data {
                s @ Signal(_) => s.clone(),
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
        Language::Apply(_) => todo!(),
        Language::ApplyNew(_) => todo!(),
        Language::Placeholder(_) => todo!(),
        Language::BinOp([op_id, _bw_id, a_id, b_id]) => Some(format!(
            "({op} {a} {b})",
            op = match &expr[op_id] {
                Language::Op(op) => match op {
                    Op::And => "bvand",
                    Op::Or => "bvor",
                    Op::Sub => "bvsub",
                    Op::Xor => "bvxor",
                    _ => panic!(),
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
                    _ => panic!(),
                },
                _ => panic!(),
            },
            a = to_racket_helper(expr, arg_id, map).unwrap(),
        )),
        Language::Hole(_) => todo!(),
        Language::List(_) => todo!(),
        Language::Concat(_) => todo!(),
        Language::AddNew(_) => todo!(),
        Language::SubNew(_) => todo!(),
        Language::OrNew(_) => todo!(),
        Language::AndNew(_) => todo!(),
        Language::XorNew(_) => todo!(),
        Language::AlgebraicShiftRightNew(_) => todo!(),
        Language::Op(_) => todo!(),
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

pub fn rewrite_left() -> Rewrite<Language, LanguageAnalysis> {
    struct Impl(Var);
    impl Applier<Language, LanguageAnalysis> for Impl {
        fn apply_one(
            &self,
            egraph: &mut EGraph<Language, LanguageAnalysis>,
            eclass: Id,
            subst: &egg::Subst,
            searcher_ast: Option<&egg::PatternAst<Language>>,
            rule_name: egg::Symbol,
        ) -> Vec<Id> {
            let bw = match &egraph[subst[self.0]].data {
                Function { ret, .. } => ret,
                Signal(bw) => bw,
                _ => panic!(),
            };
            format!(
                "(apply (&' (placeholder {name} {bw}) ?b) {name} {var})",
                name = rand::thread_rng()
                    .sample_iter(&Alphanumeric)
                    .take(7)
                    .map(char::from)
                    .collect::<String>(),
                bw = bw,
                var = self.0.to_string()
            )
            .parse::<Pattern<_>>()
            .unwrap()
            .apply_one(egraph, eclass, subst, searcher_ast, rule_name)
        }
    }
    let v: Var = "?a".parse().unwrap();
    rewrite!("rewrite";
        {format!("(&' {} ?b)", v.to_string()).parse::<Pattern<_>>().unwrap() } => { Impl(v) }
    )
}
pub fn rewrite_right() -> Rewrite<Language, LanguageAnalysis> {
    struct Impl(Var);
    impl Applier<Language, LanguageAnalysis> for Impl {
        fn apply_one(
            &self,
            egraph: &mut EGraph<Language, LanguageAnalysis>,
            eclass: Id,
            subst: &egg::Subst,
            searcher_ast: Option<&egg::PatternAst<Language>>,
            rule_name: egg::Symbol,
        ) -> Vec<Id> {
            let bw = match &egraph[subst[self.0]].data {
                Function { ret, .. } => ret,
                Signal(bw) => bw,
                _ => panic!(),
            };
            format!(
                "(apply (&' ?a (placeholder {name} {bw})) {name} {var})",
                name = rand::thread_rng()
                    .sample_iter(&Alphanumeric)
                    .take(7)
                    .map(char::from)
                    .collect::<String>(),
                bw = bw,
                var = self.0.to_string()
            )
            .parse::<Pattern<_>>()
            .unwrap()
            .apply_one(egraph, eclass, subst, searcher_ast, rule_name)
        }
    }
    let v: Var = "?b".parse().unwrap();
    rewrite!("rewrite-right";
        {format!("(&' ?a {})", v.to_string()).parse::<Pattern<_>>().unwrap() } => { Impl(v) }
    )
}

pub fn introduce_hole_var() -> Rewrite<Language, LanguageAnalysis> {
    rewrite!("introduce-hole-var";
                "(var ?a ?bw)" => "(apply-new (hole ?bw) (list (var ?a ?bw)))")
}

// This shouldn't be called fusion. Or, more specifically, the next two rewrites
// are also fusion in different forms. So only labeling this rewrite as fusion
// is misleading.
pub fn fuse_op() -> Rewrite<Language, LanguageAnalysis> {
    rewrite!("fuse-op";
                "(binop ?op ?bw (apply-new ?ast0 ?args0) (apply-new ?ast1 ?args1))" => 
                "(apply-new (binop ?op ?bw ?ast0 ?ast1) (concat ?args0 ?args1))")
}

pub fn introduce_hole_op_left() -> Rewrite<Language, LanguageAnalysis> {
    rewrite!("introduce-hole-op-left";
                "(binop ?op ?bw (apply-new ?ast0 ?args0) (apply-new ?ast1 ?args1))" => 
                "(apply-new (binop ?op ?bw (hole ?bw) ?ast1) (concat (list (apply-new ?ast0 ?args0)) ?args1))")
}

pub fn introduce_hole_op_right() -> Rewrite<Language, LanguageAnalysis> {
    rewrite!("introduce-hole-op-right";
                "(binop ?op ?bw (apply-new ?ast0 ?args0) (apply-new ?ast1 ?args1))" => 
                "(apply-new (binop ?op ?bw ?ast0 (hole ?bw)) (concat ?args0 (list (apply-new ?ast1 ?args1))))")
}

pub fn introduce_hole_op_both() -> Rewrite<Language, LanguageAnalysis> {
    rewrite!("introduce-hole-op-both";
                "(binop ?op ?bw (apply-new ?ast0 ?args0) (apply-new ?ast1 ?args1))" => 
                "(apply-new (binop ?op ?bw (hole ?bw) (hole ?bw)) (list (apply-new ?ast0 ?args0) (apply-new ?ast1 ?args1)))")
}

pub fn unary0() -> Rewrite<Language, LanguageAnalysis> {
    rewrite!("unary0";
                "(unop ?op ?bw (apply-new ?ast ?args))" => 
                "(apply-new (unop ?op ?bw ?ast) ?args)")
}

pub fn unary1() -> Rewrite<Language, LanguageAnalysis> {
    rewrite!("unary1";
                "(unop ?op ?bw (apply-new ?ast ?args))" => 
                "(apply-new (unop ?op ?bw (hole ?bw)) (list (apply-new ?ast ?args)))")
}

fn extract_ast(
    egraph: &EGraph<Language, LanguageAnalysis>,
    ast_id: Id,
    list_id: Id,
) -> RecExpr<Language> {
    let mut expr = RecExpr::default();
    let mut args = match &egraph[list_id].data {
        List(v) => Vec::from(v.clone()),
        _ => panic!(),
    };
    extract_ast_helper(egraph, ast_id, &mut expr, &mut args);
    expr
}

/// args: a mutable list of the args to be swapped in for each hole, in
/// sequential order, assuming we traverse to the holes depth-first,
/// left-to-right.
fn extract_ast_helper(
    egraph: &EGraph<Language, LanguageAnalysis>,
    id: Id,
    expr: &mut RecExpr<Language>,
    args: &mut Vec<Id>,
) -> Id {
    match {
        assert_eq!(egraph[id].nodes.len(), 1);
        &egraph[id].nodes[0]
    } {
        Language::Op(op) => expr.add(Language::Op(op.clone())),
        &Language::BinOp([op_id, bw_id, a_id, b_id]) => {
            let new_op_id = extract_ast_helper(egraph, op_id, expr, args);
            let new_bw_id = extract_ast_helper(egraph, bw_id, expr, args);
            let new_a_id = extract_ast_helper(egraph, a_id, expr, args);
            let new_b_id = extract_ast_helper(egraph, b_id, expr, args);
            expr.add(Language::BinOp([new_op_id, new_bw_id, new_a_id, new_b_id]))
        }
        &Language::UnOp([op_id, bw_id, arg_id]) => {
            let new_op_id = extract_ast_helper(egraph, op_id, expr, args);
            let new_bw_id = extract_ast_helper(egraph, bw_id, expr, args);
            let new_arg_id = extract_ast_helper(egraph, arg_id, expr, args);
            expr.add(Language::UnOp([new_op_id, new_bw_id, new_arg_id]))
        }
        &Language::Hole([bw_id]) => {
            let new_bw_id = extract_ast_helper(egraph, bw_id, expr, args);
            assert!(!args.is_empty());
            let arg_id = args.remove(0);
            // let var_nodes = egraph[arg_id]
            //     .nodes
            //     .iter()
            //     .filter(|v| match v {
            //         Language::ApplyNew(_) => false,
            //         Language::BinOp(_) => false,
            //         Language::Var(_) => true,
            //         _ => panic!(),
            //     })
            //     .collect::<Vec<_>>();
            // let binop_nodes = egraph[arg_id]
            //     .nodes
            //     .iter()
            //     .filter(|v| match v {
            //         Language::ApplyNew(_) => false,
            //         Language::BinOp(_) => true,
            //         Language::Var(_) => false,
            //         _ => panic!(),
            //     })
            //     .collect::<Vec<_>>();

            // The arg should either be a binop or a var. It shouldn't be both
            // or neither. Note: this is probably wrong, especially once we add
            // rewrites which simplify binops to vars. E.g. (and a a) => a. So
            // this will probably fail soon. It's probably just simpler to
            // search for a var and use it if it's found, and to otherwise
            // create a new var, and just not worry about the binops at all.
            // Still not sure what to do in the case of multiple vars being
            // found. The vars are equal, so I guess we could just pick a
            // canonical var? e.g. lexicographically by name?
            // assert!(
            //     (var_nodes.is_empty() && !binop_nodes.is_empty())
            //         || (!var_nodes.is_empty() && binop_nodes.is_empty())
            // );

            // Actually, after typing all of that, I just decided to implement
            // it. Idk if it's right, but it's much simpler. So the new idea is:
            // there are three cases: there's no var, there's a single var,
            // there's multiple vars. If there's no var, we create a fresh one
            // with a random string. If there's one var, we use it. If there's
            // multiple vars, they've all been proven to be equal, so we take
            // the canonical var of them, which we define as the one with
            // lexicographically the "minimum" name.
            let mut var_names = egraph[arg_id]
                .nodes
                .iter()
                .filter_map(|v| match v {
                    Language::ApplyNew(_) => None,
                    Language::BinOp(_) => None,
                    &Language::Var([name_id, _]) => match &egraph[name_id].data {
                        _String(s) => Some(s.clone()),
                        _ => panic!(),
                    },
                    _ => panic!(),
                })
                .collect::<Vec<_>>();

            let name = if !var_names.is_empty() {
                var_names.sort();
                var_names[0].clone()
            } else {
                format!("var_from_eclass_{}", arg_id)
            };

            let name_id = expr.add(Language::String(name));
            expr.add(Language::Var([name_id, new_bw_id]))
        }
        &Language::Num(v) => expr.add(Language::Num(v)),
        _ => panic!(),
    }
}

pub fn find_isa_instructions(
    egraph: &EGraph<Language, LanguageAnalysis>,
) -> Vec<RecExpr<Language>> {
    let mut out = Vec::default();
    let ast_var: Var = "?ast".parse().unwrap();
    let list_var: Var = "?list".parse().unwrap();
    for search_match in format!(
        "(apply-new {} {})",
        ast_var.to_string(),
        list_var.to_string()
    )
    .parse::<Pattern<_>>()
    .unwrap()
    .search(egraph)
    {
        for subst in search_match.substs {
            let ast_id = subst[ast_var];
            let list_id = subst[list_var];
            out.push(extract_ast(egraph, ast_id, list_id));
        }
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

#[cfg(test)]
mod tests {
    use std::str::FromStr;

    use egg::{RecExpr, Runner};

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

    #[test]
    fn apply() {
        let mut egraph: EGraph<Language, LanguageAnalysis> = EGraph::default();
        let id = egraph.add_expr(
            &RecExpr::from_str(
                "
(apply
 (&' 
  (placeholder a 8)
  (|' (placeholder b 8) (placeholder a 8)))
 a
 (var x 8)
)
",
            )
            .unwrap(),
        );

        match &egraph[id].data {
            Function { args, ret } => {
                assert_eq!(*args, [("b".to_string(), 8)].into_iter().collect());
                assert_eq!(*ret, 8);
            }
            _ => panic!(),
        }

        let id = egraph.add_expr(
            &RecExpr::from_str(
                "
(apply
 (apply
  (&' 
   (placeholder a 8)
   (|' (placeholder b 8) (placeholder a 8)))
  a
  (var x 8)
 )
 b
 (var y 8)
)
",
            )
            .unwrap(),
        );

        match &egraph[id].data {
            Signal(bw) => {
                assert_eq!(*bw, 8);
            }
            _ => panic!(),
        }
    }

    #[test]
    fn apply_fn_to_fn() {
        let mut egraph: EGraph<Language, LanguageAnalysis> = EGraph::default();
        let id = egraph.add_expr(
            &RecExpr::from_str(
                "
(apply
 (&' 
  (placeholder a 8)
  (|' (placeholder b 8) (placeholder a 8)))
 a
 (|' (placeholder c 8) (placeholder b 8))
)
",
            )
            .unwrap(),
        );

        match &egraph[id].data {
            Function { args, ret } => {
                assert_eq!(
                    *args,
                    [("c".to_string(), 8), ("b".to_string(), 8)]
                        .into_iter()
                        .collect()
                );
                assert_eq!(*ret, 8);
            }
            _ => panic!(),
        }

        let id = egraph.add_expr(
            &RecExpr::from_str(
                "
(apply
 (apply
  (&' 
   (placeholder a 8)
   (|' (placeholder b 8) (placeholder a 8)))
  a
  (|' (placeholder c 8) (placeholder b 8))
 )
 c
 (var y 8)
)
",
            )
            .unwrap(),
        );

        match &egraph[id].data {
            Function { args, ret } => {
                assert_eq!(*args, [("b".to_string(), 8)].into_iter().collect());
                assert_eq!(*ret, 8);
            }
            _ => panic!(),
        }
    }

    #[test_log::test]
    fn rewrite() {
        let mut egraph: EGraph<Language, LanguageAnalysis> = EGraph::default();
        let _id = egraph.add_expr(
            &RecExpr::from_str(
                "
(apply
 (&' 
  (placeholder a 8)
  (|' (placeholder b 8) (placeholder a 8)))
 a
 (|' (placeholder c 8) (placeholder b 8))
)
",
            )
            .unwrap(),
        );

        let _runner = Runner::default()
            .with_egraph(egraph)
            .run(vec![&rewrite_left(), &rewrite_right()]);
    }

    #[test_log::test]
    fn rewrite_new() {
        let mut egraph: EGraph<Language, LanguageAnalysis> = EGraph::default();
        let _id = egraph.add_expr(
            &RecExpr::from_str(
                "
(binop and 8 (var a 8) (binop or 8 (var b 8) (var a 8)))
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
        ]);

        let isa_instrs: Vec<_> = find_isa_instructions(&runner.egraph)
            .par_iter()
            .filter(|expr| {
                if let (Some(racket_str), map) = to_racket(&expr, (expr.as_ref().len() - 1).into())
                {
                    println!("Attempting: {}", racket_str);
                    call_racket(racket_str, &map)
                } else {
                    false
                }
            })
            .cloned()
            .collect();

        println!("ISA:");
        isa_instrs
            .iter()
            .for_each(|v| println!("{}", to_racket(v, (v.as_ref().len() - 1).into()).0.unwrap()));
    }

    #[test_log::test]
    fn explore_three_expressions() {
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
        ]);

        let isa_instrs: Vec<_> = find_isa_instructions(&runner.egraph)
            .par_iter()
            .filter(|expr| {
                if let (Some(racket_str), map) = to_racket(&expr, (expr.as_ref().len() - 1).into())
                {
                    println!("Attempting: {}", racket_str);
                    call_racket(racket_str, &map)
                } else {
                    false
                }
            })
            .cloned()
            .collect();

        println!("ISA:");
        isa_instrs
            .iter()
            .for_each(|v| println!("{}", to_racket(v, (v.as_ref().len() - 1).into()).0.unwrap()));
    }
}
