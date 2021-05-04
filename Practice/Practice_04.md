Computer Architecture, Practice #4
==================================

In this task, we will work with branching instructions and inline
assembly.

## Problem #17: "Whitespaces"

Write a program to read one character from the user. Compare the character
with ' ' and '\t' (tab) values to check that it is a whitespace symbol to set a
boolean variable (name it appropriately). For educational purposes, use a
multiway `if` selections constructs and nothing else. At the end of the
program, use a two-way if construct to check the boolean value to display
"Whitespace" or "Not a whitespace" messages to the user. Generate preprocessor
output `17.i`, find out the "true" (pun intended) nature of boolean values in C.
Take a look at the assembly in GDB. Step through the code to analyze how it works.
Try to rewrite your program by only using one-way if constructs and the `goto`
statement to jump in the code's flow to various labels similar to how the
assembly was structured in GDB. The source file should be named `17.goto.c`
Rewrite the code to set the boolean variable in x86 inline assembly. Name
the source file `17.inline.c`.

## Problem #18: "Character Count"

Write a program `18` to read characters from the user in a `while` loop. Count
the characters, stop on `EOF` condition, and print the total number of
characters. Take a look at the assembly in R2. Step through the code to analyze
how it works. Try to rewrite your program by only using one-way if constructs
and the `goto` statement to jump in the code's flow to various labels similar to
how the assembly was structured in GDB for the `while` loop. The source file
should be named `18.goto.c` Rewrite the code for the `while` loop in x86-64
inline assembly. Name the source file `18.inline.c`.

## Problem #19: "ASCII Table"

Write a program `19` to print all ASCII characters from code 32 up to 126 with
a `for` loop. Print the output in a tabular manner with 16 or 32 characters per
every row. Represent the constant 16 or 32 in a macro definition. Take a look at
the assembly in GDB. Step through the code to analyze how it works. Try to
rewrite your program by only using one-way if constructs and the `goto` statement
to jump in the code's flow to various labels similar to how the assembly was
structured in R2 for the `for` loop. The source file should be named
`19.goto.c` Rewrite the `for` loop in x86-64 inline assembly. Name the source
file `19.inline.c`.

## Problem #20: "Many Conditions"

Write a program `20` to print the season's name (Winter, Spring, Summer, or
Fall) for a given month number (from 1 to 12). For any number outside of the
range from 1 to 12, the program should print the message "Invalid month number."
Write a version of a program (`20.c`) with a multi-way `if` construct. Use
logical operators inside the `if` conditions. Compile the program and analyze
its assembly with Radare2 in graph mode. Rewrite the source file replacing the
`if` construct and logical operators with a `switch` construct. Compile and
analyze the binary with Radare2. Compare and contrast the generated code with
the `if` assembly version.

Rewrite your program by only using a one-way if construct and the `goto`
statement to jump in the code's flow to various labels similar to how the
assembly was structured in R2 for the `switch` construct. The source file should
be named `20.goto.c`. Rewrite the `switch` construct in x86-64 inline assembly
in `20.inline.c`.

## Problem #21-22: "Pointers and Arrays"

Write a program `21-1` to swap two numbers in a function called `swap`. Write
an incorrect version first (without the use of pointers). Check out the
assembly in the [Godbolt Compiler Explorer](https://godbolt.org) with the
`-O3` flag. Write a correct working version `21-2`. Compare the new assembly to
the previous one. Try adding the `-fno-inline` in Godbolt. Compare the
assembly again.

Write a program `22-1` to find a sum of an array of random integers. Create two
functions named `fill_with_random` and `sum` that can prepare and sum the array.
Create the array on the stack in `22-1`. Create the array on the heap  with
the `malloc` function in `22-2`. Do not forget to release the memory with the
`free` function. Check out the assembly of both programs in the
[Godbolt Compiler Explorer](https://godbolt.org).

Write a program `22-3` to find a sum of all the numbers passed as command-line
arguments to the program. Convert the strings to integers with the `strtol`
function. Check out the assembly in the [Godbolt Compiler Explorer](https://godbolt.org).

### Documentation

    man make
    man gcc
    man ld
    man as
    man gdb
    man objdump

### Links

#### C

* [Beej's Guide to C Programming](https://beej.us/guide/bgc)

#### x86 ISA

* [Intel® 64 and IA-32 Architectures Software Developer Manuals](https://software.intel.com/en-us/articles/intel-sdm)
* [System V AMD64 ABI](https://software.intel.com/sites/default/files/article/402129/mpx-linux64-abi.pdf)
* [X86 Opcode Reference](http://ref.x86asm.net/index.html)
* [X86 Instruction Reference](http://www.felixcloutier.com/x86)
* [Optimizing Subroutines in Assembly Language](http://www.agner.org/optimize/optimizing_assembly.pdf)
* [Intel x86 JUMP Quick Reference](http://www.unixwiz.net/techtips/x86-jumps.html)

#### ARM64 ISA

* [Arm Architecture Reference Manual Armv8, for Armv8-A architecture profile](https://developer.arm.com/documentation/ddi0487/latest)
* [Arm Instruction Set Reference Guide](https://developer.arm.com/documentation/100076/0100/a64-instruction-set-reference)
* [Learn the architecture: AArch64 Instruction Set Architecture](https://developer.arm.com/documentation/102374/0101)

#### Tools

* [GAS Syntax](https://en.wikibooks.org/wiki/X86_Assembly/GAS_Syntax)
* [GDB Quick Reference](https://users.ece.utexas.edu/~adnan/gdb-refcard.pdf)
* [Pro Git](https://git-scm.com/book/en/v2)

### Books

#### C

* C Programming Language, 2nd Edition by Brian W. Kernighan and Dennis M. Ritchie
* C Programming: A Modern Approach, 2nd Edition by K. N. King

#### Assembly

* Assembly Language for x86 Processors, 7th Edition by Kip R. Irvine
* ARM 64-Bit Assembly Language by Larry D. Pyeatt and William Ughetta
