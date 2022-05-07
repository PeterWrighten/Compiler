use lalrpop_util::lalrpop_mod;
use std::env::args;
use std::fs::read_to_string;
use std::io::Result;

lalrpop_mod!(peter);
fn main() -> Result<()> {
    let mut args = args();
    args.next();
    let mode = args.next().unwrap();
    let input = args.next().unwrap();
    args.next();
    let output = args.next().unwrap();

    let input = read_to_string(input)?;
    let ast = peter::CompUnitParser::new().parse(&input).unwrap();

    println!("{}", ast);
    Ok(())
}