.section .data

# static const char *input_format = "%ld %ld";
input_format:
    .string "%ld %ld"
# static const char *output_format = "%ld + %ld = %ld\n";
output_format:
    .string "%ld + %ld = %ld\n"
# static long a = 0;
a:
    .int 0, 0 # long on an LP64 machine is 4 + 4 bytes. The .long directive in
              # GAS is equivalent to the .int directive, so you need to reserve,
              # two consequent 0.
# static long b = 0;
b:
    .int 0, 0

.section .text

# int main() { ...
.global main
main:
    push %rbp
    mov %rsp, %rbp

    # scanf(input_format, &a, &b);
    lea input_format(%rip), %rdi
    lea a(%rip), %rsi
    lea b(%rip), %rdx
    xor %eax, %eax # number of floating point arguments for vararg functions
                   #   such as `scanf` and `printf` (0 in our case)
    call scanf@plt

    # long sum = a + b;
    mov a(%rip), %rsi
    mov b(%rip), %rdx
    mov %rdx, %rcx
    add %rsi, %rcx

    # printf(output_format, a, b, sum);
    lea output_format(%rip), %rdi
    xor %eax, %eax
    call printf@plt # `a`, `b` , and `sum` is in %rsi-%rcx as per the ABI requirements.

    leave

    # return 0;
    xor %eax, %eax
    ret

