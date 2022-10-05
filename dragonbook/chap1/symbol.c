#include "global.h"
#include <string.h>

#define STRMAX 999 /* size of lexemes array */
#define SYMMAX 100 /* size of symtable */ 

char lexemes[STRMAX];
int  lastchar = -1;
entry symtable[SYMMAX];
int lastentry = 0;

int lookup(char* s) {
    int p;
    for(p = lastentry; p > 0; p--) {
        if(strcmp(symtable[p].lexptr, s) == 0)
            return p;
    }
    return 0;
} 

int insert(char* s, int tok) {
    int len;
    len = strlen(s);
    if(lastchar + len + 1 >= SYMMAX)
        error("lexemes array full");
    lastentry += 1;
    symtable[lastentry].token = tok;
    symtable[lastentry].lexptr = &lexemes[lastchar + 1];
    lastchar += len + 1;
    strcpy(symtable[lastentry].lexptr, s);
    return lastentry;
}