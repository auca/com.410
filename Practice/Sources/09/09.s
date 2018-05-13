.section .data

# static const char *input_format = "%ld %ld";
input_format:
    .string "%ld %ld"
# static const char *output_format = "%ld\n";
output_format:
    .string "%ld\n"

.section .text

# static long gcd_recursive(long a, long b) { ...
gcd_recursive:
    # b == 0 ? ...
    test %rsi, %rsi
    jz .gcd_recursive.return_a

    # return gcd_recursive(b, a % b);
    # long temp = a;
    mov %rdi, %rax
    cqo
    # a = b;
    mov %rsi, %rdi
    # b = a % b;
    div %rsi
    mov %rdx, %rsi
    call gcd_recursive
    jmp .gcd_recursive.end

.gcd_recursive.return_a:
    # return a;
    mov %rdi, %rax
.gcd_recursive.end:
    ret

# static long gcd_loop(long a, long b) { ...
gcd_loop:
    # while (b != 0) { ...
    test %rsi, %rsi
    jz .gcd_loop.return_a

    # long temp = a;
    mov %rdi, %rax
    cqo
    # a = b;
    mov %rsi, %rdi
    # b = a % b;
    div %rsi
    mov %rdx, %rsi
    jmp gcd_loop # }

.gcd_loop.return_a:
    # return a;
    mov %rdi, %rax
    ret

# int main() { ...
.global main
main:
    # long a, b;
    sub $0x10, %rsp # Allocate the data on the stack for the local variables as
                    # we need their addresses for the `scanf` function. We can't
                    # get the address of registers.
    # scanf(input_format, &a, &b);
    lea input_format(%rip), %rdi
    lea 0x8(%rsp), %rsi
    lea (%rsp), %rdx
    xor %eax, %eax
    call scanf@plt

    # printf(output_format, gcd_recursive(a, b));
    mov 0x8(%rsp), %rdi
    mov (%rsp), %rsi
    call gcd_recursive
    mov %rax, %rsi
    lea output_format(%rip), %rdi
    xor %eax, %eax
    call printf@plt

    # printf(output_format, gcd_loop(a, b));
    mov 0x8(%rsp), %rdi
    mov (%rsp), %rsi
    call gcd_loop
    mov %rax, %rsi
    lea output_format(%rip), %rdi
    xor %eax, %eax
    call printf@plt

    add $0x10, %rsp # Remove the local variables `a` and `b` from the stack.

    # return 0;
    xor %eax, %eax
    ret

