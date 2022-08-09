#include "global.h"
#include <stdio.h>
#include <stdlib.h>

int error(char *msg) {
    fprintf(stderr, "%s\n", msg);
    exit(1);
}