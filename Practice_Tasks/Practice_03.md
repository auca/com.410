Computer Architecture, Practice #3
==================================

In this task, we will work with the stack to store local variables and pass arguments to functions. While working with the stack, we will discover how to address memory. We will find that this knowledge allows us to work with any C array.

## Problem #13: "Arguments to Functions"

Manually recreate the following C program in x86-64 assembly. Note that parameters are of type `int`, while the return types of functions are `long`. Use the sign-extension instructions specific to the target platform to perform the casts from `int` to `long`.

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

## Problem #14: "Local Variables"

Manually convert the specified C program into x86-64 assembly languages.

```C
#include <stdio.h>

int main(void)
{
    long num_to_mul, num_to_div;

    long num, times;
    scanf("%ld\n%ld", &num, &times);
    num_to_mul = num;
    num_to_div = num;

    for (char i = 0; i < (char) times; ++i) {
        num_to_mul *= 2;
        num_to_div /= 2;
    }

    printf("%ld, %ld\n", num_to_mul, num_to_div);

    return 0;
}
```

## Problem #15: "Sections"

Manually convert the specified C program into x86-64 assembly languages.

```C
#include <stdio.h>

const unsigned long arr1[10240] = { 0xDEADBEEF };
static unsigned long arr2[10240];

int main(void)
{
    unsigned long arr3[] = {
        42, 2, 3, 4, 5, 6, 7, 8, 9, 43
    };

    printf(
        "arr1 first and last elems: %#lX, %#lX\n"
        "arr2 first and last elems: %#lX, %#lX\n"
        "arr3 first and last elems: %#lX, %#lX\n",
        arr1[0], arr1[10239],
        arr2[0], arr2[10239],
        arr3[0], arr3[9]
    );

    return 0;
}
```

## Homework Problem #16: "Swap with Pointers"

Manually convert the specified C program into x86-64 assembly languages.

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

## Homework Problem #17: "Structs"

Manually convert the specified C program into x86-64 assembly languages.

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

For the third GitHub checkpoint, you are required to prepare, commit, and push Problems 13 through 15, as well as all the Homework problems for Lab 3, to your private course repository on GitHub. If you do not already have a private course repository, you will need to obtain one from the instructor. Upon completion, submit the URL of the last commit—ensuring no extraneous characters are included—on Moodle. This URL should point to the snapshot where all the problems have been completed. You are allowed to make new commits and resubmit the URL multiple times before the deadline if necessary.

Here is the directory structure with the names of the files that you must use.

```
<Your private GitHub repository>
...previous works
lab-3
├── p13
│   └── 13.x86-64.s
├── p14
│   └── 14.x86-64.s
├── p15
│   └── 15.x86-64.s
├── p16
│   └── 16.x86-64.s
└── p17
    └── 17.x86-64.s
```

Here you can find the commands that will be used to compile your code.

| Problem          | Compilation Command                         |
| :--------------- | :------------------------------------------ |
| p13: 13.x86-64.s | `gcc -static -fno-pie -no-pie -o 13 13.*.s` |
| p14: 14.x86-64.s | `gcc -static -fno-pie -no-pie -o 14 14.*.s` |
| p15: 15.x86-64.s | `gcc -static -fno-pie -no-pie -o 15 15.*.s` |
| p16: 16.x86-64.s | `gcc -static -fno-pie -no-pie -o 16 16.*.s` |
| p17: 17.x86-64.s | `gcc -static -fno-pie -no-pie -o 17 17.*.s` |

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
