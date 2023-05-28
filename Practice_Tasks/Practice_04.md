Principles of Computing Systems, Practice #4
============================================

You are asked to write five C functions that work with strings. You cannot use
any string manipulation code from the standard library to implement these custom
functions. These functions are designed to help you understand how С string
manipulation code from the standard library works internally. Put every function
you create into a `strutil.h` file. You will also need to create a `p1923.c`
file containing the `main` function, which will be used to test your code. You
should not create a `Makefile` for this lab, but you should do it for the
COM-123 course project.

## Problem #19: "Find Length of a String"

Write a C function called `my_strlen` to find the length of a given string.

Example usage:

```c
const char *str1 = "hello";
printf("Length of str1: %d\n", my_strlen(str1)); // "Length of str1: 5\n"
```

## Problem #20: "Copy Specified Characters"

Write a C function called `my_strncpy` to copy a specified number of characters
from a source string to a destination string. If the number is greater than the
length of either string, the function replaces the entire string.

```c
const char *str1 = "hello";
char destination[20] = "world";
my_strncpy(destination, str1, 3);
printf("strncpy result: %s\n", destination); // "strncpy result: helld\n"
```

## Problem #21: "Concatenate Strings"

Write a C function `my_strcat` to concatenate two strings.

```c
const char *str2 = "world";
char destination[20] = "helld";
my_strcat(destination, str2);
printf("strncat result: %s\n", destination); // "strncat result: helldworld\n"
```

## Problem #22: "Find a Character"

Write a C function `my_strchr` to find the first occurrence of a character in a
given string and return a pointer to that character.

```c
const char *str1 = "hello";
const char *result = my_strchr(str1, 'l');
if (result) {
    printf("strchr result: %s\n", result); // "strchr result: llo\n"
} else {
    printf("Character not found\n");
}
```

## Problem #23: "Compare Strings Lexicographically"

Write a C program that implements a function called `my_strcmp` to compare two
strings lexicographically.

```c
const char *str1 = "hello";
const char *str2 = "world";

int cmp_result = my_strcmp(str1, str2);
if (cmp_result < 0) {
    printf("str1 is lexicographically smaller than str2\n"); // prints this
} else if (cmp_result > 0) {
    printf("str1 is lexicographically greater than str2\n");
} else {
    printf("str1 and str2 are equal\n");
}
```

## Test Code

To check whether the code you wrote for each of the problems work, use the
following code:

```c
#include <stdio.h>

#include "strutil.h"

int main(void)
{
    const char *str1 = "hello";
    const char *str2 = "world";

    // Test my_strlen
    printf("Length of str1: %d\n", my_strlen(str1));

    // Test my_strncpy
    char destination[20] = "world";
    my_strncpy(destination, str1, 3);
    printf("strncpy result: %s\n", destination);

    // Test my_strncat
    my_strcat(destination, str2);
    printf("strncat result: %s\n", destination);

    // Test my_strchr
    const char *result = my_strchr(str1, 'l');
    if (result) {
        printf("strchr result: %s\n", result);
    } else {
        printf("Character not found\n");
    }

    // Test my_strcmp
    int cmp_result = my_strcmp(str1, str2);
    if (cmp_result < 0) {
        printf("str1 is lexicographically smaller than str2\n");
    } else if (cmp_result > 0) {
        printf("str1 is lexicographically greater than str2\n");
    } else {
        printf("str1 and str2 are equal\n");
    }

    return 0;
}
```

## GitHub Checkpoint #4

For the third GitHub Checkpoint, you need to prepare, commit, and push Problems
19 through 23 to your private course repository on GitHub. Submit the last
commit URL without any extra characters on Canvas, pointing to the snapshot where
all the problems were ready. You may make new commits and resubmit before the
deadline multiple times.

Here is the directory structure with the names of the files that you must use.

```
<Your private GitHub repository>
...previous works
lab-4
├── strutil.h
└── p1923.c
```

Here you can find the commands that will be used to compile your code.

| Problem                   | Compilation Command                          |
| :------------------------ | :------------------------------------------- |
| p1923: p1923.c, strutil.h | `gcc -o p1923 p1923.c`                       |

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
    man gdb

### Links

#### C

* [Beej's Guide to C Programming](https://beej.us/guide/bgc)

### Books

#### C

* C Programming Language, 2nd Edition by Brian W. Kernighan and Dennis M. Ritchie
* C Programming: A Modern Approach, 2nd Edition by K. N. King
