Computer Architecture, Practice #3
==================================

In this task, we will work with the stack to store local variables and send
arguments to functions.

## Problem #13: "Unsigned Locals"

Write an x86-64 assembly program that reads two **unsigned** numbers of type
`long` from the user and outputs their sum. The variables MUST be local to
function `main` and stored on the stack.

```bash
gcc -static -fno-pie -no-pie -o 13 13.x86-64.s
./13
10 20
10 + 20 = 30
```

Create the same program but in aarch64 assembly.

```bash
aarch64-linux-gnu-gcc -static -fno-pie -no-pie -o 13 13.aarch64.s
./13
10 20
10 + 20 = 30
```

Try to overflow the result. Compare the code with the one where variables
were stored in the global `.data` section.

## Problem #14: "Return Address"

Write an x86-64 assembly program that prints the return address of the `main`
function stored on the stack. Call the code directly to force the program to
exit with status 0. The exit status can be accessed in `bash` command
interpreter through the `$?` variable.

```bash
gcc -static -fno-pie -no-pie -o 14 14.x86-64.s
./14
0x7ffff7df30b3 # could be any other address
echo $?
0
```

Create the same program but in aarch64 assembly.

```bash
aarch64-linux-gnu-gcc -static -fno-pie -no-pie -o 14 14.x86-64.s
./14
0x9ffff4ac43f1 # could be any other address
echo $?
0
```

## Problem #15: "Arguments to Functions"

Recreate the following C program in x86-64 and aarch64 assembly manually. Note
that parameters are of type `int`, but the return types of functions are `long`.
Use sign-extension instructions of the target platform to do the C casts.

```C
#include <stdio.h>

static const char *output_format = "%ld\n";

static long add1(int a)
{
    return (long) a;
}

static long add2(int a, int b)
{
    return (long) a + (long) b;
}

static long add3(int a, int b, int c)
{
    return (long) a + (long) b + (long) c;
}

// TODO: add4, add5...

static long add10(int a, int b, int c, int d, int e, int f, int g, int h, int i, int j)
{
    return (long) a + (long) b + (long) c + (long) d + (long) e + (long) f + (long) g + (long) h + (long) i + (long) j;
}

int main(void)
{
    printf(output_format, add1(1));
    printf(output_format, add2(1, 2));
    printf(output_format, add3(1, 2, 3));
    printf(output_format, add4(1, 2, 3, 4));
    printf(output_format, add5(1, 2, 3, 4, 5));
    printf(output_format, add6(1, 2, 3, 4, 5, 6));
    printf(output_format, add7(1, 2, 3, 4, 5, 6, 7));
    printf(output_format, add8(1, 2, 3, 4, 5, 6, 7, 8));
    printf(output_format, add9(1, 2, 3, 4, 5, 6, 7, 8, 9));
    printf(output_format, add10(1, 2, 3, 4, 5, 6, 7, 8, 9, 10));

    return 0;
}
```

## Homework Problem #16: "Change Return Address"

Write two programs in x86-64 and aarch64 assembly that get one C String argument
from `argv` at index 1 with a path to an executable (e.g., `/bin/yes`), and
overwrite the return address in such a way, that instead of returning to
`libc_start_main` runtime function from `main`, the programs return to a
function `system` which starts the specified program from the argument. Read
more about the `system` function with the help of `man`. Think where to put
arguments so that function `system` can start the specified program. Remember
that GDB is your friend.

```bash
gcc (and aarch64-linux-gnu-gcc) -static -fno-pie -no-pie -o 16 16.x86-64.s
./16 /bin/yes
y
y
y
y
y
y
... (CTRL+C to stop)
```

```bash
gcc (and aarch64-linux-gnu-gcc) -static -fno-pie -no-pie -o 16 16.x86-64.s
echo $$
1222853 # or any other main server shell ID
./16 /bin/sh
$ echo $$
1222930 # or any other shell ID different from the one above
exit
```

## GitHub Checkpoint #3

For the third GitHub Checkpoint, you need to prepare, commit, and push Problems
13 through 15 and the Homework problem for Lab 3 to your private course
repository on GitHub. Submit the last commit ID without any extra characters on
Canvas, pointing to the snapshot where all the problems were ready. You may make
new commits and resubmit before the deadline multiple times.

Here is the directory structure with the names of the files that you must use.

```
<Your private GitHub repository>
...previous works
├── p13
│   ├── 13.aarch64.s
│   └── 13.x86-64.s
├── p14
│   ├── 14.aarch64.s
│   └── 14.x86-64.s
├── p15
│   ├── 15.aarch64.s
│   └── 15.x86-64.s
└── p16
    ├── 16.aarch64.s
    └── 16.x86-64.s
```

Here you can find the commands that will be used to compile your code.

| Problem                        | Compilation Command                          |
| :----------------------------- | :------------------------------------------- |
| p13: 13.x86-64.s, 13.aarch64.s | `gcc* -static -fno-pie -no-pie -o 13 13.*.s` |
| p14: 14.x86-64.s, 14.aarch64.s | `gcc* -static -fno-pie -no-pie -o 14 14.*.s` |
| p15: 15.x86-64.s, 15.aarch64.s | `gcc* -static -fno-pie -no-pie -o 15 15.*.s` |
| p16: 16.x86-64.s, 16.aarch64.s | `gcc* -static -fno-pie -no-pie -o 16 16.*.s` |

...where `*` is a cross compiler or ISA name.

Ensure not to submit any binary files (object files and executables). Your grade
will be lowered for that. You will get zero for a late submission. You will get
zero if the auto-grading script cannot parse your commit, clone your repository,
check out the commit, find your source files under the specific names the
instructor was using during the class, build the sources, run your programs. You
will also get zero if your programs' output format is not the same as that
outlined in the samples.

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
