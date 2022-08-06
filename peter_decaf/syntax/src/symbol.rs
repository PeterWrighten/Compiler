use common::{Loc, HashMap};

#[derive(Copy, Clone)]
pub enum Symbol<'a> {
    Var(&'a VarDef<'a>),
    Func(&'a FuncDef<'a>),
    This(&'a FuncDef<'a>),
    Class(&'a ClassDef<'a>),
}

impl<'a> Symbol<'a> {
    pub fn name(&self) -> &'a str {
        match self {
            Symbol::Var(v) => v.name(),
            Symbol::Func(f) => f.name(),
            Symbol::This(_) => "this",
            Symbol::Class(c) => c.name(),
        }
    }
}