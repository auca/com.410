Computer Architecture, Practice #2
==================================

In this task, we need to familiarize ourselves with the fundamentals of the x86-64 assembly language.

## Problem #7: "'Hello, World' From Scratch"

Write an x86-64 assembly program that outputs the "hello, world" message to the screen. Assemble the source code with the GNU Assembler through the C compiler front end (in this case, the linker will also be called to combine your object file with the C standard library). Ensure that you have no translation or linking errors. Ensure to pass `-static -fno-pie -no-pie` flags to gcc. `-static` will tell the linker not to load the standard library during runtime, but to put it directly into the executable. `-fno-pie -no-pie` linker and compiler flags will disable the generation of position-independent code (PIC) to simplify our assembly.

```
gcc -static -fno-pie -no-pie -o 07 07.x86-64.s
```

Run the program.

```
./07
hello, world
```

## Problem #8: "Increment in Assembly"

Write an x86-64 assembly program that reads a number of type `long` from the user, increments it by one, and then outputs the incremented value. If you encounter any errors, use GDB to debug your program.

```
gcc -static -fno-pie -no-pie -o 08 08.x86-64.s
./08
123
124
```

Compare and contrast your assembly source file to the C file that you got in
Problem #5.

## Problem #9: "Sum of Two Numbers in Assembly"

Write an x86-64 assembly program that reads two numbers of type `long` from the user and outputs their sum. Use GDB to debug your program in case of errors.

```
gcc -static -fno-pie -no-pie -o 09 09.x86-64.s
./09
10 20
10 + 20 = 30
```

Compare and contrast your assembly source file to the C file that you got in
Problem #6.

## Homework Problem #10: "Product"

Write a program in x86-64 assembly that reads two numbers of type `int` from the user and outputs their product. The code should be located in the `p10` directory, and the source file should be named `10.x86-64.s`. The output format must be precise, and you must use the `scanf` function to read the numbers. Ensure that you can compile your code with the following flags: `-static -fno-pie -no-pie`.

## Sample Input and Output

```
./10
10 2
10 * 2 = 20
```

## Homework Problem #11: "Quotient"

Write a program in x86-64 assembly that reads two numbers of type `long` from the user and calculates the result of their integer division. Place the code in the `p11` directory, and name the source file `11.x86-64.s`. The output format must be precise. You must use the `scanf` function to read the numbers. Ensure that you can compile your code with the following flags: `-static -fno-pie -no-pie`.

## Sample Input and Output

```
./11
10 9
10 / 9 = 1
```

## Homework Problem #12: "Remainder"

Write a program in x86-64 assembly that reads two numbers of type `long` from the user and calculates the remainder of their division. The code should be located in the `p12` directory, and the source file should be named `12.x86-64.s`. The output format must be precise, and you must use the `scanf` function to read the numbers. Ensure that you can compile your code with the following flags: `-static -fno-pie -no-pie`.

## Sample Input and Output

```
./12
10 3
10 % 3 = 1
```

## GitHub Checkpoint #2

For the second GitHub checkpoint, you are required to prepare, commit, and push Problems 7 through 9, as well as all the Homework problems for Lab 2, to your private course repository on GitHub. If you do not already have a private course repository, you will need to obtain one from the instructor. Upon completion, submit the URL of the last commit—ensuring no extraneous characters are included—on Moodle. This URL should point to the snapshot where all the problems have been completed. You are allowed to make new commits and resubmit the URL multiple times before the deadline if necessary.

Here is the directory structure with the names of the files that you must use.

```
<Your private GitHub repository>
...previous works
lab-2
├── p07
│   └── 07.x86-64.s
├── p08
│   └── 08.x86-64.s
├── p09
│   └── 09.x86-64.s
├── p10
│   └── 10.x86-64.s
├── p11
│   └── 11.x86-64.s
└── p12
    └── 12.x86-64.s
```

Here you can find the commands that will be used to compile your code.

| Problem                        | Compilation Command                         |
| :----------------------------- | :------------------------------------------ |
| p07: 07.x86-64.s               | `gcc -static -fno-pie -no-pie -o 07 07.*.s` |
| p08: 08.x86-64.s               | `gcc -static -fno-pie -no-pie -o 08 08.*.s` |
| p09: 09.x86-64.s               | `gcc -static -fno-pie -no-pie -o 09 09.*.s` |
| p10: 10.x86-64.s               | `gcc -static -fno-pie -no-pie -o 10 10.*.s` |
| p11: 11.x86-64.s               | `gcc -static -fno-pie -no-pie -o 11 11.*.s` |
| p12: 12.x86-64.s               | `gcc -static -fno-pie -no-pie -o 12 12.*.s` |

...where `*` is a cross compiler or ISA name.

Ensure not to submit any binary files, such as object files and executables, as this will result in a lower grade. Late submissions will receive a grade of zero. Similarly, if the auto-grading script cannot parse your commit ID, clone your repository, check out the commit, locate your source files under the specific names used during class, build the sources, or run your programs, you will also receive a grade of zero. Additionally, if your programs' output format does not match the samples provided, your grade will be zero.

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
* [System V AMD64 ABI](https://refspecs.linuxbase.org/elf/x86_64-abi-0.99.pdf)
* [X86 Instruction Reference](http://www.felixcloutier.com/x86)
* [Optimizing Subroutines in Assembly Language](http://www.agner.org/optimize/optimizing_assembly.pdf)

#### Tools

* [GAS Syntax](https://en.wikibooks.org/wiki/X86_Assembly/GAS_Syntax)
* [GDB Quick Reference](https://users.ece.utexas.edu/~adnan/gdb-refcard.pdf)
* [Pro Git](https://git-scm.com/book/en/v2)

### Books

#### C

* C Programming Language, 2nd Edition by Brian W. Kernighan and Dennis M. Ritchie
* C Programming: A Modern Approach, 2nd Edition by K. N. King

#### Assembly

* Learn to Program with Assembly by Jonathan Bartlett
