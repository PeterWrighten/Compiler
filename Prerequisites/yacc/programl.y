/* Definition of statement */

%{
#include <stdio.h>
int yylex();
int getchar();
void yyerror(const char *s);
%}

digit   [0-9]
pdigit  [1-9]
period  "."
head    {pdigit}{digit}*
tail    {digit}*
exp     [eE]
other   .

%%

input : expr '\n' ;
expr : expr '+' term | expr '-' term | term ;
term : term '*' factor | term '/' factor | factor ;
factor: 'i' | '(' expr ')' ;

([+\-])?{head}({period}{tail})?({exp}(-)?{head})?
            {printf("%s is correct.", yytext);}
{other}+ {printf("ERROR: %s", yytext);}

%%



yylex() 
{
    return getchar();
}

int main(void) {
    yylex();
    return 0;
}