### Computer Architecture
# Course Project
## Dynamic String in C

Write a C program that implements a dynamically sized string called my_string. The structure should contain a character array and an integer to store the current length of the string. 

### Functionality  
1. Initialize the structure with a given string.

2. Resize the structure when needed.  

3. Append a character to the structure.  

4. Concatenate another string to the structure.  

5. Free the memory allocated for the structure.  

### Definitions  
The string should have the following definitions:
```
typedef struct {
    char* data;
    int length;
} my_string;

void my_string_init(my_string* str, const char* input);
void my_string_resize(my_string* str, int new_size);
void my_string_append_char(my_string* str, char c);
void my_string_concat(my_string* str, const char* input);
void my_string_free(my_string* str);
```
### Test code  
Example C code for the main function to test the my_string methods:

```
int main() {
    my_string str;

    // Initialize the structure with a given string
    my_string_init(&str, "hello");

    // Append a character to the structure
    my_string_append_char(&str, ' ');

    // Concatenate another string to the structure
    my_string_concat(&str, "world");

    // Print the final string and its length
    printf("String: %s\n", str.data);
    printf("Length: %d\n", str.length);

    // Free the memory allocated for the structure
    my_string_free(&str);
    return 0;
}
```
Please note that you are not allowed to use any standard library functions to implement this project

Here is the directory structure with the names of the files that you must use:
```
<Your private GitHub repository>
...previous works
project
├── my_string.h
└── proj.c
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
