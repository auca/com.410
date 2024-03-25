Computer Architecture, Practice #4
==================================

In this task, we will work with structured programming constructs.

## Problem #18: "if"

Analyze the structured constructs of the C program below using the Radare2 (`radare2`) reverse engineering tool, focusing on the implementation of the `if` construct.

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

## Problem #19: "switch"

Manually convert the specified C program into x86-64 assembly languages.

```c
#include <stdio.h>

#include "utilities.h" // Implement `random_in_range` and `init_random` on your
                       // own with `rand` from `stdlib.h`.

int main(void)
{
    init_random();

    unsigned long suit_id = random_in_range(1, 4);
    char *suit;
    if (suit_id == 1)      suit = "Spades";
    else if (suit_id == 2) suit = "Clubs";
    else if (suit_id == 3) suit = "Hearts";
    else if (suit_id == 4) suit = "Diamonds";

    unsigned long rank_id = random_in_range(1, 13);
    char *rank;
    switch (rank_id)
    {
        case 1:  rank = "A";     break;
        case 2:  rank = "Two";   break;
        case 3:  rank = "Three"; break;
        case 4:  rank = "Four";  break;
        case 5:  rank = "Five";  break;
        case 6:  rank = "Six";   break;
        case 7:  rank = "Seven"; break;
        case 8:  rank = "Eight"; break;
        case 9:  rank = "Nine";  break;
        case 10: rank = "Ten";   break;
        case 11: rank = "Jack";  break;
        case 12: rank = "Queen"; break;
        case 13: rank = "King";  break;
    }

    printf("The card you have picked is %s of %s.\n", rank, suit);

    return 0;
}
```

## Problem #20: "loops"

Analyze the structured constructs of the C program below with r2 reverse
engineering tool. Focus on how the `do/while`, `while`, and `for` constructs are
implemented.

```c
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "int_stack.h" // Implement `int_stack_create`, `int_stack_push`, and
                       // `int_stack_pop` on your own. Use a `for` loop in some
                       // of your methods.

int main(void)
{
    int_stack_t stack = int_stack_create();

    long input;
    do {
        scanf("%ld", &input);
        int_stack_push(&stack, input);
    } while (input != 0);

    int_stack_pop(&stack);

    while (stack.count > 0) {
        long num = int_stack_pop(&stack);
        printf(stack.count != 0 ? "%ld " : "%ld\n", num);
    }

    int_stack_destroy(&stack);

    return 0;
}
```

## Homework Problem #21: "if in assembly"

Recreate the C program from Problem #18 in x86-64 and aarch64 assembly manually.

## Homework Problem #22: "Loops in assembly"

Recreate the `20.c` file from Problem #20 in x86-64 and aarch64 assembly
manually. Leave the `int_stack.c` and `.h` files as is. Modify the `Makefile`
to produce three executables from the C file, from the x86-64 assembly, and from
the aarch64 assembly as it was done in Problem #19.

## GitHub Checkpoint #4

For the last GitHub checkpoint, you are required to prepare, commit, and push Problems 18 through 20, as well as all the Homework problems for Lab 4, to your private course repository on GitHub. If you do not already have a private course repository, you will need to obtain one from the instructor. Upon completion, submit the URL of the last commit—ensuring no extraneous characters are included—on Moodle. This URL should point to the snapshot where all the problems have been completed. You are allowed to make new commits and resubmit the URL multiple times before the deadline if necessary.

Here is the directory structure with the names of the files that you must use. Note that Homework problems go into the` p18` and `p20` directories.

```
<Your private GitHub repository>
...previous works
lab-4
├── p18
│   └── 18.x86-64.s
├── p19
│   ├── 19.x86-64.s
│   ├── 19.c
│   ├── utilities.c
│   ├── utilities.h
│   └── Makefile
└── p20
    ├── 20.x86-64.s
    ├── 20.c
    ├── int_stack.c
    ├── int_stack.h
    └── Makefile
```

Here you can find the commands that will be used to compile your code.

| Problem              | Compilation Command                         |
| :------------------- | :------------------------------------------ |
| p18: 18.x86-64.s     | `gcc -static -fno-pie -no-pie -o 18 18.*.s` |
| p19: 19.x86-64.s,... | `make`                                      |
| p20: 20.x86-64.s,... | `make`                                      |

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
* [Intel x86 JUMP Quick Reference](http://www.unixwiz.net/techtips/x86-jumps.html)

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
