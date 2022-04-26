/* identical, No AST */

%code requires {
    #include <memory>
    #include <string>
}

%{

#include <iostream>
#include <memory>
#include <string>

int yylex();
void yyerror(std::unique_ptr<std::string> &ast, const char *s);

using namespace std;

%}

 
%parse-param { std::unique_ptr<std::string> &ast }


%union {
    std::string *str_val;
    int int_val;
}

%token INT RETURN
%token <str_val> IDENT
%token <int_val> INT_CONST

/* Type definition of non-terminal Symbol */
%type <str_val> FuncDef FuncType Block Stmt Number

%%



%%
