/* Definition of statement */

%{
int yylex();
int getchar();
void yyerror(const char *s);
%}

%%

input : expr '\n' ;
expr : expr '+' term | expr '-' term | term ;
term : term '*' factor | term '/' factor | factor ;
factor: 'i' | '(' expr ')' ;

%%



yylex() 
{
    return getchar();
}