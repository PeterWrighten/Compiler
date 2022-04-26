# My Design About Compiler

## Prerequisites
- Koopa IR (Simplified LLVM IR)
    - typed IR
    - SSA (Static Single Assignment) formed IR

- RISC-V

# Lecture 1: `main` and `return`

- Structure
    - Frontend: Lexical and Syntax Parsing, `source` -> `AST`,check semantics error.
    - Mid: `AST` -> `IR`, Opt(Machine Independent)
    - Backend: `IR` -> `ASM`, Opt(Machine dependent)

- lexical/ Syntax Parsing
    - Lexical Parsing: `byte stream` --lexer--> `token stream` --parser--> `AST`
        - EX(Token types):
        ```c
        int main() {
            return 0;
        }
        /* keyword: int
        * identifier: main
        * bound: (
        * bound: )
        * block: {
        * keyword: return
        * integer: 0
        * bound: ;
        * bound: }
        */
        ```
    - Parser: `token stream` --> `AST`, Parsing based on Semamtics rule. (Algorithm: LL, LR) <-- Lecture 2  in my college course.
        - EX(AST):(In SICP)
        ```c
        CompUnit { # Non-Terminal Symbol
            items: [
                FuncDef {
                    type: "int", 
                    name: "main",
                    params: [],
                    body: Block {
                        stmts: [
                            Return {
                                value: 0
                            }
                        ]
                    }
                }
            ]
        }
        ```
    - Semantic Analysis: Build Symbol Table --> Type checking and inference --> Calculation in Compilation.

    - IR Generation: Decoupling(LLVM IR & Koopa IR)
        ```
        decl @getint(): i32

        fun @main(): i32 {
        %entry:
            @x = call @getint()
            %cond = lt @x, 10
            br %cond, %then, %else

        %then:
            %0 = add %x, 1
            jump %end(%0)

        %else:
            %1 = mul %x, 4
            jump %end(%1)

        %end(%result: i32):
            ret %result
        }
        ```
    - Target Codgen: ISA Selection --> Reg Alloc --> ISA Schedule.

- Intro to Lexical and Grammar/Syntax
    - Syntax Notation: EBNF, RegularExpression, Gradient Descent. We would focus on EBNF in this part.
    - EX(EBNF):
    ```c
    int main() {
        return 0;
    }
    /* CompUnit ::= FuncDef;
     * 
     * FuncDef ::= FuncType IDENT "(" ")" Block;
     * FuncType ::= "int";
     * 
     * Block ::= "{" Stmt "}";
     * Stmt ::= "return" Number ";";
     * Number ::= INT_CONST;
     */
    ```
    - Lexical Conventions:
    ```
    identifier ::= identifier-nondigit
    | identifier identifier-nondigit
    | identifier digit
    ```

    - Understand EBNF(Extended Backus-Naur Form):
        - `A ::= B`: When encounter `A`, could be instead with `B`. (`A`: Non-terminal Symbol)
        - Inference from `Start Symbol`: `CompUnit`
        - Terminal Symbol: `""`, Uppercase snake named symbol(like `IDENT`).
        - `Goal`: with EBNF, inferenced from start symbol into series of `Terminal Symbol`.
        - With lexer, we inference tokens into AST.
        - Other notations: 
        ```
        A | B ;

        [...] # repeat 0 or 1 time.

        {...} # repeat 0 or multiple times

        EX:

        Params ::= Param { "," Param };
        Param ::= Type IDENT;
        Type ::= "int" | "long";
        ```
