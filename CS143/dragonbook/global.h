#include <stdio.h>
#include <ctype.h>
#include <stdlib.h>

#define BSIZE 128
#define NONE -1
#define EOS '\0'
#define NUM 256
#define DIV 257
#define MOD 258
#define ID 259
#define DONE 260

int tokenval;
int lineno;

struct entry {
    char* lexptr;
    int token;
};

int error(char *msg) {
    fprintf(stderr, "%s\n", msg);
    exit(1);
}

struct entry symtable[] = {};