Computer Architecture, Practice #4
==================================

In this task, we will work with structured programming constructs.

## Problem #18: "if"

Recreate the following C program in x86-64 and aarch64 assembly manually.

```C
#include <stdio.h>

int main(void)
{
    long num1, num2;
    scanf("%ld %ld", &num1, &num2);

    if ((num1 + num2) > 0) {
        puts("The sum is not negative.");
    }

    if ((num1 + num2) % 2 == 0) {
        puts("The sum is even.");
    } else {
        puts("The sum is odd.");
    }

    char *msg;
    if (num1 > num2) {
        msg = "%ld is greater than %ld.\n";
    } else if (num1 < num2) {
        msg = "%ld is less than %ld.\n";
    } else {
        msg = "%ld is equal to %ld.\n";
    }
    printf(msg, num1, num2);

    return 0;
}
```

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
