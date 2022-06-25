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
    Language as LanguageTrait, Pattern, RecExpr, Rewrite, Searcher, Var,
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

pub fn introduce_hole_var() -> Rewrite<Language, LanguageAnalysis> {
    rewrite!("introduce-hole-var";
                "(var ?a ?bw)" =>
                "(apply (instr (hole ?bw) (canonicalize (list (var ?a ?bw)))) (list (var ?a ?bw)))")
}

// This shouldn't be called fusion. Or, more specifically, the next two rewrites
// are also fusion in different forms. So only labeling this rewrite as fusion
// is misleading.
pub fn fuse_op() -> Rewrite<Language, LanguageAnalysis> {
    rewrite!("fuse-op";
                "(binop ?op ?bw
                  (apply (instr ?ast0 ?canonical-args0) ?args0)
                  (apply (instr ?ast1 ?canonical-args1) ?args1))" => 
                "(apply
                  (instr (binop-ast ?op ?bw ?ast0 ?ast1) (canonicalize (concat ?args0 ?args1)))
                  (concat ?args0 ?args1))")
}

pub fn introduce_hole_op_left() -> Rewrite<Language, LanguageAnalysis> {
    rewrite!("introduce-hole-op-left";
                "(binop ?op ?bw
                  ?left
                  (apply (instr ?ast1 ?canonical-args1) ?args1))" => 
                "(apply 
                  (instr
                   (binop-ast ?op ?bw (hole ?bw) ?ast1)
                   (canonicalize (concat (list ?left) ?args1)))
                  (concat (list ?left) ?args1))")
}

pub fn introduce_hole_op_right() -> Rewrite<Language, LanguageAnalysis> {
    rewrite!("introduce-hole-op-right";
                "(binop ?op ?bw
                  (apply (instr ?ast0 ?canonical-args0) ?args0)
                  ?right)" => 
                "(apply 
                  (instr
                   (binop-ast ?op ?bw ?ast0 (hole ?bw))
                   (canonicalize (concat ?args0 (list ?right))))
                  (concat ?args0 (list ?right)))")
}

pub fn introduce_hole_op_both() -> Rewrite<Language, LanguageAnalysis> {
    rewrite!("introduce-hole-op-both";
                "(binop ?op ?bw
                  ?a
                  ?b)" => 
                "(apply 
                  (instr
                   (binop-ast ?op ?bw (hole ?bw) (hole ?bw))
                   (canonicalize
                    (list
                     ?a
                     ?b)))
                  (list
                   ?a
                   ?b))")
}

pub fn unary0() -> Rewrite<Language, LanguageAnalysis> {
    rewrite!("unary0";
                "(unop ?op ?bw (apply (instr ?ast ?canonical-args) ?args))" => 
                "(apply (instr (unop-ast ?op ?bw ?ast) (canonicalize ?args)) ?args)")
}

pub fn unary1() -> Rewrite<Language, LanguageAnalysis> {
    rewrite!("unary1";
                "(unop ?op ?bw (apply (instr ?ast ?canonical-args) ?args))" => 
                "(apply
                  (instr (unop-ast ?op ?bw (hole ?bw)) (canonicalize (list (apply (instr ?ast ?canonical-args) ?args))))
                  (list (apply (instr ?ast ?canonical-args) ?args)))")
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
                Language::Canonicalize(ids) | Language::Hole(ids) => ids.to_vec(),
                Language::CanonicalArgs(ids) | Language::List(ids) => ids.to_vec(),
                Language::Op(_) | Language::Num(_) | Language::String(_) => vec![],
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
                    Language::Apply(_) => true,
                    Language::Hole(_) => true,
                    Language::UnOpAst(_) => true,
                    Language::BinOpAst(_) => true,
                    Language::List(_) => true,
                    Language::Concat(_) => true,
                    Language::Canonicalize(_) => false,
                    Language::CanonicalArgs(_) => true,
                    Language::Instr(_) => true,
                    Language::Op(_) => true,
                    Language::Num(_) => true,
                    Language::String(_) => true,
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
    }
}
