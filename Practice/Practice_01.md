Computer Architecture, Practice #1
==================================

In this task, we need to familiarize ourselves with the remote server's
development environment, the development tools, and the language that we will
use to compare the high-level world to the low-level one.

## Developer Tools

The following tool is required to be installed to work on this course. It
contains the Git version control system that you will use to submit your work to
the instructor. The Git installation package also includes a virtual terminal
Mintty, the command interpreter Bash, and an SSH client to connect and work
with the course server.

* [Git SCM](https://git-scm.com)

On macOS, it is recommended to install the official command-line developer
tools from Apple by opening the `Terminal.app` and running the following
command.

```bash
xcode-select --install
```

The following code editor is optional. It is not required, but it can be helpful
if you will not feel comfortable working with the command-line interface for
long periods. You have to install the 'Remote - SSH' extension from the editor
to use it with our remote server.

* [Microsoft Visual Studio Code](https://code.visualstudio.com)

This virtualization software and the OS images will allow you to set up your
development environment on your computer to not depend on the course server. It
is optional to set it up. You are on your own here as we will not help you
figure out what to do to get your environment up and running. Internet is full
of information about the process, though.

* [Oracle VM VirtualBox](https://www.virtualbox.org)
* [Ubuntu 20.04 Desktop](https://ubuntu.com/#download) with GUI or the
  [server](https://ubuntu.com/download/server) version without it

## Development Environment

To setup, a development environment, open the terminal (for example, through
`git-bash` on Windows) and run the Secure Copy (`scp`) program to download
credentials to your machine to login to the course server. Your credentials will
include public and private RSA cryptographic keys with a configuration file to
point to our server with your login information. To download the keys, you will
have to agree with any prompts by typing `yes` and pressing enter. You will also
have to type the password when prompted. The password will be given to you
during the class. The passwords will be disabled two weeks after the start of
the course. Ensure to get your keys before that. You will not be able to see
your password when you type it. It is normal not to leak it to your command-line
history file or show it to people nearby. Continue typing the password. If the
system does not accept your password multiple times, type it into a text editor,
cut and paste it into the terminal window. Remember that `CTRL+C` and `CTRL+V`
key combinations do not work in most Unix terminals. You will have to use other
key combinations that are different for different terminals. Mintty on Windows
uses `CTRL+INSERT` and `SHIFT+INSERT` by default. macOS terminal users are
luckier as they can use the standard `COMMAND+C` and `COMMAND+V` key
combinations.

```bash
# WARNING: If you have existing .ssh keys or configuration files, make a backup of them first.
scp -r <AUCA login>@auca.space:~/.ssh ~/
```

Do not forget to replace `<AUCA login>`, including the `<` and `>` character,
with your actual AUCA login. For example, `toksaitov_d` would be the text the
instructor of this course would write to download the keys to access the server.

From now on, you can access the server with all the necessary tools installed by
issuing the following command in your terminal.

```bash
ssh auca
```

To terminate the connection from the remote server, you can issue the `exit`
command.

It is a good idea to create a separate directory for the course work on the
server and give it a meaningful name (e.g., `com-410`). You should probably
keep different labs (experiments) in separate directories, too. Name them
appropriately. Use the commands and programs such as `cd`, `mkdir`, `mv`,
`touch`, `nano`, and `ls`. 

## Problem #1: "Hello, World"

Write a C program that outputs the "hello, world" message to the screen.
Compile the source code with the GNU C Compiler (GCC). Ensure that you have no
compilation errors.

```bash
gcc -o 01 01.c
```

Run the program.

```bash
./01
hello, world
```

Entities that start with the `#` symbol in C sources are preprocessor
directives. The preprocessor scans for such entities and performs simple text
replacement or insertions operations to generate the final C source code ready
for compilation for the target platform. We can look at what the preprocessor
will generate for our program by forcing GCC to run the preprocessor on our
sources and nothing else.

```bash
gcc -E -o 01.i 01.c
```

Open the `01.i` file in any editor that your instructor is using. Study the
file. Compile the file without the preprocessing step again.

```bash
gcc -o 01 01.i
```

Ensure that the program still produces the same result.

```bash
./01
hello, world
```

Now, force the compiler to generate the assembly source file from your C source
code.

```bash
gcc -S -o 01.s 01.c
```

Open the `01.s` file in any editor that your instructor is using. Study the
file. Translate the assembly file into the machine code. Ensure that the
generated program still works.

```bash
gcc -o 01 01.s
./01
hello, world
```

Use the optimization facilities of your compiler to generate a more efficient
(performant) assembly code. You can try any flags such as `-O1`, `-O2`, `-O3`,
`-Os`, or `-Ofast`. The flags such as `-O1-3` enable a different number of
optimization techniques. The `-Os` flag tells GCC to make the program binary
as small as possible. The `-Ofast` is `-O3` with some extra optimizations that
may lead to fast but not accurate math calculations with floating-point numbers.
GCC has more flags to enable specific optimizations. Most of them are new and
experimental or may not work well for all programs.

```bash
gcc -O3 -S -o 01.O3.s 01.c
gcc -o 01 01.O3.s
./01
hello, world
```

Compare the optimized and unoptimized assembly files with any `diff` program
such as `vimdiff`. Note how we have fewer instructions in the optimized source
file. Press `ESC`, then type `:q!` to exit from the editor `vim`.

```
vimdiff 01.s 01.O3.s
```

Finally, let's take a look at machine instructions that the CPU uses to run the
program. Run a disassembly program `objdump` on your compiled binary. It will
try to reconstruct the assembly instructions from the machine code and print
the machine code alongside the assembly. Send (pipe) the output of `objdump`
into the pager `less` to make it possible to scroll through and search for the
main entry point with the `/main` command in the terminal.

```
objdump -D 01 | less
```

Compare the machine code to the assembly code. Press `q` to exit from `less`.

Reflect on the process of generating an executable file for C. Compare the
process to that of generating a Java class file. What is the difference? Try to
answer what runs the machine code generated by the C compiler. What runs the
compiled Java bytecode?

With all that, consider the following hypothetical situation. What if all
high-performance programs in the world written in C would be rewritten into
Java. Theorize, would all those programs consume much more or less electricity?

At this point, you were building x86-64 software. It is time to do all the
operations again, but for the aarch64 ISA. Use the `aarch64-linux-gnu-gcc`. Do
it on your own. Reflect on the difference of instructions and machine code
between x86-64 and aarch64. Think, why is it that you can still run the ARM
program on an x86-64 CPU of the server.

### Documentation

    man make
    man gcc
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
* [Jump Quick Reference](http://unixwiz.net/techtips/x86-jumps.html)

#### Assemblers

* [Linux assemblers: A comparison of GAS and NASM](https://www.ibm.com/developerworks/library/l-gas-nasm/index.html)
* [GAS Syntax](https://en.wikibooks.org/wiki/X86_Assembly/GAS_Syntax)

### Books

#### C

* C Programming: A Modern Approach, 2nd Edition by K. N. King

#### x86 Assembly

* Assembly Language for x86 Processors, 7th Edition by Kip R. Irvine
