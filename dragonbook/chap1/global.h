#ifndef GLOBAL_H
#define GLOBAL_H

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

// error.c
int error(char*);

// lexer.c
int lexan();

// parser.c
void parse();
void expr();
void term();
void factor();
void match(int);

// emitter.c
void emit(int, int);

// symbol.c
int lookup(char*);
int insert(char*, int);

// init.c
void init();


typedef struct{
    char* lexptr;
    int token;
} entry;


extern entry symtable[];

#endif