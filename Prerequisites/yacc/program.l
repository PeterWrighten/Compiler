%{ #include <stdio.h> %}

digit [0-9]
pdigit [1-9]
period "."
head {pdigit}{digit}*
tail {digit}*
exp [eE]
other .

%%
([+\-])?{head}({period}{tail})?({exp}(-)?{head})?
            {printf("%s is correct.", yytext);}
{other}+ {printf("ERROR: %s", yytext);}

%%

int main() { yylex(); return 0; }