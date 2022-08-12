%define api.token.prefix {TOK_}
%token
    MINUS "-"
;

Expr: MINUS Expr %prec NEG { {% math %} = new ast::NegExpr($2, POS(@1)); };

%nonassoc QUESTION
%left     OR
%left     AND
%left     EQU NEQ
%left     LEQ GEQ LT GT
%left     PLUS MINUS
%left     TIMES SLASH MOD
%nonassoc LNOT NEG BNOT
%nonassoc LBRACK DOT
