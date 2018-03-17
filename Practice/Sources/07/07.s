.section .data

# static const char *input_format = "%ld %ld";
input_format:
    .string "%ld %ld"
# static const char *output_format = "%ld is the greatest number.\n";
output_format:
    .string "%ld is the greatest number.\n"
# static const char *equal_message = "Both numbers are equal.";
equal_message:
    .string "Both numbers are equal."
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
    # scanf(input_format, &a, &b);
    lea input_format(%rip), %rdi
    lea a(%rip), %rsi
    lea b(%rip), %rdx
    xor %eax, %eax
    call scanf@plt

    # if (a > b)
    mov a(%rip), %rsi
    mov b(%rip), %rcx
    cmp %rcx, %rsi  # compare `rsi` to `rcx` (in that order)
    jg .main.a_is_greater # check `rflags`
    # else if (a < b)
    jl .main.b_is_greater # check `rflags`
    # else
    lea equal_message(%rip), %rdi
    call puts@plt

.main.end:
    # return 0;
    xor %eax, %eax
    ret

.main.a_is_greater:
    # if (a > b) { ...
    lea output_format(%rip), %rdi
    xor %eax, %eax
    call printf@plt
    jmp .main.end # go back to `return 0;`

.main.b_is_greater:
    # if (a < b) { ...
    lea output_format(%rip), %rdi
    mov %rcx, %rsi
    xor %eax, %eax
    call printf@plt
    jmp .main.end # go back to `return 0;`

