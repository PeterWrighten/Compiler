CFLAGS=-Wall -Wno-strict-aliasing -std=gnu11 -g -I. -O0
OBJS=lexer.o  emitter.o parser.o symbol.o init.o\
     error.o 

ECC=./pcc
override CFLAGS += -DBUILD_DIR='"$(shell pwd)"'

pcc: global.h main.o $(OBJS)
	cc -o $@ main.o $(OBJS) $(LDFLAGS)

clean:
	rm -f *.o *.s 

all: pcc

.PHONY: clean