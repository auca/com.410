Computer Architecture, Practice #4
==================================

In this lab, you are asked to write five C functions that work with strings. These functions are designed to help you understand how standard library functions work internally.

Please note that you are not allowed to use any standard library functions to implement these custom functions.

## Problem #19: "Find Length of a String with my_strlen()"
Write a C program that implements a function called my_strlen() to find the length of a given string.

<b>Example input</b>: str = "hello world"  
**Example output**: 11

## Problem #20: "Copy Specified Characters with my_strncpy()"
Write a C program that implements a function called my_strncpy() to copy a specified number of characters from a source string to a destination string. If the number greater than the length of either of string, the function just replaces the entire string.

**Example input**: source = "hello", destination = "world", n = 3  
**Example output**: destination = "helld"

## Problem #21: "Concatenate Strings with my_strcat()"
Write a C program that implements a function called my_strcat() to concatenate two strings.

**Example input**: str1 = "hello", str2 = "world"  
**Example output**: str1 = "helloworld"

## Problem #22: "Find Character Occurrence with my_strchr()"
Write a C program that implements a function called my_strchr() to find the first occurrence of a character in a given string and return a pointer to that character.

**Example input**: str = "hello world", c = 'w'  
**Example output**: pointer to the first occurrence of 'w' in the given string

## Problem #23: "Compare Strings Lexicographically with my_strcmp()"
Write a C program that implements a function called my_strcmp() to compare two strings lexicographically.

**Example input**: str1 = "hello", str2 = "world"  
**Example output**: a negative integer (since "hello" is lexicographically smaller than "world")

### Test Code
To check whether the code you written for each of the problems work use the following code:
```
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
```

Here is the directory structure with the names of the files that you must use:
```
<Your private GitHub repository>
...previous works
lab-04
├── strutil.h
└── p1923.c
```

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

### Links

#### C

* [Beej's Guide to C Programming](https://beej.us/guide/bgc)

### Books

#### C

* C Programming Language, 2nd Edition by Brian W. Kernighan and Dennis M. Ritchie
* C Programming: A Modern Approach, 2nd Edition by K. N. King

#### Assembly

* Assembly Language for x86 Processors, 7th Edition by Kip R. Irvine
* ARM 64-Bit Assembly Language by Larry D. Pyeatt and William Ughetta
