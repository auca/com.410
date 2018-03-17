#!/usr/bin/env sh

# Sample Commands
gcc -E -o 01.preprocessed.c 01.c
gcc -S -o 01.gcc.s 01.c
gcc -O1 -S -o 01.O1.gcc.s 01.c
gcc -O2 -S -o 01.O2.gcc.s 01.c
gcc -O3 -S -o 01.O3.gcc.s 01.c
gcc -Os -S -o 01.Os.gcc.s 01.c
gcc -c -o 01.o 01.c
gcc -o 01 01.o

