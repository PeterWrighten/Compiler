%option noyywrap
%option nounput
%option noinput

%{

#include <cstdlib>
#include <string>

// Because Flex would use definition of tokens in Bison,
// So we need include headfiles which Bison generated.

#include "peter.tab.hpp"

using namespace std;


%}

WhiteSpace [ \t\n\r]*
LineComment "//".*$

Identifieer [a-zA-Z_][a-zA-Z0-9_]*

Decimal [1-9][0-9]*
Octal 0[0-7]*
Hexadecimal 0[xX][0-9a-fA-F]+

%%

{WhiteSpace} { /* Ignore */ }
{LineComment} { /* Ignore */ }
/* INT, RETURN, IDENT: enum type
 * Transform into integer(because of enum), and pass to Bison.
 */
"int" { return INT; }
"return" { return RETURN; }

/* yytext: string which lexer matched now.
 * yylval: pass over what lexer read
 * str_val/ int_val: Defined in Bison.
 */
{Identifier} { yylval.str_val = new string(yytext); return IDENT; }

{Decimal}   { yylval.int_val = strtol(yytext, nullptr, 0); return INT_CONST; }
{Octal}     { yylval.int_val = strtol(yytext, nullptr, 0); return INT_CONST; }
{Hexadecimal}  { yylval.int_val = strtol(yytext, nullptr, 0); return INT_CONST; }

.           { return yytext[0]; }

%%