use egg::*;

define_language! {
    enum Lang {
        // name, bitwidth
        "input" = Input([Id; 2]),

        "and" = And([Id; 2]),

        "concat" = Concat([Id; 2]),

        "bvtake" = BvTake([Id; 2]),
        "bvdrop" = BvDrop([Id; 2]),

        // Represents a template of an op applied to two arguments.
        "some-op" = SomeOp([Id; 2]),

        Num(i64),
        String(String),
    }
}


fn introduce_hole_var() -> Rewrite<Language, LanguageAnalysis> {
    rewrite!("make-bitwise";
                "(and ?a ?b)" =>
                "(concat (some-op (bvtake 1 ?a) (bvtake 1 ?b)) (and (bvdrop 1 ?a) (bvdrop 1 ?b)))")
}

#[cfg(test)]
mod tests {
    use super::*;
    use std::str::FromStr;
    
    #[test]
    fn it_works() {
    let _out: RecExpr<Lang> = RecExpr::from_str("(input a 2)").unwrap();
    }
}
