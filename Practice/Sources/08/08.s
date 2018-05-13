.section .data

# static const char *input_format = "%ld";
input_format:
    .string "%ld"
# static const char *output_format = "%ld\n";
output_format:
    .string "%ld\n"

.section .text

# static long fib_recursive(long n, long a, long b) { ...
fib_recursive:
    # --n > 0 ? ...
    dec %rdi
    test %rdi, %rdi
    jle .fib_recursive.return_a

    # return fib_recursive(n, b, a + b);
    # long temp = a;
    mov %rsi, %rcx
    # a = b;
    mov %rdx, %rsi
    # b += temp;
    add %rcx, %rdx
    call fib_recursive
    jmp .fib_recursive.end

.fib_recursive.return_a:
    # return a;
    mov %rsi, %rax
.fib_recursive.end:
    ret

# static long fib_loop(long n, long a, long b) { ...
fib_loop:
    # while (--n > 0) { ...
    dec %rdi
    test %rdi, %rdi
    jle .fib_loop.return_a

    # long temp = a;
    mov %rsi, %rcx
    # a = b;
    mov %rdx, %rsi
    # b += temp;
    add %rcx, %rdx
    jmp fib_loop # }

.fib_loop.return_a:
    # return a;
    mov %rsi, %rax
    ret

# int main() { ...
.global main
main:
    # long n;
    sub $0x8, %rsp # Allocate the data on the stack for the local variable as
                   # we need its address for the `scanf` function. We can't
                   # get the address of a register.
    # scanf(input_format, &n);
    lea input_format(%rip), %rdi
    mov %rsp, %rsi
    xor %eax, %eax
    call scanf@plt

    # printf(output_format, fib_recursive(n, 0, 1));
    mov (%rsp), %rdi
    xor %rsi, %rsi
    mov $0x1, %rdx
    call fib_recursive
    mov %rax, %rsi
    lea output_format(%rip), %rdi
    xor %eax, %eax
    call printf@plt

    # printf(output_format, fib_loop(n, 0, 1));
    mov (%rsp), %rdi
    xor %rsi, %rsi
    mov $0x1, %rdx
    call fib_loop
    mov %rax, %rsi
    lea output_format(%rip), %rdi
    xor %eax, %eax
    call printf@plt

    add $0x8, %rsp # Remove the local variable `n` from the stack.

    # return 0;
    xor %eax, %eax
    ret

