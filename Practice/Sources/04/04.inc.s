.section .data

# static const char *input_format = "%ld";
input_format:
    .string "%ld"
# static const char *output_format = "%ld\n";
output_format:
    .string "%ld\n"
# static long number = 0;
number:
    .int 0, 0 # long on an LP64 machine is 4 + 4 bytes. The .long directive in
              # GAS is equivalent to the .int directive, so you need to reserve,
              # two consequent 0.

.section .text

# int main() { ...
.global main
main:
    # scanf(input_format, &number);
    lea input_format(%rip), %rdi
    lea number(%rip), %rsi
    xor %eax, %eax # number of floating point arguments for vararg functions
                   #   such as `scanf` and `printf` (0 in our case)
    call scanf@plt

    # ++number;
    mov number(%rip), %rsi
    inc %rsi

    # printf(output_format, number);
    lea output_format(%rip), %rdi
    xor %eax, %eax
    call printf@plt # `number` is in %rsi as per the ABI requirements for the second argument.

    # return 0;
    xor %eax, %eax
    ret

