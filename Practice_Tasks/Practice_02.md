Principles of Computing Systems, Computer Architecture, Practice #2
===================================================================

In this task, we need to familiarize ourselves with the fundamentals of x86-64
and aarch64 assembly languages.

## Problem #7: "'Hello, World' From Scratch"

Write an x86-64 assembly program that outputs the "hello, world" message to the
screen. Assemble the source code with the GNU Assembler through the C compiler
front end (in that case, the linker will also be called to combine your object
file with the C standard library). Ensure that you have no translation or
linking errors. Ensure to pass `-static -fno-pie -no-pie` flags to gcc.
`-static` will tell the linker to not load the standard library during the
runtime, but to put it directly into the executable. `-fno-pie -no-pie` linker
and compiler flags will disable generation of position-independent code (PIC) to
simplify our assembly.

```bash
gcc -static -fno-pie -no-pie -o 07 07.x86-64.s
```

Run the program.

```bash
./07
hello, world
```

Repeat the steps, but in aarch64 assembly. Use the `aarch64-linux-gnu`
cross compiler to generate the executable.

```bash
aarch64-linux-gnu-gcc -static -fno-pie -no-pie -o 07 07.aarch64.s
```

Run the program.

```bash
./07
hello, world
```

## Problem #8: "Increment in Assembly"

Write an x86-64 assembly program that reads one number of type `long` from the
user and outputs its value incremented by one. Use GDB to debug your application
in case of errors.

```bash
gcc -static -fno-pie -no-pie -o 08 08.x86-64.s
./08
123
124
```

Create the same program but in aarch64 assembly.

```bash
aarch64-linux-gnu-gcc -static -fno-pie -no-pie -o 08 08.aarch64.s
./08
123
124
```

Compare and contrast your assembly sources to C sources that you got in
Problem #5.

## Problem #9: "Sum of Two Numbers in Assembly"

Write an x86-64 assembly program that reads two numbers of type `long` from the
user and outputs their sum. Use GDB to debug your application in case of errors.

```bash
gcc -static -fno-pie -no-pie -o 09 09.x86-64.s
./09
10 20
10 + 20 = 30
```

Create the same program but in aarch64 assembly.

```bash
aarch64-linux-gnu-gcc -static -fno-pie -no-pie -o 09 09.aarch64.s
./08
10 20
10 + 20 = 30
```

Test, that you can overflow the resulting variable on both CPU architectures.

Compare and contrast your assembly sources to C sources that you got in
Problem #6.

## Homework Problem #10: "Product"

Write two programs in x86-64 and aarch64 assembly that read two numbers of type
`int` from the user and output their product. The code should be located under
`p10` directory, and the source files should be named `10.x86-64.s` and
`10.aarch64.s`. The output format must be precise, and you must use the `scanf`
function here to read the numbers. Ensure that you can compile your code with
the following flags `-static -fno-pie -no-pie`.

## Sample Input and Output

```bash
./10
10 2
10 * 2 = 20
```

## Homework Problem #11: "Quotient"

Write two programs in x86-64 and aarch64 assembly that read two numbers of type
`long` from the user and find the result of the integer division. The code
should be located under `p11` directory, and the source files should be named
`11.x86-64.s` and `11.aarch64.s`. The output format must be precise, and you
must use the `scanf` function here to read the numbers. Ensure that you can
compile your code with the following flags `-static -fno-pie -no-pie`.

## Sample Input and Output

```bash
./11
10 9
10 / 9 = 1
```

## Homework Problem #12: "Remainder"

Write two programs in x86-64 and aarch64 assembly that read two numbers of type
`long` from the user and find remainder of the division. The code should be
located under `p12` directory, and the source files should be named
`12.x86-64.s` and `12.aarch64.s`. The output format must be precise, and you
must use the `scanf` function here to read the numbers. Ensure that you can
compile your code with the following flags `-static -fno-pie -no-pie`.

## Sample Input and Output

```bash
./12
10 3
10 % 3 = 1
```

## GitHub Checkpoint #2

For the second GitHub Checkpoint, you need to prepare, commit, and push Problems
7 through 9 and all the Homework problems for Lab 2 to your private course
repository on GitHub. Submit the last commit URL without any extra characters on
Canvas, pointing to the snapshot where all the problems were ready. You may make
new commits and resubmit before the deadline multiple times.

Here is the directory structure with the names of the files that you must use.

```
<Your private GitHub repository>
...previous works
lab-2
├── p07
│   ├── 07.x86-64.s
│   └── 07.aarch64.s
├── p08
│   ├── 08.x86-64.s
│   └── 08.aarch64.s
├── p09
│   ├── 09.x86-64.s
│   └── 09.aarch64.s
├── p10
│   ├── 10.x86-64.s
│   └── 10.aarch64.s
├── p11
│   ├── 11.x86-64.s
│   └── 11.aarch64.s
└── p12
    ├── 12.x86-64.s
    └── 12.aarch64.s
```

Here you can find the commands that will be used to compile your code.

| Problem                        | Compilation Command                          |
| :----------------------------- | :------------------------------------------- |
| p07: 07.x86-64.s, 07.aarch64.s | `gcc* -static -fno-pie -no-pie -o 07 07.*.s` |
| p08: 08.x86-64.s, 08.aarch64.s | `gcc* -static -fno-pie -no-pie -o 08 08.*.s` |
| p09: 09.x86-64.s, 09.aarch64.s | `gcc* -static -fno-pie -no-pie -o 09 09.*.s` |
| p10: 10.x86-64.s, 10.aarch64.s | `gcc* -static -fno-pie -no-pie -o 10 10.*.s` |
| p11: 11.x86-64.s, 11.aarch64.s | `gcc* -static -fno-pie -no-pie -o 11 11.*.s` |
| p12: 12.x86-64.s, 12.aarch64.s | `gcc* -static -fno-pie -no-pie -o 12 12.*.s` |

...where `*` is a cross compiler or ISA name.

Ensure not to submit any binary files (object files and executables). Your grade
will be lowered for that. You will get zero for a late submission. You will get
zero if the auto-grading script cannot parse your commit ID, clone your
repository, check out the commit, find your source files under the specific
names the instructor was using during the class, build the sources, run your
programs. You will also get zero if your programs' output format is not the same
as that outlined in the samples.

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
