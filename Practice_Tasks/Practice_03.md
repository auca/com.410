Principles of Computing Systems, Computer Architecture, Practice #3
===================================================================

In this task, we will work with the stack to store local variables, send
arguments to functions, and study internals of fundamental structured
programming constructs.

## Problem #13: "Arguments to Functions"

Recreate the following C program in x86-64 and aarch64 assembly manually. Note
that parameters are of type `int`, but the return types of functions are `long`.
Use sign-extension instructions of the target platform to do the C casts. Read
chapter 9 of the C Programming: A Modern Approach, 2'nd Edition by K. N. King at
the end.

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

## Problem #14-15: "if" and "switch"

Analyze the structured constructs of the C program below with `gdb`, `radare2`,
or the [Godbolt Compiler Explorer](https://godbolt.org). Focus on how the `if`
constructs are implemented. Try rewriting the code using only one-way `if`
constructs with a `goto` jump to a label inside and nothing else. Read chapter 5
of the C Programming: A Modern Approach, 2'nd Edition by K. N. King at the end.

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

Make the program below work by adding the `utilities.h` file. Analyze the
structured constructs of the C program below with `gdb`, `radare2`, or the
[Godbolt Compiler Explorer](https://godbolt.org). Focus on how the
`switch` construct is implemented. Try rewriting the code using only one `goto`
statement. You may have to use some non-standard GCC [extensions](https://gcc.gnu.org/onlinedocs/gcc/Labels-as-Values.html) for that. Read chapter 5 of the C Programming: A Modern Approach, 2'nd Edition
by K. N. King at the end.

```c
#include <stdio.h>

#include "utilities.h" // Implement `random_in_range` and `init_random` on your
                       // own with `rand` and `srand` from `stdlib.h`.

int main(void)
{
    init_random();

    unsigned long suitID = random_in_range(1, 4);
    char *suit;
    if (suitID == 1)      suit = "Spades";
    else if (suitID == 2) suit = "Clubs";
    else if (suitID == 3) suit = "Hearts";
    else if (suitID == 4) suit = "Diamonds";

    unsigned long rankID = random_in_range(1, 13);
    char *rank;
    switch (rankID)
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

## Problem #16: "loops"

Make the program below work by adding the `int_stack.h`, the `int_stack.c`, and
the `Makefile` files. Next, analyze the structured constructs of the C program
below with `gdb`, `radare2`, or the [Godbolt Compiler Explorer](https://godbolt.org).
Figure out how the `do/while`, `while`, and `for` constructs are implemented.
Try rewriting the code using only one-way `if` constructs with a `goto` jump to
a label inside and nothing else. Read chapter 6 of the C Programming: A Modern
Approach, 2'nd Edition by K. N. King at the end.

```c
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "int_stack.h" // Implement `int_stack_create`, `int_stack_push`, and
                       // `int_stack_pop` on your own. Use a `for` loop in some
                       // of your methods. Put function bodies into the
                       // `int_stack.c` file. Create a Makefile to simplify the
                       // compilation and cleanup of the program.

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

## Homework Problem #17: "Swap with Pointers"

Analyze the `swap` function of the C program below with `gdb`, `radare2`,
or the [Godbolt Compiler Explorer](https://godbolt.org). Read chapters 8, 11,
and 12 of the C Programming: A Modern Approach, 2'nd Edition by K. N. King.
Recreate the following C program in x86-64 and aarch64 assembly manually. Keep
only the necessary elements. You will get zero for the whole lab if your code is
just a copy-paste of the compiler's generated assembly. You may find this
[old lecture video](https://youtu.be/Xpfnh7in-n8) helpful.

Try to answer if is it possible to create a similar `swap` method in Java?

```C
#include <stdio.h>

static void swap(long *a, long *b)
{
    long temp = *a;
    *a = *b;
    *b = temp;
}

int main(void)
{
    long a, b;
    scanf("%ld %ld", &a, &b);

    printf("Before swap: %ld %ld\n", a, b);
    swap(&a, &b);
    printf("After swap: %ld %ld\n", a, b);

    return 0;
}
```

## Homework Problem #18: "Structs"

Analyze the `v2d_t` structure of the C program below with `gdb`, `radare2`,
or the [Godbolt Compiler Explorer](https://godbolt.org). Read chapters 16 and 17
of the C Programming: A Modern Approach, 2'nd Edition by K. N. King. Recreate
the following C program in x86-64 and aarch64 assembly manually. Keep only the
necessary elements. You will get zero for the whole lab if your code is just a
copy-paste of the compiler's generated assembly.

```C
#include <stdio.h>

typedef struct _v2d {
    long x;
    long y;
} v2d_t;

static long dot(v2d_t a, v2d_t b)
{
    return a.x * b.x + a.y * b.y;
}

static long dot_ptr(v2d_t *a, v2d_t *b)
{
    return a->x * b->x + a->y * b->y;
}

int main(void)
{
    v2d_t a, b;

    scanf("%ld %ld %ld %ld", &a.x, &a.y, &b.x, &b.y);

    long res1 = dot(a, b);
    printf("%ld\n", res1);

    long res2 = dot_ptr(&a, &b);
    printf("%ld\n", res2);

    return 0;
}
```

## GitHub Checkpoint #3

For the third GitHub Checkpoint, you need to prepare, commit, and push Problems
13 through 16 and all the Homework problems for Lab 3 to your private course
repository on GitHub. Submit the last commit URL without any extra characters on
Canvas, pointing to the snapshot where all the problems were ready. You may make
new commits and resubmit before the deadline multiple times.

You don't have to submit your code's `goto` versions. Only practice rewriting
structured constructs to spaghettified `goto` code to prepare for the Final
exam. Leave the good high-level selection and loop constructs in your C files
submitted to us.

Here is the directory structure with the names of the files that you must use.

```
<Your private GitHub repository>
...previous works
lab-3
├── p13
│   ├── 13.x86-64.s
│   └── 13.aarch64.s
├── p14-15
│   ├── 14.c
│   ├── utilities.h
│   └── 15.c
├── p16
│   ├── int_stack.c
│   ├── int_stack.h
│   ├── Makefile
│   └── 16.c
├── p17
│   ├── 17.x86-64.s
│   └── 17.aarch64.s
└── p18
    ├── 18.x86-64.s
    └── 18.aarch64.s
```

Here you can find the commands that will be used to compile your code.

| Problem                                       | Compilation Command                          |
| :-------------------------------------------- | :------------------------------------------- |
| p13: 13.x86-64.s, 13.aarch64.s                | `gcc* -static -fno-pie -no-pie -o 13 13.*.s` |
| p14-15: 14.c, 15.c, utilities.h               | `gcc -static -fno-pie -no-pie -o 1? 1?.c`    |
| p16: 16.c, int_stack.h, int_stack.c, Makefile | `make`                                       |
| p17: 17.x86-64.s, 17.aarch64.s                | `gcc* -static -fno-pie -no-pie -o 17 17.*.s` |
| p18: 18.x86-64.s, 18.aarch64.s                | `gcc* -static -fno-pie -no-pie -o 18 18.*.s` |

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
* [System V AMD64 ABI](https://refspecs.linuxbase.org/elf/x86_64-abi-0.99.pdf)
* [X86 Opcode Reference](http://ref.x86asm.net/index.html)
* [X86 Instruction Reference](http://www.felixcloutier.com/x86)
* [Intel x86 JUMP Quick Reference](http://www.unixwiz.net/techtips/x86-jumps.html)
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
