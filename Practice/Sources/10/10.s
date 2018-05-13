.section .data

# static const char *input_format = "%ld";
input_format:
    .string "%ld"
# static const char *output_format = "%ld\n";
output_format:
    .string "%ld\n"

.section .text

# static long factorial_recursive(long n) { ...
factorial_recursive:
    # n == 0 ? ...
    test %rdi, %rdi
    jz .factorial_recursive.return_one

    # return n * factorial_recursive(n - 1)
    push %rdi
    dec %rdi
    call factorial_recursive
    pop %rdi
    mul %rdi
    jmp .factorial_recursive.end

.factorial_recursive.return_one:
    # return 1;
    mov $0x1, %rax
.factorial_recursive.end:
    ret

# static long factorial_loop(long n) { ...
factorial_loop:
    # long result = 1;
    mov $0x1, %rax
    # for (long i = 2;... {
    mov $0x2, %rcx
.factorial_loop.for_body:
    # i <= n
    cmp %rdi, %rcx
    jg .factorial_loop.return_result

    # result *= i
    mul %rcx

    # ++i
    inc %rcx
    jmp .factorial_loop.for_body # }

.factorial_loop.return_result:
    # return result;
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

    # printf(output_format, factorial_recursive(n));
    mov (%rsp), %rdi
    call factorial_recursive
    mov %rax, %rsi
    lea output_format(%rip), %rdi
    xor %eax, %eax
    call printf@plt

    # printf(output_format, factorial_loop(n));
    mov (%rsp), %rdi
    call factorial_loop
    mov %rax, %rsi
    lea output_format(%rip), %rdi
    xor %eax, %eax
    call printf@plt

    add $0x8, %rsp # Remove the local variable `n` from the stack.

    # return 0;
    xor %eax, %eax
    ret

