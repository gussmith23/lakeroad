use std::{collections::HashMap, ops::Add};

use lexpr::parse::Error;

#[derive(Debug, PartialEq)]
pub enum Expr {
    Add(Box<Expr>, Box<Expr>),
    On(Box<Expr>, Box<Expr>),
    Event(EventValue),
    Num(i64),
    Wire(String),
    Reg(String),
}

#[derive(Debug, PartialEq)]
pub enum EventValue {
    Posedge(Box<Expr>),
}

pub fn parse(input: &str) -> Result<Expr, Error> {
    let v = lexpr::from_str(&input)?;

    fn recursive_helper(v: lexpr::Value) -> Expr {
        match v {
            lexpr::Value::Number(v) => Expr::Num(v.as_i64().unwrap()),
            lexpr::Value::Cons(v) => {
                let mut v = v.into_iter();
                let head = v.next().unwrap();
                match head {
                    (lexpr::Value::Symbol(s), None) => match &*s {
                        "add" => {
                            let left = v.next().unwrap().0;
                            let right = v.next().unwrap().0;
                            Expr::Add(
                                Box::new(recursive_helper(left)),
                                Box::new(recursive_helper(right)),
                            )
                        }
                        "on" => {
                            let event = v.next().unwrap().0;
                            let expr = v.next().unwrap().0;
                            Expr::On(
                                Box::new(recursive_helper(event)),
                                Box::new(recursive_helper(expr)),
                            )
                        }
                        "posedge" => {
                            let signal = v.next().unwrap().0;
                            Expr::Event(EventValue::Posedge(Box::new(recursive_helper(signal))))
                        }
                        "wire" => {
                            let name = v.next().unwrap().0.as_symbol().unwrap().to_owned();
                            Expr::Wire(name)
                        }
                        _ => panic!("Unknown symbol {}", s),
                    },
                    _ => panic!("Expected symbol"),
                }
            }
            _ => panic!("Expected cons"),
        }
    }

    Ok(recursive_helper(v))
}

#[derive(Clone, PartialEq, Debug)]
pub enum SignalValue {
    //Z,
    X,
    Num(i64),
}

impl Add for SignalValue {
    type Output = SignalValue;

    fn add(self, rhs: Self) -> Self::Output {
        match (self, rhs) {
            (SignalValue::Num(a), SignalValue::Num(b)) => SignalValue::Num(a + b),
            (SignalValue::X, _) | (_, SignalValue::X) => SignalValue::X,
        }
    }
}

/// The monadic (I'm not sure if I'm using that term correctly) Signal type
/// represents Signal values in Churchroad expressions. Generally, Churchroad
/// expressions can be thought of as representing hardware designs. Expressions
/// evaluate to signal values. Signal values are just as you'd expect in Verilog
/// (4-valued bitvectors), with the added fact that they carry around the state
/// of the context in which they were produced; state being the values of all of
/// the registers.
#[derive(Clone, PartialEq, Debug)]
pub struct SignalM {
    value: SignalValue,
    state: HashMap<String, SignalValue>,
}

impl From<SignalValue> for SignalM {
    fn from(v: SignalValue) -> Self {
        SignalM {
            value: v,
            state: HashMap::new(),
        }
    }
}

#[derive(Clone, Copy, PartialEq, Debug)]
pub enum Time {
    NS(i64),
}

impl PartialOrd for Time {
    fn partial_cmp(&self, other: &Self) -> Option<std::cmp::Ordering> {
        match (self, other) {
            (Time::NS(a), Time::NS(b)) => a.partial_cmp(b),
        }
    }
}

/// Time and value at that time.
type Event = (Time, SignalValue);

/// A sequence of events, where an event is a signal changing its value.
pub type Sequence = Vec<Event>;

// To evaluate the value of an expression, we just need to evaluate the
// expression

// We can evaluate an expression for a single set of inputs, and for a sequence
// of inputs. For a single set of inputs, we can just evaluate the expression as
// you expect. For a sequence of inputs, we need to evaluate the expression for
// each unique set of inputs.

/// Sort a sequence.
pub fn sort_sequence(seq: &Sequence) -> Sequence {
    let mut seq = (*seq).clone();
    seq.sort_by(|a, b| {
        let a = match a.0 {
            Time::NS(v) => v,
        };
        let b = match b.0 {
            Time::NS(v) => v,
        };
        a.cmp(&b)
    });

    seq
}

// Is interpret_stream just the implementation of `interpret` for `on` expressions?
// No, I don't think so.
pub fn interpret_stream(expr: &Expr, env: &HashMap<String, Sequence>) -> Sequence {
    // Join all sequences together.

    let mut all_events: Vec<_> = env
        .iter()
        .flat_map(|(signal_name, sequence)| {
            sequence
                .iter()
                .map(|(time, v)| (signal_name.to_owned(), time, v))
        })
        .collect();

    all_events.sort_by(|a, b| a.1.partial_cmp(&b.1).unwrap());

    // Naive interpretation implementation. Simply run the interpreter at each
    // new event. In the future, an easy optimization we will need to implement:
    // events can happen at the same time. These events can all be grouped and
    // the interpreter can be called just once for them.

    // Maps signals to their current values.
    let mut signal_value_map: HashMap<String, SignalValue> = env
        .keys()
        .map(|v| (v.to_owned(), SignalValue::X.into()))
        .collect();

    let mut out: Sequence = Vec::new();

    for (signal_name, time, value) in all_events {
        signal_value_map.insert(signal_name, (*value).clone().into());
        // Ah! At this point, this needs to return an entirely new env. Which
        // means we probably need to use the monadic signal type that I've been
        // using in Rosette.
        let tmp = interpret(expr, &signal_value_map);
        for (k, v) in tmp.state.iter() {
            signal_value_map.insert(k.to_owned(), v.clone());
        }
        out.push((*time, tmp.value));
    }

    out
}

/// Interpret an expression for a single set of inputs (not a sequence of
/// inputs).
pub fn interpret(expr: &Expr, env: &HashMap<String, SignalValue>) -> SignalM {
    fn recursive_helper(expr: &Expr, env: &HashMap<String, SignalValue>) -> SignalM {
        match expr {
            Expr::Add(left, right) => {
                (recursive_helper(left, &env).value + recursive_helper(right, &env).value).into()
            }
            Expr::Num(n) => SignalValue::Num(*n).into(),
            Expr::Wire(name) | Expr::Reg(name) => env
                .get(name)
                .expect(&format!("Expected key {} in {:#?}.", name, env))
                .clone()
                .into(),
            _ => unimplemented!(),
        }
    }
    return recursive_helper(expr, env);
}

#[cfg(test)]
mod tests {
    use super::EventValue::*;
    use super::Expr::*;
    use super::*;

    macro_rules! parse_test {
        ($name:ident, $expr_str:expr, $expr_obj:expr) => {
            #[test]
            fn $name() {
                let result = parse($expr_str);
                assert_eq!(result.unwrap(), $expr_obj);
            }
        };
    }

    macro_rules! interpret_test {
        ($name:ident, $expr_str:expr,  $env: expr, $value: expr) => {
            #[test]
            fn $name() {
                let result = interpret(&parse($expr_str).unwrap(), $env);
                assert_eq!(result, $value);
            }
        };
        ($name:ident, $expr_str:expr, $value: expr) => {
            interpret_test!($name, $expr_str, &HashMap::new(), $value);
        };
    }

    /// - env: Maps signal names to [`Sequence`]s.
    macro_rules! interpret_stream_test {
        ($name:ident, $expr_str:expr,  $env: expr, $value: expr) => {
            #[test]
            fn $name() {
                let env: HashMap<String, Sequence> = $env;
                let result = interpret_stream(&parse($expr_str).unwrap(), &env);
                assert_eq!(result, $value);
            }
        };
    }

    parse_test!(
        parse_add,
        "(add 2 2)",
        Add(Box::new(Num(2)), Box::new(Num(2)))
    );

    parse_test!(
        parse_on,
        "(on (posedge (wire clk)) (add (wire a) (wire b)))",
        On(
            Box::new(Event(Posedge(Box::new(Wire("clk".to_owned()))))),
            Box::new(Add(
                Box::new(Wire("a".to_owned())),
                Box::new(Wire("b".to_owned()))
            ))
        )
    );

    interpret_test!(
        interpret_add_consts,
        "(add 2 2)",
        SignalValue::Num(4).into()
    );

    interpret_test!(
        interpret_add,
        "(add (wire a) (wire b))",
        &{
            let mut env = HashMap::new();
            env.insert("a".to_owned(), SignalValue::Num(2).into());
            env.insert("b".to_owned(), SignalValue::Num(2).into());
            env
        },
        SignalValue::Num(4).into()
    );

    interpret_stream_test!(
        interpret_add_sequence,
        "(add (wire a) (wire b))",
        {
            let mut env = HashMap::new();
            env.insert("a".to_owned(), vec![(Time::NS(0), SignalValue::Num(2))]);
            env.insert("b".to_owned(), vec![(Time::NS(1), SignalValue::Num(3))]);
            env
        },
        vec![
            (Time::NS(0), SignalValue::X),
            (Time::NS(1), SignalValue::Num(5))
        ]
    );

    interpret_stream_test!(
        interpret_on_posedge_clk_sequence,
        "(on (posedge (wire clk)) 2)",
        {
            let mut env = HashMap::new();
            env.insert("clk".to_owned(), vec![(Time::NS(0), SignalValue::Num(0))]);
            env.insert("clk".to_owned(), vec![(Time::NS(1), SignalValue::Num(1))]);
            env.insert("clk".to_owned(), vec![(Time::NS(2), SignalValue::Num(0))]);
            env.insert("clk".to_owned(), vec![(Time::NS(3), SignalValue::Num(1))]);
            env
        },
        vec![
            (Time::NS(1), SignalValue::Num(1)),
            (Time::NS(3), SignalValue::Num(1)),
        ]
    );
}
