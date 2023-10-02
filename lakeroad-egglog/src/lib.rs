use std::{collections::HashMap, default};

use egglog::{ast::Literal, Term, TermDag};

pub fn to_verilog(term_dag: &TermDag, term: &Term) -> String {
    // let mut wires = HashMap::default();

    fn recursive_helper(term_dag: &TermDag, term: &Term) -> String {
        match term {
            Term::Lit(_) => todo!(),
            Term::Var(_) => todo!(),
            Term::App(s, v) => match (s.as_str(), v.as_slice()) {
                ("Reg", [default_id, clk_id, d_id]) => {
                    let _default_val = match term_dag.get(*default_id) {
                        Term::Lit(Literal::Int(default_val)) => default_val,
                        _ => panic!(),
                    };

                    let clk = recursive_helper(term_dag, &term_dag.get(*clk_id));
                    let d = recursive_helper(term_dag, &term_dag.get(*d_id));

                    todo!()
                }
                ("Var", [name_id, bw_id]) => {
                    let _name = match term_dag.get(*name_id) {
                        Term::Lit(Literal::String(name)) => name,
                        _ => panic!(),
                    };
                    let _bw = match term_dag.get(*bw_id) {
                        Term::Lit(Literal::Int(bw)) => bw,
                        _ => panic!(),
                    };

                    "TODO".to_owned()
                }
                _ => todo!("{:?}", (s, v)),
            },
        }
    }

    recursive_helper(term_dag, term);

    todo!()
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn it_works() {}
}
